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

#define GC_DEBUG_PMC_HEADERS_PER_ALLOC 1
#define GC_DEBUG_BUFFER_HEADERS_PER_ALLOC 1
#define GC_DEBUG_STRING_HEADERS_PER_ALLOC 1
#ifndef GC_IS_MALLOC
#    define PMC_HEADERS_PER_ALLOC 256
#    define BUFFER_HEADERS_PER_ALLOC 256
#    define STRING_HEADERS_PER_ALLOC 256
#else /* GC_IS_MALLOC */
#    define PMC_HEADERS_PER_ALLOC 512
#    define BUFFER_HEADERS_PER_ALLOC 512
#    define STRING_HEADERS_PER_ALLOC 512
#endif /* GC_IS_MALLOC */

/** PMC Header Functions for small-object lookup table **/

void
add_free_pmc(struct Parrot_Interp *interpreter,
        struct Small_Object_Pool *pool, void *pmc)
{
    if (PObj_active_destroy_TEST((PMC *)pmc))
        ((PMC *)pmc)->vtable->destroy(interpreter, (PMC *)pmc);
    PObj_flags_SETTO((PMC *)pmc, PObj_on_free_list_FLAG);

    /* Don't let it point to garbage memory */
    ((PMC *)pmc)->data = NULL;
    ((PMC *)pmc)->metadata = NULL;

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
        (*pool->more_objects) (interpreter, pool);

    pmc = pool->free_list;
    pool->free_list = *(void **)pmc;

    PObj_flags_SETTO(pmc, 0);
    /* Make sure it doesn't seem to be on the GC list */
    pmc->next_for_GC = NULL;

    return pmc;
}

void
alloc_pmcs(struct Parrot_Interp *interpreter, struct Small_Object_Pool *pool)
{
    interpreter->total_PMCs += pool->objects_per_alloc;
    interpreter->header_allocs_since_last_collect++;
    alloc_objects(interpreter, pool);
}


/** Buffer Header Functions for small-object lookup table **/

void
add_free_buffer(struct Parrot_Interp *interpreter,
        struct Small_Object_Pool *pool, void *vp_buffer)
{
    Buffer *buffer = (Buffer *)vp_buffer;

    if (GC_DEBUG(interpreter) && PObj_report_TEST(buffer))
        fprintf(stderr, "Freeing buffer %p -> %p\n", buffer, buffer->bufstart);

#ifdef GC_IS_MALLOC
    /* free allocated space at bufstart, but not if it is used
     * COW or it is external
     */
    /* external_FLAG | on_free_list_FLAG */
    if (buffer->bufstart && !PObj_is_external_or_free_TESTALL(buffer))
    {
        if (PObj_is_string_TEST(buffer)) {
            int *refcount = ((int *)buffer->bufstart);

            if (!--(*refcount))
                free(refcount); /* the actual bufstart */
        }
        else
            free(buffer->bufstart);
    }
#endif /* GC_IS_MALLOC */
    PObj_flags_SETTO(buffer, PObj_on_free_list_FLAG);
    /* Use the right length */
    buffer->buflen = 0;

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
        (*pool->more_objects) (interpreter, pool);
    buffer = pool->free_list;
    pool->free_list = *(void **)buffer;

    /* Don't let it point to garbage memory */
    buffer->bufstart = NULL;
    /* Clear the flagpole (especially _on_free_list_FLAG) */
    PObj_flags_CLEARALL(buffer);
#if ! DISABLE_GC_DEBUG
    if (GC_DEBUG(interpreter))
        buffer->version++;
#endif

    /* If you get the "Live buffer 0xnnnnnnn version m found on free list"
     * message, try setting a conditional breakpoint on the following line.
     * The condition should be (buffer == 0xnnnnnnnn) && (version == m) By
     * looking at the stack trace, you can figure out what the buffer was
     * being used for. Remember, though, that it might just be stale stack
     * litter that is triggering the warning, and not a bug at all. */

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
    int num_headers = GC_DEBUG(interpreter) ?
        GC_DEBUG_PMC_HEADERS_PER_ALLOC : PMC_HEADERS_PER_ALLOC;
    struct Small_Object_Pool *pmc_pool =
        new_small_object_pool(interpreter, sizeof(PMC), num_headers);

    pmc_pool->add_free_object = add_free_pmc;
    pmc_pool->get_free_object = get_free_pmc;
    pmc_pool->alloc_objects = alloc_pmcs;
    pmc_pool->more_objects = more_traceable_objects;
    pmc_pool->mem_pool = interpreter->arena_base->memory_pool;
    return pmc_pool;
}

/* Creates a new pool for buffer-like structures.
 * Usually you would need make_bufferlike_pool.
 */
