/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/headers.c - Header management functions

=head1 DESCRIPTION

Handles getting of various headers, and pool creation.

=cut

*/

#include "parrot/parrot.h"
#include <assert.h>

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

/*


=head2 Buffer Header Functions for small-object lookup table

=over 4

=item C<static void *
get_free_buffer(Interp *interpreter,
        struct Small_Object_Pool *pool)>

Gets a free C<Buffer> from C<pool> and returns it. Memory is cleared.

=cut

*/

static void *
get_free_buffer(Interp *interpreter,
        struct Small_Object_Pool *pool)
{
    PObj *buffer = pool->get_free_object(interpreter, pool);

    /* don't mess around with flags */
    PObj_bufstart(buffer) = NULL;
    PObj_buflen(buffer) = 0;

    if (pool->object_size > sizeof(PObj))
        memset(buffer + 1, 0, pool->object_size - sizeof(PObj));
    return buffer;
}

/*

=back

=head2 Header Pool Creation Functions

=over 4

=item C<struct Small_Object_Pool *
new_pmc_pool(Interp *interpreter)>

Creates an new pool for PMCs and returns it.

=cut

*/

struct Small_Object_Pool *
new_pmc_pool(Interp *interpreter)
{
    int num_headers = GC_DEBUG(interpreter) ?
        GC_DEBUG_PMC_HEADERS_PER_ALLOC : PMC_HEADERS_PER_ALLOC;
    struct Small_Object_Pool *pmc_pool =
        new_small_object_pool(interpreter, sizeof(PMC), num_headers);

    pmc_pool->mem_pool = NULL;
    (interpreter->arena_base->init_pool)(interpreter, pmc_pool);
    return pmc_pool;
}

/*

=item C<struct Small_Object_Pool *
new_bufferlike_pool(Interp *interpreter,
        size_t actual_buffer_size)>

Creates a new pool for buffer-like structures. Usually you would need
C<make_bufferlike_pool()>.

=cut

*/

struct Small_Object_Pool *
new_bufferlike_pool(Interp *interpreter,
        size_t actual_buffer_size)
{
    int num_headers = GC_DEBUG(interpreter) ?
            GC_DEBUG_BUFFER_HEADERS_PER_ALLOC : BUFFER_HEADERS_PER_ALLOC;
    size_t buffer_size =
            (actual_buffer_size + sizeof(void *) - 1) & ~(sizeof(void *) - 1);
    struct Small_Object_Pool *pool =
            new_small_object_pool(interpreter, buffer_size, num_headers);

    pool->mem_pool = interpreter->arena_base->memory_pool;
    pool->align_1 = BUFFER_ALIGNMENT - 1;
    (interpreter->arena_base->init_pool)(interpreter, pool);
    return pool;
}

/*

=item C<struct Small_Object_Pool *
new_buffer_pool(Interp *interpreter)>

Non-constant strings and plain Buffers are in the sized header pools.

=cut

*/

struct Small_Object_Pool *
new_buffer_pool(Interp *interpreter)
{
    return make_bufferlike_pool(interpreter, sizeof(Buffer));
}

/*

=item C<struct Small_Object_Pool *
new_string_pool(Interp *interpreter, INTVAL constant)>

Creates a new pool for C<STRINGS> and returns it.

=cut

*/

struct Small_Object_Pool *
new_string_pool(Interp *interpreter, INTVAL constant)
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

/*

=item C<struct Small_Object_Pool *
make_bufferlike_pool(Interp *interpreter, size_t buffer_size)>

Make and return a bufferlike header pool.

=cut

*/

struct Small_Object_Pool *
make_bufferlike_pool(Interp *interpreter, size_t buffer_size)
{
    UINTVAL idx;
    UINTVAL num_old = interpreter->arena_base->num_sized;
    struct Small_Object_Pool **sized_pools =
            interpreter->arena_base->sized_header_pools;

    idx = (buffer_size - sizeof(Buffer)) / sizeof(void *);

    /* Expand the array of sized resource pools, if necessary */
    if (num_old <= idx) {
        UINTVAL num_new = idx + 1;
        sized_pools = mem_internal_realloc(sized_pools, num_new * sizeof(void *));
        memset(sized_pools + num_old, 0, sizeof(void *) * (num_new - num_old));

        interpreter->arena_base->sized_header_pools = sized_pools;
        interpreter->arena_base->num_sized = num_new;
    }

    if (sized_pools[idx] == NULL) {
        sized_pools[idx] = new_bufferlike_pool(interpreter, buffer_size);
    }

    return sized_pools[idx];
}

