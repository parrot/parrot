/*
Copyright (C) 2001-2007, The Perl Foundation.
$Id$

=head1 NAME

src/gc/resources.c - Handling Small Object Pools

=head1 DESCRIPTION

Handles the accessing of small object pools (header pools).

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/smallobject.h"

/* HEADERIZER HFILE: include/parrot/smallobject.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void gc_ms_add_free_object(SHIM_INTERP,
    ARGMOD(Small_Object_Pool *pool),
    ARGIN(void *to_add))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pool);

static void gc_ms_add_free_pmc_ext(SHIM_INTERP,
    ARGMOD(Small_Object_Pool *pool),
    ARGIN(void *to_add))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pool);

static void gc_ms_alloc_objects(PARROT_INTERP,
    ARGMOD(Small_Object_Pool *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static void * gc_ms_get_free_object(PARROT_INTERP,
    ARGMOD(Small_Object_Pool *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static void * gc_ms_get_free_pmc_ext(PARROT_INTERP,
    ARGMOD(Small_Object_Pool *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

static void gc_ms_pool_init(SHIM_INTERP, ARGMOD(Small_Object_Pool *pool))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

static void more_traceable_objects(PARROT_INTERP,
    ARGMOD(Small_Object_Pool *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

#define ASSERT_ARGS_gc_ms_add_free_object assert(pool); \
                                          assert(to_add);
#define ASSERT_ARGS_gc_ms_add_free_pmc_ext assert(pool); \
                                           assert(to_add);
#define ASSERT_ARGS_gc_ms_alloc_objects assert(interp); \
                                        assert(pool);
#define ASSERT_ARGS_gc_ms_get_free_object assert(interp); \
                                          assert(pool);
#define ASSERT_ARGS_gc_ms_get_free_pmc_ext assert(interp); \
                                           assert(pool);
#define ASSERT_ARGS_gc_ms_pool_init assert(pool);
#define ASSERT_ARGS_more_traceable_objects assert(interp); \
                                           assert(pool);
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


#define GC_DEBUG_REPLENISH_LEVEL_FACTOR        0.0
#define GC_DEBUG_UNITS_PER_ALLOC_GROWTH_FACTOR 1
#define REPLENISH_LEVEL_FACTOR                 0.3

/* this factor is totally arbitrary, but gives good timings for stress.pasm */
#define UNITS_PER_ALLOC_GROWTH_FACTOR          1.75

#define POOL_MAX_BYTES                         65536 * 128

/*

=item C<INTVAL contained_in_pool>

Returns whether the given C<*ptr> points to a location in C<pool>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
contained_in_pool(ARGIN(const Small_Object_Pool *pool), ARGIN(const void *ptr))
{
    const Small_Object_Arena *arena;
    ASSERT_ARGS(contained_in_pool);

    ptr = PObj_to_ARENA(ptr);

    for (arena = pool->last_Arena; arena; arena = arena->prev) {
        const ptrdiff_t ptr_diff =
            (ptrdiff_t)ptr - (ptrdiff_t)arena->start_objects;

        if (0 <= ptr_diff
                && ptr_diff < (ptrdiff_t)(arena->used * pool->object_size)
                && ptr_diff % pool->object_size == 0)
            return 1;
    }

    return 0;
}

/*

=item C<int Parrot_is_const_pmc>

Returns whether C<*pmc> is a constant PMC. The given pointer is a constant
PMC if it points into the constant PMC pool.

=cut

*/

int
Parrot_is_const_pmc(PARROT_INTERP, ARGIN(const PMC *pmc))
{
    Small_Object_Pool * const pool = interp->arena_base->constant_pmc_pool;
    const               int   c    = contained_in_pool(pool, pmc);
    ASSERT_ARGS(Parrot_is_const_pmc);

    /* some paranoia first. */
    /* I wonder if it would save any machine cycles to write
       !(PObj_constant_TEST(pmc) ^ c)
       instead. */
    PARROT_ASSERT(!!PObj_constant_TEST(pmc) == !!c);

    return c;
}


/*

=item C<static void more_traceable_objects>

We're out of traceable objects. First we try a DOD run to free some up. If
that doesn't work, allocate a new arena.

=cut

*/

