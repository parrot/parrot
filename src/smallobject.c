/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/resources.c - Handling Small Object Pools

=head1 DESCRIPTION

Handles the accessing of small object pools (header pools).

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include <assert.h>

#define GC_DEBUG_REPLENISH_LEVEL_FACTOR 0.0
#define GC_DEBUG_UNITS_PER_ALLOC_GROWTH_FACTOR 1
#define REPLENISH_LEVEL_FACTOR 0.3
/* this factor is totally arbitrary, but gives good timings for stress.pasm */
#define UNITS_PER_ALLOC_GROWTH_FACTOR 1.75

#define POOL_MAX_BYTES 65536*128

/*

=item C<INTVAL
contained_in_pool(struct Parrot_Interp *interpreter,
        struct Small_Object_Pool *pool, void *ptr)>

Returns whether C<pool> contains C<*ptr>.

=cut

*/

INTVAL
contained_in_pool(struct Parrot_Interp *interpreter,
        struct Small_Object_Pool *pool, void *ptr)
{
    struct Small_Object_Arena *arena;

    for (arena = pool->last_Arena; arena; arena = arena->prev) {
        ptrdiff_t ptr_diff = (ptrdiff_t)ptr - (ptrdiff_t)arena->start_objects;

        if (0 <= ptr_diff
                && ptr_diff <
                (ptrdiff_t)(arena->used * pool->object_size)
                && ptr_diff % pool->object_size == 0)
            return 1;
    }
    return 0;
}

/*

=item C<int
Parrot_is_const_pmc(Parrot_Interp interpreter, PMC *pmc)>

Returns whether C<*pmc> is a constant PMC.

=cut

*/

int
Parrot_is_const_pmc(Parrot_Interp interpreter, PMC *pmc)
{
    struct Small_Object_Pool *pool
        = interpreter->arena_base->constant_pmc_pool;
    int c;
#if  ARENA_DOD_FLAGS
    c = GET_ARENA(pmc)->pool == pool;
#else
    c = contained_in_pool(interpreter, pool, pmc);
#endif

    /* some paranoia first */
    assert(!!PObj_constant_TEST(pmc) == !!c);
    return c;
}


/*

=item C<void
more_traceable_objects(struct Parrot_Interp *interpreter,
        struct Small_Object_Pool *pool)>

We're out of traceable objects. Try a DOD, then get some more if needed.

=cut

*/

void
more_traceable_objects(struct Parrot_Interp *interpreter,
        struct Small_Object_Pool *pool)
{
    if (pool->skip)
        pool->skip = 0;
    else if (pool->last_Arena) {
        Parrot_do_dod_run(interpreter, DOD_trace_stack_FLAG);
        if (pool->num_free_objects <= pool->replenish_level)
            pool->skip = 1;
    }

    /* requires that num_free_objects be updated in Parrot_do_dod_run. If dod
     * is disabled, then we must check the free list directly. */
    if (!pool->free_list) {
        (*pool->alloc_objects) (interpreter, pool);
    }
}

/*

=item C<void
more_non_traceable_objects(struct Parrot_Interp *interpreter,
        struct Small_Object_Pool *pool)>

We're out of non-traceable objects. Get some more.

=cut

*/

void
more_non_traceable_objects(struct Parrot_Interp *interpreter,
        struct Small_Object_Pool *pool)
{
    (*pool->alloc_objects) (interpreter, pool);
}

/*

=item C<void
add_free_object(struct Parrot_Interp *interpreter,
        struct Small_Object_Pool *pool, void *to_add)>

Add an unused object back to the free pool for later reuse.

=item C<static void *
get_free_object(struct Parrot_Interp *interpreter,
        struct Small_Object_Pool *pool)>

Get a new object from the free pool and return it.

=cut

*/

void
add_free_object(struct Parrot_Interp *interpreter,
        struct Small_Object_Pool *pool, void *to_add)
{
    *(void **)to_add = pool->free_list;
    pool->free_list = to_add;
}


static void *
get_free_object(struct Parrot_Interp *interpreter,
        struct Small_Object_Pool *pool)
{
    void *ptr;

    /* if we don't have any objects */
    if (!pool->free_list)
        (*pool->more_objects) (interpreter, pool);
    ptr = pool->free_list;
    pool->free_list = *(void **)ptr;
    PObj_on_free_list_CLEAR((PObj*) ptr);
#if ! DISABLE_GC_DEBUG
    if (GC_DEBUG(interpreter))
        PObj_version((Buffer*)ptr) = interpreter->dod_runs;
#endif
    return ptr;
}

