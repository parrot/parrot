/*
Copyright (C) 2010-2011, Parrot Foundation.

=head1 NAME

src/gc/fixed_allocator.c - Implementation of allocator for small objects.

=head1 DESCRIPTION

C<FixedAllocator> used to allocate small chunks of fixed size memory.

C<PoolAllocator> used to allocate memory of particular size.

=cut

*/

#include "parrot/parrot.h"
#include "fixed_allocator.h"
#include "gc_private.h"

/* HEADERIZER HFILE: src/gc/fixed_allocator.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void allocate_new_pool_arena(PARROT_INTERP,
    ARGMOD(Pool_Allocator *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static size_t arena_size(ARGIN(const Pool_Allocator *self))
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
static void * get_free_list_item(ARGMOD(Pool_Allocator *pool))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*pool);

PARROT_CANNOT_RETURN_NULL
static void * get_newfree_list_item(ARGMOD(Pool_Allocator *pool))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*pool);

PARROT_CANNOT_RETURN_NULL
static void * pool_allocate(PARROT_INTERP, ARGMOD(Pool_Allocator *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

static void pool_free(PARROT_INTERP,
    ARGMOD(Pool_Allocator *pool),
    ARGMOD(void *data))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pool)
        FUNC_MODIFIES(*data);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static int pool_is_maybe_owned(
    ARGMOD(Pool_Allocator *pool),
    ARGIN(void *ptr))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

PARROT_WARN_UNUSED_RESULT
static int pool_is_owned(ARGMOD(Pool_Allocator *pool), ARGIN(void *ptr))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

#define ASSERT_ARGS_allocate_new_pool_arena __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_arena_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_get_free_list_item __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_get_newfree_list_item __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_pool_allocate __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_pool_free __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool) \
    , PARROT_ASSERT_ARG(data))
#define ASSERT_ARGS_pool_is_maybe_owned __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool) \
    , PARROT_ASSERT_ARG(ptr))
#define ASSERT_ARGS_pool_is_owned __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool) \
    , PARROT_ASSERT_ARG(ptr))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=head1 FixedAllocator METHODS

=over 4

=item C<struct Fixed_Allocator* Parrot_gc_fixed_allocator_new(PARROT_INTERP)>

Create new Fixed_Allocator.

=item C<void Parrot_gc_fixed_allocator_destroy(PARROT_INTERP, Fixed_Allocator
*allocator)>

Destroy Fixed_Allocator.

=item C<void * Parrot_gc_fixed_allocator_allocate(PARROT_INTERP, Fixed_Allocator
*allocator, size_t size)>

Allocate fixed size memory from Fixed_Allocator.

=item C<void Parrot_gc_fixed_allocator_free(PARROT_INTERP, Fixed_Allocator
*allocator, void *data, size_t size)>

Free fixed size memory from Fixed_Allocator.

=item C<size_t Parrot_gc_fixed_allocator_allocated_memory(PARROT_INTERP, const
Fixed_Allocator *allocator)>

Calculate amount of memory allocated in Fixed_Allocator.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
struct Fixed_Allocator*
Parrot_gc_fixed_allocator_new(SHIM_INTERP)
{
    ASSERT_ARGS(Parrot_gc_fixed_allocator_new)

    return mem_internal_allocate_zeroed_typed(Fixed_Allocator);
}

PARROT_EXPORT
void
Parrot_gc_fixed_allocator_destroy(PARROT_INTERP, ARGFREE_NOTNULL(Fixed_Allocator *allocator))
{
    ASSERT_ARGS(Parrot_gc_fixed_allocator_destroy)
    size_t i;
    for (i = 0; i < allocator->num_pools; ++i) {
        if (allocator->pools[i]) {
            Parrot_gc_pool_destroy(interp, allocator->pools[i]);
        }
    }

    mem_sys_free(allocator->pools);
    mem_sys_free(allocator);
}

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
void *
Parrot_gc_fixed_allocator_allocate(PARROT_INTERP,
        ARGIN(Fixed_Allocator *allocator),
        size_t size)
{
    ASSERT_ARGS(Parrot_gc_fixed_allocator_allocate)

    /* We always align size to 4/8 bytes. */
    const size_t index = (size - 1) / sizeof (void *);
    PARROT_ASSERT(size);

    if (index < allocator->num_pools) {
        Pool_Allocator *pool = allocator->pools[index];

        if (!pool) {
            const size_t alloc_size = (index + 1) * sizeof (void *);
            allocator->pools[index] = pool
                                    = Parrot_gc_pool_new(interp, alloc_size);
        }

        return pool_allocate(interp, pool);
    }
    else {
        const size_t new_size   = index + 1;
        const size_t alloc_size = new_size * sizeof (void *);

        /* (re)allocate pools */
        if (allocator->num_pools)
            allocator->pools = mem_internal_realloc_n_zeroed_typed(
                                    allocator->pools, new_size,
                                    allocator->num_pools, Pool_Allocator *);
        else
            allocator->pools = mem_internal_allocate_n_zeroed_typed(new_size,
                                    Pool_Allocator *);

        allocator->num_pools    = new_size;
        allocator->pools[index] = Parrot_gc_pool_new(interp, alloc_size);
    }

    /* memset return value to 0 here? */
    return pool_allocate(interp, allocator->pools[index]);
}


