/*
Copyright (C) 2001-2010, Parrot Foundation.
$Id$

=head1 NAME

src/gc/mark_sweep.c - Small Object Pools and general mark/sweep GC behavior

=head1 DESCRIPTION

This file implements a number of routines related to the mark and sweep phases
of the garbage collector system. The functions in this file attempt to perform
various useful utilities without interfering with the operations of the
particular GC core. Individual GC cores may choose to use these functions or
to reimplement their functionality, hopefully without causing any problems
throughout the rest of Parrot.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "gc_private.h"

/* HEADERIZER HFILE: src/gc/gc_private.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void free_buffer(SHIM_INTERP,
    SHIM(Memory_Pools *mem_pools),
    ARGMOD(Fixed_Size_Pool *pool),
    ARGMOD(Buffer *b))
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*pool)
        FUNC_MODIFIES(*b);

static void free_pmc_in_pool(PARROT_INTERP,
    ARGIN(Memory_Pools *mem_pools),
    SHIM(Fixed_Size_Pool *pool),
    ARGMOD(PObj *p))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*p);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static Fixed_Size_Pool * new_bufferlike_pool(PARROT_INTERP,
    ARGIN(const Memory_Pools *mem_pools),
    size_t actual_buffer_size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static Fixed_Size_Pool * new_fixed_size_obj_pool(
    size_t object_size,
    size_t objects_per_alloc);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static Fixed_Size_Pool * new_pmc_pool(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static Fixed_Size_Pool * new_string_pool(PARROT_INTERP,
    ARGMOD(Memory_Pools *mem_pools),
    INTVAL constant)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*mem_pools);

static void Parrot_gc_allocate_new_attributes_arena(
    ARGMOD(PMC_Attribute_Pool *pool))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*pool);

PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
static PMC_Attribute_Pool * Parrot_gc_create_attrib_pool(size_t attrib_idx);

#define ASSERT_ARGS_free_buffer __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool) \
    , PARROT_ASSERT_ARG(b))
#define ASSERT_ARGS_free_pmc_in_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(mem_pools) \
    , PARROT_ASSERT_ARG(p))
#define ASSERT_ARGS_new_bufferlike_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(mem_pools))
#define ASSERT_ARGS_new_fixed_size_obj_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_new_pmc_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_new_string_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(mem_pools))
#define ASSERT_ARGS_Parrot_gc_allocate_new_attributes_arena \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_Parrot_gc_create_attrib_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/* Set when walking the system stack */
int CONSERVATIVE_POINTER_CHASING = 0;

/*

=item C<void Parrot_gc_run_init(PARROT_INTERP, Memory_Pools *mem_pools)>

Prepares the collector for a mark & sweep GC run. Initializes the various
fields in the Memory_Pools structure that need to be zeroed out prior to the
mark phase.

=cut

*/

void
Parrot_gc_run_init(SHIM_INTERP, ARGMOD(Memory_Pools *mem_pools))
{
    ASSERT_ARGS(Parrot_gc_run_init)

    mem_pools->gc_trace_ptr        = NULL;
    mem_pools->gc_mark_start       = NULL;
    mem_pools->num_early_PMCs_seen = 0;
}

/*

=item C<int Parrot_gc_trace_root(PARROT_INTERP, Memory_Pools *mem_pools,
Parrot_gc_trace_type trace)>

Traces the root set with behavior that's dependent on the flags passed.
Returns 0 if it's a lazy GC run and all objects that need timely destruction
were found. Returns 1 otherwise.

The flag C<trace> can have these values:

=over 4

=item * GC_TRACE_ROOT_ONLY

trace normal roots

=item * GC_TRACE_SYSTEM_ONLY

trace system areas only

=item * GC_TRACE_FULL

trace whole root set, including system areas.

=back

=cut

*/

