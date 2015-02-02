/*
Copyright (C) 2001-2015, Parrot Foundation.

=head1 NAME

src/gc/gc_ms2.c - Non-recursive M&S

=head1 DESCRIPTION

This program implements a non-recursive M&S garbage collection.

=cut

*/

#include "parrot/parrot.h"
#include "parrot/gc_api.h"
#include "parrot/pointer_array.h"
#include "gc_private.h"
#include "fixed_allocator.h"
#ifdef MEMORY_DEBUG
#  include "parrot/list.h"
#  include "parrot/runcore_trace.h"
#endif

typedef struct pmc_alloc_struct {
    void *ptr;
    PMC   pmc;   /* NB: Value! */
} pmc_alloc_struct;

typedef struct string_alloc_struct {
    void    *ptr;
    STRING   str;   /* NB: Value! */
} string_alloc_struct;

/* We allocate additional space in front of PObj* to store additional pointer */
#define PMC2PAC(p) ((pmc_alloc_struct *)((char*)(p) - sizeof (void *)))
#define STR2PAC(p) ((string_alloc_struct *)((char*)(p) - sizeof (void *)))

/* Private information */
typedef struct MarkSweep_GC {
    /* Allocator for PMC headers */
    struct Pool_Allocator          *pmc_allocator;
    /* Currently allocate objects */
    struct Parrot_Pointer_Array    *objects;
    /* During M&S gather new live objects in this list */
    struct Parrot_Pointer_Array    *new_objects;

    /* Allocator for strings */
    struct Pool_Allocator          *string_allocator;
    struct Parrot_Pointer_Array    *strings;

    /* Fixed-size allocator */
    struct Fixed_Allocator *fixed_size_allocator;

    /* String GC */
    struct String_GC        string_gc;

    /* GC blocking */
    UINTVAL gc_mark_block_level:8;  /* Num of outstanding GC block requests */
    UINTVAL gc_sweep_block_level:8; /* Num of outstanding GC block requests */
    UINTVAL gc_move_block_level:8;  /* for the compacting/move phase */

    size_t dynamic_threshold; /* Maximum percentage of memory wasted */
    size_t min_threshold;     /* Minimum GC threshold */
    size_t gc_threshold;      /* Number of allocated bytes before GC is triggered */

    UINTVAL num_early_gc_PMCs;    /* how many PMCs want immediate destruction */
} MarkSweep_GC;