static void
more_traceable_objects(PARROT_INTERP, ARGMOD(Small_Object_Pool *pool))
{
    ASSERT_ARGS(more_traceable_objects);
    if (pool->skip)
        pool->skip = 0;
    else {
        Small_Object_Arena * const arena = pool->last_Arena;
        if (arena) {
            if (arena->used == arena->total_objects)
                Parrot_do_dod_run(interp, GC_trace_stack_FLAG);

            if (pool->num_free_objects <= pool->replenish_level)
                pool->skip = 1;
        }
    }

    /* requires that num_free_objects be updated in Parrot_do_dod_run. If dod
     * is disabled, then we must check the free list directly. */
    if (!pool->free_list)
        (*pool->alloc_objects) (interp, pool);
}

/*

=item C<static void gc_ms_add_free_pmc_ext>

Add a freed PMC_EXT structure to the free list in the PMC_EXT pool. Objects
on the free list can be reused later.

=cut

*/

static void
gc_ms_add_free_pmc_ext(SHIM_INTERP, ARGMOD(Small_Object_Pool *pool), ARGIN(void *to_add))
{
    PMC_EXT *object        = (PMC_EXT *)to_add;
    ASSERT_ARGS(gc_ms_add_free_pmc_ext);
    object->_metadata      = NULL;

    /* yes, this cast is a hack for now, but a pointer is a pointer */
    object->_next_for_GC   = (PMC *)pool->free_list;
    pool->free_list        = object;
}

/*

=item C<static void gc_ms_add_free_object>

Add an unused object back to the pool's free list for later reuse. Set
the PObj flags to indicate that the item is free.

=cut

*/

static void
gc_ms_add_free_object(SHIM_INTERP, ARGMOD(Small_Object_Pool *pool), ARGIN(void *to_add))
{
    PObj *object           = (PObj *)to_add;
    ASSERT_ARGS(gc_ms_add_free_object);

    PObj_flags_SETTO(object, PObj_on_free_list_FLAG);

    /* during GC buflen is used to check for objects on the free_list */
    PObj_buflen(object)    = 0;
    PMC_struct_val(object) = pool->free_list;
    pool->free_list        = object;
}

/*

=item C<static void * gc_ms_get_free_object>

Free object allocator for the MS garbage collector system. If there are no
free objects, call C<gc_ms_add_free_object> to either free them up with a
DOD run, or allocate new objects. If there are objects available on the
free list, pop it off and return it.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static void *
gc_ms_get_free_object(PARROT_INTERP, ARGMOD(Small_Object_Pool *pool))
{
    PObj *ptr;
    PObj *free_list = (PObj *)pool->free_list;
    ASSERT_ARGS(gc_ms_get_free_object);

    /* if we don't have any objects */
    if (!free_list) {
        (*pool->more_objects)(interp, pool);
        free_list = (PObj *)pool->free_list;
    }

    ptr             = free_list;
    pool->free_list = PMC_struct_val(ptr);

    PObj_flags_SETTO(ptr, 0);

    --pool->num_free_objects;

    return ptr;
}

/*

=item C<static void * gc_ms_get_free_pmc_ext>

Get a new PMC_EXT structure from the free pool and return it.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static void *
gc_ms_get_free_pmc_ext(PARROT_INTERP, ARGMOD(Small_Object_Pool *pool))
{
    PMC_EXT *ptr;
    PMC_EXT *free_list = (PMC_EXT *)pool->free_list;
    ASSERT_ARGS(gc_ms_get_free_pmc_ext);

    /* if we don't have any objects */
    if (!free_list) {
        (*pool->more_objects)(interp, pool);
        free_list = (PMC_EXT *)pool->free_list;
    }

    ptr               = free_list;
    pool->free_list   = ptr->_next_for_GC;
    ptr->_next_for_GC = NULL;

    --pool->num_free_objects;

    return ptr;
}

/*

=item C<void Parrot_add_to_free_list>

Adds the objects in the newly allocated C<arena> to the free list.

=cut

*/