struct Small_Object_Pool *
new_bufferlike_pool(struct Parrot_Interp *interpreter,
        size_t actual_buffer_size)
{
    int num_headers = GC_DEBUG(interpreter) ?
            GC_DEBUG_BUFFER_HEADERS_PER_ALLOC : BUFFER_HEADERS_PER_ALLOC;
    size_t buffer_size =
            (actual_buffer_size + sizeof(void *) - 1) & ~(sizeof(void *) - 1);
    struct Small_Object_Pool *pool =
            new_small_object_pool(interpreter, buffer_size, num_headers);

    pool->add_free_object = add_free_buffer;
    pool->get_free_object = get_free_buffer;
    pool->alloc_objects = alloc_buffers;
    pool->more_objects = more_traceable_objects;
    pool->mem_pool = interpreter->arena_base->memory_pool;
    pool->align_1 = BUFFER_ALIGNMENT - 1;
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
    pool->objects_per_alloc = GC_DEBUG(interpreter) ?
            GC_DEBUG_STRING_HEADERS_PER_ALLOC : STRING_HEADERS_PER_ALLOC;
    pool->align_1 = STRING_ALIGNMENT - 1;
    if (constant) {
        pool->mem_pool = interpreter->arena_base->constant_string_pool;
    }
    return pool;
}


/* makes and returns a Bufferlike Header Pool */
struct Small_Object_Pool *
make_bufferlike_pool(struct Parrot_Interp *interpreter, size_t buffer_size)
{
    UINTVAL idx;
    UINTVAL num_old = interpreter->arena_base->num_sized;
    struct Small_Object_Pool **sized_pools =
            interpreter->arena_base->sized_header_pools;

    idx = (buffer_size - sizeof(Buffer)) / sizeof(void *);

    /* Expand the array of sized resource pools, if necessary */
    if (num_old <= idx) {
        UINTVAL num_new = idx + 1;
        sized_pools = mem_sys_realloc(sized_pools, num_new * sizeof(void *));
        memset(sized_pools + num_old, 0, sizeof(void *) * (num_new - num_old));

        interpreter->arena_base->sized_header_pools = sized_pools;
        interpreter->arena_base->num_sized = num_new;
    }

    if (sized_pools[idx] == NULL) {
        sized_pools[idx] = new_bufferlike_pool(interpreter, buffer_size);
    }

    return sized_pools[idx];
}

/* returns a Bufferlike Header Pool, it must exist */
struct Small_Object_Pool *
get_bufferlike_pool(struct Parrot_Interp *interpreter, size_t buffer_size)
{
    struct Small_Object_Pool **sized_pools =
            interpreter->arena_base->sized_header_pools;

    return sized_pools[ (buffer_size - sizeof(Buffer)) / sizeof(void *) ];
}



/** Get a header **/

PMC *
new_pmc_header(struct Parrot_Interp *interpreter)
{
    return get_free_pmc(interpreter, interpreter->arena_base->pmc_pool);
}

STRING *
new_string_header(struct Parrot_Interp *interpreter, UINTVAL flags)
{
    STRING *string;

    string = get_free_buffer(interpreter, (flags & PObj_constant_FLAG)
            ? interpreter->
            arena_base->constant_string_header_pool :
            interpreter->arena_base->string_header_pool);
    PObj_flags_SETTO(string, flags | PObj_is_string_FLAG);
    string->strstart = 0;
    return string;
}

Buffer *
new_buffer_header(struct Parrot_Interp *interpreter)
{
    return get_free_buffer(interpreter,
            interpreter->arena_base->buffer_header_pool);
}

void *
new_bufferlike_header(struct Parrot_Interp *interpreter, size_t size)
{
    struct Small_Object_Pool *pool;

    pool = get_bufferlike_pool(interpreter, size);

    return get_free_buffer(interpreter, pool);
}


size_t
get_max_buffer_address(struct Parrot_Interp *interpreter)
{
    UINTVAL i;
    size_t max = interpreter->arena_base->string_header_pool->end_arena_memory;

    if (max < interpreter->arena_base->buffer_header_pool->end_arena_memory)
        max = interpreter->arena_base->buffer_header_pool->end_arena_memory;

    if (max < interpreter->arena_base->
            constant_string_header_pool->end_arena_memory)
        max = interpreter->arena_base->constant_string_header_pool->
                end_arena_memory;

    for (i = 0; i < interpreter->arena_base->num_sized; i++) {
        if (interpreter->arena_base->sized_header_pools[i]) {
            if (max < interpreter->arena_base->
                    sized_header_pools[i]->end_arena_memory)
                max = interpreter->arena_base->sized_header_pools[i]->
                        end_arena_memory;
        }
    }

    return max;
}