/* HEADERIZER HFILE: src/gc/gc_private.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static Parrot_Buffer* gc_ms2_allocate_buffer_header(PARROT_INTERP,
    size_t size)
        __attribute__nonnull__(1);

static void gc_ms2_allocate_buffer_storage(PARROT_INTERP,
    ARGMOD(Parrot_Buffer *str),
    size_t size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*str);

PARROT_CAN_RETURN_NULL
static void* gc_ms2_allocate_fixed_size_storage(PARROT_INTERP, size_t size)
        __attribute__nonnull__(1);

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static void * gc_ms2_allocate_memory_chunk(PARROT_INTERP, size_t size)
        __attribute__nonnull__(1);

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static void * gc_ms2_allocate_memory_chunk_zeroed(PARROT_INTERP,
    size_t size)
        __attribute__nonnull__(1);

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static void* gc_ms2_allocate_pmc_attributes(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static PMC* gc_ms2_allocate_pmc_header(PARROT_INTERP, UINTVAL flags)
        __attribute__nonnull__(1);

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static STRING* gc_ms2_allocate_string_header(PARROT_INTERP, UINTVAL flags)
        __attribute__nonnull__(1);

static void gc_ms2_allocate_string_storage(PARROT_INTERP,
    ARGMOD(STRING *str),
    size_t size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*str);

static void gc_ms2_block_GC_mark(PARROT_INTERP)
        __attribute__nonnull__(1);

static void gc_ms2_block_GC_move(PARROT_INTERP)
        __attribute__nonnull__(1);

static void gc_ms2_block_GC_sweep(PARROT_INTERP)
        __attribute__nonnull__(1);

static void gc_ms2_compact_memory_pool(PARROT_INTERP)
        __attribute__nonnull__(1);

static void gc_ms2_destroy_pmc_pool(PARROT_INTERP,
    ARGIN(Pool_Allocator *pool),
    ARGIN(Parrot_Pointer_Array *list))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void gc_ms2_finalize(PARROT_INTERP)
        __attribute__nonnull__(1);

static void gc_ms2_free_buffer_header(PARROT_INTERP,
    ARGFREE(Parrot_Buffer *s),
    size_t size)
        __attribute__nonnull__(1);

static void gc_ms2_free_fixed_size_storage(PARROT_INTERP,
    size_t size,
    ARGFREE_NOTNULL(void *data))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

static void gc_ms2_free_memory_chunk(PARROT_INTERP, ARGFREE(void *data))
        __attribute__nonnull__(1);

static void gc_ms2_free_pmc_attributes(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

static void gc_ms2_free_pmc_header(PARROT_INTERP, ARGFREE(PMC *pmc))
        __attribute__nonnull__(1);

static void gc_ms2_free_string_header(PARROT_INTERP, ARGFREE(STRING *s))
        __attribute__nonnull__(1);

static size_t gc_ms2_get_gc_info(PARROT_INTERP, Interpinfo_enum which)
        __attribute__nonnull__(1);

static unsigned int gc_ms2_is_blocked_GC_mark(PARROT_INTERP)
        __attribute__nonnull__(1);

static unsigned int gc_ms2_is_blocked_GC_move(PARROT_INTERP)
        __attribute__nonnull__(1);

static unsigned int gc_ms2_is_blocked_GC_sweep(PARROT_INTERP)
        __attribute__nonnull__(1);

static int gc_ms2_is_pmc_ptr(PARROT_INTERP, ARGIN_NULLOK(void *ptr))
        __attribute__nonnull__(1);

static int gc_ms2_is_ptr_owned(PARROT_INTERP,
    ARGIN_NULLOK(void *ptr),
    ARGIN(Pool_Allocator *pool),
    ARGIN(Parrot_Pointer_Array *list))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

static int gc_ms2_is_string_ptr(PARROT_INTERP, ARGIN_NULLOK(void *ptr))
        __attribute__nonnull__(1);

static void gc_ms2_iterate_live_strings(PARROT_INTERP,
    string_iterator_callback callback,
    ARGIN_NULLOK(void *data))
        __attribute__nonnull__(1);

static void gc_ms2_mark_and_sweep(PARROT_INTERP, UINTVAL flags)
        __attribute__nonnull__(1);

static void gc_ms2_mark_live_objects(PARROT_INTERP,
    ARGIN(MarkSweep_GC *self),
    UINTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void gc_ms2_mark_pmc_header(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

static void gc_ms2_mark_str_header(PARROT_INTERP, ARGMOD(STRING *s))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*s);

static void gc_ms2_maybe_mark_and_sweep(PARROT_INTERP, UINTVAL flags)
        __attribute__nonnull__(1);

static void gc_ms2_pmc_needs_early_collection(PARROT_INTERP, PMC *pmc)
        __attribute__nonnull__(1);

PARROT_INLINE
static void gc_ms2_print_stats(PARROT_INTERP, ARGIN(const char* header))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void gc_ms2_reallocate_buffer_storage(PARROT_INTERP,
    ARGMOD(Parrot_Buffer *str),
    size_t size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*str);

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static void * gc_ms2_reallocate_memory_chunk(PARROT_INTERP,
    ARGFREE(void *from),
    size_t size)
        __attribute__nonnull__(1);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static void * gc_ms2_reallocate_memory_chunk_zeroed(PARROT_INTERP,
    ARGFREE(void *data),
    size_t newsize,
    size_t oldsize);

static void gc_ms2_reallocate_string_storage(PARROT_INTERP,
    ARGMOD(STRING *str),
    size_t size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*str);

static void gc_ms2_sweep_pmc_pool(PARROT_INTERP,
    ARGIN(Pool_Allocator *pool),
    ARGIN(Parrot_Pointer_Array *list))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void gc_ms2_sweep_string_pool(PARROT_INTERP,
    ARGIN(Pool_Allocator *pool),
    ARGIN(Parrot_Pointer_Array *list))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void gc_ms2_unblock_GC_mark(PARROT_INTERP)
        __attribute__nonnull__(1);

static void gc_ms2_unblock_GC_move(PARROT_INTERP)
        __attribute__nonnull__(1);

static void gc_ms2_unblock_GC_sweep(PARROT_INTERP)
        __attribute__nonnull__(1);

static void gc_ms2_validate_objects(PARROT_INTERP)
        __attribute__nonnull__(1);

static void gc_ms2_validate_pmc(PARROT_INTERP, ARGIN(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void gc_ms2_validate_str(PARROT_INTERP, ARGIN(STRING *str))
        __attribute__nonnull__(2);

#define ASSERT_ARGS_gc_ms2_allocate_buffer_header __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_allocate_buffer_storage \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(str))
#define ASSERT_ARGS_gc_ms2_allocate_fixed_size_storage \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_allocate_memory_chunk __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_allocate_memory_chunk_zeroed \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_allocate_pmc_attributes \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_gc_ms2_allocate_pmc_header __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_allocate_string_header __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_allocate_string_storage \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(str))
#define ASSERT_ARGS_gc_ms2_block_GC_mark __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_block_GC_move __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_block_GC_sweep __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_compact_memory_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_destroy_pmc_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pool) \
    , PARROT_ASSERT_ARG(list))
#define ASSERT_ARGS_gc_ms2_finalize __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_free_buffer_header __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_free_fixed_size_storage \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(data))
#define ASSERT_ARGS_gc_ms2_free_memory_chunk __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_free_pmc_attributes __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_gc_ms2_free_pmc_header __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_free_string_header __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_get_gc_info __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_is_blocked_GC_mark __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_is_blocked_GC_move __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_is_blocked_GC_sweep __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_is_pmc_ptr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_is_ptr_owned __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pool) \
    , PARROT_ASSERT_ARG(list))
#define ASSERT_ARGS_gc_ms2_is_string_ptr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_iterate_live_strings __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_mark_and_sweep __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_mark_live_objects __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_gc_ms2_mark_pmc_header __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_gc_ms2_mark_str_header __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_gc_ms2_maybe_mark_and_sweep __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_pmc_needs_early_collection \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_print_stats __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(header))
#define ASSERT_ARGS_gc_ms2_reallocate_buffer_storage \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(str))
#define ASSERT_ARGS_gc_ms2_reallocate_memory_chunk \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_reallocate_memory_chunk_zeroed \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_ms2_reallocate_string_storage \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(str))
#define ASSERT_ARGS_gc_ms2_sweep_pmc_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pool) \
    , PARROT_ASSERT_ARG(list))
#define ASSERT_ARGS_gc_ms2_sweep_string_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pool) \
    , PARROT_ASSERT_ARG(list))
#define ASSERT_ARGS_gc_ms2_unblock_GC_mark __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_unblock_GC_move __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_unblock_GC_sweep __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_validate_objects __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_validate_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_gc_ms2_validate_str __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(str))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=head1 Functions

=over 4

=item C<static void gc_ms2_mark_and_sweep(PARROT_INTERP, UINTVAL flags)>

Performs a GC run.  This function is called from the GC API function
C<Parrot_gc_mark_and_sweep>.

Flags can be a combination of these values:

  GC_finish_FLAG
  GC_lazy_FLAG
  GC_trace_stack_FLAG

=cut

*/


/*

=item C<static void gc_ms2_compact_memory_pool(PARROT_INTERP)>

Stub for compacting memory pools.

=cut

*/

static void
gc_ms2_compact_memory_pool(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms2_compact_memory_pool)
    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    Parrot_gc_str_compact_pool(interp, &self->string_gc);
}


/*

=item C<static PMC* gc_ms2_allocate_pmc_header(PARROT_INTERP, UINTVAL flags)>

=item C<static void gc_ms2_free_pmc_header(PARROT_INTERP, PMC *pmc)>

=item C<static STRING* gc_ms2_allocate_string_header(PARROT_INTERP, UINTVAL
flags)>

=item C<static void gc_ms2_free_string_header(PARROT_INTERP, STRING *s)>

=item C<static void* gc_ms2_allocate_pmc_attributes(PARROT_INTERP, PMC *pmc)>

=item C<static void gc_ms2_free_pmc_attributes(PARROT_INTERP, PMC *pmc)>

=item C<static void gc_ms2_allocate_string_storage(PARROT_INTERP, STRING *str,
size_t size)>

=item C<static void gc_ms2_reallocate_string_storage(PARROT_INTERP, STRING *str,
size_t size)>

=item C<static void gc_ms2_allocate_buffer_storage(PARROT_INTERP, Parrot_Buffer
*str, size_t size)>

=item C<static void gc_ms2_reallocate_buffer_storage(PARROT_INTERP,
Parrot_Buffer *str, size_t size)>

=item C<static void* gc_ms2_allocate_fixed_size_storage(PARROT_INTERP, size_t
size)>

=item C<static void gc_ms2_free_fixed_size_storage(PARROT_INTERP, size_t size,
void *data)>

Functions for allocating/deallocating various objects.

*/


PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static void*
gc_ms2_allocate_pmc_attributes(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(gc_ms2_allocate_pmc_attributes)
    struct GC_Subsystem * const gc_sys = interp->gc_sys;
    MarkSweep_GC * const self = (MarkSweep_GC *)gc_sys->gc_private;
    const size_t  attr_size = pmc->vtable->attr_size;

    PMC_data(pmc)           = Parrot_gc_fixed_allocator_allocate(interp,
                                self->fixed_size_allocator, attr_size);

    memset(PMC_data(pmc), 0, attr_size);

    if (!PObj_constant_TEST(pmc))
        gc_sys->stats.memory_used += attr_size;

    return PMC_data(pmc);
}


static void
gc_ms2_free_pmc_attributes(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(gc_ms2_free_pmc_attributes)

    if (PMC_data(pmc)) {
        struct GC_Subsystem * const gc_sys = interp->gc_sys;
        MarkSweep_GC * const self = (MarkSweep_GC *)gc_sys->gc_private;
        Parrot_gc_fixed_allocator_free(interp, self->fixed_size_allocator,
                PMC_data(pmc), pmc->vtable->attr_size);

        if (!PObj_constant_TEST(pmc))
            gc_sys->stats.memory_used -= pmc->vtable->attr_size;
    }
}


PARROT_CAN_RETURN_NULL
static void*
gc_ms2_allocate_fixed_size_storage(PARROT_INTERP, size_t size)
{
    ASSERT_ARGS(gc_ms2_allocate_fixed_size_storage)
    struct GC_Subsystem * const gc_sys = interp->gc_sys;
    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;

    gc_sys->stats.memory_used += size;

    return Parrot_gc_fixed_allocator_allocate(interp,
                self->fixed_size_allocator, size);
}


static void
gc_ms2_free_fixed_size_storage(PARROT_INTERP, size_t size, ARGFREE_NOTNULL(void *data))
{
    ASSERT_ARGS(gc_ms2_free_fixed_size_storage)
    if (data) {
        struct GC_Subsystem * const gc_sys = interp->gc_sys;
        MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;

        gc_sys->stats.memory_used -= size;

        Parrot_gc_fixed_allocator_free(interp, self->fixed_size_allocator,
                                         data, size);
    }
}


/*

=item C<static size_t gc_ms2_get_gc_info(PARROT_INTERP, Interpinfo_enum which)>

GC introspection function.
gets stats based on enum which

=cut

*/
static size_t
gc_ms2_get_gc_info(PARROT_INTERP, Interpinfo_enum which)
{
    ASSERT_ARGS(gc_ms2_get_gc_info)
    struct GC_Subsystem * const gc_sys = interp->gc_sys;
    MarkSweep_GC * const self = (MarkSweep_GC *)gc_sys->gc_private;

    switch (which) {
      case IMPATIENT_PMCS:
        return self->num_early_gc_PMCs;
      case TOTAL_PMCS:
        /* It's higher than actual number of allocated PMCs */
        return Parrot_pa_count_allocated(interp, self->objects);
      case ACTIVE_PMCS:
        /* It's higher than actual number of allocated PMCs */
        return Parrot_pa_count_used(interp, self->objects);
      default:
        return Parrot_gc_get_info(interp, which, &gc_sys->stats);
    }
}


/*

=item C<void Parrot_gc_ms2_init(PARROT_INTERP, Parrot_GC_Init_Args *args)>

Initializes the infinite memory collector. Installs the necessary function
pointers into the Memory_Pools structure. The two most important are the
C<mark_and_sweep> and C<pool_init> functions. C<finalize_gc_system> function
will be called at Parrot exit and will shut down the GC system if things
need to be flushed/closed/deactivated/freed/etc. It can be set to NULL if no
finalization is necessary.

=cut

*/

void
Parrot_gc_ms2_init(PARROT_INTERP, ARGIN(Parrot_GC_Init_Args *args))
{
    ASSERT_ARGS(Parrot_gc_ms2_init)
    struct MarkSweep_GC *self;
    struct GC_Subsystem * const gc_sys = interp->gc_sys;

    /* We have to transfer ownership of memory to parent interp
     * in threaded parrot */
    gc_sys->finalize_gc_system          = gc_ms2_finalize;

    gc_sys->maybe_gc_mark               = gc_ms2_maybe_mark_and_sweep;
    gc_sys->do_gc_mark                  = gc_ms2_mark_and_sweep;
    gc_sys->compact_string_pool         = gc_ms2_compact_memory_pool;

    /*
    gc_sys->mark_special                = gc_ms2_mark_special;
    */
    gc_sys->pmc_needs_early_collection  = gc_ms2_pmc_needs_early_collection;

    gc_sys->allocate_pmc_header         = gc_ms2_allocate_pmc_header;
    gc_sys->free_pmc_header             = gc_ms2_free_pmc_header;

    gc_sys->allocate_string_header      = gc_ms2_allocate_string_header;
    gc_sys->free_string_header          = gc_ms2_free_string_header;

#ifdef PARROT_BUFFERLIKE_LIST
    gc_sys->allocate_bufferlike_header  = gc_ms2_allocate_buffer_header;
    gc_sys->free_bufferlike_header      = gc_ms2_free_buffer_header;
#endif

    gc_sys->allocate_pmc_attributes     = gc_ms2_allocate_pmc_attributes;
    gc_sys->free_pmc_attributes         = gc_ms2_free_pmc_attributes;

    gc_sys->is_pmc_ptr                  = gc_ms2_is_pmc_ptr;
    gc_sys->is_string_ptr               = gc_ms2_is_string_ptr;
    gc_sys->mark_pmc_header             = gc_ms2_mark_pmc_header;
    gc_sys->mark_str_header             = gc_ms2_mark_str_header;

    gc_sys->block_mark                  = gc_ms2_block_GC_mark;
    gc_sys->unblock_mark                = gc_ms2_unblock_GC_mark;
    gc_sys->is_blocked_mark             = gc_ms2_is_blocked_GC_mark;

    gc_sys->block_sweep                 = gc_ms2_block_GC_sweep;
    gc_sys->unblock_sweep               = gc_ms2_unblock_GC_sweep;
    gc_sys->is_blocked_sweep            = gc_ms2_is_blocked_GC_sweep;

    gc_sys->block_move                  = gc_ms2_block_GC_move;
    gc_sys->unblock_move                = gc_ms2_unblock_GC_move;
    gc_sys->is_blocked_move             = gc_ms2_is_blocked_GC_move;

    gc_sys->allocate_string_storage     = gc_ms2_allocate_string_storage;
    gc_sys->reallocate_string_storage   = gc_ms2_reallocate_string_storage;

    gc_sys->allocate_buffer_storage     = gc_ms2_allocate_buffer_storage;
    gc_sys->reallocate_buffer_storage   = gc_ms2_reallocate_buffer_storage;

    gc_sys->allocate_fixed_size_storage = gc_ms2_allocate_fixed_size_storage;
    gc_sys->free_fixed_size_storage     = gc_ms2_free_fixed_size_storage;

    /* We don't distinguish between chunk and chunk_with_pointers */
    gc_sys->allocate_memory_chunk   = gc_ms2_allocate_memory_chunk;
    gc_sys->reallocate_memory_chunk = gc_ms2_reallocate_memory_chunk;

    gc_sys->allocate_memory_chunk_with_interior_pointers
                = gc_ms2_allocate_memory_chunk_zeroed;
    gc_sys->reallocate_memory_chunk_with_interior_pointers
                = gc_ms2_reallocate_memory_chunk_zeroed;
    gc_sys->free_memory_chunk       = gc_ms2_free_memory_chunk;

    gc_sys->iterate_live_strings    = gc_ms2_iterate_live_strings;

    gc_sys->get_gc_info             = gc_ms2_get_gc_info;

    {
        self = mem_internal_allocate_zeroed_typed(MarkSweep_GC);

        self->pmc_allocator = Parrot_gc_pool_new(interp,
            sizeof (pmc_alloc_struct));
        self->objects = Parrot_pa_new(interp);

        self->string_allocator = Parrot_gc_pool_new(interp,
            sizeof (string_alloc_struct));
        self->strings = Parrot_pa_new(interp);

        self->fixed_size_allocator = Parrot_gc_fixed_allocator_new(interp);

        self->dynamic_threshold = args->dynamic_threshold
                                ? args->dynamic_threshold
                                : GC_DEFAULT_DYNAMIC_THRESHOLD;
        self->min_threshold     = args->min_threshold
                                ? args->min_threshold
                                : GC_DEFAULT_MIN_THRESHOLD;
        self->gc_threshold      = self->min_threshold;

        Parrot_gc_str_initialize(interp, &self->string_gc);
    }

    gc_sys->gc_private = self;
}


