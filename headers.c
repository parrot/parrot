/* headers.c 
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Header management functions. Handles getting of various headers, 
 *     and pool creation
 *  Data Structure and Algorithms:
 *     
 *  History:
 *     Initial version by Mike Lambert on 2002.05.27
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

#define PMC_HEADERS_PER_ALLOC 256
#define BUFFER_HEADERS_PER_ALLOC 256
#define STRING_HEADERS_PER_ALLOC 256

/** PMC Header Functions for small-object lookup table **/

void
add_free_pmc(struct Parrot_Interp *interpreter, 
             struct Small_Object_Pool *pool, void *pmc)
{
    ((PMC *)pmc)->flags = PMC_on_free_list_FLAG;
    /* Don't let it point to garbage memory */
    ((PMC *)pmc)->data = NULL;

    /* Copied from add_free_object */
    *(void **)pmc = pool->free_list;
    pool->free_list = pmc;
}
void *
get_free_pmc(struct Parrot_Interp *interpreter, struct Small_Object_Pool *pool)
{
    /* Copied from get_free_object */
    PMC *pmc;
    if (!pool->free_list)
        (*pool->more_objects)(interpreter, pool);
    pmc = pool->free_list;
    pool->free_list = *(void **)pmc;
    
    pmc->flags = 0;
    /* Make sure it doesn't seem to be on the GC list */
    pmc->next_for_GC = NULL;
    
    return pmc;
}
void 
alloc_pmcs(struct Parrot_Interp *interpreter, 
                struct Small_Object_Pool *pool)
{
    interpreter->total_PMCs += pool->objects_per_alloc;
    interpreter->header_allocs_since_last_collect++;
    alloc_objects(interpreter, pool);
}


/** Buffer Header Functions for small-object lookup table **/

void
add_free_buffer(struct Parrot_Interp *interpreter, 
                struct Small_Object_Pool *pool, void *buffer)
{
    ((Buffer *)buffer)->flags = BUFFER_on_free_list_FLAG;
    /* Use the right length */
    ((Buffer *)buffer)->buflen = 0;

    /* Copied from add_free_object */
    *(void **)buffer = pool->free_list;
    pool->free_list = buffer;
}
void *
get_free_buffer(struct Parrot_Interp *interpreter, 
                struct Small_Object_Pool *pool)
{
    /* Copied from get_free_object */
    Buffer *buffer;
    if (!pool->free_list)
        (*pool->more_objects)(interpreter, pool);
    buffer = pool->free_list;
    pool->free_list = *(void **)buffer;
    
    /* Don't let it point to garbage memory */
    buffer->bufstart = NULL;
    buffer->flags = 0;
    
    return buffer;
}
void 
alloc_buffers(struct Parrot_Interp *interpreter, 
                   struct Small_Object_Pool *pool)
{
    interpreter->total_Buffers += pool->objects_per_alloc;
    interpreter->header_allocs_since_last_collect++;
    alloc_objects(interpreter, pool);
}



/** Header Pool Creation Functions **/

struct Small_Object_Pool *
new_pmc_pool(struct Parrot_Interp *interpreter)
{
    struct Small_Object_Pool *pmc_pool = new_small_object_pool(
                      interpreter, sizeof(PMC), PMC_HEADERS_PER_ALLOC);
    pmc_pool->add_free_object = add_free_pmc;
    pmc_pool->get_free_object = get_free_pmc;
    pmc_pool->alloc_objects = alloc_pmcs;
    pmc_pool->more_objects = more_traceable_objects;
    pmc_pool->mem_pool = interpreter->arena_base->memory_pool;
    return pmc_pool;
}

/* Creates a new pool for buffer-like structures. 
 * Usually you would need get_bufferlike_pool. */
struct Small_Object_Pool *
new_bufferlike_pool(struct Parrot_Interp *interpreter,
                        size_t actual_buffer_size)
{
    size_t buffer_size = 
        (actual_buffer_size + sizeof(void*) - 1) & ~(sizeof(void*) - 1);
    struct Small_Object_Pool *pool = 
        new_small_object_pool(interpreter, buffer_size,
                          BUFFER_HEADERS_PER_ALLOC);
    pool->add_free_object = add_free_buffer;
    pool->get_free_object = get_free_buffer;
    pool->alloc_objects = alloc_buffers;
    pool->more_objects = more_traceable_objects;
    pool->mem_pool = interpreter->arena_base->memory_pool;
    pool->align_1 = BUFFER_ALIGNMENT-1;
    return pool;
}