int
Parrot_gc_trace_root(PARROT_INTERP,
        ARGMOD(Memory_Pools *mem_pools),
        Parrot_gc_trace_type trace)
{
    ASSERT_ARGS(Parrot_gc_trace_root)
    PObj    *obj;

    /* note: adding locals here did cause increased GC runs */
    mark_context_start();

    if (trace == GC_TRACE_SYSTEM_ONLY) {
        trace_system_areas(interp, mem_pools);
        return 0;
    }

    /* We have to start somewhere; the interpreter globals is a good place */
    if (!mem_pools->gc_mark_start) {
        mem_pools->gc_mark_start
            = mem_pools->gc_mark_ptr
            = interp->iglobals;
    }

    /* mark the list of iglobals */
    Parrot_gc_mark_PMC_alive(interp, interp->iglobals);

    /* mark the current continuation */
    obj = (PObj *)interp->current_cont;
    if (obj && obj != (PObj *)NEED_CONTINUATION)
        Parrot_gc_mark_PMC_alive(interp, (PMC *)obj);

    /* mark the current context. */
    Parrot_gc_mark_PMC_alive(interp, CURRENT_CONTEXT(interp));

    /* mark the dynamic environment. */
    Parrot_gc_mark_PMC_alive(interp, interp->dynamic_env);

    /* mark the vtables: the data, Class PMCs, etc. */
    mark_vtables(interp);

    /* mark the root_namespace */
    Parrot_gc_mark_PMC_alive(interp, interp->root_namespace);

    /* mark the concurrency scheduler */
    Parrot_gc_mark_PMC_alive(interp, interp->scheduler);

    /* s. packfile.c */
    mark_const_subs(interp);

    /* mark caches and freelists */
    mark_object_cache(interp);

    /* Now mark the class hash */
    Parrot_gc_mark_PMC_alive(interp, interp->class_hash);

    /* Now mark the HLL stuff */
    Parrot_gc_mark_PMC_alive(interp, interp->HLL_info);
    Parrot_gc_mark_PMC_alive(interp, interp->HLL_namespace);

    /* Mark the registry */
    PARROT_ASSERT(interp->gc_registry);
    Parrot_gc_mark_PMC_alive(interp, interp->gc_registry);

    /* Mark the MMD cache. */
    if (interp->op_mmd_cache)
        Parrot_mmd_cache_mark(interp, interp->op_mmd_cache);

    /* Walk the iodata */
    Parrot_IOData_mark(interp, interp->piodata);

    if (trace == GC_TRACE_FULL)
        trace_system_areas(interp, mem_pools);

    /* quick check to see if we have already marked all impatient PMCs. If we
       have, return 0 and exit here. This will alert other parts of the GC
       that if we are in a lazy run we can just stop it. */
    if (mem_pools->lazy_gc
    &&  mem_pools->num_early_PMCs_seen >= mem_pools->num_early_gc_PMCs)
        return 0;

    return 1;
}


/*

=item C<void Parrot_gc_sweep_pool(PARROT_INTERP, Memory_Pools *mem_pools,
Fixed_Size_Pool *pool)>

Puts any buffers/PMCs that are marked as "dead" or "black" onto the pool
free list.

=cut

*/

void
Parrot_gc_sweep_pool(PARROT_INTERP,
        ARGMOD(Memory_Pools *mem_pools),
        ARGMOD(Fixed_Size_Pool *pool))
{
    ASSERT_ARGS(Parrot_gc_sweep_pool)

    PObj               *b;
    Fixed_Size_Arena   *cur_arena;
    gc_object_fn_type   gc_object   = pool->gc_object;
    UINTVAL             total_used  = 0;
    const UINTVAL       object_size = pool->object_size;

    /* Run through all the PObj header pools and mark */
    for (cur_arena = pool->last_Arena; cur_arena; cur_arena = cur_arena->prev) {
        const size_t objects_end = cur_arena->used;
        UINTVAL      i;
        b = (PObj *)cur_arena->start_objects;

        /* loop only while there are objects in the arena */
        for (i = objects_end; i; i--) {

            /* if it's on free list, do nothing */

            if (PObj_live_TEST(b)) {
                total_used++;
                PObj_live_CLEAR(b);
                PObj_get_FLAGS(b) &= ~PObj_custom_GC_FLAG;
            }
            else if (!PObj_on_free_list_TEST(b)) {
                /* it must be dead */


                if (PObj_is_shared_TEST(b)) {
                    /* only mess with shared objects if we
                     * (and thus everyone) is suspended for
                     * a GC run.
                     * XXX wrong thing to do with "other" GCs
                     */
                    if (!(interp->thread_data
                    &&   (interp->thread_data->state & THREAD_STATE_SUSPENDED_GC))) {
                        ++total_used;
                        goto next;
                    }
                }

                if (gc_object)
                    gc_object(interp, mem_pools, pool, b);

                pool->add_free_object(interp, mem_pools, pool, b);
            }
next:
            b = (PObj *)((char *)b + object_size);
        }
    }

    pool->num_free_objects = pool->total_objects - total_used;
}


