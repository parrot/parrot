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

#define REPLENISH_LEVEL_FACTOR 0.8
#define UNITS_PER_ALLOC_GROWTH_FACTOR 4

INTVAL
contained_in_pool(struct Parrot_Interp *interpreter,
            struct Small_Object_Pool *pool, void *ptr)
{
    struct Small_Object_Arena *arena;
    
    for (arena = pool->last_Arena; arena; arena = arena->prev) {
        ptrdiff_t ptr_diff = (ptrdiff_t)ptr - (ptrdiff_t)arena->start_objects;
        if (0 <= ptr_diff && ptr_diff < (ptrdiff_t)arena->total_objects * pool->object_size
        &&  ptr_diff % pool->object_size == 0)
            return 1;
    }
    return 0;
}

void
add_free_object(struct Parrot_Interp *interpreter,
                 struct Small_Object_Pool *pool, void *to_add)
{
    /* Okay, so there's space. Add the header on */
    *(void **)to_add = pool->free_list;
    pool->free_list = to_add;
    pool->num_free_objects++;
}

void *
get_free_object(struct Parrot_Interp *interpreter,
                   struct Small_Object_Pool *pool)
{
    void *ptr;
    
    if (!pool->num_free_objects) {
        if (pool->free_objects) {
            (*pool->free_objects)(interpreter, pool);
        }
        if (pool->num_free_objects <= pool->replenish_level) {
            (*pool->more_objects)(interpreter, pool);
        }
    }

    if (!pool->num_free_objects) {
        return NULL;
    }

    ptr = pool->free_list;
    pool->free_list = *(void **)ptr;
    pool->num_free_objects--;
    return ptr;
}

/* We have no more headers on the free header pool. Go allocate more
 * and put them on */
void
alloc_more_objects(struct Parrot_Interp *interpreter,
                          struct Small_Object_Pool *pool)
{
    struct Small_Object_Arena *new_arena;
    void *object;
    UINTVAL i;

    new_arena = mem_sys_allocate(sizeof(struct Small_Object_Arena));

    /* Setup memory for the new objects */
    new_arena->start_objects = 
        mem_sys_allocate(pool->object_size * pool->objects_per_alloc);
    memset(new_arena->start_objects, 0, 
           pool->object_size * pool->objects_per_alloc);
 
    /* Hook up the new object block into the object pool */
    new_arena->used = pool->objects_per_alloc;
    new_arena->total_objects = pool->objects_per_alloc;
    new_arena->next = NULL;
    new_arena->prev = pool->last_Arena;
    if (new_arena->prev) {
        new_arena->prev->next = new_arena;
    }
    pool->last_Arena = new_arena;

    if (pool->start_arena_memory > (size_t)new_arena->start_objects)
        pool->start_arena_memory = (size_t)new_arena->start_objects;

    if (pool->end_arena_memory < (size_t)new_arena->start_objects
                               + pool->object_size * pool->objects_per_alloc)
        pool->end_arena_memory = (size_t)new_arena->start_objects
                               + pool->object_size * pool->objects_per_alloc;

    /* Move all the new objects into the free list */
    object = new_arena->start_objects;
    for (i = 0; i < pool->objects_per_alloc; i++) {
        (*pool->add_free_object)(interpreter, pool, object);
        object = (void *)((char *)object + pool->object_size);
    }

    /* Allocate more next time */
    pool->total_objects += pool->objects_per_alloc;
    pool->objects_per_alloc *= UNITS_PER_ALLOC_GROWTH_FACTOR;
    pool->replenish_level = (size_t)(pool->total_objects * REPLENISH_LEVEL_FACTOR);
}

struct Small_Object_Pool *
new_small_object_pool(struct Parrot_Interp *interpreter,
                  size_t object_size, size_t objects_per_alloc)
{
    struct Small_Object_Pool *pool;

    pool = mem_sys_allocate(sizeof(struct Small_Object_Pool));
    pool->num_free_objects = 0;
    pool->object_size = object_size;
    pool->objects_per_alloc = objects_per_alloc;
    pool->add_free_object = add_free_object;
    pool->get_free_object = get_free_object;
    pool->free_objects = NULL;
    pool->more_objects = alloc_more_objects;
    pool->replenish_level = 0;
    pool->free_list = NULL;
	return pool;
}


/* Use get_sized_small_object_pool and set_sized_small_object_pool for
 * when you want a pool of a given size, and don't particularly care what's in it */
struct Small_Object_Pool *
get_sized_small_object_pool(struct Parrot_Interp *interpreter, size_t object_size)
{
    size_t new_object_size;
    UINTVAL idx;
    UINTVAL num_old = interpreter->arena_base->num_sized;
    struct Small_Object_Pool** sized_pools =
        interpreter->arena_base->sized_header_pools;

    new_object_size = (object_size + sizeof(void*) - 1) & ~(sizeof(void*) - 1);
    idx = new_object_size / sizeof(void*);

    if (num_old <= idx) {
        return NULL;
    }

    return sized_pools[idx];
}

void
set_sized_small_object_pool(struct Parrot_Interp *interpreter, 
                            size_t object_size, struct Small_Object_Pool *pool)
{
    size_t new_object_size;
    UINTVAL idx;
    UINTVAL num_old = interpreter->arena_base->num_sized;
    struct Small_Object_Pool** sized_pools =
        interpreter->arena_base->sized_header_pools;

    new_object_size = (object_size + sizeof(void*) - 1) & ~(sizeof(void*) - 1);
    idx = new_object_size / sizeof(void*);

    /* for speed and sanity reasons */
    if( new_object_size > 64 ) {
        internal_exception(ALLOCATION_ERROR,
            "Error: Cannot allocate sized small_object pools of more than 64 bytes\n");
    }

    /* Expand the array of sized resource pools, if necessary */
    if (num_old <= idx) {
        UINTVAL num_new = idx + 1;
        sized_pools = mem_sys_realloc(sized_pools, num_new * sizeof(void*));
        memset(sized_pools + num_old, 0, sizeof(void*) * (num_new - num_old));
        interpreter->arena_base->sized_header_pools = sized_pools;
        interpreter->arena_base->num_sized = num_new;
    }

    /* set the element if it doesn't exist, or die if it does */
    if (sized_pools[idx] == NULL) {
        sized_pools[idx] = pool;
    } else if(pool != NULL) {
        internal_exception(ALLOCATION_ERROR,
            "Error: Tried to set a small-object pool when one has already been set!\n");
        
    }
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