void
Parrot_add_to_free_list(PARROT_INTERP,
        ARGMOD(Small_Object_Pool  *pool),
        ARGMOD(Small_Object_Arena *arena))
{
    UINTVAL  i;
    void    *object;
    const UINTVAL num_objects = pool->objects_per_alloc;
    ASSERT_ARGS(Parrot_add_to_free_list);

    pool->total_objects += num_objects;
    arena->used          = num_objects;

    /* Move all the new objects into the free list */
    object = (void *)arena->start_objects;

    for (i = 0; i < num_objects; i++) {
        pool->add_free_object(interp, pool, object);
        object = (void *)((char *)object + pool->object_size);
    }

    pool->num_free_objects += num_objects;
}

/*

=item C<void Parrot_append_arena_in_pool>

Insert the new arena into the pool's structure. Arenas are stored in a
linked list, so add the new arena to the list. Set information in the
arenas structure, such as the number of objects allocated in it.

=cut

*/
void
Parrot_append_arena_in_pool(PARROT_INTERP,
    ARGMOD(Small_Object_Pool *pool),
    ARGMOD(Small_Object_Arena *new_arena), size_t size)
{
    ASSERT_ARGS(Parrot_append_arena_in_pool);

    /* Maintain the *_arena_memory invariant for stack walking code. Set it
     * regardless if we're the first pool to be added. */
    if (!pool->last_Arena
            || (pool->start_arena_memory > (size_t)new_arena->start_objects))
        pool->start_arena_memory = (size_t)new_arena->start_objects;

    if (!pool->last_Arena || (pool->end_arena_memory <
                (size_t)new_arena->start_objects + size))
        pool->end_arena_memory = (size_t)new_arena->start_objects + size;

    new_arena->total_objects = pool->objects_per_alloc;
    new_arena->next          = NULL;
    new_arena->prev          = pool->last_Arena;

    if (new_arena->prev)
        new_arena->prev->next = new_arena;

    pool->last_Arena = new_arena;
    interp->arena_base->header_allocs_since_last_collect++;
}

/*

=item C<static void gc_ms_alloc_objects>

New arena allocator function for the MS garbage collector system. Allocates
and initializes a new memory arena in the given pool. Adds all the new
objects to the pool's free list for later allocation.

=cut

*/

static void
gc_ms_alloc_objects(PARROT_INTERP, ARGMOD(Small_Object_Pool *pool))
{
    /* Setup memory for the new objects */
    Small_Object_Arena * const new_arena =
        mem_internal_allocate_typed(Small_Object_Arena);

    const size_t size = pool->object_size * pool->objects_per_alloc;
    size_t alloc_size;
    ASSERT_ARGS(gc_ms_alloc_objects);

    /* could be mem_internal_allocate too, but calloc is fast */
    new_arena->start_objects = mem_internal_allocate_zeroed(size);

    Parrot_append_arena_in_pool(interp, pool, new_arena, size);

    Parrot_add_to_free_list(interp, pool, new_arena);

    /* Allocate more next time */
    if (GC_DEBUG(interp)) {
        pool->objects_per_alloc *= GC_DEBUG_UNITS_PER_ALLOC_GROWTH_FACTOR;
        pool->replenish_level =
                (size_t)(pool->total_objects *
                GC_DEBUG_REPLENISH_LEVEL_FACTOR);
    }
    else {
        pool->objects_per_alloc = (size_t)(pool->objects_per_alloc *
            UNITS_PER_ALLOC_GROWTH_FACTOR);
        pool->replenish_level   =
                (size_t)(pool->total_objects * REPLENISH_LEVEL_FACTOR);
    }

    /* check alloc size against maximum */
    alloc_size = pool->object_size * pool->objects_per_alloc;

    if (alloc_size > POOL_MAX_BYTES)
        pool->objects_per_alloc = POOL_MAX_BYTES / pool->object_size;
}

/*

=item C<Small_Object_Pool * new_small_object_pool>

Creates a new C<Small_Object_Pool> and returns a pointer to it.
Initializes the pool structure based on the size of objects in the
pool and the number of items to allocate in each arena.

=cut

*/

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
Small_Object_Pool *
new_small_object_pool(size_t object_size, size_t objects_per_alloc)
{
    Small_Object_Pool * const pool =
        mem_internal_allocate_zeroed_typed(Small_Object_Pool);
    ASSERT_ARGS(new_small_object_pool);

    pool->last_Arena        = NULL;
    pool->free_list         = NULL;
    pool->mem_pool          = NULL;
    pool->object_size       = object_size;
    pool->objects_per_alloc = objects_per_alloc;

    return pool;
}