/*

=item C<INTVAL contained_in_pool(const Fixed_Size_Pool *pool, const void *ptr)>

Returns whether the given C<*ptr> points to a location in C<pool>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
contained_in_pool(ARGIN(const Fixed_Size_Pool *pool), ARGIN(const void *ptr))
{
    ASSERT_ARGS(contained_in_pool)
    const Fixed_Size_Arena *arena;

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

=item C<void mark_special(PARROT_INTERP, Memory_Pools *mem_pools, PMC *obj)>

Handles marking a PMC. Specifically, calls the VTABLE_mark for that PMC
if one is present. Also handles marking shared PMCs.

=cut

*/

void
mark_special(PARROT_INTERP, ARGMOD(Memory_Pools *mem_pools), ARGIN(PMC *obj))
{
    ASSERT_ARGS(mark_special)

    /*
     * If the object is shared, we have to use the arena and gc
     * pointers of the originating interpreter.
     *
     * We are possibly changing another interpreter's data here, so
     * the mark phase of GC must run only on one interpreter of a pool
     * at a time. However, freeing unused objects can occur in parallel.
     * And: to be sure that a shared object is dead, we have to finish
     * the mark phase of all interpreters in a pool that might reference
     * the object.
     */
    if (PObj_is_PMC_shared_TEST(obj)) {
        interp = PMC_sync(obj)->owner;
        PARROT_ASSERT(interp);

        if (!mem_pools->gc_mark_ptr)
            mem_pools->gc_mark_ptr = obj;
    }

    PObj_get_FLAGS(obj) |= PObj_custom_GC_FLAG;

    /* clearing the flag is much more expensive then testing */
    if (!PObj_needs_early_gc_TEST(obj))
        PObj_high_priority_gc_CLEAR(obj);

    /* mark properties */
    Parrot_gc_mark_PMC_alive(interp, PMC_metadata(obj));

    if (PObj_custom_mark_TEST(obj)) {
        PARROT_ASSERT(!PObj_on_free_list_TEST(obj));
        VTABLE_mark(interp, obj);
    }
}


/*

=item C<void Parrot_gc_clear_live_bits(PARROT_INTERP, const Fixed_Size_Pool
*pool)>

Resets the PMC pool, so all objects are marked as "White". This
is done after a GC run to reset the system and prepare for the
next mark phase.

=cut

*/

void
Parrot_gc_clear_live_bits(SHIM_INTERP, ARGIN(const Fixed_Size_Pool *pool))
{
    ASSERT_ARGS(Parrot_gc_clear_live_bits)
    Fixed_Size_Arena *arena;
    const UINTVAL object_size = pool->object_size;

    for (arena = pool->last_Arena; arena; arena = arena->prev) {
        Buffer *b = (Buffer *)arena->start_objects;
        UINTVAL i;

        for (i = 0; i < arena->used; i++) {
            PObj_live_CLEAR(b);
            b = (Buffer *)((char *)b + object_size);
        }
    }
}


/*

=item C<void Parrot_add_to_free_list(PARROT_INTERP, Fixed_Size_Pool *pool,
Fixed_Size_Arena *arena)>

Adds the objects in the newly allocated C<arena> to the free list of the pool.

=cut

*/