/*

=item C<static void gc_ms2_finalize(PARROT_INTERP)>

Finalize GC subsystem.

=cut

*/

static void
gc_ms2_finalize(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms2_finalize)

    if (!interp->parent_interpreter) {
        struct GC_Subsystem * const gc_sys = interp->gc_sys;
        MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;

        gc_ms2_print_stats(interp, "ms2 finalize");
        Parrot_gc_str_finalize(interp, &self->string_gc);

        Parrot_pa_destroy(interp, self->objects);
        Parrot_pa_destroy(interp, self->strings);
        Parrot_gc_pool_destroy(interp, self->pmc_allocator);
        Parrot_gc_pool_destroy(interp, self->string_allocator);
        Parrot_gc_fixed_allocator_destroy(interp, self->fixed_size_allocator);

        /* now free this GC system */
        mem_sys_free(self);
        gc_sys->gc_private = NULL;
    }
}


PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static PMC*
gc_ms2_allocate_pmc_header(PARROT_INTERP, UINTVAL flags)
{
    ASSERT_ARGS(gc_ms2_allocate_pmc_header)
    struct GC_Subsystem * const gc_sys = interp->gc_sys;
    MarkSweep_GC     * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    Pool_Allocator   * const pool = self->pmc_allocator;
    pmc_alloc_struct *ptr;

    if (!(flags & PObj_constant_FLAG))
        gc_sys->stats.memory_used += sizeof (PMC);

    ptr = (pmc_alloc_struct *)Parrot_gc_pool_allocate(interp, pool);
    ptr->ptr = Parrot_pa_insert(self->objects, ptr);

    return &ptr->pmc;
}


static void
gc_ms2_free_pmc_header(PARROT_INTERP, ARGFREE(PMC *pmc))
{
    ASSERT_ARGS(gc_ms2_free_pmc_header)
    struct GC_Subsystem * const gc_sys = interp->gc_sys;
    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;

    if (pmc) {
        if (PObj_on_free_list_TEST(pmc))
            return;
        Parrot_pa_remove(interp, self->objects, PMC2PAC(pmc)->ptr);
        PObj_on_free_list_SET(pmc);

        Parrot_pmc_destroy(interp, pmc);

        Parrot_gc_pool_free(interp, self->pmc_allocator, PMC2PAC(pmc));

        if (!PObj_constant_TEST(pmc))
            gc_sys->stats.memory_used -= sizeof (PMC);
    }
}


/*

=item C<static void gc_ms2_mark_pmc_header(PARROT_INTERP, PMC *pmc)>

mark as grey

=cut

*/

static void
gc_ms2_mark_pmc_header(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(gc_ms2_mark_pmc_header)
    MarkSweep_GC      * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    pmc_alloc_struct  * const item = PMC2PAC(pmc);

    /* Object was already marked as grey. Or live. Or dead. Skip it */
    if (PObj_is_live_or_free_TESTALL(pmc))
        return;

    /* mark it live */
    PObj_live_SET(pmc);

    if (!PObj_constant_TEST(pmc)) {
        Parrot_pa_remove(interp, self->objects, item->ptr);
        if (!self->new_objects)
            self->new_objects = Parrot_pa_new(interp);
        item->ptr = Parrot_pa_insert(self->new_objects, item);
    }
}


/*

=item C<static int gc_ms2_is_pmc_ptr(PARROT_INTERP, void *ptr)>

Establish if *ptr is.owned.

=cut

*/

static int
gc_ms2_is_pmc_ptr(PARROT_INTERP, ARGIN_NULLOK(void *ptr))
{
    ASSERT_ARGS(gc_ms2_is_pmc_ptr)
    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    return gc_ms2_is_ptr_owned(interp, ptr, self->pmc_allocator, self->objects);
}

/*

=item C<gc_ms2_allocate_string_header()>

Allocate string headers.

=item C<gc_ms2_free_string_header()>

Free string headers.

=item C<static Parrot_Buffer* gc_ms2_allocate_buffer_header(PARROT_INTERP,
size_t size)>

Deprecated. define PARROT_BUFFERLIKE_LIST in config.h to use it.

=item C<static void gc_ms2_free_buffer_header(PARROT_INTERP, Parrot_Buffer *s,
size_t size)>

Deprecated. define PARROT_BUFFERLIKE_LIST in config.h to use it.

*/

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static STRING*
gc_ms2_allocate_string_header(PARROT_INTERP, UINTVAL flags)
{
    ASSERT_ARGS(gc_ms2_allocate_string_header)
    struct GC_Subsystem * const gc_sys = interp->gc_sys;
    MarkSweep_GC     * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    Pool_Allocator   * const pool = self->string_allocator;
    string_alloc_struct *ptr;
    STRING           *ret;

    if (!(flags & PObj_constant_FLAG))
        gc_sys->stats.memory_used += sizeof (STRING);

    ptr = (string_alloc_struct *)Parrot_gc_pool_allocate(interp, pool);
    ptr->ptr = Parrot_pa_insert(self->strings, ptr);

    ret = &ptr->str;
    memset(ret, 0, sizeof (STRING));
    return ret;
}