#if ARENA_DOD_FLAGS
static void *
get_free_object_df(struct Parrot_Interp *interpreter,
        struct Small_Object_Pool *pool)
{
    void *ptr;

    /* if we don't have any objects */
    if (!pool->free_list)
        (*pool->more_objects) (interpreter, pool);
    ptr = pool->free_list;
    pool->free_list = *(void **)ptr;
    *((Dead_PObj*)ptr)->arena_dod_flag_ptr &=
        ~ (PObj_on_free_list_FLAG << ((Dead_PObj*)ptr)->flag_shift);
#if ! DISABLE_GC_DEBUG
    if (GC_DEBUG(interpreter))
        PObj_version((Buffer*)ptr) = interpreter->dod_runs;
#endif
    return ptr;
}


#endif

/*

=item C<static void
add_to_free_list(struct Parrot_Interp *interpreter,
        struct Small_Object_Pool *pool,
        struct Small_Object_Arena *arena,
        UINTVAL start,
        UINTVAL end)>

Adds the memory between C<start> and C<end> to the free list.

=cut

*/

static void
add_to_free_list(struct Parrot_Interp *interpreter,
        struct Small_Object_Pool *pool,
        struct Small_Object_Arena *arena,
        UINTVAL start,
        UINTVAL end)
{
#if ARENA_DOD_FLAGS
    UINTVAL *dod_flags;
    UINTVAL nm;
#endif
    UINTVAL i;
    void *object;

    pool->total_objects += end - start;
    arena->used = end;

    /* Move all the new objects into the free list */
    object = (void *)((char *)arena->start_objects +
            start * pool->object_size);
#if ARENA_DOD_FLAGS
    pool->replenish_level =
                (size_t)(pool->total_objects * REPLENISH_LEVEL_FACTOR);
    dod_flags = arena->dod_flags + (start >> ARENA_FLAG_SHIFT);
    assert((start & ARENA_FLAG_MASK) == 0);
    nm = 0;
#endif
    for (i = start; i < end; i++) {
#if ARENA_DOD_FLAGS
        if (! (i & ARENA_FLAG_MASK)) {
            *dod_flags = ALL_FREE_MASK;
            if (pool->object_size >= sizeof(Dead_PObj))
                ((Dead_PObj*)object)->arena_dod_flag_ptr = dod_flags;
            ++dod_flags;
            nm = 0;
        }
        else {
            if (pool->object_size >= sizeof(Dead_PObj))
                ((Dead_PObj*)object)->arena_dod_flag_ptr = dod_flags - 1;
            nm += 4;
        }
        if (pool->object_size >= sizeof(Dead_PObj))
            ((Dead_PObj*)object)->flag_shift = nm;
#else
        PObj_flags_SETTO((PObj *)object, PObj_on_free_list_FLAG);
#endif
        pool->add_free_object (interpreter, pool, object);
        object = (void *)((char *)object + pool->object_size);
    }
#if ARENA_DOD_FLAGS
    /* set last */
    *dod_flags = ALL_FREE_MASK;
#endif
}

/*

=item C<void
alloc_objects(struct Parrot_Interp *interpreter,
        struct Small_Object_Pool *pool)>

We have no more headers on the free header pool. Go allocate more
and put them on.

=cut

*/

void
alloc_objects(struct Parrot_Interp *interpreter,
        struct Small_Object_Pool *pool)
{
    struct Small_Object_Arena *new_arena;
    size_t size;
    UINTVAL start, end;

    /* Setup memory for the new objects */
#if ARENA_DOD_FLAGS
    size_t offset;

    /* check old arena first */
    if (pool->last_Arena &&
            pool->last_Arena->used < pool->last_Arena->total_objects) {
        start = pool->last_Arena->used;
        end = start << 2;
        if (end > pool->last_Arena->total_objects)
            end = pool->last_Arena->total_objects;
        add_to_free_list(interpreter, pool, pool->last_Arena, start, end);
        return;
    }