void
Parrot_add_to_free_list(SHIM_INTERP,
        ARGMOD(Fixed_Size_Pool  *pool),
        ARGMOD(Fixed_Size_Arena *arena))
{
    ASSERT_ARGS(Parrot_add_to_free_list)
    void    *object;
    const UINTVAL num_objects = pool->objects_per_alloc;

    pool->total_objects += num_objects;
    object = (void *)arena->start_objects;
#if GC_USE_LAZY_ALLOCATOR
    /* Don't move anything onto the free list. Set the pointers and do it
       lazily when we allocate. */
    {
        const size_t total_size = num_objects * pool->object_size;
        pool->newfree = arena->start_objects;
        pool->newlast = (void*)((char*)object + total_size);
        arena->used = 0;
    }
#else
    /* Move all the new objects into the free list */
    arena->used          = num_objects;
    for (i = 0; i < num_objects; i++) {
        pool->add_free_object(interp, pool, object);
        object = (void *)((char *)object + pool->object_size);
    }
#endif
    pool->num_free_objects += num_objects;
}


/*

=item C<void Parrot_append_arena_in_pool(PARROT_INTERP, Memory_Pools *mem_pools,
Fixed_Size_Pool *pool, Fixed_Size_Arena *new_arena, size_t size)>

Insert the new arena into the pool's structure. Arenas are stored in a
linked list, so add the new arena to the list. Set information in the
arenas structure, such as the number of objects allocated in it.

=cut

*/

void
Parrot_append_arena_in_pool(SHIM_INTERP,
        ARGMOD(Memory_Pools *mem_pools),
        ARGMOD(Fixed_Size_Pool *pool),
        ARGMOD(Fixed_Size_Arena *new_arena), size_t size)
{
    ASSERT_ARGS(Parrot_append_arena_in_pool)

    /* Maintain the *_arena_memory invariant for stack walking code. Set it
     * regardless if we're the first pool to be added. */
    if (!pool->last_Arena
    || (pool->start_arena_memory > (size_t)new_arena->start_objects))
        pool->start_arena_memory = (size_t)new_arena->start_objects;

    if (!pool->last_Arena
    || (pool->end_arena_memory < (size_t)new_arena->start_objects + size))
        pool->end_arena_memory = (size_t)new_arena->start_objects + size;

    new_arena->total_objects = pool->objects_per_alloc;
    new_arena->next          = NULL;
    new_arena->prev          = pool->last_Arena;

    if (new_arena->prev)
        new_arena->prev->next = new_arena;

    pool->last_Arena = new_arena;
    mem_pools->header_allocs_since_last_collect += size;
}

/*

=back

=head2 Header Pool Creation Functions

=over 4

=item C<static Fixed_Size_Pool * new_pmc_pool(PARROT_INTERP)>

Creates and initializes a new pool for PMCs and returns it.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static Fixed_Size_Pool *
new_pmc_pool(PARROT_INTERP)
{
    ASSERT_ARGS(new_pmc_pool)
    const int num_headers = PMC_HEADERS_PER_ALLOC;
    Fixed_Size_Pool * const pmc_pool =
        new_fixed_size_obj_pool(sizeof (PMC), num_headers);

    pmc_pool->mem_pool   = NULL;
    pmc_pool->gc_object  = free_pmc_in_pool;

    (interp->gc_sys->init_pool)(interp, pmc_pool);
    return pmc_pool;
}

/*

=item C<static void free_pmc_in_pool(PARROT_INTERP, Memory_Pools *mem_pools,
Fixed_Size_Pool *pool, PObj *p)>

Frees a PMC that is no longer being used. Calls a custom C<destroy> VTABLE
method if one is available.

=cut

*/

static void
free_pmc_in_pool(PARROT_INTERP,
        ARGIN(Memory_Pools *mem_pools),
        SHIM(Fixed_Size_Pool *pool),
        ARGMOD(PObj *p))
{
    ASSERT_ARGS(free_pmc_in_pool)
    PMC    * const pmc        = (PMC *)p;

    /* TODO collect objects with finalizers */
    if (PObj_needs_early_gc_TEST(p)) {
        --mem_pools->num_early_gc_PMCs;
    }

    Parrot_pmc_destroy(interp, pmc);
}