static void
gc_ms2_free_string_header(PARROT_INTERP, ARGFREE(STRING *s))
{
    ASSERT_ARGS(gc_ms2_free_string_header)

    if (s && !PObj_on_free_list_TEST(s)) {
        struct GC_Subsystem * const gc_sys = interp->gc_sys;
        MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;

        Parrot_pa_remove(interp, self->strings, STR2PAC(s)->ptr);

        if (Buffer_bufstart(s) && !PObj_external_TEST(s))
            Parrot_gc_str_free_buffer_storage(interp,
                &self->string_gc, (Parrot_Buffer *)s);

        PObj_on_free_list_SET(s);

        Parrot_gc_pool_free(interp, self->string_allocator, STR2PAC(s));

        if (!PObj_constant_TEST(s))
            gc_sys->stats.memory_used -= sizeof (STRING);
    }
}

#ifdef PARROT_BUFFERLIKE_LIST

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static Parrot_Buffer*
gc_ms2_allocate_buffer_header(PARROT_INTERP, SHIM(size_t size))
{
    ASSERT_ARGS(gc_ms2_allocate_buffer_header)
    return (Parrot_Buffer *)gc_ms2_allocate_string_header(interp, 0);
}


static void
gc_ms2_free_buffer_header(PARROT_INTERP, ARGFREE(Parrot_Buffer *s), SHIM(size_t size))
{
    ASSERT_ARGS(gc_ms2_free_buffer_header)
    gc_ms2_free_string_header(interp, (STRING*)s);
}

#endif

/*

=item C<static int gc_ms2_is_string_ptr(PARROT_INTERP, void *ptr)>

Establish if STRING *ptr is owned.

=cut

*/

static int
gc_ms2_is_string_ptr(PARROT_INTERP, ARGIN_NULLOK(void *ptr))
{
    ASSERT_ARGS(gc_ms2_is_string_ptr)
    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    return gc_ms2_is_ptr_owned(interp, ptr, self->string_allocator, self->strings);
}


/*

item C<void gc_ms_allocate_string_storage(PARROT_INTERP, STRING *str, size_t
size)>

=item C<void gc_ms_reallocate_string_storage(PARROT_INTERP, STRING *str, size_t
size)>

=item C<void gc_ms_allocate_buffer_storage(PARROT_INTERP, Parrot_Buffer *str, size_t
size)>

=item C<void gc_ms_reallocate_buffer_storage(PARROT_INTERP, Parrot_Buffer *str, size_t
size)>

Functions for allocating strings/buffers storage.

=cut

*/

static void
gc_ms2_allocate_string_storage(PARROT_INTERP, ARGMOD(STRING *str), size_t size)
{
    ASSERT_ARGS(gc_ms2_allocate_string_storage)
    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    Parrot_gc_str_allocate_string_storage(interp, &self->string_gc, str, size);
}


static void
gc_ms2_reallocate_string_storage(PARROT_INTERP, ARGMOD(STRING *str), size_t size)
{
    ASSERT_ARGS(gc_ms2_reallocate_string_storage)
    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    Parrot_gc_str_reallocate_string_storage(interp, &self->string_gc, str, size);
}


static void
gc_ms2_allocate_buffer_storage(PARROT_INTERP, ARGMOD(Parrot_Buffer *str), size_t size)
{
    ASSERT_ARGS(gc_ms2_allocate_buffer_storage)
    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    Parrot_gc_str_allocate_buffer_storage(interp, &self->string_gc, str, size);
}


static void
gc_ms2_reallocate_buffer_storage(PARROT_INTERP, ARGMOD(Parrot_Buffer *str), size_t size)
{
    ASSERT_ARGS(gc_ms2_reallocate_buffer_storage)
    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    Parrot_gc_str_reallocate_buffer_storage(interp, &self->string_gc, str, size);
}


/*

=item C<static void gc_ms2_mark_str_header(PARROT_INTERP, STRING *s)>

Marks STRING as live.

=cut

*/

static void
gc_ms2_mark_str_header(SHIM_INTERP, ARGMOD(STRING *s))
{
    ASSERT_ARGS(gc_ms2_mark_str_header)

    PObj_live_SET(s);
}


/*

=item C<static void gc_ms2_iterate_live_strings(PARROT_INTERP,
string_iterator_callback callback, void *data)>

Iterates over live strings invoking callback for each of them. Used during
compacting of string pool.

=cut

*/

static void
gc_ms2_iterate_live_strings(PARROT_INTERP,
        string_iterator_callback callback,
        ARGIN_NULLOK(void *data))
{
    ASSERT_ARGS(gc_ms2_iterate_live_strings)

    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;

    gc_ms2_print_stats(interp, "ms2 iterate_live_strings");
    POINTER_ARRAY_ITER(self->strings,
        STRING * const s = &((string_alloc_struct *)ptr)->str;
        callback(interp, (Parrot_Buffer *)s, data););
}


/*

=item C<static void gc_ms2_mark_live_objects(PARROT_INTERP, MarkSweep_GC *self,
UINTVAL flags)>

Marks all live objects in the system.  If this occurs during global
destruction, makes sure to keep around the two PMCs for which order of
destruction matters.

=cut

*/

static void
gc_ms2_mark_live_objects(PARROT_INTERP, ARGIN(MarkSweep_GC *self),
    UINTVAL flags)
{
    ASSERT_ARGS(gc_ms2_mark_live_objects)

    gc_ms2_print_stats(interp, "Mark live objects");
    /* Allocate list for gray objects */
    self->new_objects = Parrot_pa_new(interp);

    /* destroy root set and constants, but watch ordered destruction */
    if (flags & GC_finish_FLAG) {
        PObj_live_SET(interp->gc_registry);
        PObj_live_SET(interp->scheduler);
    }
    else {
        /* Trace "roots" into new_objects */
        gc_ms2_mark_pmc_header(interp, PMCNULL);

        Parrot_gc_trace_root(interp, NULL, GC_TRACE_FULL);

        if (interp->pdb && interp->pdb->debugger)
            Parrot_gc_trace_root(interp->pdb->debugger, NULL,
                (Parrot_gc_trace_type)0);
    }

    /* new_objects are "gray" until fully marked */
    /* Additional gray objects will append to new_objects list */
    /* So, iterate over them in one go */
    POINTER_ARRAY_ITER(self->new_objects,
        PMC * const pmc = &((pmc_alloc_struct *)ptr)->pmc;

        /* if object is a PMC and contains buffers or PMCs, then attach the PMC
         * to the chained mark list. */
        if (PObj_custom_mark_TEST(pmc))
            VTABLE_mark(interp, pmc);

        if (PMC_metadata(pmc))
            Parrot_gc_mark_PMC_alive(interp, PMC_metadata(pmc)););
}

