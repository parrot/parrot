/* resources.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Handles the accessing of small object pools (header pools)
 *  Data Structure and Algorithms:
 *
 *  History:
 *     Initial version by Mike Lambert on 2002.05.27
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

#define GC_DEBUG_REPLENISH_LEVEL_FACTOR 0.0
#define GC_DEBUG_UNITS_PER_ALLOC_GROWTH_FACTOR 1
#define REPLENISH_LEVEL_FACTOR 0.3
/* this factor is totally arbitrary, but gives good timings for stress.pasm */
#define UNITS_PER_ALLOC_GROWTH_FACTOR 1.75

#define POOL_MAX_BYTES 65536*128

INTVAL
contained_in_pool(struct Parrot_Interp *interpreter,
        struct Small_Object_Pool *pool, void *ptr)
{
    struct Small_Object_Arena *arena;

    for (arena = pool->last_Arena; arena; arena = arena->prev) {
        ptrdiff_t ptr_diff = (ptrdiff_t)ptr - (ptrdiff_t)arena->start_objects;

        if (0 <= ptr_diff
                && ptr_diff <
                (ptrdiff_t)(arena->total_objects * pool->object_size)
                && ptr_diff % pool->object_size == 0)
            return 1;
    }
    return 0;
}

/* We're out of traceable objects. Try a DOD, then get some more if needed */
void
more_traceable_objects(struct Parrot_Interp *interpreter,
        struct Small_Object_Pool *pool)
{
    Parrot_do_dod_run(interpreter);
    /* requires that num_free_objects be updated in Parrot_do_dod_run. If dod
     * is disabled, then we must check the free list directly. */
    if (!pool->free_list || pool->num_free_objects <= pool->replenish_level) {
        (*pool->alloc_objects) (interpreter, pool);
    }
}

/* We're out of non-traceable objects. Get some more */
void
more_non_traceable_objects(struct Parrot_Interp *interpreter,
        struct Small_Object_Pool *pool)
{
    (*pool->alloc_objects) (interpreter, pool);
}

/* Add an unused object back to the free pool for later reuse */
void
add_free_object(struct Parrot_Interp *interpreter,
        struct Small_Object_Pool *pool, void *to_add)
{
    /* This code is copied to add_free_pmc */
    PObj_flags_SETTO((PObj *)to_add, PObj_on_free_list_FLAG);
    *(void **)to_add = pool->free_list;
    pool->free_list = to_add;
    pool->num_free_objects++;
}

/* Get a new object from the free pool and return it */
void *
get_free_object(struct Parrot_Interp *interpreter,
        struct Small_Object_Pool *pool)
{
    /* This code is copied to get_free_pmc and get_free_buffer */
    void *ptr;

    /* if we don't have any objects */
    if (!pool->free_list)
        (*pool->more_objects) (interpreter, pool);

    ptr = pool->free_list;
    pool->free_list = *(void **)ptr;
    return ptr;
}

/* We have no more headers on the free header pool. Go allocate more
 * and put them on */
void
alloc_objects(struct Parrot_Interp *interpreter,
        struct Small_Object_Pool *pool)
{
    struct Small_Object_Arena *new_arena;
    void *object;
    UINTVAL i;
    size_t size = pool->object_size * pool->objects_per_alloc;

    new_arena = mem_sys_allocate(sizeof(struct Small_Object_Arena));

    /* Setup memory for the new objects */
    new_arena->start_objects = mem_sys_allocate_zeroed(size);

    /* Maintain the *_arena_memory invariant for stack walking code. Set it
     * regardless if we're the first pool to be added. */
    if (!pool->last_Arena
            || (pool->start_arena_memory > (size_t)new_arena->start_objects))
        pool->start_arena_memory = (size_t)new_arena->start_objects;

    if (!pool->last_Arena || (pool->end_arena_memory <
                    (size_t)new_arena->start_objects + size))
        pool->end_arena_memory = (size_t)new_arena->start_objects + size;

    /* Hook up the new object block into the object pool */
    new_arena->used = pool->objects_per_alloc;
    new_arena->total_objects = pool->objects_per_alloc;
    new_arena->next = NULL;
    new_arena->prev = pool->last_Arena;
    if (new_arena->prev) {
        new_arena->prev->next = new_arena;
    }
    pool->last_Arena = new_arena;
    interpreter->header_allocs_since_last_collect++;

    /* Move all the new objects into the free list */
    object = new_arena->start_objects;
    for (i = 0; i < pool->objects_per_alloc; i++) {
        add_free_object (interpreter, pool, object);
        object = (void *)((char *)object + pool->object_size);
    }

    /* Allocate more next time */
    pool->total_objects += pool->objects_per_alloc;
    if (GC_DEBUG(interpreter)) {
        pool->objects_per_alloc *= GC_DEBUG_UNITS_PER_ALLOC_GROWTH_FACTOR;
        pool->replenish_level =
                (size_t)(pool->total_objects *
                GC_DEBUG_REPLENISH_LEVEL_FACTOR);
    }
    else {
        pool->objects_per_alloc *= UNITS_PER_ALLOC_GROWTH_FACTOR;
        pool->replenish_level =
                (size_t)(pool->total_objects * REPLENISH_LEVEL_FACTOR);
    }
    /* check alloc size agains maximum and set new allocation data */
    size = pool->object_size * pool->objects_per_alloc;

    if (size > POOL_MAX_BYTES) {
        pool->objects_per_alloc = POOL_MAX_BYTES / pool->object_size;
    }
}

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
    pool->alloc_objects = alloc_objects;
    return pool;
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