/*

=item C<struct Small_Object_Pool *
get_bufferlike_pool(Interp *interpreter, size_t buffer_size)>

Return a bufferlike header pool, it must exist.

=cut

*/

struct Small_Object_Pool *
get_bufferlike_pool(Interp *interpreter, size_t buffer_size)
{
    struct Small_Object_Pool **sized_pools =
            interpreter->arena_base->sized_header_pools;

    return sized_pools[ (buffer_size - sizeof(Buffer)) / sizeof(void *) ];
}


/*

=item C<PMC *
new_pmc_header(Interp *interpreter)>

Get a header.

=cut

*/

static PMC_EXT * new_pmc_ext(Parrot_Interp);

PMC *
new_pmc_header(Interp *interpreter, UINTVAL flags)
{
    struct Small_Object_Pool *pool;
    PMC *pmc;

    pool = flags & PObj_constant_FLAG ?
        interpreter->arena_base->constant_pmc_pool :
        interpreter->arena_base->pmc_pool;
#if ARENA_DOD_FLAGS
    assert(sizeof(Dead_PObj) <= sizeof(PMC));
#endif
    pmc = pool->get_free_object(interpreter, pool);
    /* clear flags, set is_PMC_FLAG */
    if (flags & PObj_is_PMC_EXT_FLAG) {
#if ARENA_DOD_FLAGS
        *((Dead_PObj*)pmc)->arena_dod_flag_ptr |=
            (PObj_is_special_PMC_FLAG << ((Dead_PObj*)pmc)->flag_shift);
#else
        flags |= PObj_is_special_PMC_FLAG;
#endif
        pmc->pmc_ext = new_pmc_ext(interpreter);
        if (flags & PObj_is_PMC_shared_FLAG) {
            PMC_sync(pmc) = mem_internal_allocate(sizeof(*PMC_sync(pmc)));
            PMC_sync(pmc)->owner = interpreter;
            MUTEX_INIT(PMC_sync(pmc)->pmc_lock);
        }
    }
    else
        pmc->pmc_ext = NULL;
    PObj_get_FLAGS(pmc) |= PObj_is_PMC_FLAG|flags;
    pmc->vtable = NULL;
#if ! PMC_DATA_IN_EXT
    PMC_data(pmc) = NULL;
#endif
    return pmc;
}

/*

=item C<PMC_EXT *
new_pmc_ext(Interp *interpreter)>

Creates a new C<PMC_EXT> and returns it.

=cut

*/

static PMC_EXT *
new_pmc_ext(Interp *interpreter)
{
    struct Small_Object_Pool *pool = interpreter->arena_base->pmc_ext_pool;
    void *ptr;
    /*
     * can't use normall get_free_object--PMC_EXT doesn't have flags
     * it isn't a Buffer
     */
    if (!pool->free_list)
        (*pool->more_objects) (interpreter, pool);
    ptr = pool->free_list;
    pool->free_list = *(void **)ptr;
    memset(ptr, 0, sizeof(PMC_EXT));
    return ptr;
}

/*

=item C<void
add_pmc_ext(Interp *interpreter, PMC *pmc)>

Adds a new C<PMC_EXT> to C<pmc>.

=cut

*/

void
add_pmc_ext(Interp *interpreter, PMC *pmc)
{
    pmc->pmc_ext = new_pmc_ext(interpreter);
    PObj_is_PMC_EXT_SET(pmc);
#ifdef PARROT_GC_IMS
    /*
     * preserve DDD color: a simple PMC  live = black
     *                     an aggregate  live = grey
     * set'em black
     */
    if (PObj_live_TEST(pmc))
        PObj_get_FLAGS(pmc) |= PObj_custom_GC_FLAG;
#endif
}

/*

=item C<STRING *
new_string_header(Interp *interpreter, UINTVAL flags)>

Returns a new C<STRING> header.

=cut

*/

STRING *
new_string_header(Interp *interpreter, UINTVAL flags)
{
    STRING *string;
    string = get_free_buffer(interpreter, (flags & PObj_constant_FLAG)
            ? interpreter->
            arena_base->constant_string_header_pool :
            interpreter->arena_base->string_header_pool);
    PObj_get_FLAGS(string) |= flags | PObj_is_string_FLAG;
    SET_NULL(string->strstart);
    return string;
}

/*

=item C<Buffer *
new_buffer_header(Interp *interpreter)>

Creates and returns a new C<Buffer>.

=cut

*/

