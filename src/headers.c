/* headers.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
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
#  define PMC_HEADERS_PER_ALLOC 512
#  define BUFFER_HEADERS_PER_ALLOC 256
#  define STRING_HEADERS_PER_ALLOC 256
#else /* GC_IS_MALLOC */
#  define PMC_HEADERS_PER_ALLOC 512
#  define BUFFER_HEADERS_PER_ALLOC 512
#  define STRING_HEADERS_PER_ALLOC 512
#endif /* GC_IS_MALLOC */

#  define CONSTANT_PMC_HEADERS_PER_ALLOC 64
/** PMC Header Functions for small-object lookup table **/

void *
get_free_pmc(struct Parrot_Interp *interpreter, struct Small_Object_Pool *pool)
{
    PMC *pmc = get_free_object(interpreter, pool);

    /* clear flags, set is_PMC_FLAG */
    PObj_flags_SETTO(pmc, PObj_is_PMC_FLAG);
#if ! PMC_DATA_IN_EXT
    PMC_data((PMC *)pmc) = NULL;
#endif
    ((PMC *)pmc)->pmc_ext = NULL;
    /* TODO check PMCs init method, if they clear the cache */
    return pmc;
}

/** Buffer Header Functions for small-object lookup table **/

void *
get_free_buffer(struct Parrot_Interp *interpreter,
        struct Small_Object_Pool *pool)
{
    Buffer *buffer = get_free_object(interpreter, pool);

    memset(buffer, 0, pool->object_size);
    SET_NULL(buffer->bufstart);
    return buffer;
}

/** Header Pool Creation Functions **/

struct Small_Object_Pool *
new_pmc_pool(struct Parrot_Interp *interpreter)
{
    int num_headers = GC_DEBUG(interpreter) ?
        GC_DEBUG_PMC_HEADERS_PER_ALLOC : PMC_HEADERS_PER_ALLOC;
    struct Small_Object_Pool *pmc_pool =
        new_small_object_pool(interpreter, sizeof(PMC), num_headers);

    pmc_pool->get_free_object = get_free_pmc;
    pmc_pool->more_objects = more_traceable_objects;
    pmc_pool->mem_pool = NULL;
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

    pool->get_free_object = get_free_buffer;
    pool->more_objects = more_traceable_objects;
    pool->mem_pool = interpreter->arena_base->memory_pool;
    pool->align_1 = BUFFER_ALIGNMENT - 1;
    return pool;
}

/* non constant strings and plain Buffers are in the sized header
 * pools
 */
struct Small_Object_Pool *
new_buffer_pool(struct Parrot_Interp *interpreter)
{
    return make_bufferlike_pool(interpreter, sizeof(Buffer));
}

struct Small_Object_Pool *
new_string_pool(struct Parrot_Interp *interpreter, INTVAL constant)
{
    struct Small_Object_Pool *pool;
    if (constant) {
        pool = new_bufferlike_pool(interpreter, sizeof(STRING));
        pool->mem_pool = interpreter->arena_base->constant_string_pool;
    }
    else
        pool = make_bufferlike_pool(interpreter, sizeof(STRING));
    pool->objects_per_alloc = GC_DEBUG(interpreter) ?
            GC_DEBUG_STRING_HEADERS_PER_ALLOC : STRING_HEADERS_PER_ALLOC;
    pool->align_1 = STRING_ALIGNMENT - 1;
    return pool;
}

/* make and return a bufferlike header pool */
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

/* return a bufferlike header pool, it must exist */
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


static PARROT_INLINE PMC_EXT *
new_pmc_ext(struct Parrot_Interp *interpreter)
{
    struct Small_Object_Pool *pool = interpreter->arena_base->pmc_ext_pool;
    void *ptr = get_free_object(interpreter, pool);
    memset(ptr, 0, sizeof(PMC_EXT));
    return ptr;
}

void
add_pmc_ext(struct Parrot_Interp *interpreter, PMC *pmc)
{
    pmc->pmc_ext = new_pmc_ext(interpreter);
    PObj_is_PMC_EXT_SET(pmc);
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
    SET_NULL(string->strstart);
    return string;
}

Buffer *
new_buffer_header(struct Parrot_Interp *interpreter)
{
    return get_free_buffer(interpreter,
            interpreter->arena_base->buffer_header_pool);
}

void
buffer_mark_COW(Buffer *b)
{
    PObj_COW_SET(b);
}

Buffer *
buffer_unmake_COW(struct Parrot_Interp *interpreter, Buffer *src)
{
    if (PObj_COW_TEST(src)) {
        Buffer *b = new_buffer_header(interpreter);
        Parrot_allocate(interpreter, b, src->buflen);
        mem_sys_memcopy(b->bufstart, src->bufstart, src->buflen);
        return b;
    }
    return src;
}