/*

=item C<static Fixed_Size_Pool * new_bufferlike_pool(PARROT_INTERP, const
Memory_Pools *mem_pools, size_t actual_buffer_size)>

Creates a new pool for buffer-like structures. This is called from
C<get_bufferlike_pool()>, and should probably not be called directly.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static Fixed_Size_Pool *
new_bufferlike_pool(PARROT_INTERP,
        ARGIN(const Memory_Pools *mem_pools),
        size_t actual_buffer_size)
{
    ASSERT_ARGS(new_bufferlike_pool)
    const int num_headers          = BUFFER_HEADERS_PER_ALLOC;
    const size_t buffer_size       =
            (actual_buffer_size + sizeof (void *) - 1) & ~(sizeof (void *) - 1);
    Fixed_Size_Pool * const pool =
            new_fixed_size_obj_pool(buffer_size, num_headers);

    pool->gc_object = (gc_object_fn_type)free_buffer;

    pool->mem_pool  = mem_pools->memory_pool;
    (interp->gc_sys->init_pool)(interp, pool);
    return pool;
}

/*

=item C<static Fixed_Size_Pool * new_fixed_size_obj_pool(size_t object_size,
size_t objects_per_alloc)>

Creates a new C<Fixed_Size_Pool> and returns a pointer to it.
Initializes the pool structure based on the size of objects in the
pool and the number of items to allocate in each arena.

=cut

*/

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static Fixed_Size_Pool *
new_fixed_size_obj_pool(size_t object_size, size_t objects_per_alloc)
{
    ASSERT_ARGS(new_fixed_size_obj_pool)
    Fixed_Size_Pool * const pool =
        mem_internal_allocate_zeroed_typed(Fixed_Size_Pool);

    pool->last_Arena        = NULL;
    pool->free_list         = NULL;
    pool->mem_pool          = NULL;
    pool->object_size       = object_size;
    pool->objects_per_alloc = objects_per_alloc;
#if GC_USE_LAZY_ALLOCATOR
    pool->newfree           = NULL;
    pool->newlast           = NULL;
#endif

    return pool;
}

/*

=item C<static Fixed_Size_Pool * new_string_pool(PARROT_INTERP, Memory_Pools
*mem_pools, INTVAL constant)>

Creates a new pool for C<STRING>s and returns it. This calls
C<get_bufferlike_pool> internally, which in turn calls C<new_bufferlike_pool>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static Fixed_Size_Pool *
new_string_pool(PARROT_INTERP, ARGMOD(Memory_Pools *mem_pools), INTVAL constant)
{
    ASSERT_ARGS(new_string_pool)
    Fixed_Size_Pool *pool;
    if (constant) {
        pool           = new_bufferlike_pool(interp, mem_pools, sizeof (STRING));
        pool->gc_object = NULL;
        pool->mem_pool = mem_pools->constant_string_pool;
    }
    else
        pool = get_bufferlike_pool(interp, mem_pools, sizeof (STRING));

    pool->objects_per_alloc = STRING_HEADERS_PER_ALLOC;

    return pool;
}

/*

=item C<static void free_buffer(PARROT_INTERP, Memory_Pools *mem_pools,
Fixed_Size_Pool *pool, Buffer *b)>

Frees a buffer, returning it to the memory pool for Parrot to possibly
reuse later.

=cut

*/

static void
free_buffer(SHIM_INTERP,
        SHIM(Memory_Pools *mem_pools),
        ARGMOD(Fixed_Size_Pool *pool),
        ARGMOD(Buffer *b))
{
    ASSERT_ARGS(free_buffer)
    Variable_Size_Pool * const mem_pool = (Variable_Size_Pool *)pool->mem_pool;

    /* XXX Jarkko reported that on irix pool->mem_pool was NULL, which really
     * shouldn't happen */
    if (mem_pool) {
        if (!PObj_COW_TEST(b))
            mem_pool->guaranteed_reclaimable += Buffer_buflen(b);
        else
            mem_pool->possibly_reclaimable   += Buffer_buflen(b);
    }

    Buffer_buflen(b) = 0;
}