Buffer *
new_buffer_header(Interp *interpreter)
{
    return get_free_buffer(interpreter,
            interpreter->arena_base->buffer_header_pool);
}


/*

=item C<void *
new_bufferlike_header(Interp *interpreter, size_t size)>

Creates and returns a new buffer-like header.

=cut

*/

void *
new_bufferlike_header(Interp *interpreter, size_t size)
{
    struct Small_Object_Pool *pool;

    pool = get_bufferlike_pool(interpreter, size);

    return get_free_buffer(interpreter, pool);
}

/*

=item C<size_t
get_max_buffer_address(Interp *interpreter)>

Calculates the maximum buffer address and returns it.

=cut

*/

size_t
get_max_buffer_address(Interp *interpreter)
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

/*

=item C<size_t
get_min_buffer_address(Interp *interpreter)>

Calculates the minimum buffer address and returns it.

=cut

*/

size_t
get_min_buffer_address(Interp *interpreter)
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

/*

=item C<size_t
get_max_pmc_address(Interp *interpreter)>

Calculates the maximum PMC address and returns it.

=cut

*/

size_t
get_max_pmc_address(Interp *interpreter)
{
    return interpreter->arena_base->pmc_pool->end_arena_memory;
}

/*

=item C<size_t
get_min_pmc_address(Interp *interpreter)>

Calculates the maximum PMC address and returns it.

=cut

*/

size_t
get_min_pmc_address(Interp *interpreter)
{
    return interpreter->arena_base->pmc_pool->start_arena_memory;
}

/*

=item C<int
is_buffer_ptr(Interp *interpreter, void *ptr)>

Checks that C<ptr> is actually a C<Buffer>.

=cut

*/

int
is_buffer_ptr(Interp *interpreter, void *ptr)
{
    UINTVAL i;
    struct Arenas *arena_base = interpreter->arena_base;;

    if (contained_in_pool(interpreter,
                    arena_base->constant_string_header_pool, ptr))
        return 1;

    for (i = 0; i < arena_base->num_sized; i++) {
        if (arena_base->sized_header_pools[i] &&
                contained_in_pool(interpreter,
                        arena_base->sized_header_pools[i], ptr))
            return 1;
    }

    return 0;
}

/*

=item C<int
is_pmc_ptr(Interp *interpreter, void *ptr)>

Checks that C<ptr> is actually a PMC.

=cut

*/

int
is_pmc_ptr(Interp *interpreter, void *ptr)
{
    return contained_in_pool(interpreter,
            interpreter->arena_base->pmc_pool, ptr);
}


/*

=item C<void
Parrot_initialize_header_pools(Interp *interpreter)>

Initialize the pools for the tracked resources.

=cut

*/

void
Parrot_initialize_header_pools(Interp *interpreter)
{
    struct Arenas *arena_base;

    arena_base = interpreter->arena_base;
    /* Init the constant string header pool */
    arena_base->constant_string_header_pool = new_string_pool(interpreter, 1);
    arena_base->constant_string_header_pool->name = "constant_string_header";

    /* Init the buffer header pool
     *
     * note: the buffer_header_pool and the string_header_pool are actually
     * living in the sized_header_pools, this pool pointers are only
     * here for faster access in new_*_header
     */
    arena_base->buffer_header_pool = new_buffer_pool(interpreter);
    arena_base->buffer_header_pool->name = "buffer_header";

    /* Init the string header pool */
    arena_base->string_header_pool = new_string_pool(interpreter, 0);
    arena_base->string_header_pool->name = "string_header";

    /* Init the PMC header pool */
    arena_base->pmc_pool = new_pmc_pool(interpreter);
    arena_base->pmc_pool->name = "pmc";

    /* pmc extension buffer */
    arena_base->pmc_ext_pool =
        new_small_object_pool(interpreter, sizeof(struct PMC_EXT), 1024);
    (arena_base->init_pool)(interpreter, arena_base->pmc_ext_pool);
    arena_base->pmc_ext_pool->name = "pmc_ext";

    /* constant PMCs */
    arena_base->constant_pmc_pool = new_pmc_pool(interpreter);
    arena_base->constant_pmc_pool->name = "constant_pmc";
    arena_base->constant_pmc_pool->objects_per_alloc =
       CONSTANT_PMC_HEADERS_PER_ALLOC;
}

