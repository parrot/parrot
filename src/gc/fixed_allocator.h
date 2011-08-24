/*
Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

src/gc/fixed_allocator.h - implementation of allocator for small-size objects.

=head1 DESCRIPTION

*/

#ifndef PARROT_GC_FIXED_ALLOCATOR_H_GUARD
#define PARROT_GC_FIXED_ALLOCATOR_H_GUARD

#include "parrot/settings.h"

/* these values are used for the attribute allocator */
#define GC_ATTRIB_POOLS_HEADROOM 8
#define GC_FIXED_SIZE_POOL_SIZE 4096

/* Use the lazy allocator. Since it amortizes arena allocation costs, turn
   this on at the same time that you increase the size of allocated arenas.
   increase *_HEADERS_PER_ALLOC and GC_FIXED_SIZE_POOL_SIZE to be large
   enough to satisfy most startup costs. */

typedef struct Pool_Allocator_Free_List {
    struct Pool_Allocator_Free_List * next;
} Pool_Allocator_Free_List;

typedef struct Pool_Allocator_Arena {
    struct Pool_Allocator_Arena * next;
    struct Pool_Allocator_Arena * prev;
} Pool_Allocator_Arena;

typedef struct Pool_Allocator {
    size_t object_size;
    size_t total_objects;
    size_t objects_per_alloc;
    size_t num_free_objects;
    Pool_Allocator_Free_List * free_list;
    Pool_Allocator_Arena     * top_arena;
    Pool_Allocator_Free_List * newfree;
    Pool_Allocator_Free_List * newlast;

    /* Pointers of arena bounds. Used in .is_owned check */
    void *lo_arena_ptr;
    void *hi_arena_ptr;
} Pool_Allocator;

typedef struct Fixed_Allocator
{
    Pool_Allocator **pools;
    size_t           num_pools;
} Fixed_Allocator;


/* HEADERIZER BEGIN: src/gc/fixed_allocator.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
void * Parrot_gc_fixed_allocator_allocate(PARROT_INTERP,
    ARGIN(Fixed_Allocator *allocator),
    size_t size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
size_t Parrot_gc_fixed_allocator_allocated_memory(PARROT_INTERP,
    ARGIN(const Fixed_Allocator *allocator))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_gc_fixed_allocator_destroy(PARROT_INTERP,
    ARGFREE_NOTNULL(Fixed_Allocator *allocator))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_gc_fixed_allocator_free(PARROT_INTERP,
    ARGIN(Fixed_Allocator *allocator),
    ARGMOD(void *data),
    size_t size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*data);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
struct Fixed_Allocator* Parrot_gc_fixed_allocator_new(PARROT_INTERP);

PARROT_CANNOT_RETURN_NULL
PARROT_EXPORT
void * Parrot_gc_pool_allocate(PARROT_INTERP, ARGMOD(Pool_Allocator * pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(* pool);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
size_t Parrot_gc_pool_allocated_size(PARROT_INTERP,
    ARGIN(const Pool_Allocator *pool))
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_gc_pool_destroy(PARROT_INTERP, ARGMOD(Pool_Allocator *pool))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

PARROT_EXPORT
void Parrot_gc_pool_free(PARROT_INTERP,
    ARGMOD(Pool_Allocator *pool),
    ARGFREE(void *data))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
int Parrot_gc_pool_is_maybe_owned(PARROT_INTERP,
    ARGMOD(Pool_Allocator *pool),
    ARGMOD(void *ptr))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pool)
        FUNC_MODIFIES(*ptr);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
int Parrot_gc_pool_is_owned(PARROT_INTERP,
    ARGMOD(Pool_Allocator *pool),
    ARGMOD(void *ptr))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pool)
        FUNC_MODIFIES(*ptr);

PARROT_CAN_RETURN_NULL
void* Parrot_gc_pool_high_ptr(PARROT_INTERP, ARGIN(Pool_Allocator *pool))
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
void* Parrot_gc_pool_low_ptr(PARROT_INTERP, ARGIN(Pool_Allocator *pool))
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
Pool_Allocator * Parrot_gc_pool_new(PARROT_INTERP, size_t object_size);

#define ASSERT_ARGS_Parrot_gc_fixed_allocator_allocate \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(allocator))
#define ASSERT_ARGS_Parrot_gc_fixed_allocator_allocated_memory \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(allocator))
#define ASSERT_ARGS_Parrot_gc_fixed_allocator_destroy \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(allocator))
#define ASSERT_ARGS_Parrot_gc_fixed_allocator_free \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(allocator) \
    , PARROT_ASSERT_ARG(data))
#define ASSERT_ARGS_Parrot_gc_fixed_allocator_new __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_gc_pool_allocate __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_Parrot_gc_pool_allocated_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_Parrot_gc_pool_destroy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_Parrot_gc_pool_free __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_Parrot_gc_pool_is_maybe_owned __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool) \
    , PARROT_ASSERT_ARG(ptr))
#define ASSERT_ARGS_Parrot_gc_pool_is_owned __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool) \
    , PARROT_ASSERT_ARG(ptr))
#define ASSERT_ARGS_Parrot_gc_pool_high_ptr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_Parrot_gc_pool_low_ptr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_Parrot_gc_pool_new __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/gc/fixed_allocator.c */


#endif /* PARROT_GC_FIXED_ALLOCATOR_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