Buffer *
buffer_copy_if_diff(struct Parrot_Interp *interpreter, Buffer *src, Buffer *dst)
{
    Buffer *b;
    /* if src and dst point to the same COWed bufstart,
     * src hadn't changed yet
     */
    if (src->bufstart == dst->bufstart)
        return dst;
    b = new_buffer_header(interpreter);
    Parrot_allocate(interpreter, b, src->buflen);
    mem_sys_memcopy(b->bufstart, src->bufstart, src->buflen);
    return b;
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
    size_t max = interpreter->arena_base->constant_string_header_pool->
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
    size_t min = interpreter->arena_base->constant_string_header_pool->
            start_arena_memory;

    for (i = 0; i < interpreter->arena_base->num_sized; i++) {
        if (interpreter->arena_base->sized_header_pools[i] &&
            interpreter->arena_base->sized_header_pools[i]->start_arena_memory) {
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
#  if ! DISABLE_GC_DEBUG
    interpreter->arena_base->extra_buffer_headers.pobj_version   = 0;
#  endif
#endif
    /* Init the constant string header pool */
    interpreter->arena_base->constant_string_header_pool =
            new_string_pool(interpreter, 1);
    interpreter->arena_base->constant_string_header_pool->name =
        "constant_string_header";


    /* Init the buffer header pool
     *
     * note: the buffer_header_pool and the string_header_pool are actually
     * living in the sized_header_pools, this pool pointers are only
     * here for faster access in new_*_header
     */
    interpreter->arena_base->buffer_header_pool = new_buffer_pool(interpreter);
    interpreter->arena_base->buffer_header_pool->name = "buffer_header";

    /* Init the string header pool */
    interpreter->arena_base->string_header_pool =
            new_string_pool(interpreter, 0);
    interpreter->arena_base->string_header_pool->name = "string_header";

    /* Init the PMC header pool */
    interpreter->arena_base->pmc_pool = new_pmc_pool(interpreter);
    interpreter->arena_base->pmc_pool->name = "pmc";
    interpreter->arena_base->pmc_ext_pool =
        new_small_object_pool(interpreter, sizeof(struct PMC_EXT), 1024);
    interpreter->arena_base->pmc_ext_pool->more_objects =
        alloc_objects;
    interpreter->arena_base->pmc_ext_pool->name = "pmc_ext";
    interpreter->arena_base->constant_pmc_pool = new_pmc_pool(interpreter);
    interpreter->arena_base->constant_pmc_pool->name = "constant_pmc";
    interpreter->arena_base->constant_pmc_pool->objects_per_alloc =
       CONSTANT_PMC_HEADERS_PER_ALLOC;
}

void
Parrot_destroy_header_pools(struct Parrot_Interp *interpreter)
{
    struct Small_Object_Pool *pool;
    struct Small_Object_Arena *cur_arena, *next;
    int i, j, start;

    /* const/non const COW strings life in different pools
     * so in first pass
     * COW refcount is done, in 2. refcounting
     * in 3rd freeing
     */
#ifdef GC_IS_MALLOC
    start = 0;
#else
    start = 2;
#endif
    for (i = start; i <= 2; i++) {
        for (j = -3; j < (INTVAL)interpreter->arena_base->num_sized; j++) {
            if (j == -3)
                pool = interpreter->arena_base->constant_pmc_pool;
            else if (j == -2)
                pool = interpreter->arena_base->pmc_pool;
            else if (j == -1)
                pool = interpreter->arena_base->constant_string_header_pool;
            else
                pool = interpreter->arena_base->sized_header_pools[j];
            if (pool) {
                if (j <= -2) {
                    if (i == 2)
                        free_unused_pobjects(interpreter, pool);
                }
                else {
#ifdef GC_IS_MALLOC
                    if (i == 0)
                        clear_cow(interpreter, pool, 1);
                    else if (i == 1)
                        used_cow(interpreter, pool, 1);
                    else
#endif
                        free_unused_pobjects(interpreter, pool);
                }
            }
            if (i == 2 && pool) {
                for (cur_arena = pool->last_Arena; cur_arena;) {
                    next = cur_arena->prev;
#if ARENA_DOD_FLAGS
                    mem_sys_free(cur_arena->dod_flags);
#else
                    mem_sys_free(cur_arena->start_objects);
#endif
                    mem_sys_free(cur_arena);
                    cur_arena = next;
                }
                free(pool);
            }

        }
    }
    pool = interpreter->arena_base->pmc_ext_pool;
    for (cur_arena = pool->last_Arena; cur_arena;) {
        next = cur_arena->prev;
#if ARENA_DOD_FLAGS
        mem_sys_free(cur_arena->dod_flags);
#else
        mem_sys_free(cur_arena->start_objects);
#endif
        mem_sys_free(cur_arena);
        cur_arena = next;
    }
    mem_sys_free(interpreter->arena_base->pmc_ext_pool);
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