    size = ARENA_SIZE;
    /*
     * [ Note: Linux ]
     * Albeit we reserve x pools with 500KB each, the memory footprint
     * of a running program is much smaller, if only a few objects per pool
     * are used. The unused pages of the arenas are only mapped (they use space
     * in the page tables, but no physical memory).
     * Because of the COW pages strategy of the kernel, there shouldn't
     * be a problem with many running instances too at least if these get
     * fork'ed or were created as threads.
     * For many unique parrot processes, you might either reduce ARENA_SIZE
     * or turn off ARENA_DOD_FLAGS.
     */
    new_arena = Parrot_memalign(ARENA_ALIGN, size);
    if (!new_arena)
        PANIC("Out of arena memory");
    /* offset in bytes of whole Objects */
    offset = ( 1 + sizeof(struct Small_Object_Arena) / pool->object_size) *
        pool->object_size;
    new_arena->start_objects = (char *)new_arena + offset;
    size -= offset;
    pool->objects_per_alloc = size / pool->object_size;
    new_arena->object_size = pool->object_size;
#ifdef SIMULATE_DIRTY_AND_RUN_SLOW
    /* memory gets washed in get_free_*, so we don't need zeroed
     * memory here
     */
    memset(new_arena->start_objects, 0xff, size); /* simulate dirty */
#endif
    new_arena->dod_flags = mem_sys_allocate(ARENA_FLAG_SIZE(pool));
    new_arena->pool = pool;
#else
    new_arena = mem_sys_allocate(sizeof(struct Small_Object_Arena));
    if (!new_arena)
        PANIC("Out of arena memory");
    size = pool->object_size * pool->objects_per_alloc;
    /* could be mem_sys_allocate too, but calloc is fast */
    new_arena->start_objects = mem_sys_allocate_zeroed(size);
#endif

    /* Maintain the *_arena_memory invariant for stack walking code. Set it
     * regardless if we're the first pool to be added. */
    if (!pool->last_Arena
            || (pool->start_arena_memory > (size_t)new_arena->start_objects))
        pool->start_arena_memory = (size_t)new_arena->start_objects;

    if (!pool->last_Arena || (pool->end_arena_memory <
                    (size_t)new_arena->start_objects + size))
        pool->end_arena_memory = (size_t)new_arena->start_objects + size;

    /* Hook up the new object block into the object pool */
#if ARENA_DOD_FLAGS
    /* not the first one - put all on free list */
    if (pool->last_Arena) {
        start = 0;
        end = pool->objects_per_alloc;
    }
    else {
        /* first arena, start with x objects */
        start = 0;
        end = 1024*2;
        assert(end < pool->objects_per_alloc);
    }
#else
    start = 0;
    end = pool->objects_per_alloc;
#endif
    new_arena->total_objects = pool->objects_per_alloc;
    new_arena->next = NULL;
    new_arena->prev = pool->last_Arena;
    if (new_arena->prev) {
        new_arena->prev->next = new_arena;
    }
    pool->last_Arena = new_arena;
    interpreter->header_allocs_since_last_collect++;

    add_to_free_list(interpreter, pool, new_arena, start, end);

#if ! ARENA_DOD_FLAGS
    /* Allocate more next time */
    if (GC_DEBUG(interpreter)) {
        pool->objects_per_alloc *= GC_DEBUG_UNITS_PER_ALLOC_GROWTH_FACTOR;
        pool->replenish_level =
                (size_t)(pool->total_objects *
                GC_DEBUG_REPLENISH_LEVEL_FACTOR);
    }
    else {
        pool->objects_per_alloc = (UINTVAL) pool->objects_per_alloc * UNITS_PER_ALLOC_GROWTH_FACTOR;
        pool->replenish_level =
                (size_t)(pool->total_objects * REPLENISH_LEVEL_FACTOR);
    }
    /* check alloc size against maximum */
    size = pool->object_size * pool->objects_per_alloc;

    if (size > POOL_MAX_BYTES) {
        pool->objects_per_alloc = POOL_MAX_BYTES / pool->object_size;
    }
#endif
}

/*

=item C<struct Small_Object_Pool *
new_small_object_pool(struct Parrot_Interp *interpreter,
        size_t object_size, size_t objects_per_alloc)>

Creates a new C<Small_Object_Pool> and returns a pointer to it.

=cut

*/

struct Small_Object_Pool *
new_small_object_pool(struct Parrot_Interp *interpreter,
        size_t object_size, size_t objects_per_alloc)
{
    struct Small_Object_Pool *pool;

    pool = mem_sys_allocate_zeroed(sizeof(struct Small_Object_Pool));
    SET_NULL(pool->last_Arena);
    SET_NULL(pool->free_list);
    SET_NULL(pool->mem_pool);
    pool->object_size = object_size;
    pool->objects_per_alloc = objects_per_alloc;
    pool->add_free_object = add_free_object;
    pool->get_free_object = get_free_object;
#if ARENA_DOD_FLAGS
    if (object_size >= sizeof(Dead_PObj))
        pool->get_free_object = get_free_object_df;
#endif
    pool->alloc_objects = alloc_objects;
    return pool;
}

/*

=back

=head1 SEE ALSO

F<include/parrot/smallobject.h>, F<docs/memory_internals.pod>.

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