PARROT_EXPORT
void
Parrot_gc_fixed_allocator_free(PARROT_INTERP,
        ARGIN(Fixed_Allocator *allocator),
        ARGMOD(void *data), size_t size)
{
    ASSERT_ARGS(Parrot_gc_fixed_allocator_free)

    /* We always align size to 4/8 bytes. */
    const size_t index = (size - 1) / sizeof (void*);

    PARROT_ASSERT(allocator->pools[index]);

    pool_free(interp, allocator->pools[index], data);
}

PARROT_EXPORT
size_t
Parrot_gc_fixed_allocator_allocated_memory(PARROT_INTERP,
        ARGIN(const Fixed_Allocator *allocator))
{
    ASSERT_ARGS(Parrot_gc_fixed_allocator_allocated_memory)
    size_t total = 0;
    size_t i     = 0;

    for (i = 0; i < allocator->num_pools; i++) {
        if (allocator->pools[i])
            total += Parrot_gc_pool_allocated_size(interp, allocator->pools[i]);
    }

    return total;
}

/*

=back

=head1 PoolAllocator METHODS

=over 4

=item C<Pool_Allocator * Parrot_gc_pool_new(PARROT_INTERP, size_t object_size)>

Create Pool Allocator

=item C<void Parrot_gc_pool_destroy(PARROT_INTERP, Pool_Allocator *pool)>

Destroy allocated Pool - free memory for all areanas in the alocated pool

=item C<void * Parrot_gc_pool_allocate(PARROT_INTERP, Pool_Allocator * pool)>

Allocate from Pool

=item C<void Parrot_gc_pool_free(PARROT_INTERP, Pool_Allocator *pool, void
*data)>

Frees a fixed-size data item back to the Pool for later reallocation

=item C<int Parrot_gc_pool_is_owned(PARROT_INTERP, Pool_Allocator *pool, void
*ptr)>

check that pointer is owned by pool.

=item C<int Parrot_gc_pool_is_maybe_owned(PARROT_INTERP, Pool_Allocator *pool,
void *ptr)>

check that pointer is probably owned by pool.

=item C<size_t Parrot_gc_pool_allocated_size(PARROT_INTERP, const Pool_Allocator
*pool)>

Calculate size of memory allocated by pool.

=item C<void* Parrot_gc_pool_low_ptr(PARROT_INTERP, Pool_Allocator *pool)>

=item C<void* Parrot_gc_pool_high_ptr(PARROT_INTERP, Pool_Allocator *pool)>

Get low/high boundaries of allocated memory.

=back

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
Pool_Allocator *
Parrot_gc_pool_new(SHIM_INTERP, size_t object_size)
{
    ASSERT_ARGS(Parrot_gc_pool_new)
    const size_t attrib_size = object_size < sizeof (void *) ? sizeof (void*) : object_size;
    const size_t num_objs_raw =
        (GC_FIXED_SIZE_POOL_SIZE - sizeof (Pool_Allocator_Arena)) / attrib_size;
    const size_t num_objs = (num_objs_raw == 0)?(1):(num_objs_raw);
    Pool_Allocator * const newpool = mem_internal_allocate_typed(Pool_Allocator);

    newpool->object_size       = attrib_size;
    newpool->total_objects     = 0;
    newpool->objects_per_alloc = num_objs;
    newpool->num_free_objects  = 0;
    newpool->free_list         = NULL;
    newpool->top_arena         = NULL;
    newpool->lo_arena_ptr      = (void *)((size_t)-1);
    newpool->hi_arena_ptr      = NULL;
    newpool->newfree           = NULL;
    newpool->newlast           = NULL;

    return newpool;
}

PARROT_EXPORT
void
Parrot_gc_pool_destroy(SHIM_INTERP, ARGMOD(Pool_Allocator *pool))
{
    ASSERT_ARGS(Parrot_gc_pool_destroy)

    Pool_Allocator_Arena *arena = pool->top_arena;

    while (arena) {
        Pool_Allocator_Arena *next = arena->next;
        mem_internal_free(arena);
        arena = next;
    }

    mem_internal_free(pool);
}

PARROT_CANNOT_RETURN_NULL
PARROT_EXPORT
void *
Parrot_gc_pool_allocate(PARROT_INTERP, ARGMOD(Pool_Allocator * pool))
{
    ASSERT_ARGS(Parrot_gc_pool_allocate)
    return pool_allocate(interp, pool);
}

PARROT_EXPORT
void
Parrot_gc_pool_free(PARROT_INTERP, ARGMOD(Pool_Allocator *pool), ARGFREE(void *data))
{
    ASSERT_ARGS(Parrot_gc_pool_free)
    pool_free(interp, pool, data);
}

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
int
Parrot_gc_pool_is_owned(SHIM_INTERP, ARGMOD(Pool_Allocator *pool), ARGMOD(void *ptr))
{
    ASSERT_ARGS(Parrot_gc_pool_is_owned)
    return pool_is_owned(pool, ptr);
}

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
int
Parrot_gc_pool_is_maybe_owned(SHIM_INTERP, ARGMOD(Pool_Allocator *pool), ARGMOD(void *ptr))
{
    ASSERT_ARGS(Parrot_gc_pool_is_maybe_owned)
    return pool_is_maybe_owned(pool, ptr);
}


PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
size_t
Parrot_gc_pool_allocated_size(SHIM_INTERP, ARGIN(const Pool_Allocator *pool))
{
    ASSERT_ARGS(Parrot_gc_pool_allocated_size)
    const Pool_Allocator_Arena *arena = pool->top_arena;
    int                   count = 0;
    while (arena) {
        count++;
        arena = arena->next;
    }

    return count * arena_size(pool);
}

PARROT_CAN_RETURN_NULL
void*
Parrot_gc_pool_low_ptr(SHIM_INTERP, ARGIN(Pool_Allocator *pool))
{
    ASSERT_ARGS(Parrot_gc_pool_low_ptr)
    return pool->lo_arena_ptr;
}

PARROT_CAN_RETURN_NULL
void*
Parrot_gc_pool_high_ptr(SHIM_INTERP, ARGIN(Pool_Allocator *pool))
{
    ASSERT_ARGS(Parrot_gc_pool_high_ptr)
    return pool->hi_arena_ptr;
}

/*

=head1 PoolAllocator helper functions

=over 4

=item C<static void * pool_allocate(PARROT_INTERP, Pool_Allocator *pool)>

=item C<static void * get_free_list_item(Pool_Allocator *pool)>

=item C<static void * get_newfree_list_item(Pool_Allocator *pool)>

=item C<static void pool_free(PARROT_INTERP, Pool_Allocator *pool, void *data)>

=item C<static int pool_is_owned(Pool_Allocator *pool, void *ptr)>

=item C<static int pool_is_maybe_owned(Pool_Allocator *pool, void *ptr)>

Static implementation of public methods.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static void *
get_free_list_item(ARGMOD(Pool_Allocator *pool))
{
    ASSERT_ARGS(get_free_list_item)

    Pool_Allocator_Free_List * const item = pool->free_list;
    pool->free_list = item->next;
    --pool->num_free_objects;
    return item;
}

PARROT_CANNOT_RETURN_NULL
static void *
get_newfree_list_item(ARGMOD(Pool_Allocator *pool))
{
    ASSERT_ARGS(get_newfree_list_item)

    Pool_Allocator_Free_List * const item = pool->newfree;
    pool->newfree = (Pool_Allocator_Free_List *)
                    ((char *)(pool->newfree) + pool->object_size);

    if (pool->newfree >= pool->newlast)
        pool->newfree = NULL;

    --pool->num_free_objects;
    return item;
}

PARROT_CANNOT_RETURN_NULL
static void *
pool_allocate(PARROT_INTERP, ARGMOD(Pool_Allocator *pool))
{
    ASSERT_ARGS(pool_allocate)

    if (pool->free_list)
        return get_free_list_item(pool);

    if (!pool->newfree)
        allocate_new_pool_arena(interp, pool);

    return get_newfree_list_item(pool);
}

static void
pool_free(SHIM_INTERP, ARGMOD(Pool_Allocator *pool), ARGMOD(void *data))
{
    ASSERT_ARGS(pool_free)
    Pool_Allocator_Free_List * const item = (Pool_Allocator_Free_List *)data;

    /* It's too expensive.
    PARROT_ASSERT(Parrot_gc_pool_is_owned(pool, data));
    */

    item->next      = pool->free_list;
    pool->free_list = item;

    ++pool->num_free_objects;
}

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static int
pool_is_maybe_owned(ARGMOD(Pool_Allocator *pool), ARGIN(void *ptr))
{
    ASSERT_ARGS(pool_is_maybe_owned)

    /* Poiners are aligned */
    if (PTR2UINTVAL(ptr) & 3)
        return 0;

    return (ptr >= pool->lo_arena_ptr && ptr < pool->hi_arena_ptr);
}