static void
gc_ms2_mark_and_sweep(PARROT_INTERP, UINTVAL flags)
{
    ASSERT_ARGS(gc_ms2_mark_and_sweep)
    struct GC_Subsystem * const gc_sys = interp->gc_sys;
    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    GC_Statistics       *stats;
    size_t               threshold;

    if (interp->thread_data)
        LOCK(interp->thread_data->interp_lock);

    gc_ms2_print_stats(interp, "Maybe m&s");
    /* GC is blocked */
    if (self->gc_mark_block_level)
        goto DONE;

    /* avoid global destruction for child interps */
    if (flags & GC_finish_FLAG && interp->parent_interpreter)
        goto DONE;

    ++self->gc_mark_block_level;
    gc_ms2_mark_live_objects(interp, self, flags);

    /* At this point of time new_objects contains only live PMCs */
    /* objects contains "dead" or "constant" PMCs */
    /* sweep of new_objects will repaint them white */
    /* sweep of objects will destroy dead objects leaving only "constant" */
    gc_ms2_print_stats(interp, "Sweep new pmc objects");
    gc_ms2_sweep_pmc_pool(interp, self->pmc_allocator, self->new_objects);
    gc_ms2_print_stats(interp, "Sweep old pmc objects");
    gc_ms2_sweep_pmc_pool(interp, self->pmc_allocator, self->objects);
    gc_ms2_sweep_string_pool(interp, self->string_allocator, self->strings);

    /* destroy the rest */
    if (flags & GC_finish_FLAG) {
        gc_ms2_print_stats(interp, "Destroy old pmc objects");
        gc_ms2_destroy_pmc_pool(interp, self->pmc_allocator, self->objects);
        gc_ms2_print_stats(interp, "Destroy new pmc objects");
        gc_ms2_destroy_pmc_pool(interp, self->pmc_allocator, self->new_objects);
    }

    /* Replace objects with new_objects. Ignoring "constant" one */
    do {
        Parrot_Pointer_Array * const tmp = self->objects;
        self->objects = self->new_objects;
        Parrot_pa_destroy(interp, tmp);
    } while (0);

    /* We swept all dead objects */
    gc_ms2_print_stats(interp, "Compact memory pool");
    gc_ms2_compact_memory_pool(interp);

    stats = &gc_sys->stats;
    stats->mem_used_last_collect = stats->memory_used;
    stats->gc_mark_runs++;

    /* The dynamic threshold is a configurable percentage of the amount of
       memory used after the last GC */
    threshold = (size_t)(stats->mem_used_last_collect *
                         (0.01 * self->dynamic_threshold));

    if (threshold < self->min_threshold)
        threshold = self->min_threshold;

    self->gc_threshold = stats->mem_used_last_collect + threshold;

    self->gc_mark_block_level--;
    self->num_early_gc_PMCs = 0;
DONE:
    gc_ms2_print_stats(interp, "Done");
    if (interp->thread_data)
        UNLOCK(interp->thread_data->interp_lock);
}


/*

=item C<static void gc_ms2_maybe_mark_and_sweep(PARROT_INTERP, UINTVAL flags)>

Run a GC if memory used is above threshold.

=cut

*/

static void
gc_ms2_maybe_mark_and_sweep(PARROT_INTERP, UINTVAL flags)
{
    ASSERT_ARGS(gc_ms2_maybe_mark_and_sweep)
    struct GC_Subsystem * const gc_sys = interp->gc_sys;
    MarkSweep_GC * const self = (MarkSweep_GC *)gc_sys->gc_private;

    if (!self->gc_mark_block_level
    &&   gc_sys->stats.memory_used > self->gc_threshold)
        gc_sys->do_gc_mark(interp, flags);
}


/*

=item C<static void gc_ms2_sweep_pmc_pool(PARROT_INTERP, Pool_Allocator *pool,
Parrot_Pointer_Array *list)>

Helper function to sweep pool.

=cut

*/

static void
gc_ms2_sweep_pmc_pool(PARROT_INTERP,
        ARGIN(Pool_Allocator *pool),
        ARGIN(Parrot_Pointer_Array *list))
{
    ASSERT_ARGS(gc_ms2_sweep_pmc_pool)
    struct GC_Subsystem * const gc_sys = interp->gc_sys;

    POINTER_ARRAY_ITER(list,
        PMC *pmc = &(((pmc_alloc_struct *)ptr)->pmc);

        /* Paint live objects white */
        if (PObj_live_TEST(pmc))
            PObj_live_CLEAR(pmc);

        else if (!PObj_constant_TEST(pmc)) {
            GC_DEBUG_DETAIL_FLAGS("GC destroy pmc ", pmc);
            Parrot_pa_remove(interp, list, PMC2PAC(pmc)->ptr);

            /* this is manual inlining of Parrot_pmc_destroy() */
            if (PObj_custom_destroy_TEST(pmc))
                VTABLE_destroy(interp, pmc);

            if (pmc->vtable->attr_size && PMC_data(pmc))
                Parrot_gc_free_pmc_attributes(interp, pmc);
            PMC_data(pmc) = NULL;

            gc_sys->stats.memory_used -= sizeof (PMC);

            PObj_on_free_list_SET(pmc);
            PObj_gc_CLEAR(pmc);

            Parrot_gc_pool_free(interp, pool, ptr);
        });
}


/*

=item C<static void gc_ms2_destroy_pmc_pool(PARROT_INTERP, Pool_Allocator *pool,
Parrot_Pointer_Array *list)>

Helper function to perform final destruction of root set PMCs.

=cut

*/

static void
gc_ms2_destroy_pmc_pool(PARROT_INTERP,
        ARGIN(Pool_Allocator *pool),
        ARGIN(Parrot_Pointer_Array *list))
{
    ASSERT_ARGS(gc_ms2_destroy_pmc_pool)

    POINTER_ARRAY_ITER(list,
        PMC *pmc = &(((pmc_alloc_struct*)ptr)->pmc);
        GC_DEBUG_DETAIL_FLAGS("GC remove pmc ", pmc);
        Parrot_pa_remove(interp, list, PMC2PAC(pmc)->ptr);

        Parrot_pmc_destroy(interp, pmc);
        PObj_on_free_list_SET(pmc);

        Parrot_gc_pool_free(interp, pool, ptr););
}

