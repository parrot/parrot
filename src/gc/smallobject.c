/*
Copyright (C) 2001-2007, The Perl Foundation.
$Id$

=head1 NAME

src/resources.c - Handling Small Object Pools

=head1 DESCRIPTION

Handles the accessing of small object pools (header pools).

=head2 Functions

*/

#include "parrot/parrot.h"
#include "parrot/smallobject.h"
#include <assert.h>

/* HEADERIZER HFILE: include/parrot/smallobject.h */

/* HEADERIZER BEGIN: static */

static void gc_ms_add_free_object( SHIM_INTERP,
    NOTNULL(Small_Object_Pool *pool),
    NOTNULL(void *to_add) )
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void gc_ms_alloc_objects( PARROT_INTERP,
    NOTNULL(Small_Object_Pool *pool) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static void * gc_ms_get_free_object( PARROT_INTERP,
    NOTNULL(Small_Object_Pool *pool) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void gc_ms_pool_init( SHIM_INTERP, NOTNULL(Small_Object_Pool *pool) )
        __attribute__nonnull__(2);

static void more_traceable_objects( PARROT_INTERP,
    NOTNULL(Small_Object_Pool *pool) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

/* HEADERIZER END: static */


#define GC_DEBUG_REPLENISH_LEVEL_FACTOR        0.0
#define GC_DEBUG_UNITS_PER_ALLOC_GROWTH_FACTOR 1
#define REPLENISH_LEVEL_FACTOR                 0.3

/* this factor is totally arbitrary, but gives good timings for stress.pasm */
#define UNITS_PER_ALLOC_GROWTH_FACTOR          1.75

#define POOL_MAX_BYTES                         65536 * 128

/*

FUNCDOC: contained_in_pool

Returns whether C<pool> contains C<*ptr>.

XXX If ever there is a function that ought to be consted, this is it.

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
contained_in_pool(NOTNULL(const Small_Object_Pool *pool), NOTNULL(const void *ptr))
{
    const Small_Object_Arena *arena;

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

FUNCDOC: Parrot_is_const_pmc

Returns whether C<*pmc> is a constant PMC.

*/

int
Parrot_is_const_pmc(PARROT_INTERP, NOTNULL(PMC *pmc))
{
    Small_Object_Pool * const pool = interp->arena_base->constant_pmc_pool;
    const               int   c    = contained_in_pool(pool, pmc);

    /* some paranoia first */
    assert(!!PObj_constant_TEST(pmc) == !!c);

    return c;
}


/*

FUNCDOC: more_traceable_objects

We're out of traceable objects. Try a DOD, then get some more if needed.

*/

static void
more_traceable_objects(PARROT_INTERP, NOTNULL(Small_Object_Pool *pool))
{
    if (pool->skip)
        pool->skip = 0;
    else {
        Small_Object_Arena * const arena = pool->last_Arena;
        if (arena) {
            if (arena->used == arena->total_objects)
                Parrot_do_dod_run(interp, DOD_trace_stack_FLAG);

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

FUNCDOC: gc_ms_add_free_object

Add an unused object back to the free pool for later reuse.

*/

static void
gc_ms_add_free_object(SHIM_INTERP, NOTNULL(Small_Object_Pool *pool), NOTNULL(void *to_add))
{
    *(void **)to_add = pool->free_list;
    pool->free_list  = to_add;
}

/*

FUNCDOC: gc_ms_get_free_object

Get a new object from the free pool and return it.

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static void *
gc_ms_get_free_object(PARROT_INTERP, NOTNULL(Small_Object_Pool *pool))
{
    void *ptr;

    /* if we don't have any objects */
    if (!pool->free_list)
        (*pool->more_objects)(interp, pool);

    ptr             = pool->free_list;
    pool->free_list = *(void **)ptr;

    PObj_flags_SETTO((PObj*) ptr, 0);

    --pool->num_free_objects;

    return ptr;
}

/*

FUNCDOC: Parrot_add_to_free_list

Adds the memory between C<start> and C<end> to the free list.

*/

void
Parrot_add_to_free_list(PARROT_INTERP,
        NOTNULL(Small_Object_Pool  *pool),
        NOTNULL(Small_Object_Arena *arena),
        UINTVAL             start,
        UINTVAL             end)
{
    UINTVAL  i;
    void    *object;

    pool->total_objects += end - start;
    arena->used          = end;

    /* Move all the new objects into the free list */
    object = (void *)((char *)arena->start_objects + start * pool->object_size);

    for (i = start; i < end; i++) {
        PObj_flags_SETTO((PObj *)object, PObj_on_free_list_FLAG);
        /*
         * during GC buflen is used to check for objects on the
         * free_list
         */
        PObj_buflen((PObj*)object) = 0;
        pool->add_free_object(interp, pool, object);
        object = (void *)((char *)object + pool->object_size);
    }

    pool->num_free_objects += end - start;
}

/*

FUNCDOC: Parrot_append_arrena_in_pool

insert the new arena into the pool's structure, update stats

*/
void
Parrot_append_arena_in_pool(PARROT_INTERP,
    NOTNULL(Small_Object_Pool *pool),
    NOTNULL(Small_Object_Arena *new_arena), size_t size)
{

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

FUNCDOC: gc_ms_alloc_objects

We have no more headers on the free header pool. Go allocate more
and put them on.

*/

static void
gc_ms_alloc_objects(PARROT_INTERP, NOTNULL(Small_Object_Pool *pool))
{
    size_t  size;
    UINTVAL start, end;

    /* Setup memory for the new objects */
    Small_Object_Arena * const new_arena =
        mem_internal_allocate_typed(Small_Object_Arena);

    if (!new_arena)
        PANIC(interp, "Out of arena memory");

    size = pool->object_size * pool->objects_per_alloc;

    /* could be mem_internal_allocate too, but calloc is fast */
    new_arena->start_objects = mem_internal_allocate_zeroed(size);

    Parrot_append_arena_in_pool(interp, pool, new_arena, size);

    start = 0;
    end   = pool->objects_per_alloc;
    Parrot_add_to_free_list(interp, pool, new_arena, start, end);

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
    size = pool->object_size * pool->objects_per_alloc;

    if (size > POOL_MAX_BYTES)
        pool->objects_per_alloc = POOL_MAX_BYTES / pool->object_size;
}

/*

FUNCDOC: new_small_object_pool

Creates a new C<Small_Object_Pool> and returns a pointer to it.

*/

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
Small_Object_Pool *
new_small_object_pool(size_t object_size, size_t objects_per_alloc)
{
    Small_Object_Pool * const pool =
        mem_internal_allocate_zeroed_typed(Small_Object_Pool);

    pool->last_Arena        = NULL;
    pool->free_list         = NULL;
    pool->mem_pool          = NULL;
    pool->object_size       = object_size;
    pool->objects_per_alloc = objects_per_alloc;

    return pool;
}

void
gc_pmc_ext_pool_init(NOTNULL(Small_Object_Pool *pool))
{
    pool->add_free_object = gc_ms_add_free_object;
    pool->get_free_object = gc_ms_get_free_object;
    pool->alloc_objects   = gc_ms_alloc_objects;
    pool->more_objects    = gc_ms_alloc_objects;
}

static void
gc_ms_pool_init(SHIM_INTERP, NOTNULL(Small_Object_Pool *pool))
{
    pool->add_free_object = gc_ms_add_free_object;
    pool->get_free_object = gc_ms_get_free_object;
    pool->alloc_objects   = gc_ms_alloc_objects;
    pool->more_objects    = more_traceable_objects;
}

/*

FUNCDOC: Parrot_gc_ms_init

Initialize the state structures of the gc system. Called immediately before
creation of memory pools. This function must set the function pointers
for C<add_free_object_fn>, C<get_free_object_fn>, C<alloc_object_fn>, and
C<more_object_fn>.

*/

void
Parrot_gc_ms_init(PARROT_INTERP)
{
    Arenas * const arena_base     = interp->arena_base;

    arena_base->do_dod_run        = Parrot_dod_ms_run;
    arena_base->de_init_gc_system = NULL;
    arena_base->init_pool         = gc_ms_pool_init;
}

/*

FUNCDOC: Parrot_small_object_pool_merge

Merge C<source> into C<dest>.

*/

void
Parrot_small_object_pool_merge(PARROT_INTERP,
        NOTNULL(Small_Object_Pool *dest), NOTNULL(Small_Object_Pool *source))
{
    Small_Object_Arena  *cur_arena;
    void               **free_list_end;

    /* XXX num_free_objects doesn't seem to be accounted correctly in, e.g.,
     * the PMC_EXT pool.
     */
#if 0
    if (source->num_free_objects == source->total_objects) {
        return;
    }
#endif

    /* assert(source->total_objects); */
    assert(dest->object_size == source->object_size);
    assert((dest->name == NULL && source->name == NULL) ||
        0 == strcmp(dest->name, source->name));

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