/*

=item C<void gc_pmc_ext_pool_init>

Initialize the PMC_EXT pool functions. This is done separately from other
pools.

=cut

*/

void
gc_pmc_ext_pool_init(ARGMOD(Small_Object_Pool *pool))
{
    ASSERT_ARGS(gc_pmc_ext_pool_init);
    pool->add_free_object = gc_ms_add_free_pmc_ext;
    pool->get_free_object = gc_ms_get_free_pmc_ext;
    pool->alloc_objects   = gc_ms_alloc_objects;
    pool->more_objects    = gc_ms_alloc_objects;
}

/*

=item C<static void gc_ms_pool_init>

Initialize a memory pool for the MS garbage collector system. Sets the
function pointers necessary to perform basic operations on a pool, such
as object allocation.

=cut

*/

static void
gc_ms_pool_init(SHIM_INTERP, ARGMOD(Small_Object_Pool *pool))
{
    ASSERT_ARGS(gc_ms_pool_init);
    pool->add_free_object = gc_ms_add_free_object;
    pool->get_free_object = gc_ms_get_free_object;
    pool->alloc_objects   = gc_ms_alloc_objects;
    pool->more_objects    = more_traceable_objects;
}

/*

=item C<void Parrot_gc_ms_init>

Initialize the state structures of the gc system. Called immediately before
creation of memory pools. This function must set the function pointers
for C<add_free_object_fn>, C<get_free_object_fn>, C<alloc_object_fn>, and
C<more_object_fn>.

=cut

*/

void
Parrot_gc_ms_init(PARROT_INTERP)
{
    Arenas * const arena_base     = interp->arena_base;
    ASSERT_ARGS(Parrot_gc_ms_init);

    arena_base->do_gc_mark         = Parrot_dod_ms_run;
    arena_base->finalize_gc_system = NULL;
    arena_base->init_pool          = gc_ms_pool_init;
}

/*

=item C<void Parrot_small_object_pool_merge>

Merge pool C<source> into pool C<dest>. Combines the free lists directly,
moves all arenas to the new pool, and remove the old pool. To merge, the
two pools must have the same object size, and the same name (if they have
names).

=cut

*/

void
Parrot_small_object_pool_merge(PARROT_INTERP,
        ARGMOD(Small_Object_Pool *dest), ARGMOD(Small_Object_Pool *source))
{
    Small_Object_Arena  *cur_arena;
    void               **free_list_end;
    ASSERT_ARGS(Parrot_small_object_pool_merge);

    /* XXX num_free_objects doesn't seem to be accounted correctly in, e.g.,
     * the PMC_EXT pool.
     */
#if 0
    if (source->num_free_objects == source->total_objects) {
        return;
    }
#endif

    /* PARROT_ASSERT(source->total_objects); */
    PARROT_ASSERT(dest->object_size == source->object_size);
    PARROT_ASSERT((dest->name == NULL && source->name == NULL) ||
        STREQ(dest->name, source->name));

    dest->total_objects += source->total_objects;

    /* append new free_list to old */
    /* XXX this won't work with, e.g., gc_gms */
    free_list_end  = &dest->free_list;

    while (*free_list_end)
        free_list_end = (void **)*free_list_end;

    *free_list_end = source->free_list;

    /* now append source arenas */
    cur_arena = source->last_Arena;

    while (cur_arena) {
        size_t                     total_objects;
        Small_Object_Arena * const next_arena = cur_arena->prev;

        cur_arena->next = cur_arena->prev = NULL;

        total_objects   = cur_arena->total_objects;

        Parrot_append_arena_in_pool(interp, dest, cur_arena,
            cur_arena->total_objects);

        /* XXX needed? */
        cur_arena->total_objects = total_objects;

        cur_arena = next_arena;
    }

    /* remove things from source */
    /* XXX is this enough? */
    source->last_Arena       = NULL;
    source->free_list        = NULL;
    source->total_objects    = 0;
    source->num_free_objects = 0;
}

/*

=back

=head1 SEE ALSO

F<include/parrot/smallobject.h>, F<docs/memory_internals.pod>.

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