/*

=item C<Fixed_Size_Pool * get_bufferlike_pool(PARROT_INTERP, Memory_Pools
*mem_pools, size_t buffer_size)>

Makes and return a bufferlike header pool for objects of a given size. If a
pool for objects of that size already exists, no new pool will be created and
the pointer to the existing pool is returned.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Fixed_Size_Pool *
get_bufferlike_pool(PARROT_INTERP,
        ARGMOD(Memory_Pools *mem_pools),
        size_t buffer_size)
{
    ASSERT_ARGS(get_bufferlike_pool)
    Fixed_Size_Pool **sized_pools   = mem_pools->sized_header_pools;
    const UINTVAL       num_old     = mem_pools->num_sized;
    const UINTVAL       idx         = GET_SIZED_POOL_IDX(buffer_size);

    /* Expands the array of sized resource pools, if necessary */
    if (num_old <= idx) {
        const UINTVAL num_new = idx + 1;
        /* XXX: use mem_sys_realloc_zeroed to do this easier? If we want the
                same debugging behavior as mem_internal_realloc, we would
                need to add a new function/macro for
                mem_internal_realloc_zeroed, to mirror mem_sys_realloc_zeroed. */
        sized_pools = (Fixed_Size_Pool **)mem_internal_realloc(sized_pools,
                                           num_new * sizeof (void *));
        memset(sized_pools + num_old, 0, sizeof (void *) * (num_new - num_old));

        mem_pools->sized_header_pools = sized_pools;
        mem_pools->num_sized = num_new;
    }

    if (sized_pools[idx] == NULL)
        sized_pools[idx] = new_bufferlike_pool(interp, mem_pools, buffer_size);

    return sized_pools[idx];
}

/*

=item C<void initialize_fixed_size_pools(PARROT_INTERP, Memory_Pools * const
mem_pools)>

The initialization routine for the interpreter's header pools. Initializes
pools for string headers, constant string headers, buffers, PMCs and
constant PMCs.

The C<string_header_pool> actually lives in the
sized pools, although no other sized pools are created here.

=cut

*/

void
initialize_fixed_size_pools(PARROT_INTERP,
        ARGIN(Memory_Pools * const mem_pools))
{
    ASSERT_ARGS(initialize_fixed_size_pools)

    /* Init the constant string header pool */
    mem_pools->constant_string_header_pool       = new_string_pool(interp, mem_pools, 1);
    mem_pools->constant_string_header_pool->name = "constant_string_header";
    mem_pools->constant_string_header_pool->skip = GC_ALWAYS_SKIP;

    /* Init the buffer header pool
     *
     * The string_header_pool actually lives in the
     * sized_header_pools. These pool pointers only provide faster access in
     * new_*_header */

    /* Init the string header pool */
    mem_pools->string_header_pool       = new_string_pool(interp, mem_pools, 0);
    mem_pools->string_header_pool->name = "string_header";

    /* Init the PMC header pool */
    mem_pools->pmc_pool                 = new_pmc_pool(interp);
    mem_pools->pmc_pool->name           = "pmc";

    /* constant PMCs */
    mem_pools->constant_pmc_pool                    = new_pmc_pool(interp);
    mem_pools->constant_pmc_pool->name              = "constant_pmc";
    mem_pools->constant_pmc_pool->skip              = GC_ALWAYS_SKIP;
    mem_pools->constant_pmc_pool->objects_per_alloc =
        CONSTANT_PMC_HEADERS_PER_ALLOC;
}


/*

=item C<int header_pools_iterate_callback(PARROT_INTERP, Memory_Pools
*mem_pools, int flag, void *arg, pool_iter_fn func)>

Iterates through header pools, invoking the given callback function on each
pool in the list matching the given criteria. Determines which pools to iterate
over depending on flags passed to the function.  Returns the callback's return
value, if non-zero. A non-zero return value from the callback function will
terminate the iteration prematurely.

=over 4

=item flag is one of

  POOL_PMC
  POOL_BUFFER
  POOL_CONST
  POOL_ALL

Only matching pools will be used. Notice that it is not possible to iterate
over certain sets of pools using the provided flags in the single pass. For
instance, both the PMC pool and the constant PMC pool cannot be iterated over
in a single pass.

=item arg

This argument is passed on to the iteration function.

=item pool_iter_fn

Called with C<(Parrot_Interp, Fixed_Size_Pool *, int flag, void *arg)>.  If
the function returns a non-zero value, iteration will stop.

=back

=cut

*/

