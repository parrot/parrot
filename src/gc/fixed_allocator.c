/*
Copyright (C) 2010, Parrot Foundation.
$Id$

=head1 NAME

src/gc/fixed_allocator.c - Implementation of allocator for small objects.

=head1 DESCRIPTION

C<FixedAllocator> used to allocate small chunks of fixed size memory.

C<PoolAllocator> used to allocate memory of particular size.

=cut

*/

#include "parrot/parrot.h"
#include "fixed_allocator.h"

/* HEADERIZER HFILE: src/gc/fixed_allocator.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void allocate_new_pool_arena(ARGMOD(Pool_Allocator *pool))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*pool);

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
static void * pool_allocate(ARGMOD(Pool_Allocator *pool))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*pool);

static void pool_free(ARGMOD(Pool_Allocator *pool), ARGFREE(void *data))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*pool);

static int pool_is_owned(ARGMOD(Pool_Allocator *pool), ARGIN(void *ptr))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

#define ASSERT_ARGS_allocate_new_pool_arena __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_arena_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_get_free_list_item __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_get_newfree_list_item __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_pool_allocate __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_pool_free __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool))
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

=item C<void* Parrot_gc_fixed_allocator_allocate(PARROT_INTERP, Fixed_Allocator
*allocator, size_t size)>

Allocate fixed size memory from Fixed_Allocator.

=item C<void Parrot_gc_fixed_allocator_free(PARROT_INTERP, Fixed_Allocator
*allocator, void *data, size_t size)>

Free fixed size memory from Fixed_Allocator.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
struct Fixed_Allocator*
Parrot_gc_fixed_allocator_new(PARROT_INTERP)
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
}

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
void*
Parrot_gc_fixed_allocator_allocate(PARROT_INTERP,
        ARGIN(Fixed_Allocator *allocator),
        size_t size)
{
    ASSERT_ARGS(Parrot_gc_fixed_allocator_allocate)

    /* We always align size to 4/8 bytes. */
    const size_t index = (size - 1) / sizeof (void *);
    void   *ret;
    PARROT_ASSERT(size);

    if (index >= allocator->num_pools) {
        size_t new_size = index + 1;
        /* (re)allocate pools */
        if (allocator->num_pools)
            allocator->pools = mem_internal_realloc_n_zeroed_typed(
                                    allocator->pools, new_size,
                                    allocator->num_pools, Pool_Allocator *);
        else
            allocator->pools = mem_internal_allocate_n_zeroed_typed(new_size,
                                    Pool_Allocator *);

        allocator->num_pools = new_size;
    }

    if (! allocator->pools[index]) {
        const size_t alloc_size = (index + 1) * sizeof (void *);
        allocator->pools[index] = Parrot_gc_pool_new(interp, alloc_size);
    }

    ret = pool_allocate(allocator->pools[index]);

    /* memset ret to 0 here? */
    return ret;
}


PARROT_EXPORT
void
Parrot_gc_fixed_allocator_free(PARROT_INTERP,
        ARGIN(Fixed_Allocator *allocator),
        ARGFREE_NOTNULL(void *data), size_t size)
{
    ASSERT_ARGS(Parrot_gc_fixed_allocator_free)

    /* We always align size to 4/8 bytes. */
    size_t index = (size - 1) / sizeof (void*);

    PARROT_ASSERT(allocator->pools[index]);

    pool_free(allocator->pools[index], data);
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

check for pool validity

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
    newpool->hi_arena_ptr      = 0;
    newpool->newfree           = 0;
    newpool->newlast           = 0;

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
    return pool_allocate(pool);
}

PARROT_EXPORT
void
Parrot_gc_pool_free(SHIM_INTERP, ARGMOD(Pool_Allocator *pool), ARGFREE(void *data))
{
    ASSERT_ARGS(Parrot_gc_pool_free)
    pool_free(pool, data);
}