size_t
get_min_buffer_address(struct Parrot_Interp *interpreter)
{
    UINTVAL i;
    size_t min = interpreter->arena_base->string_header_pool->
            start_arena_memory;

    if (min > interpreter->arena_base->buffer_header_pool->start_arena_memory)
        min = interpreter->arena_base->buffer_header_pool->start_arena_memory;

    if (min > interpreter->arena_base->
            constant_string_header_pool->start_arena_memory)
        min = interpreter->arena_base->
                constant_string_header_pool->start_arena_memory;

    for (i = 0; i < interpreter->arena_base->num_sized; i++) {
        if (interpreter->arena_base->sized_header_pools[i]) {
            if (min > interpreter->arena_base->
                    sized_header_pools[i]->start_arena_memory)
                min = interpreter->arena_base->sized_header_pools[i]->
                        start_arena_memory;
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

    for (i = 0; i < interpreter->arena_base->num_sized; i++) {
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
add_extra_buffer_header(struct Parrot_Interp *interpreter, void *buffer)
{
    Buffer *headers = &interpreter->arena_base->extra_buffer_headers;
    void **ptr;
    Parrot_reallocate(interpreter, headers, headers->buflen + sizeof(void *));
    ptr = (void **)((char *)headers->bufstart + headers->buflen -
            sizeof(void *));
    *ptr = buffer;
}


/* Initialize the pools for the tracked resources */
void
Parrot_initialize_header_pools(struct Parrot_Interp *interpreter)
{
#if 0
    Parrot_allocate(interpreter,
            &interpreter->arena_base->extra_buffer_headers, 0);
    add_extra_buffer_header(interpreter,
            &interpreter->arena_base->extra_buffer_headers);
#else
    interpreter->arena_base->extra_buffer_headers.bufstart  = NULL;
    interpreter->arena_base->extra_buffer_headers.buflen    = 0;
    interpreter->arena_base->extra_buffer_headers.obj.flags = 0;
# if ! DISABLE_GC_DEBUG
    interpreter->arena_base->extra_buffer_headers.version   = 0;
# endif
#endif
    /* Init the constant string header pool */
    interpreter->arena_base->constant_string_header_pool =
            new_string_pool(interpreter, 1);


    /* Init the buffer header pool - this must be the first pool created! */
    interpreter->arena_base->buffer_header_pool = new_buffer_pool(interpreter);

    /* Init the string header pool */
    interpreter->arena_base->string_header_pool =
            new_string_pool(interpreter, 0);

    /* Init the PMC header pool */
    interpreter->arena_base->pmc_pool = new_pmc_pool(interpreter);
}

void
Parrot_destroy_header_pools(struct Parrot_Interp *interpreter)
{
    struct Small_Object_Pool *pool;
    struct Small_Object_Arena *cur_arena, *next;
    int i, j, start;

    /* const/non const COW strings live in different pools * so in first pass
     * * * * COW refcount is done, in 2. refcounting * in 3rd freeing */
#ifdef GC_IS_MALLOC
    start = 0;
#else
    start = 2;
#endif
    for (i = start; i <= 2; i++) {
        for (j = -4; j < (INTVAL)interpreter->arena_base->num_sized; j++) {
            if (j == -4)
                pool = interpreter->arena_base->constant_string_header_pool;
            else if (j == -3)
                pool = interpreter->arena_base->pmc_pool;
            else if (j == -2)
                pool = interpreter->arena_base->string_header_pool;
            else if (j == -1)
                pool = interpreter->arena_base->buffer_header_pool;
            else
                pool = interpreter->arena_base->sized_header_pools[j];
            if (pool) {
                if (j == -3) {
                    if (i == 2)
                        free_unused_PMCs(interpreter);
                }
                else {
#ifdef GC_IS_MALLOC
                    if (i == 0)
                        clear_cow(interpreter, pool, 1);
                    else if (i == 1)
                        used_cow(interpreter, pool, 1);
                    else
#endif
                        free_unused_buffers(interpreter, pool, 1);
                }
            }
            if (i == 2 && pool) {
                for (cur_arena = pool->last_Arena; cur_arena;) {
                    next = cur_arena->prev;
                    mem_sys_free(cur_arena->start_objects);
                    mem_sys_free(cur_arena);
                    cur_arena = next;
                }
                free(pool);
            }

        }
    }
    mem_sys_free(interpreter->arena_base->sized_header_pools);
}

#if 0

/* if we want these names, they must be added in DOD */
void
Parrot_initialize_header_pool_names(struct Parrot_Interp *interpreter)
{
    interpreter->arena_base->string_header_pool->name
            = string_make(interpreter, "String Pool", strlen("String Pool"),
            0, PObj_constant_FLAG, 0);
    interpreter->arena_base->pmc_pool->name
            = string_make(interpreter, "PMC Pool", strlen("PMC Pool"),
            0, PObj_constant_FLAG, 0);
    /* Set up names for each header pool, * now that we have a constant string
     *
     * * pool available to us */
    interpreter->arena_base->constant_string_header_pool->name
            =
            string_make(interpreter, "Constant String Pool",
            strlen("Constant String Pool"), 0, PObj_constant_FLAG, 0);
    interpreter->arena_base->buffer_header_pool->name =
            string_make(interpreter, "Generic Header Pool",
            strlen("Generic Header Pool"), 0, PObj_constant_FLAG, 0);
}

#endif

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