PARROT_IGNORABLE_RESULT
int
header_pools_iterate_callback(PARROT_INTERP,
        ARGIN(Memory_Pools *mem_pools),
        int flag, ARGIN_NULLOK(void *arg),
        NOTNULL(pool_iter_fn func))
{
    ASSERT_ARGS(header_pools_iterate_callback)

    if (flag & POOL_PMC) {
        Fixed_Size_Pool *pool = flag & POOL_CONST
            ? mem_pools->constant_pmc_pool
            : mem_pools->pmc_pool;

        const int ret_val = (func)(interp, mem_pools, pool,
            flag & (POOL_PMC | POOL_CONST) , arg);

        if (ret_val)
            return ret_val;
    }

    if (flag & POOL_BUFFER) {
        INTVAL i;

        if (flag & POOL_CONST) {
            const int ret_val = (func)(interp, mem_pools,
                mem_pools->constant_string_header_pool,
                POOL_BUFFER | POOL_CONST, arg);

            if (ret_val)
                return ret_val;
        }

        for (i = mem_pools->num_sized - 1; i >= 0; --i) {
            Fixed_Size_Pool * const pool = mem_pools->sized_header_pools[i];

            if (pool) {
                const int ret_val = (func)(interp, mem_pools, pool, POOL_BUFFER, arg);
                if (ret_val)
                    return ret_val;
            }
        }
    }

    return 0;
}

/*

=over 4

=item C<void * Parrot_gc_get_attributes_from_pool(PARROT_INTERP,
PMC_Attribute_Pool * pool)>

Get a new fixed-size storage space from the given pool. The pool contains
information on the size of the item to allocate already.

=item C<static void Parrot_gc_allocate_new_attributes_arena(PMC_Attribute_Pool
*pool)>

Allocate a new arena of fixed-sized data structures for the given pool.

=item C<void Parrot_gc_initialize_fixed_size_pools(PARROT_INTERP, Memory_Pools
*mem_pools, size_t init_num_pools)>

Initialize the pools (zeroize)

=item C<PMC_Attribute_Pool * Parrot_gc_get_attribute_pool(PARROT_INTERP,
Memory_Pools *mem_pools, size_t attrib_size)>

Find a fixed-sized data structure pool given the size of the object to
allocate. If the pool does not exist, create it.

=item C<static PMC_Attribute_Pool * Parrot_gc_create_attrib_pool(size_t
attrib_idx)>

Create a new pool for fixed-sized data items with the given C<attrib_size>.

=back

=cut

*/

PARROT_CANNOT_RETURN_NULL
void *
Parrot_gc_get_attributes_from_pool(PARROT_INTERP, ARGMOD(PMC_Attribute_Pool * pool))
{
    ASSERT_ARGS(Parrot_gc_get_attributes_from_pool)
    PMC_Attribute_Free_List *item;

#if GC_USE_LAZY_ALLOCATOR
    if (pool->free_list) {
        item            = pool->free_list;
        pool->free_list = item->next;
    }
    else if (pool->newfree) {
        item          = pool->newfree;
        pool->newfree = (PMC_Attribute_Free_List *)
                        ((char *)(pool->newfree) + pool->attr_size);
        if (pool->newfree >= pool->newlast)
            pool->newfree = NULL;
    }
    else {
        Parrot_gc_allocate_new_attributes_arena(pool);
        return Parrot_gc_get_attributes_from_pool(interp, pool);
    }
#else
    if (pool->free_list == NULL)
        Parrot_gc_allocate_new_attributes_arena(pool);
    item            = pool->free_list;
    pool->free_list = item->next;
#endif

    pool->num_free_objects--;
    return (void *)item;
}