PARROT_EXPORT
int
Parrot_gc_pool_is_owned(SHIM_INTERP, ARGMOD(Pool_Allocator *pool), ARGMOD(void *ptr))
{
    ASSERT_ARGS(Parrot_gc_pool_is_owned)
    return pool_is_owned(pool, ptr);
}


/*

=head1 PoolAllocator helper functions

=over 4

=item C<static void * pool_allocate(Pool_Allocator *pool)>

=item C<static void * get_free_list_item(Pool_Allocator *pool)>

=item C<static void * get_newfree_list_item(Pool_Allocator *pool)>

=item C<static void pool_free(Pool_Allocator *pool, void *data)>

=item C<static int pool_is_owned(Pool_Allocator *pool, void *ptr)>

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

    return item;
}

PARROT_CANNOT_RETURN_NULL
static void *
pool_allocate(ARGMOD(Pool_Allocator *pool))
{
    ASSERT_ARGS(pool_allocate)
    Pool_Allocator_Free_List *item;

    if (pool->free_list)
        item = (Pool_Allocator_Free_List*)get_free_list_item(pool);

    else if (pool->newfree)
        item = (Pool_Allocator_Free_List*)get_newfree_list_item(pool);

    else {
        allocate_new_pool_arena(pool);
        item = (Pool_Allocator_Free_List*)get_newfree_list_item(pool);
    }

    --pool->num_free_objects;
    return (void *)item;
}

static void
pool_free(ARGMOD(Pool_Allocator *pool), ARGFREE(void *data))
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


static int
pool_is_owned(ARGMOD(Pool_Allocator *pool), ARGIN(void *ptr))
{
    ASSERT_ARGS(pool_is_owned)
    Pool_Allocator_Arena *arena = pool->top_arena;
    size_t                a_size;

    if (ptr < pool->lo_arena_ptr || ptr > pool->hi_arena_ptr)
        return 0;

    /* We can cache this value. All arenas are same size */
    a_size = arena_size(pool);
    while (arena) {
        const ptrdiff_t ptr_diff =
            (ptrdiff_t)ptr - (ptrdiff_t)(arena + 1);

        if (0 <= ptr_diff
              && ptr_diff < a_size
              && ptr_diff % pool->object_size == 0)
            return 1;

        arena = arena->next;
    }

    return 0;
}

/*

=item C<static void allocate_new_pool_arena(Pool_Allocator *pool)>

Allocate a new pool arena

=cut

*/

static void
allocate_new_pool_arena(ARGMOD(Pool_Allocator *pool))
{
    ASSERT_ARGS(allocate_new_pool_arena)
    Pool_Allocator_Free_List *next;

    const size_t num_items  = pool->objects_per_alloc;
    const size_t item_size  = pool->object_size;
    const size_t item_space = item_size * num_items;

    /* Round up to 4kb */
    Pool_Allocator_Arena * const new_arena = (Pool_Allocator_Arena *)mem_internal_allocate(
                                                arena_size(pool));

    new_arena->prev = NULL;
    new_arena->next = pool->top_arena;
    pool->top_arena = new_arena;
    next            = (Pool_Allocator_Free_List *)(new_arena + 1);

    pool->newfree   = next;
    pool->newlast   = (Pool_Allocator_Free_List *)((char *)next + item_space);

    pool->num_free_objects += num_items;
    pool->total_objects    += num_items;

    if (pool->lo_arena_ptr > new_arena)
        pool->lo_arena_ptr = new_arena;

    if (pool->hi_arena_ptr < (char*)new_arena + GC_FIXED_SIZE_POOL_SIZE)
        pool->hi_arena_ptr = new_arena + GC_FIXED_SIZE_POOL_SIZE;
}

/*

=item C<static size_t arena_size(const Pool_Allocator *self)>

Calculate size of Arena.

=cut

*/

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
 * vim: expandtab shiftwidth=4:
 */