/*

=item C<int Parrot_forall_header_pools(Interp *, int flag, void *arg, pool_iter_fn)>

Iterate through all header pools by calling the passed function. Returns
zero if the iteration didn't stop or the returned value.

=over 4

=item flag is one of

  POOL_PMC
  POOL_BUFFER
  POOL_CONST
  POOL_ALL

Only matching pools will be used.

=item arg

This argument is passed on to the iteration function.

=item pool_iter_fn

It is called with C<Interp*, Small_Object_Pool *, int flag, void *arg)>
If the function returns a non-zero value iteration will stop.

=back


=cut

*/

int
Parrot_forall_header_pools(Interp *interpreter, int flag, void *arg,
        pool_iter_fn func)
{
    struct Small_Object_Pool *pool;
    struct Arenas *arena_base;
    int ret_val, i;

    arena_base = interpreter->arena_base;

    if ((flag & (POOL_PMC | POOL_CONST)) == (POOL_PMC | POOL_CONST)) {
        ret_val = (func)(interpreter, arena_base->constant_pmc_pool,
                POOL_PMC | POOL_CONST, arg);
        if (ret_val)
            return ret_val;
    }
    if (flag & POOL_PMC) {
        ret_val = (func)(interpreter, arena_base->pmc_pool, POOL_PMC, arg);
        if (ret_val)
            return ret_val;
    }
    if ((flag & (POOL_BUFFER | POOL_CONST)) == (POOL_BUFFER | POOL_CONST)) {
        ret_val = (func)(interpreter, arena_base->constant_string_header_pool,
                POOL_BUFFER | POOL_CONST, arg);
        if (ret_val)
            return ret_val;
    }
    if (!(flag & POOL_BUFFER))
        return 0;
    for (i = 0; i < (INTVAL)interpreter->arena_base->num_sized; i++) {
        pool = arena_base->sized_header_pools[i];
        if (!pool)
            continue;
        ret_val = (func)(interpreter, pool, POOL_BUFFER, arg);
        if (ret_val)
            return ret_val;
    }
    return 0;
}

/*

=item C<void
Parrot_destroy_header_pools(Interp *interpreter)>

Destroys the header pools.

=cut

*/

static void
free_pool(Interp *interpreter, struct Small_Object_Pool *pool)
{
    struct Small_Object_Arena *cur_arena, *next;
    for (cur_arena = pool->last_Arena; cur_arena;) {
        next = cur_arena->prev;
#if ARENA_DOD_FLAGS
        mem_internal_free(cur_arena->dod_flags);
        Parrot_free_memalign(cur_arena);
#else
        mem_internal_free(cur_arena->start_objects);
        mem_internal_free(cur_arena);
#endif
        cur_arena = next;
    }
    mem_internal_free(pool);
}

static int
sweep_cb_buf(Interp *interpreter, struct Small_Object_Pool *pool, int flag,
        void *arg)
{
    int pass = (int)arg;

#ifdef GC_IS_MALLOC
    if (pass == 0)
        clear_cow(interpreter, pool, 1);
    else if (pass == 1)
        used_cow(interpreter, pool, 1);
    else
#endif
    {
        Parrot_dod_sweep(interpreter, pool);
        free_pool(interpreter, pool);
    }
    return 0;

}

static int
sweep_cb_pmc(Interp *interpreter, struct Small_Object_Pool *pool, int flag,
        void *arg)
{
    Parrot_dod_sweep(interpreter, pool);
    free_pool(interpreter, pool);
    return 0;
}

void
Parrot_destroy_header_pools(Interp *interpreter)
{
    struct Small_Object_Pool *pool;
    struct Small_Object_Arena *cur_arena, *next;
    int pass, start;

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
    Parrot_forall_header_pools(interpreter, POOL_PMC | POOL_CONST, 0,
            sweep_cb_pmc);

    for (pass = start; pass <= 2; pass++) {
        Parrot_forall_header_pools(interpreter, POOL_BUFFER | POOL_CONST,
                (void *)pass, sweep_cb_buf);

    }
    free_pool(interpreter, interpreter->arena_base->pmc_ext_pool);
    mem_internal_free(interpreter->arena_base->sized_header_pools);
}

#if 0

/*

=item C<void
Parrot_initialize_header_pool_names(Interp *interpreter)>

If we want these names, they must be added in DOD.

=cut

*/

void
Parrot_initialize_header_pool_names(Interp *interpreter)
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

=back

=head1 SEE ALSO

F<include/parrot/headers.h>.

=head1 HISTORY

Initial version by Mike Lambert on 2002.05.27.

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