static void
Parrot_gc_allocate_new_attributes_arena(ARGMOD(PMC_Attribute_Pool *pool))
{
    ASSERT_ARGS(Parrot_gc_allocate_new_attributes_arena)
    PMC_Attribute_Free_List *next;

    const size_t num_items  = pool->objects_per_alloc;
    const size_t item_size  = pool->attr_size;
    const size_t item_space = item_size * num_items;
    const size_t total_size = sizeof (PMC_Attribute_Arena) + item_space;

    PMC_Attribute_Arena * const new_arena = (PMC_Attribute_Arena *)mem_internal_allocate(
        total_size);

    new_arena->prev = NULL;
    new_arena->next = pool->top_arena;
    pool->top_arena = new_arena;
    next            = (PMC_Attribute_Free_List *)(new_arena + 1);

#if GC_USE_LAZY_ALLOCATOR
    pool->newfree   = next;
    pool->newlast   = (PMC_Attribute_Free_List *)((char *)next + item_space);
#else
    pool->free_list = next;
    for (i = 0; i < num_items; i++) {
        list        = next;
        list->next  = (PMC_Attribute_Free_List *)((char *)list + item_size);
        next        = list->next;
    }
    list->next      = pool->free_list;
#endif

    pool->num_free_objects += num_items;
    pool->total_objects    += num_items;
}

void
Parrot_gc_initialize_fixed_size_pools(SHIM_INTERP,
        ARGMOD(Memory_Pools *mem_pools),
        size_t init_num_pools)
{
    ASSERT_ARGS(Parrot_gc_initialize_fixed_size_pools)
    PMC_Attribute_Pool **pools;
    const size_t total_size = (init_num_pools + 1) * sizeof (void *);

    pools = (PMC_Attribute_Pool **)mem_internal_allocate(total_size);
    memset(pools, 0, total_size);

    mem_pools->attrib_pools = pools;
    mem_pools->num_attribs = init_num_pools;
}


PARROT_CANNOT_RETURN_NULL
PMC_Attribute_Pool *
Parrot_gc_get_attribute_pool(SHIM_INTERP,
        ARGMOD(Memory_Pools *mem_pools),
        size_t attrib_size)
{
    ASSERT_ARGS(Parrot_gc_get_attribute_pool)

    PMC_Attribute_Pool **pools = mem_pools->attrib_pools;
    const size_t         idx   = (attrib_size < sizeof (void *))
                               ? 0
                               : attrib_size - sizeof (void *);

    if (mem_pools->num_attribs <= idx) {
        const size_t total_length = idx + GC_ATTRIB_POOLS_HEADROOM;
        const size_t total_size   = total_length * sizeof (void *);
        const size_t current_size = mem_pools->num_attribs;
        const size_t diff         = total_length - current_size;

        pools = (PMC_Attribute_Pool **)mem_internal_realloc(pools, total_size);
        memset(pools + current_size, 0, diff * sizeof (void *));
        mem_pools->attrib_pools = pools;
        mem_pools->num_attribs = total_length;
    }

    if (!pools[idx]) {
        PMC_Attribute_Pool * const pool = Parrot_gc_create_attrib_pool(idx);
        /* Create the first arena now, so we don't have to check for it later */
        Parrot_gc_allocate_new_attributes_arena(pool);
        pools[idx] = pool;
    }

    return pools[idx];
}

PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
static PMC_Attribute_Pool *
Parrot_gc_create_attrib_pool(size_t attrib_idx)
{
    ASSERT_ARGS(Parrot_gc_create_attrib_pool)
    const size_t attrib_size = attrib_idx + sizeof (void *);
    const size_t num_objs_raw =
        (GC_FIXED_SIZE_POOL_SIZE - sizeof (PMC_Attribute_Arena)) / attrib_size;
    const size_t num_objs = (num_objs_raw == 0)?(1):(num_objs_raw);
    PMC_Attribute_Pool * const newpool = mem_internal_allocate_typed(PMC_Attribute_Pool);

    newpool->attr_size         = attrib_size;
    newpool->total_objects     = 0;
    newpool->objects_per_alloc = num_objs;
    newpool->num_free_objects  = 0;
    newpool->free_list         = NULL;
    newpool->top_arena         = NULL;

    return newpool;
}


/*

=back

=head1 SEE ALSO

F<include/parrot/mark_sweep.h>, F<docs/memory_internals.pod>.

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
