/*
Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

src/gc/gc_ms2.c - Non-recursive M&S

=head1 DESCRIPTION

=cut

*/

#include "parrot/parrot.h"
#include "parrot/gc_api.h"
#include "parrot/pointer_array.h"
#include "gc_private.h"
#include "fixed_allocator.h"

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

#define PANIC_OUT_OF_MEM(size) failed_allocation(__LINE__, (size))

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

    /* Maximum percentage of memory wasted */
    size_t dynamic_threshold;
    /* Minimum GC threhshold */
    size_t min_threshold;
    /* Number of allocated bytes before GC is triggered */
    size_t gc_threshold;

    /* GC blocking */
    UINTVAL gc_mark_block_level;  /* How many outstanding GC block
                                     requests are there? */
    UINTVAL gc_sweep_block_level; /* How many outstanding GC block
                                     requests are there? */

    UINTVAL num_early_gc_PMCs;    /* how many PMCs want immediate destruction */

} MarkSweep_GC;

/* HEADERIZER HFILE: src/gc/gc_private.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_DOES_NOT_RETURN
static void failed_allocation(unsigned int line, unsigned long size);

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static Buffer* gc_ms2_allocate_buffer_header(PARROT_INTERP, size_t size)
        __attribute__nonnull__(1);

static void gc_ms2_allocate_buffer_storage(PARROT_INTERP,
    ARGMOD(Buffer *str),
    size_t size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*str);

PARROT_CAN_RETURN_NULL
static void* gc_ms2_allocate_fixed_size_storage(PARROT_INTERP, size_t size)
        __attribute__nonnull__(1);

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static void * gc_ms2_allocate_memory_chunk(PARROT_INTERP, size_t size);

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static void * gc_ms2_allocate_memory_chunk_zeroed(PARROT_INTERP,
    size_t size);

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
    ARGFREE(Buffer *s),
    size_t size)
        __attribute__nonnull__(1);

static void gc_ms2_free_fixed_size_storage(PARROT_INTERP,
    size_t size,
    ARGFREE_NOTNULL(void *data))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

static void gc_ms2_free_memory_chunk(PARROT_INTERP, ARGFREE(void *data));
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

static void gc_ms2_pmc_needs_early_collection(PARROT_INTERP, PMC *pmc)
        __attribute__nonnull__(1);

static void gc_ms2_reallocate_buffer_storage(PARROT_INTERP,
    ARGMOD(Buffer *str),
    size_t size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*str);

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static void * gc_ms2_reallocate_memory_chunk(PARROT_INTERP,
    ARGFREE(void *from),
    size_t size);

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

static void gc_ms2_unblock_GC_sweep(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_failed_allocation __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_ms2_allocate_buffer_header __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_allocate_buffer_storage \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(str))
#define ASSERT_ARGS_gc_ms2_allocate_fixed_size_storage \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_allocate_memory_chunk __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_ms2_allocate_memory_chunk_zeroed \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
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
#define ASSERT_ARGS_gc_ms2_free_memory_chunk __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
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
#define ASSERT_ARGS_gc_ms2_pmc_needs_early_collection \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_reallocate_buffer_storage \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(str))
#define ASSERT_ARGS_gc_ms2_reallocate_memory_chunk \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
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
#define ASSERT_ARGS_gc_ms2_unblock_GC_sweep __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
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

=item C<static void gc_ms2_allocate_buffer_storage(PARROT_INTERP, Buffer *str,
size_t size)>

=item C<static void gc_ms2_reallocate_buffer_storage(PARROT_INTERP, Buffer *str,
size_t size)>

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
    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    const size_t  attr_size = pmc->vtable->attr_size;

    PMC_data(pmc)           = Parrot_gc_fixed_allocator_allocate(interp,
                                self->fixed_size_allocator, attr_size);

    memset(PMC_data(pmc), 0, attr_size);

    if (!PObj_constant_TEST(pmc))
        interp->gc_sys->stats.memory_used += attr_size;

    return PMC_data(pmc);
}


static void
gc_ms2_free_pmc_attributes(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(gc_ms2_free_pmc_attributes)

    if (PMC_data(pmc)) {
        MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
        Parrot_gc_fixed_allocator_free(interp, self->fixed_size_allocator,
                PMC_data(pmc), pmc->vtable->attr_size);

        if (!PObj_constant_TEST(pmc))
            interp->gc_sys->stats.memory_used -= pmc->vtable->attr_size;
    }
}


PARROT_CAN_RETURN_NULL
static void*
gc_ms2_allocate_fixed_size_storage(PARROT_INTERP, size_t size)
{
    ASSERT_ARGS(gc_ms2_allocate_fixed_size_storage)
    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;

    interp->gc_sys->stats.memory_used += size;

    return Parrot_gc_fixed_allocator_allocate(interp,
                self->fixed_size_allocator, size);
}


static void
gc_ms2_free_fixed_size_storage(PARROT_INTERP, size_t size, ARGFREE_NOTNULL(void *data))
{
    ASSERT_ARGS(gc_ms2_free_fixed_size_storage)
    if (data) {
        MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;

        interp->gc_sys->stats.memory_used -= size;

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
    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;

    if (which == IMPATIENT_PMCS)
        return self->num_early_gc_PMCs;
    if (which == TOTAL_PMCS)
        /* It's higher than actual number of allocated PMCs */
        return Parrot_pa_count_allocated(interp, self->objects);
    if (which == ACTIVE_PMCS)
        /* It's higher than actual number of allocated PMCs */
        return Parrot_pa_count_used(interp, self->objects);

    return Parrot_gc_get_info(interp, which, &interp->gc_sys->stats);
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

    /* We have to transfer ownership of memory to parent interp
     * in threaded parrot */
    interp->gc_sys->finalize_gc_system          = gc_ms2_finalize;

    interp->gc_sys->do_gc_mark                  = gc_ms2_mark_and_sweep;
    interp->gc_sys->compact_string_pool         = gc_ms2_compact_memory_pool;

    /*
    interp->gc_sys->mark_special                = gc_ms2_mark_special;
    */
    interp->gc_sys->pmc_needs_early_collection  = gc_ms2_pmc_needs_early_collection;

    interp->gc_sys->allocate_pmc_header         = gc_ms2_allocate_pmc_header;
    interp->gc_sys->free_pmc_header             = gc_ms2_free_pmc_header;

    interp->gc_sys->allocate_string_header      = gc_ms2_allocate_string_header;
    interp->gc_sys->free_string_header          = gc_ms2_free_string_header;

    interp->gc_sys->allocate_bufferlike_header  = gc_ms2_allocate_buffer_header;
    interp->gc_sys->free_bufferlike_header      = gc_ms2_free_buffer_header;

    interp->gc_sys->allocate_pmc_attributes     = gc_ms2_allocate_pmc_attributes;
    interp->gc_sys->free_pmc_attributes         = gc_ms2_free_pmc_attributes;

    interp->gc_sys->is_pmc_ptr                  = gc_ms2_is_pmc_ptr;
    interp->gc_sys->is_string_ptr               = gc_ms2_is_string_ptr;
    interp->gc_sys->mark_pmc_header             = gc_ms2_mark_pmc_header;
    interp->gc_sys->mark_str_header             = gc_ms2_mark_str_header;

    interp->gc_sys->block_mark                  = gc_ms2_block_GC_mark;
    interp->gc_sys->unblock_mark                = gc_ms2_unblock_GC_mark;
    interp->gc_sys->is_blocked_mark             = gc_ms2_is_blocked_GC_mark;

    interp->gc_sys->block_sweep                 = gc_ms2_block_GC_sweep;
    interp->gc_sys->unblock_sweep               = gc_ms2_unblock_GC_sweep;
    interp->gc_sys->is_blocked_sweep            = gc_ms2_is_blocked_GC_sweep;

    interp->gc_sys->allocate_string_storage     = gc_ms2_allocate_string_storage;
    interp->gc_sys->reallocate_string_storage   = gc_ms2_reallocate_string_storage;

    interp->gc_sys->allocate_buffer_storage     = gc_ms2_allocate_buffer_storage;
    interp->gc_sys->reallocate_buffer_storage   = gc_ms2_reallocate_buffer_storage;

    interp->gc_sys->allocate_fixed_size_storage = gc_ms2_allocate_fixed_size_storage;
    interp->gc_sys->free_fixed_size_storage     = gc_ms2_free_fixed_size_storage;

    /* We don't distinguish between chunk and chunk_with_pointers */
    interp->gc_sys->allocate_memory_chunk   = gc_ms2_allocate_memory_chunk;
    interp->gc_sys->reallocate_memory_chunk = gc_ms2_reallocate_memory_chunk;

    interp->gc_sys->allocate_memory_chunk_with_interior_pointers
                = gc_ms2_allocate_memory_chunk_zeroed;
    interp->gc_sys->reallocate_memory_chunk_with_interior_pointers
                = gc_ms2_reallocate_memory_chunk_zeroed;
    interp->gc_sys->free_memory_chunk       = gc_ms2_free_memory_chunk;

    interp->gc_sys->iterate_live_strings    = gc_ms2_iterate_live_strings;

    interp->gc_sys->get_gc_info             = gc_ms2_get_gc_info;

    if (interp->parent_interpreter && interp->parent_interpreter->gc_sys) {
        /* This is a "child" interpreter. Just reuse parent one */
        self = (MarkSweep_GC*)interp->parent_interpreter->gc_sys->gc_private;
    }
    else {
        self = mem_allocate_zeroed_typed(MarkSweep_GC);

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

    interp->gc_sys->gc_private = self;
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
        MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;

        Parrot_gc_str_finalize(interp, &self->string_gc);

        Parrot_pa_destroy(interp, self->objects);
        Parrot_pa_destroy(interp, self->strings);
        Parrot_gc_pool_destroy(interp, self->pmc_allocator);
        Parrot_gc_pool_destroy(interp, self->string_allocator);
        Parrot_gc_fixed_allocator_destroy(interp, self->fixed_size_allocator);

        /* now free this GC system */
        mem_sys_free(self);
        interp->gc_sys->gc_private = NULL;
    }
}


PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static PMC*
gc_ms2_allocate_pmc_header(PARROT_INTERP, UINTVAL flags)
{
    ASSERT_ARGS(gc_ms2_allocate_pmc_header)
    MarkSweep_GC     * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    Pool_Allocator   * const pool = self->pmc_allocator;
    pmc_alloc_struct *ptr;

    if (!(flags & PObj_constant_FLAG))
        interp->gc_sys->stats.memory_used += sizeof (PMC);

    ptr = (pmc_alloc_struct *)Parrot_gc_pool_allocate(interp, pool);
    ptr->ptr = Parrot_pa_insert(interp, self->objects, ptr);

    return &ptr->pmc;
}


static void
gc_ms2_free_pmc_header(PARROT_INTERP, ARGFREE(PMC *pmc))
{
    ASSERT_ARGS(gc_ms2_free_pmc_header)
    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;

    if (pmc) {
        if (PObj_on_free_list_TEST(pmc))
            return;
        Parrot_pa_remove(interp, self->objects, PMC2PAC(pmc)->ptr);
        PObj_on_free_list_SET(pmc);

        Parrot_pmc_destroy(interp, pmc);

        Parrot_gc_pool_free(interp, self->pmc_allocator, PMC2PAC(pmc));

        if (!PObj_constant_TEST(pmc))
            interp->gc_sys->stats.memory_used -= sizeof (PMC);
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
        item->ptr = Parrot_pa_insert(interp, self->new_objects, item);
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

=item C<gc_ms2_free_string_header()>

=item C<static Buffer* gc_ms2_allocate_buffer_header(PARROT_INTERP, size_t
size)>

=item C<static void gc_ms2_free_buffer_header(PARROT_INTERP, Buffer *s, size_t
size)>

Allocate/free string/buffer headers.

*/

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static STRING*
gc_ms2_allocate_string_header(PARROT_INTERP, UINTVAL flags)
{
    ASSERT_ARGS(gc_ms2_allocate_string_header)
    MarkSweep_GC     * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    Pool_Allocator   * const pool = self->string_allocator;
    string_alloc_struct *ptr;
    STRING           *ret;

    if (!(flags & PObj_constant_FLAG))
        interp->gc_sys->stats.memory_used += sizeof (STRING);

    ptr = (string_alloc_struct *)Parrot_gc_pool_allocate(interp, pool);
    ptr->ptr = Parrot_pa_insert(interp, self->strings, ptr);

    ret = &ptr->str;
    memset(ret, 0, sizeof (STRING));
    return ret;
}


static void
gc_ms2_free_string_header(PARROT_INTERP, ARGFREE(STRING *s))
{
    ASSERT_ARGS(gc_ms2_free_string_header)

    if (s && !PObj_on_free_list_TEST(s)) {
        MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;

        Parrot_pa_remove(interp, self->strings, STR2PAC(s)->ptr);

        if (Buffer_bufstart(s) && !PObj_external_TEST(s))
            Parrot_gc_str_free_buffer_storage(interp,
                &self->string_gc, (Buffer *)s);

        PObj_on_free_list_SET(s);

        Parrot_gc_pool_free(interp, self->string_allocator, STR2PAC(s));

        if (!PObj_constant_TEST(s))
            interp->gc_sys->stats.memory_used -= sizeof (STRING);
    }
}


PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static Buffer*
gc_ms2_allocate_buffer_header(PARROT_INTERP, SHIM(size_t size))
{
    ASSERT_ARGS(gc_ms2_allocate_buffer_header)
    return (Buffer *)gc_ms2_allocate_string_header(interp, 0);
}


static void
gc_ms2_free_buffer_header(PARROT_INTERP, ARGFREE(Buffer *s), SHIM(size_t size))
{
    ASSERT_ARGS(gc_ms2_free_buffer_header)
    gc_ms2_free_string_header(interp, (STRING*)s);
}


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

=item C<void gc_ms_allocate_buffer_storage(PARROT_INTERP, Buffer *str, size_t
size)>

=item C<void gc_ms_reallocate_buffer_storage(PARROT_INTERP, Buffer *str, size_t
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
gc_ms2_allocate_buffer_storage(PARROT_INTERP, ARGMOD(Buffer *str), size_t size)
{
    ASSERT_ARGS(gc_ms2_allocate_buffer_storage)
    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    Parrot_gc_str_allocate_buffer_storage(interp, &self->string_gc, str, size);
}


static void
gc_ms2_reallocate_buffer_storage(PARROT_INTERP, ARGMOD(Buffer *str), size_t size)
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

    POINTER_ARRAY_ITER(self->strings,
        STRING * const s = &((string_alloc_struct *)ptr)->str;
        callback(interp, (Buffer *)s, data););
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
    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    GC_Statistics       *stats;
    size_t               threshold;

    /* GC is blocked */
    if (self->gc_mark_block_level)
        return;

    /* avoid global destruction for child interps */
    if (flags & GC_finish_FLAG && interp->parent_interpreter)
        return;

    ++self->gc_mark_block_level;
    gc_ms2_mark_live_objects(interp, self, flags);

    /* At this point of time new_objects contains only live PMCs */
    /* objects contains "dead" or "constant" PMCs */
    /* sweep of new_objects will repaint them white */
    /* sweep of objects will destroy dead objects leaving only "constant" */
    gc_ms2_sweep_pmc_pool(interp, self->pmc_allocator, self->new_objects);
    gc_ms2_sweep_pmc_pool(interp, self->pmc_allocator, self->objects);
    gc_ms2_sweep_string_pool(interp, self->string_allocator, self->strings);

    /* destroy the rest */
    if (flags & GC_finish_FLAG) {
        gc_ms2_destroy_pmc_pool(interp, self->pmc_allocator, self->objects);
        gc_ms2_destroy_pmc_pool(interp, self->pmc_allocator, self->new_objects);
    }

    /* Replace objects with new_objects. Ignoring "constant" one */
    do {
        Parrot_Pointer_Array * const tmp = self->objects;
        self->objects = self->new_objects;
        Parrot_pa_destroy(interp, tmp);
    } while (0);

    /* We swept all dead objects */
    gc_ms2_compact_memory_pool(interp);

    stats = &interp->gc_sys->stats;
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
}


/*

=item C<void Parrot_gc_maybe_mark_and_sweep(PARROT_INTERP, UINTVAL flags)>

Run a GC if memory used is above threshold.

=cut

*/

void
Parrot_gc_maybe_mark_and_sweep(PARROT_INTERP, UINTVAL flags)
{
    ASSERT_ARGS(Parrot_gc_maybe_mark_and_sweep)
    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;

    if (interp->gc_sys->stats.memory_used > self->gc_threshold)
        gc_ms2_mark_and_sweep(interp, flags);
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

    POINTER_ARRAY_ITER(list,
        PMC *pmc = &(((pmc_alloc_struct *)ptr)->pmc);

        /* Paint live objects white */
        if (PObj_live_TEST(pmc))
            PObj_live_CLEAR(pmc);

        else if (!PObj_constant_TEST(pmc)) {
            Parrot_pa_remove(interp, list, PMC2PAC(pmc)->ptr);

            /* this is manual inlining of Parrot_pmc_destroy() */
            if (PObj_custom_destroy_TEST(pmc))
                VTABLE_destroy(interp, pmc);

            if (pmc->vtable->attr_size && PMC_data(pmc))
                Parrot_gc_free_pmc_attributes(interp, pmc);
            PMC_data(pmc) = NULL;

            interp->gc_sys->stats.memory_used -= sizeof (PMC);

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

    POINTER_ARRAY_ITER(list,
        STRING * const obj = &(((string_alloc_struct*)ptr)->str);

        PARROT_ASSERT(!PObj_on_free_list_TEST(obj));

        /* Paint live objects white */
        if (PObj_live_TEST(obj))
            PObj_live_CLEAR(obj);

        else if (!PObj_constant_TEST(obj)) {
            Parrot_pa_remove(interp, list, STR2PAC(obj)->ptr);
            if (Buffer_bufstart(obj) && !PObj_external_TEST(obj))
                Parrot_gc_str_free_buffer_storage(interp, &self->string_gc, (Buffer*)obj);

            interp->gc_sys->stats.memory_used -= sizeof (STRING);

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
    return Parrot_pa_is_owned(interp, list, item, item->ptr);
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

=item C<static unsigned int gc_ms2_is_blocked_GC_mark(PARROT_INTERP)>

Determines if the GC mark is currently blocked.

=item C<static unsigned int gc_ms2_is_blocked_GC_sweep(PARROT_INTERP)>

Determines if the GC sweep is currently blocked.

=cut

*/

static void
gc_ms2_block_GC_mark(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms2_block_GC_mark)
    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    ++self->gc_mark_block_level;
    Parrot_shared_gc_block(interp);
}


static void
gc_ms2_unblock_GC_mark(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms2_unblock_GC_mark)
    MarkSweep_GC * const self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    if (self->gc_mark_block_level) {
        --self->gc_mark_block_level;
        Parrot_shared_gc_unblock(interp);
    }
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


/*

=item C<static void * gc_ms2_allocate_memory_chunk(PARROT_INTERP, size_t size)>

=item C<static void * gc_ms2_reallocate_memory_chunk(PARROT_INTERP, void *from,
size_t size)>

=item C<static void * gc_ms2_allocate_memory_chunk_zeroed(PARROT_INTERP, size_t
size)>

=item C<static void * gc_ms2_reallocate_memory_chunk_zeroed(PARROT_INTERP, void
*data, size_t newsize, size_t oldsize)>

=item C<static void gc_ms2_free_memory_chunk(PARROT_INTERP, void *data)>

=item C<static void failed_allocation(unsigned int line, unsigned long size)>

TODO Write docu.

*/

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static void *
gc_ms2_allocate_memory_chunk(SHIM_INTERP, size_t size)
{
    ASSERT_ARGS(gc_ms2_allocate_memory_chunk)
    void * const ptr = malloc(size);
#ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "Allocated %i at %p\n", size, ptr);
#endif
    if (!ptr && size)
        PANIC_OUT_OF_MEM(size);
    return ptr;
}


PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static void *
gc_ms2_reallocate_memory_chunk(SHIM_INTERP, ARGFREE(void *from), size_t size)
{
    ASSERT_ARGS(gc_ms2_reallocate_memory_chunk)
    void *ptr;
#ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "Freed %p (realloc -- %i bytes)\n", from, size);
#endif
    if (from)
        ptr = realloc(from, size);
    else
        ptr = calloc(1, size);
#ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "Allocated %i at %p\n", size, ptr);
#endif
    if (!ptr && size)
        PANIC_OUT_OF_MEM(size);
    return ptr;
}


PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static void *
gc_ms2_allocate_memory_chunk_zeroed(SHIM_INTERP, size_t size)
{
    ASSERT_ARGS(gc_ms2_allocate_memory_chunk_zeroed)
    void * const ptr = calloc(1, (size_t)size);
#ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "Allocated %i at %p\n", size, ptr);
#endif
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
gc_ms2_free_memory_chunk(SHIM_INTERP, ARGFREE(void *data))
{
    ASSERT_ARGS(gc_ms2_free_memory_chunk)
#ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "Freed %p\n", data);
#endif
    if (data)
        free(data);
}


PARROT_DOES_NOT_RETURN
static void
failed_allocation(unsigned int line, unsigned long size)
{
    ASSERT_ARGS(failed_allocation)
    fprintf(stderr, "Failed allocation of %lu bytes\n", size);
    do_panic(NULL, "Out of mem", __FILE__, line);
}


/*

=item C<static void gc_ms2_pmc_needs_early_collection(PARROT_INTERP, PMC *pmc)>

Marks a PMC as needing timely destruction.

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

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