struct Small_Object_Pool *
new_buffer_pool(struct Parrot_Interp *interpreter)
{
    struct Small_Object_Pool *pool = 
        new_bufferlike_pool(interpreter, sizeof(Buffer));
    return pool;
}

struct Small_Object_Pool *
new_string_pool(struct Parrot_Interp *interpreter, INTVAL constant)
{
    struct Small_Object_Pool *pool = 
        new_bufferlike_pool(interpreter, sizeof(STRING));
    pool->objects_per_alloc = STRING_HEADERS_PER_ALLOC;
    pool->align_1 = STRING_ALIGNMENT-1;
    if (constant) {
        pool->mem_pool = interpreter->arena_base->constant_string_pool;
    }
    return pool;
}


/* returns a Bufferlike Header Pool */
struct Small_Object_Pool *
get_bufferlike_pool(struct Parrot_Interp *interpreter,
                        size_t buffer_size)
{
    UINTVAL idx;
    UINTVAL num_old = interpreter->arena_base->num_sized;
    struct Small_Object_Pool** sized_pools =
        interpreter->arena_base->sized_header_pools;
    
    idx = (buffer_size - sizeof(Buffer)) / sizeof(void*);

    /* Expand the array of sized resource pools, if necessary */
    if (num_old <= idx) {
        UINTVAL num_new = idx + 1;
        sized_pools = mem_sys_realloc(sized_pools, num_new * sizeof(void*));
        memset(sized_pools + num_old, 0, sizeof(void*) * (num_new - num_old));
        interpreter->arena_base->sized_header_pools = sized_pools;
        interpreter->arena_base->num_sized = num_new;
    }

    if (sized_pools[idx] == NULL) {
        sized_pools[idx] = new_bufferlike_pool(interpreter,buffer_size);
    }

    return sized_pools[idx];
    /* FIXME! Sized buffer headers are currently not collected! */
}



/** Get a header **/

PMC *
new_pmc_header(struct Parrot_Interp *interpreter)
{
    /* Icky special case. Grab system memory if there's no interpreter
     * yet */
    if (interpreter == NULL) {
        PMC *return_me = mem_sys_allocate(sizeof(PMC));
        return return_me;
    }

    return get_free_pmc(interpreter, interpreter->arena_base->pmc_pool);
}

STRING *
new_string_header(struct Parrot_Interp *interpreter, UINTVAL flags)
{
    STRING * string;
    /* Icky special case. Grab system memory if there's no interpreter
     * yet */
    if (interpreter == NULL) {
        STRING *return_me = mem_sys_allocate(sizeof(STRING));
        return_me->flags = flags;
        return return_me;
    }
    string = get_free_buffer(interpreter, (flags & BUFFER_constant_FLAG)
                             ? interpreter->arena_base->constant_string_header_pool
                             : interpreter->arena_base->string_header_pool
                             );
    string->flags |= flags;
    return string;
}

Buffer *
new_buffer_header(struct Parrot_Interp *interpreter)
{
    /* Icky special case. Grab system memory if there's no interpreter
     * yet */
    if (interpreter == NULL) {
        Buffer *return_me = mem_sys_allocate(sizeof(Buffer));
        return return_me;
    }

    return get_free_buffer(interpreter, 
                              interpreter->arena_base->buffer_header_pool);
}

void *
new_bufferlike_header(struct Parrot_Interp *interpreter, size_t size)
{
    struct Small_Object_Pool* pool;
    Buffer *buffer;

    /* Icky special case. Grab system memory if there's no interpreter
     * yet */
    if (interpreter == NULL) {
        Buffer *return_me = mem_sys_allocate(size);
        return return_me;
    }

    pool = get_bufferlike_pool(interpreter, size);
    
    buffer = get_free_buffer(interpreter, pool);
    buffer->bufstart = NULL;
    buffer->buflen = 0;
    return buffer;
}