/*

=item C<static void gc_ms2_sweep_string_pool(PARROT_INTERP, Pool_Allocator
*pool, Parrot_Pointer_Array *list)>

Helper function to sweep STRING pool for live STRINGs.

=cut

*/

static void
gc_ms2_sweep_string_pool(PARROT_INTERP,
        ARGIN(Pool_Allocator *pool),
        ARGIN(Parrot_Pointer_Array *list))
{
    ASSERT_ARGS(gc_ms2_sweep_string_pool)

    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    GC_Statistics  stats = interp->gc_sys->stats;

    gc_ms2_print_stats(interp, "Sweep string pool");
    POINTER_ARRAY_ITER(list,
        STRING * const obj = &(((string_alloc_struct*)ptr)->str);

        PARROT_ASSERT(!PObj_on_free_list_TEST(obj));

        /* Paint live objects white */
        if (PObj_live_TEST(obj))
            PObj_live_CLEAR(obj);

        else if (!PObj_constant_TEST(obj)) {
            GC_DEBUG_DETAIL_STR("GC remove str ", obj);
            Parrot_pa_remove(interp, list, STR2PAC(obj)->ptr);
            if (Buffer_bufstart(obj) && !PObj_external_TEST(obj))
                Parrot_gc_str_free_buffer_storage(interp, &self->string_gc, (Parrot_Buffer*)obj);

            stats.memory_used -= sizeof (STRING);

            PObj_on_free_list_SET(obj);

            Parrot_gc_pool_free(interp, pool, ptr);
        });
}


/*

=item C<static int gc_ms2_is_ptr_owned(PARROT_INTERP, void *ptr, Pool_Allocator
*pool, Parrot_Pointer_Array *list)>

Helper function to check that we own PObj

=cut

*/

static int
gc_ms2_is_ptr_owned(PARROT_INTERP,
        ARGIN_NULLOK(void *ptr),
        ARGIN(Pool_Allocator *pool),
        ARGIN(Parrot_Pointer_Array *list))
{
    ASSERT_ARGS(gc_ms2_is_ptr_owned)
    PObj             *obj  = (PObj *)ptr;
    pmc_alloc_struct *item = PMC2PAC(ptr);

    if (!obj || !item)
        return 0;

    if (!Parrot_gc_pool_is_owned(interp, pool, item))
        return 0;

    /* black or white objects marked already. */
    if (PObj_is_live_or_free_TESTALL(obj))
        return 0;

    /* Pool.is_owned isn't precise enough (yet) */
    return Parrot_pa_is_owned(list, item, item->ptr);
}


/*

=item C<static void gc_ms2_block_GC_mark(PARROT_INTERP)>

Blocks the GC from performing its mark phase.

=item C<static void gc_ms2_unblock_GC_mark(PARROT_INTERP)>

Unblocks the GC mark.

=item C<static void gc_ms2_block_GC_sweep(PARROT_INTERP)>

Blocks the GC from performing its sweep phase.

=item C<static void gc_ms2_unblock_GC_sweep(PARROT_INTERP)>

Unblocks GC sweep.

=item C<static void gc_ms2_block_GC_move(PARROT_INTERP)>

Blocks the GC from performing its move phase.

=item C<static void gc_ms2_unblock_GC_move(PARROT_INTERP)>

Unblocks GC move.

=item C<static unsigned int gc_ms2_is_blocked_GC_mark(PARROT_INTERP)>

Determines if the GC mark is currently blocked.

=item C<static unsigned int gc_ms2_is_blocked_GC_sweep(PARROT_INTERP)>

Determines if the GC sweep is currently blocked.

=item C<static unsigned int gc_ms2_is_blocked_GC_move(PARROT_INTERP)>

Determines if the GC compacting/move is currently blocked.

=cut

*/

static void
gc_ms2_block_GC_mark(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms2_block_GC_mark)
    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    ++self->gc_mark_block_level;
}

static void
gc_ms2_unblock_GC_mark(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms2_unblock_GC_mark)
    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    if (self->gc_mark_block_level)
        --self->gc_mark_block_level;
}

static void
gc_ms2_block_GC_sweep(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms2_block_GC_sweep)
    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    ++self->gc_sweep_block_level;
}

static void
gc_ms2_unblock_GC_sweep(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms2_unblock_GC_sweep)
    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    if (self->gc_sweep_block_level)
        --self->gc_sweep_block_level;
}

static void
gc_ms2_block_GC_move(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms2_block_GC_move)
    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    ++self->gc_move_block_level;
}

static void
gc_ms2_unblock_GC_move(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms2_unblock_GC_move)
    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    if (self->gc_move_block_level)
        --self->gc_move_block_level;
}

static unsigned int
gc_ms2_is_blocked_GC_mark(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms2_is_blocked_GC_mark)
    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    return self->gc_mark_block_level;
}

static unsigned int
gc_ms2_is_blocked_GC_sweep(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms2_is_blocked_GC_sweep)
    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    return self->gc_sweep_block_level;
}

static unsigned int
gc_ms2_is_blocked_GC_move(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms2_is_blocked_GC_move)
    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    return self->gc_move_block_level;
}

/*

=item C<static void * gc_ms2_allocate_memory_chunk(PARROT_INTERP, size_t size)>

=item C<static void * gc_ms2_reallocate_memory_chunk(PARROT_INTERP, void *from,
size_t size)>

=item C<static void * gc_ms2_allocate_memory_chunk_zeroed(PARROT_INTERP, size_t
size)>

=item C<static void * gc_ms2_reallocate_memory_chunk_zeroed(PARROT_INTERP, void
*data, size_t newsize, size_t oldsize)>

=item C<static void gc_ms2_free_memory_chunk(PARROT_INTERP, void *data)>

TODO Write docu.

*/

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static void *
gc_ms2_allocate_memory_chunk(PARROT_INTERP, size_t size)
{
    ASSERT_ARGS(gc_ms2_allocate_memory_chunk)
    void * const ptr = malloc(size);
    MEMORY_DEBUG_UNUSED(interp)
    MEMORY_DEBUG_DETAIL_2("Allocated "SIZE_FMT" at %p\n", size, ptr);
    if (!ptr && size)
        PANIC_OUT_OF_MEM(size);
    return ptr;
}


PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static void *
gc_ms2_reallocate_memory_chunk(PARROT_INTERP, ARGFREE(void *from), size_t size)
{
    ASSERT_ARGS(gc_ms2_reallocate_memory_chunk)
    void *ptr;
    MEMORY_DEBUG_UNUSED(interp)
    MEMORY_DEBUG_DETAIL_2("Freed %p (realloc -- "SIZE_FMT" bytes)\n", from, size);
    if (from)
        ptr = realloc(from, size);
    else
        ptr = calloc(1, size);
    MEMORY_DEBUG_DETAIL_2("Allocated "SIZE_FMT" at %p\n", size, ptr);
    if (!ptr && size)
        PANIC_OUT_OF_MEM(size);
    return ptr;
}


PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static void *
gc_ms2_allocate_memory_chunk_zeroed(PARROT_INTERP, size_t size)
{
    ASSERT_ARGS(gc_ms2_allocate_memory_chunk_zeroed)
    void * const ptr = calloc(1, (size_t)size);
    MEMORY_DEBUG_UNUSED(interp)
    MEMORY_DEBUG_DETAIL_2("Allocated "SIZE_FMT" at %p\n", size, ptr);
    if (!ptr && size)
        PANIC_OUT_OF_MEM(size);
    return ptr;
}


PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static void *
gc_ms2_reallocate_memory_chunk_zeroed(SHIM_INTERP, ARGFREE(void *data),
        size_t newsize, size_t oldsize)
{
    ASSERT_ARGS(gc_ms2_reallocate_memory_chunk_zeroed)
    void * const ptr = realloc(data, newsize);
    if (newsize > oldsize)
        memset((char*)ptr + oldsize, 0, newsize - oldsize);
    return ptr;
}


static void
gc_ms2_free_memory_chunk(PARROT_INTERP, ARGFREE(void *data))
{
    ASSERT_ARGS(gc_ms2_free_memory_chunk)
    MEMORY_DEBUG_UNUSED(interp)
    MEMORY_DEBUG_DETAIL_2("Freed %p%s\n", data, "");
    if (data)
        free(data);
}


/*

=item C<static void gc_ms2_pmc_needs_early_collection(PARROT_INTERP, PMC *pmc)>

Helper function to count how many PMCs need timely destruction.

=cut

*/

static void
gc_ms2_pmc_needs_early_collection(PARROT_INTERP, SHIM(PMC *pmc))
{
    ASSERT_ARGS(gc_ms2_pmc_needs_early_collection)
    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    ++self->num_early_gc_PMCs;
}

/*

=item C<void gc_ms2_print_stats_always(PARROT_INTERP, const char* header)>

=item C<static void gc_ms2_print_stats(PARROT_INTERP, const char* header)>

debug functions

Only enabled with C<-DMEMORY_DEBUG> in C<ccflags>.

=cut

*/

void
gc_ms2_print_stats_always(PARROT_INTERP, ARGIN(const char* header))
{
    ASSERT_ARGS(gc_ms2_print_stats_always)

    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    GC_Statistics        stats = interp->gc_sys->stats;

    fprintf(stderr, "GC %-25s | total: %lu, ", header,
            (unsigned long)stats.gc_mark_runs);
    fprintf(stderr, "old: %lu, new: %lu\n",
            (unsigned long)Parrot_pa_count_used(interp, self->objects),
            self->new_objects
              ? (unsigned long)Parrot_pa_count_used(interp, self->new_objects)
              : 0);

#if 1
    fprintf(stderr, "GC PMC: %6lu",
            (unsigned long)Parrot_gc_pool_allocated_size(interp, self->pmc_allocator));
    fprintf(stderr, ", STRING: %6lu",
            (unsigned long)Parrot_gc_pool_allocated_size(interp, self->string_allocator));
    fprintf(stderr, ", buf: %6lu",
            (unsigned long)self->string_gc.memory_pool->total_allocated);
    fprintf(stderr, ", const buf: %6lu",
            (unsigned long)self->string_gc.constant_string_pool->total_allocated);
    fprintf(stderr, ", fixed: %6lu",
            (unsigned long)Parrot_gc_fixed_allocator_allocated_memory(interp,
              self->fixed_size_allocator));
    if (interp->parent_interpreter) {
        fprintf(stderr, ", parent: 0x%lx, tid: %3d",
                (unsigned long)interp->parent_interpreter,
                interp->thread_data ? (signed)interp->thread_data->tid : -1);
    }
#endif
    fprintf(stderr, "\n");

}

PARROT_INLINE
static void
gc_ms2_print_stats(PARROT_INTERP, ARGIN(const char* header))
{
    ASSERT_ARGS(gc_ms2_print_stats)

#ifdef MEMORY_DEBUG
    if (Interp_debug_TEST(interp, PARROT_MEM_STAT_DEBUG_FLAG)) {
        gc_ms2_print_stats_always(interp, header);
        gc_ms2_validate_objects(interp);
    }
#else
    UNUSED(interp);
    UNUSED(header);
#endif

}

/*

=item C<static void gc_ms2_validate_pmc(PARROT_INTERP, PMC *pmc)>

=item C<static void gc_ms2_validate_str(PARROT_INTERP, STRING *str)>

=item C<static void gc_ms2_validate_objects(PARROT_INTERP)>

Validation routines

=cut

*/
static void
gc_ms2_validate_pmc(PARROT_INTERP, ARGIN(PMC *pmc))
{
    ASSERT_ARGS(gc_ms2_validate_pmc)

    if (PObj_on_free_list_TEST(pmc))
        Parrot_confess("Dead object found!", __FILE__, __LINE__);

    if (PObj_live_TEST(pmc))
        return;

    PObj_live_SET(pmc);

    if (PObj_custom_mark_TEST(pmc))
        VTABLE_mark(interp, pmc);

}

static void
gc_ms2_validate_str(SHIM_INTERP, ARGIN(STRING *str))
{
    ASSERT_ARGS(gc_ms2_validate_str)

#ifdef PARROT_ASSERTS_ON
    PARROT_ASSERT(!PObj_on_free_list_TEST(str));
#else
    UNUSED(str);
#endif
}

static void
gc_ms2_validate_objects(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms2_validate_objects)

/* GH #880 validate is not thread-safe, problematic only on darwin */
#if defined(THREAD_DEBUG) && !defined(__APPLE__)
    INTVAL i;
    struct GC_Subsystem * const gc_sys = interp->gc_sys;
    MarkSweep_GC * const self = (MarkSweep_GC *)gc_sys->gc_private;

#  ifdef MEMORY_DEBUG
    fprintf(stderr, "MS2 Validate\n");
#  endif
    gc_sys->mark_pmc_header = gc_ms2_validate_pmc;
    gc_sys->mark_str_header = gc_ms2_validate_str;
    Parrot_gc_trace_root(interp, NULL, GC_TRACE_FULL);
    gc_sys->mark_pmc_header = gc_ms2_mark_pmc_header;
    gc_sys->mark_str_header = gc_ms2_mark_str_header;

#  ifdef MEMORY_DEBUG
    fprintf(stderr, "\n");
#  endif
#else
    UNUSED(interp);
#endif
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