PARROT_WARN_UNUSED_RESULT
static int
pool_is_owned(ARGMOD(Pool_Allocator *pool), ARGIN(void *ptr))
{
    ASSERT_ARGS(pool_is_owned)

    if (ptr >= pool->lo_arena_ptr && ptr <= pool->hi_arena_ptr) {
        /* We can cache this value. All arenas are same size */
        const ptrdiff_t a_size = arena_size(pool);
        const Pool_Allocator_Arena *arena = pool->top_arena;
        while (arena) {
            const ptrdiff_t ptr_diff =
                (ptrdiff_t)ptr - (ptrdiff_t)(arena + 1);

            if (0 <= ptr_diff
                  && ptr_diff < a_size
                  && ptr_diff % pool->object_size == 0)
                return 1;

            arena = arena->next;
        }
    }

    return 0;
}

/*

=item C<static void allocate_new_pool_arena(PARROT_INTERP, Pool_Allocator
*pool)>

Allocate a new pool arena

=cut

*/

static void
allocate_new_pool_arena(PARROT_INTERP, ARGMOD(Pool_Allocator *pool))
{
    ASSERT_ARGS(allocate_new_pool_arena)
    Pool_Allocator_Free_List *next;
    Pool_Allocator_Arena     *new_arena;

    const size_t num_items  = pool->objects_per_alloc;
    const size_t item_size  = pool->object_size;
    const size_t item_space = item_size * num_items;
    /* Round up to 4kb */
    const size_t total_size = arena_size(pool);

    /* Run a GC if needed */
    Parrot_gc_maybe_mark_and_sweep(interp, GC_trace_stack_FLAG);

    new_arena = (Pool_Allocator_Arena *)mem_internal_allocate_zeroed(total_size);

    interp->gc_sys->stats.memory_allocated += total_size;

    new_arena->prev = NULL;
    new_arena->next = pool->top_arena;
    pool->top_arena = new_arena;
    next            = (Pool_Allocator_Free_List *)(new_arena + 1);

    pool->newfree   = next;
    pool->newlast   = (Pool_Allocator_Free_List *)((char *)next + item_space);

    pool->num_free_objects += num_items;
    pool->total_objects    += num_items;

    if (pool->lo_arena_ptr > (void *)new_arena)
        pool->lo_arena_ptr = new_arena;

    if ((char *)pool->hi_arena_ptr < (char *)new_arena + total_size)
        pool->hi_arena_ptr = (char *)new_arena + total_size;
}

/*

=item C<static size_t arena_size(const Pool_Allocator *self)>

Calculate size of Arena.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static size_t
arena_size(ARGIN(const Pool_Allocator *self))
{
    ASSERT_ARGS(arena_size)

    const size_t num_items  = self->objects_per_alloc;
    const size_t item_size  = self->object_size;
    const size_t item_space = item_size * num_items;
    const size_t total_size = sizeof (Pool_Allocator_Arena) + item_space;

    /* Round up to 4kb */
    return total_size < GC_FIXED_SIZE_POOL_SIZE
                      ? GC_FIXED_SIZE_POOL_SIZE
                      : total_size;
}


/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