size_t
get_max_buffer_address(struct Parrot_Interp *interpreter)
{
    UINTVAL i;
    size_t max = interpreter->arena_base->string_header_pool->end_arena_memory;

    if (max < interpreter->arena_base->buffer_header_pool->end_arena_memory)
        max = interpreter->arena_base->buffer_header_pool->end_arena_memory;

    if (max < interpreter->arena_base->constant_string_header_pool->end_arena_memory)
        max = interpreter->arena_base->constant_string_header_pool->end_arena_memory;

    for(i = 0; i<interpreter->arena_base->num_sized; i++) {
        if (interpreter->arena_base->sized_header_pools[i]) {
            if (max < interpreter->arena_base->sized_header_pools[i]->end_arena_memory)
                max = interpreter->arena_base->sized_header_pools[i]->end_arena_memory;
        }
    }
    
    return max;
}
size_t
get_min_buffer_address(struct Parrot_Interp *interpreter)
{
    UINTVAL i;
    size_t min = interpreter->arena_base->string_header_pool->start_arena_memory;

    if (min > interpreter->arena_base->buffer_header_pool->start_arena_memory)
        min = interpreter->arena_base->buffer_header_pool->start_arena_memory;

    if (min > interpreter->arena_base->constant_string_header_pool->start_arena_memory)
        min = interpreter->arena_base->constant_string_header_pool->start_arena_memory;

    for(i = 0; i<interpreter->arena_base->num_sized; i++) {
        if (interpreter->arena_base->sized_header_pools[i]) {
            if (min > interpreter->arena_base->sized_header_pools[i]->start_arena_memory)
                min = interpreter->arena_base->sized_header_pools[i]->start_arena_memory;
        }
    }
    
    return min;
}

size_t
get_max_pmc_address(struct Parrot_Interp *interpreter)
{
    return interpreter->arena_base->pmc_pool->end_arena_memory;
}
size_t
get_min_pmc_address(struct Parrot_Interp *interpreter)
{
    return interpreter->arena_base->pmc_pool->start_arena_memory;
}

int
is_buffer_ptr(struct Parrot_Interp *interpreter, void *ptr)
{
    UINTVAL i;
    
    if (contained_in_pool(interpreter, 
                          interpreter->arena_base->string_header_pool, ptr))
        return 1;
    if (contained_in_pool(interpreter, 
                          interpreter->arena_base->buffer_header_pool, ptr))
        return 1;
    if (contained_in_pool(interpreter, 
                          interpreter->arena_base->constant_string_header_pool, ptr))
        return 1;

    for(i = 0; i<interpreter->arena_base->num_sized; i++) {
        if (interpreter->arena_base->sized_header_pools[i] && 
            contained_in_pool(interpreter, 
                              interpreter->arena_base->sized_header_pools[i], ptr))
            return 1;
    }

    return 0;
}

int
is_pmc_ptr(struct Parrot_Interp *interpreter, void *ptr)
{
    return contained_in_pool(interpreter, 
                             interpreter->arena_base->pmc_pool, ptr);
}


void
free_pmc(PMC *pmc)
{
    if (pmc) {
        memset(pmc, 0, sizeof(PMC));
    }
}

void
free_buffer(Buffer *thing)
{
    if (thing) {
        if (thing->bufstart && (thing->flags & BUFFER_sysmem_FLAG)) {
            mem_sys_free(thing->bufstart);
        }
        thing->bufstart = NULL;
        thing->buflen = 0;
        thing->flags = 0;
    }
}

void
add_extra_buffer_header(struct Parrot_Interp *interpreter, void* buffer)
{
    Buffer* headers = &interpreter->arena_base->extra_buffer_headers;
    void** ptr;
    Parrot_reallocate(interpreter, headers, headers->buflen + sizeof(void*));
    ptr = (void**)((char*)headers->bufstart + headers->buflen - sizeof(void*));
    *ptr = buffer;
}


/* Initialize the pools for the tracked resources */
void
Parrot_initialize_header_pools(struct Parrot_Interp *interpreter)
{
    Parrot_allocate(interpreter, &interpreter->arena_base->extra_buffer_headers, 0);
    add_extra_buffer_header(interpreter,&interpreter->arena_base->extra_buffer_headers);

    /* Init the buffer header pool - this must be the first pool created! */
    interpreter->arena_base->buffer_header_pool = new_buffer_pool(interpreter);

    /* Init the string header pool */
    interpreter->arena_base->string_header_pool = new_string_pool(interpreter, 0);
    
    /* Init the PMC header pool */
    interpreter->arena_base->pmc_pool = new_pmc_pool(interpreter);

    /* Init the constant string header pool */
    interpreter->arena_base->constant_string_header_pool = new_string_pool(interpreter, 1);
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
