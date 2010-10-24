/*
Copyright (C) 2001-2010, Parrot Foundation.
$Id$

=head1 NAME

src/gc/gc_ms2.c - Non-recursive M&S

=head1 DESCRIPTION

Generational, non-compacting, mark and sweep GC.

Objects stored in 3 different lists for each generation.
PObj_GC_generation_0_FLAG and PObj_GC_generation_1_FLAG determine generation.
PObj_GC_generation_2_FLAG set when Object survived first collection in particular
generation.

GC algorithm is:
1. After C<gc_threshold> allocated memory we trigger collection of young objects.
2. Survived objects without PObj_GC_generation_2_FLAG will set flag.
3. -- // -- with PObj_GC_generation_2_FLAG will be moved to older generation.
4. After ... we trigger collection of older objects with same approach.
5. After ... we trigger collection of ancient objects.

Objects in old generations have wb_variant_vtable as primary vtable.
WB (WriteBarrier) vtables trigger Parrot_gc_write_barrier(self) which will add
SELF into root_objects list.

=cut

*/

#include "parrot/parrot.h"
#include "parrot/gc_api.h"
#include "parrot/list.h"
#include "gc_private.h"
#include "fixed_allocator.h"

#define PANIC_OUT_OF_MEM(size) failed_allocation(__LINE__, (size))

/* Get generation from PObj->flags */
#define PObj_to_generation(pobj)                      \
    ((pobj)->flags & PObj_GC_generation_0_FLAG        \
        ? 1                                           \
        : ((pobj)->flags) & PObj_GC_generation_1_FLAG \
            ? 2                                       \
            : 0)

#define generation_to_flags(gen)                      \
    (gen) == 1                                        \
        ? PObj_GC_generation_0_FLAG                   \
        : (gen) == 2                                  \
            ? PObj_GC_generation_1_FLAG               \
            : 0

/* Private information */
typedef struct MarkSweep_GC {
    /* Allocator for PMC headers */
    struct Pool_Allocator  *pmc_allocator;

    /* During M&S gather new live objects in this list */
    struct Linked_List     *root_objects;

    /* Currently allocate objects. 3 generations of them */
    struct Linked_List     *objects[3];

    /* Allocator for strings */
    struct Pool_Allocator  *string_allocator;

    /* 3 generations of strings */
    struct Linked_List     *strings[3];

    /* Fixed-size allocator */
    struct Fixed_Allocator *fixed_size_allocator;

    /* String GC */
    struct String_GC        string_gc;

    /* Amount of allocated memory before trigger gc */
    size_t                  gc_threshold;

    /* During GC phase - which generation we are collecting */
    size_t                  current_generation;

    /* GC blocking */
    UINTVAL gc_mark_block_level;  /* How many outstanding GC block
                                     requests are there? */
    UINTVAL gc_sweep_block_level; /* How many outstanding GC block
                                     requests are there? */

    UINTVAL num_early_gc_PMCs;    /* how many PMCs want immediate destruction */

} MarkSweep_GC;

/* Callback to destroy PMC or free string storage */
typedef void (*sweep_cb)(PARROT_INTERP, PObj *obj);

/* HEADERIZER HFILE: src/gc/gc_private.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_DOES_NOT_RETURN
static void failed_allocation(unsigned int line, unsigned long size);

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static Buffer* gc_ms2_allocate_buffer_header(PARROT_INTERP,
    SHIM(size_t size))
        __attribute__nonnull__(1);

static void gc_ms2_allocate_buffer_storage(PARROT_INTERP,
    ARGIN(Buffer *str),
    size_t size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
static void* gc_ms2_allocate_fixed_size_storage(PARROT_INTERP, size_t size)
        __attribute__nonnull__(1);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static void * gc_ms2_allocate_memory_chunk(SHIM_INTERP, size_t size);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static void * gc_ms2_allocate_memory_chunk_zeroed(SHIM_INTERP, size_t size);

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
static STRING* gc_ms2_allocate_string_header(PARROT_INTERP,
    SHIM(UINTVAL flags))
        __attribute__nonnull__(1);

static void gc_ms2_allocate_string_storage(PARROT_INTERP,
    ARGIN(STRING *str),
    size_t size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void gc_ms2_block_GC_mark(PARROT_INTERP)
        __attribute__nonnull__(1);

static void gc_ms2_block_GC_sweep(PARROT_INTERP)
        __attribute__nonnull__(1);

static void gc_ms2_bring_them_together(PARROT_INTERP,
    ARGIN(List_Item_Header *old_object_tails[]))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void gc_ms2_check_sanity(PARROT_INTERP)
        __attribute__nonnull__(1);

static void gc_ms2_compact_memory_pool(PARROT_INTERP)
        __attribute__nonnull__(1);

static size_t gc_ms2_count_used_pmc_memory(PARROT_INTERP,
    ARGIN(Linked_List *list))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static size_t gc_ms2_count_used_string_memory(PARROT_INTERP,
    ARGIN(Linked_List *list))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void gc_ms2_finalize(PARROT_INTERP)
        __attribute__nonnull__(1);

static void gc_ms2_free_buffer_header(PARROT_INTERP,
    ARGFREE(Buffer *s),
    SHIM(size_t size))
        __attribute__nonnull__(1);

static void gc_ms2_free_fixed_size_storage(PARROT_INTERP,
    size_t size,
    ARGMOD(void *data))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*data);

static void gc_ms2_free_memory_chunk(SHIM_INTERP, ARGFREE(void *data));
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
    ARGIN(Linked_List *list))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

static int gc_ms2_is_string_ptr(PARROT_INTERP, ARGIN_NULLOK(void *ptr))
        __attribute__nonnull__(1);

static void gc_ms2_iterate_live_strings(PARROT_INTERP,
    string_iterator_callback callback,
    ARGIN_NULLOK(void *data))
        __attribute__nonnull__(1);

static void gc_ms2_iterate_string_list(PARROT_INTERP,
    ARGIN(Linked_List *list),
    string_iterator_callback callback,
    ARGIN_NULLOK(void *data))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void gc_ms2_mark_and_sweep(PARROT_INTERP, UINTVAL flags)
        __attribute__nonnull__(1);

static void gc_ms2_mark_pmc_header(PARROT_INTERP, ARGIN(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void gc_ms2_mark_string_header(PARROT_INTERP,
    ARGIN_NULLOK(STRING *str))
        __attribute__nonnull__(1);

static void gc_ms2_maybe_mark_and_sweep(PARROT_INTERP)
        __attribute__nonnull__(1);

static void gc_ms2_pmc_needs_early_collection(PARROT_INTERP,
    ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

static void gc_ms2_pmc_validate(PARROT_INTERP, ARGIN(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void gc_ms2_print_stats(PARROT_INTERP, const char* header, int gen)
        __attribute__nonnull__(1);

static void gc_ms2_reallocate_buffer_storage(PARROT_INTERP,
    ARGIN(Buffer *str),
    size_t size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static void * gc_ms2_reallocate_memory_chunk(SHIM_INTERP,
    ARGFREE(void *from),
    size_t size);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static void * gc_ms2_reallocate_memory_chunk_zeroed(SHIM_INTERP,
    ARGFREE(void *data),
    size_t newsize,
    size_t oldsize);

static void gc_ms2_reallocate_string_storage(PARROT_INTERP,
    ARGIN(STRING *str),
    size_t size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void gc_ms2_seal_object(PARROT_INTERP, ARGIN(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void gc_ms2_set_gen_flags(PARROT_INTERP, ARGIN(PObj *obj), int gen)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void gc_ms2_string_mark_propagate(PARROT_INTERP, ARGIN(STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void gc_ms2_string_validate(PARROT_INTERP, ARGIN(STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void gc_ms2_sweep_pmc_cb(PARROT_INTERP, ARGIN(PObj *obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void gc_ms2_sweep_pool(PARROT_INTERP,
    ARGIN(Pool_Allocator *pool),
    ARGIN(Linked_List *list),
    ARGIN(sweep_cb callback))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

static void gc_ms2_sweep_string_cb(PARROT_INTERP, ARGIN(PObj *obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void gc_ms2_unblock_GC_mark(PARROT_INTERP)
        __attribute__nonnull__(1);

static void gc_ms2_unblock_GC_sweep(PARROT_INTERP)
        __attribute__nonnull__(1);

static void gc_ms2_vtable_mark_propagate(PARROT_INTERP, ARGIN(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void gc_ms2_write_barrier(PARROT_INTERP, ARGIN(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static int gen2flags(int gen);
static int pobj2gen(ARGIN(PMC *pmc))
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
#define ASSERT_ARGS_gc_ms2_bring_them_together __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(old_object_tails))
#define ASSERT_ARGS_gc_ms2_check_sanity __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_compact_memory_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_count_used_pmc_memory __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(list))
#define ASSERT_ARGS_gc_ms2_count_used_string_memory \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
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
#define ASSERT_ARGS_gc_ms2_iterate_string_list __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(list))
#define ASSERT_ARGS_gc_ms2_mark_and_sweep __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_mark_pmc_header __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_gc_ms2_mark_string_header __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_maybe_mark_and_sweep __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_pmc_needs_early_collection \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_gc_ms2_pmc_validate __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_gc_ms2_print_stats __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
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
#define ASSERT_ARGS_gc_ms2_seal_object __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_gc_ms2_set_gen_flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(obj))
#define ASSERT_ARGS_gc_ms2_string_mark_propagate __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_gc_ms2_string_validate __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_gc_ms2_sweep_pmc_cb __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(obj))
#define ASSERT_ARGS_gc_ms2_sweep_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pool) \
    , PARROT_ASSERT_ARG(list) \
    , PARROT_ASSERT_ARG(callback))
#define ASSERT_ARGS_gc_ms2_sweep_string_cb __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(obj))
#define ASSERT_ARGS_gc_ms2_unblock_GC_mark __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_unblock_GC_sweep __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_vtable_mark_propagate __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_gc_ms2_write_barrier __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_gen2flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_pobj2gen __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pmc))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=head1 Functions

=over 4

=item C<static void gc_ms2_mark_and_sweep(PARROT_INTERP, UINTVAL flags)>

This function is called from the GC API function C<Parrot_gc_mark_and_sweep>.

Flags can be a combination of these values:

  GC_finish_FLAG
  GC_lazy_FLAG
  GC_trace_stack_FLAG

=cut

*/


/*

=item C<void Parrot_gc_ms2_init(PARROT_INTERP)>

Initializes the generational collector

=cut

*/

void
Parrot_gc_ms2_init(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_ms2_init)
    struct MarkSweep_GC *self;

    /* We have to transfer ownership of memory to parent interp in threaded parrot */
    interp->gc_sys->finalize_gc_system = NULL; /* gc_ms2_finalize; */

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
    interp->gc_sys->mark_str_header             = gc_ms2_mark_string_header;

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
    interp->gc_sys->allocate_memory_chunk       = gc_ms2_allocate_memory_chunk;
    interp->gc_sys->reallocate_memory_chunk     = gc_ms2_reallocate_memory_chunk;
    interp->gc_sys->allocate_memory_chunk_with_interior_pointers
                = gc_ms2_allocate_memory_chunk_zeroed;
    interp->gc_sys->reallocate_memory_chunk_with_interior_pointers
                = gc_ms2_reallocate_memory_chunk_zeroed;
    interp->gc_sys->free_memory_chunk           = gc_ms2_free_memory_chunk;

    interp->gc_sys->iterate_live_strings        = gc_ms2_iterate_live_strings;
    interp->gc_sys->write_barrier               = gc_ms2_write_barrier;

    interp->gc_sys->get_gc_info                 = gc_ms2_get_gc_info;

    if (interp->parent_interpreter && interp->parent_interpreter->gc_sys) {
        /* This is a "child" interpreter. Just reuse parent one */
        self = (MarkSweep_GC*)interp->parent_interpreter->gc_sys->gc_private;
    }
    else {
        self = mem_allocate_zeroed_typed(MarkSweep_GC);

        self->pmc_allocator = Parrot_gc_pool_new(interp,
            sizeof (List_Item_Header) + sizeof (PMC));

        self->objects[0] = Parrot_list_new(interp);
        self->objects[1] = Parrot_list_new(interp);
        self->objects[2] = Parrot_list_new(interp);

        /* Allocate list for gray objects */
        self->root_objects = Parrot_list_new(interp);


        self->string_allocator = Parrot_gc_pool_new(interp,
            sizeof (List_Item_Header) + sizeof (STRING));
        self->strings[0] = Parrot_list_new(interp);
        self->strings[1] = Parrot_list_new(interp);
        self->strings[2] = Parrot_list_new(interp);

        self->fixed_size_allocator = Parrot_gc_fixed_allocator_new(interp);

        /* Collect every 256M allocated. */
        /* Hardcode for now. Will be configured via CLI */
        self->gc_threshold = 16 * 1024 * 1024;
    }
    interp->gc_sys->gc_private = self;

    Parrot_gc_str_initialize(interp, &self->string_gc);
}

static void
gc_ms2_mark_and_sweep(PARROT_INTERP, UINTVAL flags)
{
    ASSERT_ARGS(gc_ms2_mark_and_sweep)
    MarkSweep_GC      *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    List_Item_Header *tmp;
    Linked_List      *list;
    int               i, gen = -1;

    /*
     * Remember current postions of objects.
     * We will use later for properly moving objects between generations.
     */
    List_Item_Header *old_object_tails[] = {
                          self->objects[0]->last,
                          self->objects[1]->last,
                          self->objects[2]->last
                      };
    UNUSED(flags);

    /* GC is blocked */
    if (self->gc_mark_block_level)
        return;

    if (flags & GC_finish_FLAG) {
        /* Ignore it. Will cleanup in gc_ms2_finalize */
        return;
    }

    /* Ignore calls from String GC. We know better when to trigger GC */
    if (flags & GC_strings_cb_FLAG) {
        return;
    }

    ++self->gc_mark_block_level;

    interp->gc_sys->stats.gc_mark_runs++;
    /* Which generation we are going to collect? */
    /* TODO Use less naive approach. E.g. count amount of allocated memory in
     * older generations */
    if (interp->gc_sys->stats.gc_mark_runs % 100 == 0)
        gen = self->current_generation = 2;
    else if (interp->gc_sys->stats.gc_mark_runs % 10 == 0)
        gen = self->current_generation = 1;
    else
        gen = self->current_generation = 0;

    gc_ms2_print_stats(interp, "Before", gen);

    gc_ms2_check_sanity(interp);

    /* Trace roots */
    gc_ms2_mark_pmc_header(interp, PMCNULL);
    Parrot_gc_trace_root(interp, NULL, GC_TRACE_FULL);
    if (interp->pdb && interp->pdb->debugger) {
        Parrot_gc_trace_root(interp->pdb->debugger, NULL, (Parrot_gc_trace_type)0);
    }

    gc_ms2_check_sanity(interp);
    /* root_objects are "gray" until fully marked */
    /* Additional gray objects will appended to root_objects list */
    /* Iterate over them in one go */
    tmp = self->root_objects->first;
    while (tmp) {
        PMC *pmc = LLH2Obj_typed(tmp, PMC);

        /* write_barrier can set this flag */
        pmc->flags &= ~PObj_GC_wb_triggered_FLAG;

        /* if object is a PMC and contains buffers or PMCs, then attach the PMC
         * to the chained mark list. */
        if (PObj_is_special_PMC_TEST(pmc)) {
            if (PObj_custom_mark_TEST(pmc))
                VTABLE_mark(interp, pmc);
        }

        if (PMC_metadata(pmc))
            Parrot_gc_mark_PMC_alive(interp, PMC_metadata(pmc));

        PObj_live_SET(pmc);

        tmp = tmp->next;
    }

    gc_ms2_check_sanity(interp);
    /*
     * At this point root_objects contains live objects from different
     * generations.
     *
     * Iterate over them and move into proper list. Do not repaint them white
     * yet.
     *
     * Remember postions of last item in lists. We will need it to pull more
     * objects into those generations.
     */
    old_object_tails[0] = self->objects[0]->last;
    old_object_tails[1] = self->objects[1]->last;
    old_object_tails[2] = self->objects[2]->last;

    tmp = self->root_objects->first;
    while (tmp) {
        List_Item_Header *next = tmp->next;

        LIST_REMOVE(self->root_objects, tmp);
        LIST_APPEND(self->objects[PObj_to_generation(LLH2Obj_typed(tmp, PMC))], tmp);

        tmp = next;
    }

    gc_ms2_check_sanity(interp);
    /*
     * Now. self->objects[N] contains properly marked objects.
     * (For current or younger generations).
     * 1. Propagate survived objects into older generation.
     * 2. Paint them white.
     * 3. Destroy everything else.
     */

    /* There is no generation beyond 2. We have to handle it differentely */
    for (i = gen == 2 ? 1 : gen; i >= 0; i--) {
        tmp = self->objects[i]->first;
        while (tmp) {
            PMC                 *pmc = LLH2Obj_typed(tmp, PMC);
            List_Item_Header    *next = tmp->next;

            /* We are moving previously remembered tail. Update it */
            if (!next) {
                old_object_tails[i] = tmp->prev;
            }

            if (!PObj_constant_TEST(pmc)) {
                if (PObj_live_TEST(pmc)) {
                    gc_ms2_seal_object(interp, pmc);

                    /* Move to older generation */
                    LIST_REMOVE(self->objects[i], tmp);
                    LIST_APPEND(self->objects[i+1], tmp);

                    gc_ms2_set_gen_flags(interp, (PObj *)pmc, i+1);
                }
            }

            tmp = next;
        }
    }

    gc_ms2_check_sanity(interp);
    /* Handling oldest generation. Don't move it further */
    if (1 || gen >= 1) {
        tmp = self->objects[2]->first;
        while (tmp) {
            PMC                 *pmc = LLH2Obj_typed(tmp, PMC);
            List_Item_Header    *next = tmp->next;

            if (PObj_live_TEST(pmc)) {
                gc_ms2_seal_object(interp, pmc);
                gc_ms2_set_gen_flags(interp, (PObj *)pmc, 2);
            }

            tmp = next;
        }
    }

    gc_ms2_check_sanity(interp);

    gc_ms2_print_stats(interp, "Bringing", gen);
    gc_ms2_bring_them_together(interp, old_object_tails);
    gc_ms2_print_stats(interp, "Here", gen);


    /* Now. Sweep all dead objects */
    gc_ms2_sweep_pool(interp, self->pmc_allocator, self->objects[0], gc_ms2_sweep_pmc_cb);
    gc_ms2_sweep_pool(interp, self->string_allocator, self->strings[0], gc_ms2_sweep_string_cb);

    if (gen >= 1) {
        gc_ms2_sweep_pool(interp, self->pmc_allocator, self->objects[1], gc_ms2_sweep_pmc_cb);
        gc_ms2_sweep_pool(interp, self->string_allocator, self->strings[1], gc_ms2_sweep_string_cb);
    }
    else {
        tmp = 0 && old_object_tails[1]
             ? old_object_tails[1]
             : self->objects[1]->first;
        while (tmp) {
            PMC *pmc = LLH2Obj_typed(tmp, PMC);
            PObj_live_CLEAR(pmc);
            pmc->flags &= ~PObj_GC_generation_2_FLAG;
            tmp = tmp->next;
        }

        tmp = self->strings[1]->first;
        while (tmp) {
            PMC *pmc = LLH2Obj_typed(tmp, PMC);
            PObj_live_CLEAR(pmc);
            tmp = tmp->next;
        }
    }

    if (gen == 2) {
        gc_ms2_sweep_pool(interp, self->pmc_allocator, self->objects[2], gc_ms2_sweep_pmc_cb);
        gc_ms2_sweep_pool(interp, self->string_allocator, self->strings[2], gc_ms2_sweep_string_cb);
    }
    else {
        tmp = 0 && old_object_tails[2]
              ? old_object_tails[2]
              : self->objects[2]->first;
        while (tmp) {
            PMC *pmc = LLH2Obj_typed(tmp, PMC);
            PObj_live_CLEAR(pmc);
            pmc->flags &= ~PObj_GC_generation_2_FLAG;
            tmp = tmp->next;
        }

        tmp = self->strings[2]->first;
        while (tmp) {
            PMC *pmc = LLH2Obj_typed(tmp, PMC);
            PObj_live_CLEAR(pmc);
            tmp = tmp->next;
        }
    }



    /* Update some stats */
    interp->gc_sys->stats.header_allocs_since_last_collect = 0;
    interp->gc_sys->stats.mem_used_last_collect            = 0;
    self->gc_mark_block_level--;

    /* We swept all dead objects */
    self->num_early_gc_PMCs                      = 0;

    gc_ms2_compact_memory_pool(interp);

    gc_ms2_check_sanity(interp);


    gc_ms2_print_stats(interp, "After", gen);
}

/*
=item C<static void gc_ms2_bring_them_together(PARROT_INTERP, List_Item_Header
*old_object_tails[])>

Bring all cross-referenced objects into same generation.

TODO Give better name to this function.

=cut
*/
static void
gc_ms2_bring_them_together(PARROT_INTERP, ARGIN(List_Item_Header *old_object_tails[]))
{
    ASSERT_ARGS(gc_ms2_bring_them_together)
    MarkSweep_GC  *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    int i;
    /*
     * Last step. old_object_tails contains pointer to previous end of generation.
     * We have to move old-to-young referenced objects into same generation.
     *
     * Use special version of VTABLE_mark for it.
     */
    interp->gc_sys->mark_pmc_header = gc_ms2_vtable_mark_propagate;
    interp->gc_sys->mark_str_header = gc_ms2_string_mark_propagate;

    for (i = 2; i > 0; i--) {
        /* It can be our first move to this generation */
        List_Item_Header *tmp = old_object_tails[i]
                              ? old_object_tails[i]
                              : self->objects[i]->first;

        // FIXME. Something wrong with updating tails.
        tmp = self->objects[i]->first;

        /* We are "marking" this generation */
        self->current_generation = i;

        while (tmp) {
            PMC *pmc = LLH2Obj_typed(tmp, PMC);

            /* mark can append more objects to this list */
            if (PObj_custom_mark_TEST(pmc))
                VTABLE_mark(interp, pmc);

            if (PMC_metadata(pmc))
                Parrot_gc_mark_PMC_alive(interp, PMC_metadata(pmc));

            tmp = tmp->next;
        }
    }


    interp->gc_sys->mark_str_header = gc_ms2_mark_string_header;
    interp->gc_sys->mark_pmc_header = gc_ms2_mark_pmc_header;

    gc_ms2_check_sanity(interp);

#if 0
    // DEBUG ONLY. Simple recursive check
    interp->gc_sys->mark_pmc_header = gc_ms2_pmc_validate;
    interp->gc_sys->mark_str_header = gc_ms2_string_validate;

    for (i = 2; i > 0; i--) {
        /* It can be our first move to this generation */
        List_Item_Header *tmp = self->objects[i]->first;

        while (tmp) {
            PMC *pmc = LLH2Obj_typed(tmp, PMC);
            pmc->flags &= ~PObj_GC_generation_2_FLAG;
            tmp = tmp->next;
        }

        tmp = self->objects[i]->first;

        /* We are "marking" this generation */
        self->current_generation = i;

        while (tmp) {
            PMC *pmc = LLH2Obj_typed(tmp, PMC);

            pmc->flags |= PObj_GC_generation_2_FLAG;

            if (PObj_custom_mark_TEST(pmc))
                VTABLE_mark(interp, pmc);

            if (PMC_metadata(pmc))
                Parrot_gc_mark_PMC_alive(interp, PMC_metadata(pmc));

            tmp = tmp->next;
        }
    }

    interp->gc_sys->mark_str_header = gc_ms2_mark_string_header;
    interp->gc_sys->mark_pmc_header = gc_ms2_mark_pmc_header;
#endif
}

/*

=item C<static void gc_ms2_pmc_validate(PARROT_INTERP, PMC *pmc)>

=item C<static void gc_ms2_string_validate(PARROT_INTERP, STRING *s)>

Validate pmc/string objects re current generation

=cut

*/

static void
gc_ms2_pmc_validate(PARROT_INTERP, ARGIN(PMC *pmc))
{
    ASSERT_ARGS(gc_ms2_pmc_validate)

    MarkSweep_GC  *self = (MarkSweep_GC *)interp->gc_sys->gc_private;

    if (PObj_constant_TEST(pmc))
        return;

    PARROT_ASSERT(pobj2gen(pmc) == self->current_generation
                  || !"Got object from wrong generation");

    pmc->flags |= PObj_GC_generation_2_FLAG;

    if (PObj_custom_mark_TEST(pmc))
        VTABLE_mark(interp, pmc);
}

static void
gc_ms2_string_validate(PARROT_INTERP, ARGIN(STRING *s))
{
    ASSERT_ARGS(gc_ms2_string_validate)

    MarkSweep_GC  *self = (MarkSweep_GC *)interp->gc_sys->gc_private;

    if (PObj_constant_TEST(s))
        return;

    PARROT_ASSERT(pobj2gen((PMC *)s) == self->current_generation);
}

/*

=item C<static void gc_ms2_compact_memory_pool(PARROT_INTERP)>

Stub for compacting memory pools.

=cut

*/
static void
gc_ms2_compact_memory_pool(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms2_compact_memory_pool)
    MarkSweep_GC *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
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
    MarkSweep_GC *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    const size_t  attr_size = pmc->vtable->attr_size;
    PMC_data(pmc) = Parrot_gc_fixed_allocator_allocate(interp,
                        self->fixed_size_allocator, attr_size);
    memset(PMC_data(pmc), 0, attr_size);

    interp->gc_sys->stats.mem_used_last_collect += attr_size;

    return PMC_data(pmc);
}

static void
gc_ms2_free_pmc_attributes(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(gc_ms2_free_pmc_attributes)
    if (PMC_data(pmc)) {
        MarkSweep_GC *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
        Parrot_gc_fixed_allocator_free(interp, self->fixed_size_allocator,
                PMC_data(pmc), pmc->vtable->attr_size);

        interp->gc_sys->stats.mem_used_last_collect -= pmc->vtable->attr_size;
    }
}

PARROT_CAN_RETURN_NULL
static void*
gc_ms2_allocate_fixed_size_storage(PARROT_INTERP, size_t size)
{
    ASSERT_ARGS(gc_ms2_allocate_fixed_size_storage)
    MarkSweep_GC *self = (MarkSweep_GC *)interp->gc_sys->gc_private;

    interp->gc_sys->stats.memory_allocated      += size;
    interp->gc_sys->stats.mem_used_last_collect += size;

    return Parrot_gc_fixed_allocator_allocate(interp, self->fixed_size_allocator, size);
}

static void
gc_ms2_free_fixed_size_storage(PARROT_INTERP, size_t size, ARGMOD(void *data))
{
    ASSERT_ARGS(gc_ms2_free_fixed_size_storage)
    if (data) {
        MarkSweep_GC *self = (MarkSweep_GC *)interp->gc_sys->gc_private;

        interp->gc_sys->stats.memory_allocated      -= size;
        interp->gc_sys->stats.mem_used_last_collect -= size;

        Parrot_gc_fixed_allocator_free(interp, self->fixed_size_allocator, data, size);
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
    MarkSweep_GC *self = (MarkSweep_GC *)interp->gc_sys->gc_private;

    if (which == IMPATIENT_PMCS)
        return self->num_early_gc_PMCs;

    return Parrot_gc_get_info(interp, which, &interp->gc_sys->stats);
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
    MarkSweep_GC *self = (MarkSweep_GC *)interp->gc_sys->gc_private;

    Parrot_gc_str_finalize(interp, &self->string_gc);

    Parrot_list_destroy(interp, self->objects[0]);
    Parrot_list_destroy(interp, self->objects[1]);
    Parrot_list_destroy(interp, self->objects[2]);
    Parrot_list_destroy(interp, self->strings[0]);
    Parrot_list_destroy(interp, self->strings[1]);
    Parrot_list_destroy(interp, self->strings[2]);
    Parrot_gc_pool_destroy(interp, self->pmc_allocator);
    Parrot_gc_pool_destroy(interp, self->string_allocator);
    Parrot_gc_fixed_allocator_destroy(interp, self->fixed_size_allocator);
}

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static PMC*
gc_ms2_allocate_pmc_header(PARROT_INTERP, UINTVAL flags)
{
    ASSERT_ARGS(gc_ms2_allocate_pmc_header)
    MarkSweep_GC      *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    List_Item_Header *ptr;
    PMC              *ret;

    gc_ms2_maybe_mark_and_sweep(interp);

    /* Increase used memory. Not precisely accurate due Pool_Allocator paging */
    ++interp->gc_sys->stats.header_allocs_since_last_collect;
    interp->gc_sys->stats.memory_allocated      += sizeof (PMC);
    interp->gc_sys->stats.mem_used_last_collect += sizeof (PMC);

    ptr = (List_Item_Header *)Parrot_gc_pool_allocate(interp,
            self->pmc_allocator);
    LIST_APPEND(self->objects[0], ptr);

    ret = LLH2Obj_typed(ptr, PMC);
    ret->flags = 0;

    return ret;
}

static void
gc_ms2_free_pmc_header(PARROT_INTERP, ARGFREE(PMC *pmc))
{
    ASSERT_ARGS(gc_ms2_free_pmc_header)
    MarkSweep_GC *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    if (pmc) {
        if (PObj_on_free_list_TEST(pmc))
            return;

        Parrot_list_remove(interp, self->objects[PObj_to_generation(pmc)], Obj2LLH(pmc));

        PObj_on_free_list_SET(pmc);

        Parrot_pmc_destroy(interp, pmc);

        Parrot_gc_pool_free(interp, self->pmc_allocator, Obj2LLH(pmc));

        --interp->gc_sys->stats.header_allocs_since_last_collect;
        interp->gc_sys->stats.memory_allocated      -= sizeof (PMC);
        interp->gc_sys->stats.mem_used_last_collect -= sizeof (PMC);
    }
}

/*

=item C<static void gc_ms2_mark_pmc_header(PARROT_INTERP, PMC *pmc)>

mark as grey

=cut

*/

static void
gc_ms2_mark_pmc_header(PARROT_INTERP, ARGIN(PMC *pmc))
{
    ASSERT_ARGS(gc_ms2_mark_pmc_header)
    MarkSweep_GC      *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    List_Item_Header  *item = Obj2LLH(pmc);
    size_t             gen  = PObj_to_generation(pmc);

    /* Object was already marked as grey. Or live. Or dead. Skip it */
    if (PObj_is_live_or_free_TESTALL(pmc) || PObj_constant_TEST(pmc))
        return;

    /* If object too old - skip it */
    if (gen > self->current_generation)
        return;

    /* mark it live */
    PObj_live_SET(pmc);

    LIST_REMOVE(self->objects[gen], item);
    LIST_APPEND(self->root_objects, item);
}

/*

=item C<static int gc_ms2_is_pmc_ptr(PARROT_INTERP, void *ptr)>

establish if *ptr is.owned

=cut

*/

static int
gc_ms2_is_pmc_ptr(PARROT_INTERP, ARGIN_NULLOK(void *ptr))
{
    ASSERT_ARGS(gc_ms2_is_pmc_ptr)
    MarkSweep_GC      *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    return gc_ms2_is_ptr_owned(interp, ptr, self->pmc_allocator, self->objects[0])
           || gc_ms2_is_ptr_owned(interp, ptr, self->pmc_allocator, self->objects[1])
           || gc_ms2_is_ptr_owned(interp, ptr, self->pmc_allocator, self->objects[2]);
}

/*

=item C<static void gc_ms2_sweep_pmc_cb(PARROT_INTERP, PObj *obj)>

destroy pmc *obj

=cut

*/

static void
gc_ms2_sweep_pmc_cb(PARROT_INTERP, ARGIN(PObj *obj))
{
    ASSERT_ARGS(gc_ms2_sweep_pmc_cb)
    PMC *pmc = (PMC *)obj;
    Parrot_pmc_destroy(interp, pmc);
}

/*

=item C<gc_ms2_allocate_string_header(PARROT_INTERP, STRING *str)>

=item C<gc_ms2_free_string_header(PARROT_INTERP, STRING *s)>

=item C<static Buffer* gc_ms2_allocate_buffer_header(PARROT_INTERP, size_t
size)>

=item C<static void gc_ms2_free_buffer_header(PARROT_INTERP, Buffer *s, size_t
size)>

Allocate/free string/buffer headers.

*/

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static STRING*
gc_ms2_allocate_string_header(PARROT_INTERP, SHIM(UINTVAL flags))
{
    ASSERT_ARGS(gc_ms2_allocate_string_header)
    MarkSweep_GC     *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    List_Item_Header *ptr;
    STRING           *ret;

    gc_ms2_maybe_mark_and_sweep(interp);

    /* Increase used memory. Not precisely accurate due Pool_Allocator paging */
    ++interp->gc_sys->stats.header_allocs_since_last_collect;
    interp->gc_sys->stats.memory_allocated      += sizeof (STRING);
    interp->gc_sys->stats.mem_used_last_collect += sizeof (STRING);

    ptr = (List_Item_Header *)Parrot_gc_pool_allocate(interp,
            self->string_allocator);
    LIST_APPEND(self->strings[0], ptr);

    ret = LLH2Obj_typed(ptr, STRING);
    memset(ret, 0, sizeof (STRING));
    return ret;
}

static void
gc_ms2_free_string_header(PARROT_INTERP, ARGFREE(STRING *s))
{
    ASSERT_ARGS(gc_ms2_free_string_header)
    MarkSweep_GC *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    if (s) {
        if (PObj_on_free_list_TEST(s))
            return;
        Parrot_list_remove(interp, self->strings[PObj_to_generation(s)], Obj2LLH(s));
        PObj_on_free_list_SET(s);

        if (Buffer_bufstart(s) && !PObj_external_TEST(s))
            Parrot_gc_str_free_buffer_storage(interp, &self->string_gc, (Buffer *)s);

        Parrot_gc_pool_free(interp, self->string_allocator, Obj2LLH(s));

        --interp->gc_sys->stats.header_allocs_since_last_collect;
        interp->gc_sys->stats.memory_allocated      -= sizeof (STRING);
        interp->gc_sys->stats.mem_used_last_collect -= sizeof (STRING);
    }
}

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static Buffer*
gc_ms2_allocate_buffer_header(PARROT_INTERP, SHIM(size_t size))
{
    ASSERT_ARGS(gc_ms2_allocate_buffer_header)
    return (Buffer*)gc_ms2_allocate_string_header(interp, 0);
}

static void
gc_ms2_free_buffer_header(PARROT_INTERP, ARGFREE(Buffer *s), SHIM(size_t size))
{
    ASSERT_ARGS(gc_ms2_free_buffer_header)
    gc_ms2_free_string_header(interp, (STRING*)s);
}

/*

=item C<static int gc_ms2_is_string_ptr(PARROT_INTERP, void *ptr)>

establish if string *ptr is owned

=cut

*/

static int
gc_ms2_is_string_ptr(PARROT_INTERP, ARGIN_NULLOK(void *ptr))
{
    ASSERT_ARGS(gc_ms2_is_string_ptr)
    MarkSweep_GC      *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    return gc_ms2_is_ptr_owned(interp, ptr, self->string_allocator, self->strings[0])
           || gc_ms2_is_ptr_owned(interp, ptr, self->string_allocator, self->strings[1])
           || gc_ms2_is_ptr_owned(interp, ptr, self->string_allocator, self->strings[2]);
}

/*

item C<void gc_ms2_allocate_string_storage(PARROT_INTERP, STRING *str, size_t
size)>

=item C<void gc_ms2_reallocate_string_storage(PARROT_INTERP, STRING *str, size_t
size)>

=item C<void gc_ms2_allocate_buffer_storage(PARROT_INTERP, Buffer *str, size_t
size)>

=item C<void gc_ms2_reallocate_buffer_storage(PARROT_INTERP, Buffer *str, size_t
size)>

Functions for allocating strings/buffers storage.

=cut
*/

static void
gc_ms2_allocate_string_storage(PARROT_INTERP, ARGIN(STRING *str), size_t size)
{
    ASSERT_ARGS(gc_ms2_allocate_string_storage)
    MarkSweep_GC *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    Parrot_gc_str_allocate_string_storage(interp, &self->string_gc, str, size);
    interp->gc_sys->stats.mem_used_last_collect += size;
}

static void
gc_ms2_reallocate_string_storage(PARROT_INTERP, ARGIN(STRING *str), size_t size)
{
    ASSERT_ARGS(gc_ms2_reallocate_string_storage)
    MarkSweep_GC *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    Parrot_gc_str_reallocate_string_storage(interp, &self->string_gc, str, size);
    interp->gc_sys->stats.mem_used_last_collect += size;
}

static void
gc_ms2_allocate_buffer_storage(PARROT_INTERP, ARGIN(Buffer *str), size_t size)
{
    ASSERT_ARGS(gc_ms2_allocate_buffer_storage)
    MarkSweep_GC *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    Parrot_gc_str_allocate_buffer_storage(interp, &self->string_gc, str, size);
    interp->gc_sys->stats.mem_used_last_collect += size;
}

static void
gc_ms2_reallocate_buffer_storage(PARROT_INTERP, ARGIN(Buffer *str), size_t size)
{
    ASSERT_ARGS(gc_ms2_reallocate_buffer_storage)
    MarkSweep_GC *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    Parrot_gc_str_reallocate_buffer_storage(interp, &self->string_gc, str, size);
    interp->gc_sys->stats.mem_used_last_collect += size;
}

/*

=item C<static void gc_ms2_mark_string_header(PARROT_INTERP, STRING *str)>

Mark String

=cut

*/

static void
gc_ms2_mark_string_header(PARROT_INTERP, ARGIN_NULLOK(STRING *str))
{
    ASSERT_ARGS(gc_ms2_mark_string_header)
    MarkSweep_GC      *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    List_Item_Header  *item = Obj2LLH(str);
    size_t             gen  = PObj_to_generation(str);

    /* If object too old - skip it */
    if (gen > self->current_generation)
        return;

    /* Object was already marked as grey. Or live. Or dead. Skip it */
    if (PObj_is_live_or_free_TESTALL(str))
        return;

    /* mark it live */
    PObj_live_SET(str);
}

/*

=item C<static void gc_ms2_sweep_string_cb(PARROT_INTERP, PObj *obj)>

destroy string *obj

=cut

*/

static void
gc_ms2_sweep_string_cb(PARROT_INTERP, ARGIN(PObj *obj))
{
    ASSERT_ARGS(gc_ms2_sweep_string_cb)
    MarkSweep_GC *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    Buffer       *str  = (Buffer *)obj;
    /* Compact string pool here. Or get rid of "shared buffers" and just free storage */
    if (Buffer_bufstart(str) && !PObj_external_TEST(str))
        Parrot_gc_str_free_buffer_storage(interp, &self->string_gc, str);
}


/*

=item C<static void gc_ms2_iterate_live_strings(PARROT_INTERP,
string_iterator_callback callback, void *data)>

Iterate over live string invoking callback for each of them. Used during
compacting of string pool.

=cut
*/
static void
gc_ms2_iterate_live_strings(PARROT_INTERP,
        string_iterator_callback callback,
        ARGIN_NULLOK(void *data))
{
    ASSERT_ARGS(gc_ms2_iterate_live_strings)

    MarkSweep_GC *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    gc_ms2_iterate_string_list(interp, self->strings[0], callback, data);
    gc_ms2_iterate_string_list(interp, self->strings[1], callback, data);
    gc_ms2_iterate_string_list(interp, self->strings[2], callback, data);
}

/*

=item C<static void gc_ms2_iterate_string_list(PARROT_INTERP, Linked_List *list,
string_iterator_callback callback, void *data)>

Iterate over string list

=cut

*/

static void
gc_ms2_iterate_string_list(PARROT_INTERP,
        ARGIN(Linked_List *list),
        string_iterator_callback callback,
        ARGIN_NULLOK(void *data))
{
    ASSERT_ARGS(gc_ms2_iterate_string_list)
    List_Item_Header *tmp = list->first;

    while (tmp) {
        Buffer *b = LLH2Obj_typed(tmp, Buffer);
        callback(interp, b, data);
        tmp = tmp->next;
    }
}


/*

=item C<static void gc_ms2_vtable_mark_propagate(PARROT_INTERP, PMC *pmc)>

propogate to next generation if req

=cut

*/

static void
gc_ms2_vtable_mark_propagate(PARROT_INTERP, ARGIN(PMC *pmc))
{
    ASSERT_ARGS(gc_ms2_vtable_mark_propagate)

    MarkSweep_GC      *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    List_Item_Header  *item = Obj2LLH(pmc);
    size_t             gen  = PObj_to_generation(pmc);

    PARROT_ASSERT(!PObj_on_free_list_TEST(pmc)
            || !"Attempt to mark dead object");

    /* Objects from older generation will stay */
    if (gen > self->current_generation)
        return;

    /* "Constant"... */
    if (pmc->flags & PObj_constant_FLAG)
        return;

    if (gen != self->current_generation) {
        LIST_REMOVE(self->objects[gen], item);
        LIST_APPEND(self->objects[self->current_generation], item);
        gc_ms2_set_gen_flags(interp, (PObj *)pmc, self->current_generation);
    }

    PObj_live_SET(pmc);
}

/*

=item C<static void gc_ms2_string_mark_propagate(PARROT_INTERP, STRING *s)>

propogate to next generation if req

=cut

*/

static void
gc_ms2_string_mark_propagate(PARROT_INTERP, ARGIN(STRING *s))
{
    ASSERT_ARGS(gc_ms2_string_mark_propagate)

    MarkSweep_GC      *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    List_Item_Header  *item = Obj2LLH(s);
    size_t             gen  = PObj_to_generation(s);

    PARROT_ASSERT(item->owner == self->strings[gen]);

    /* Objects from older generation will stay */
    if (gen >= self->current_generation)
        return;

    /* "Constant"... */
    if (s->flags & PObj_constant_FLAG)
        return;

    LIST_REMOVE(self->strings[gen], item);
    LIST_APPEND(self->strings[self->current_generation], item);
    gc_ms2_set_gen_flags(interp, (PObj *)s, self->current_generation);
}

/*
=item C<static void gc_ms2_sweep_pool(PARROT_INTERP, Pool_Allocator *pool,
Linked_List *list, sweep_cb callback)>

Helper function to sweep pool.

=cut
*/

static void
gc_ms2_sweep_pool(PARROT_INTERP,
        ARGIN(Pool_Allocator *pool),
        ARGIN(Linked_List *list),
        ARGIN(sweep_cb callback))
{
    ASSERT_ARGS(gc_ms2_sweep_pool)
    List_Item_Header *tmp = list->first;
    while (tmp) {
        List_Item_Header *next = tmp->next;
        PObj             *obj  = LLH2Obj_typed(tmp, PObj);
        if (PObj_live_TEST(obj)) {
            /* Paint live objects white */
            PObj_live_CLEAR(obj);
            obj->flags &= ~PObj_GC_wb_triggered_FLAG;
        }
        else if (!PObj_constant_TEST(obj)) {
            callback(interp, obj);

            LIST_REMOVE(list, tmp);
            PObj_on_free_list_SET(obj);
            Parrot_gc_pool_free(interp, pool, tmp);
        }
        else {
            /* Remove "constant" objects from pool. We don't handle them */
            LIST_REMOVE(list, tmp);
        }
        tmp = next;
    }
}



/*
=item C<static int gc_ms2_is_ptr_owned(PARROT_INTERP, void *ptr, Pool_Allocator
*pool, Linked_List *list)>

Helper function to check that we own PObj

=cut
*/

static int
gc_ms2_is_ptr_owned(PARROT_INTERP, ARGIN_NULLOK(void *ptr),
    ARGIN(Pool_Allocator *pool), ARGIN(Linked_List *list))
{
    ASSERT_ARGS(gc_ms2_is_ptr_owned)
    MarkSweep_GC     *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    List_Item_Header *item = Obj2LLH(ptr);
    PObj             *obj  = (PObj *)ptr;

    if (!obj || !item)
        return 0;

    if (!Parrot_gc_pool_is_owned(interp, pool, item))
        return 0;

    /* black or white objects marked already. */
    if (PObj_is_live_or_free_TESTALL(obj))
        return 0;

    /* Pool.is_owned isn't precise enough (yet) */
    if (Parrot_list_contains(interp, list, item))
        return 1;

    return 0;
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
    MarkSweep_GC *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    ++self->gc_mark_block_level;
    Parrot_shared_gc_block(interp);
}

static void
gc_ms2_unblock_GC_mark(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms2_unblock_GC_mark)
    MarkSweep_GC *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    if (self->gc_mark_block_level) {
        --self->gc_mark_block_level;
        Parrot_shared_gc_unblock(interp);
    }
}

static void
gc_ms2_block_GC_sweep(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms2_block_GC_sweep)
    MarkSweep_GC *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    ++self->gc_sweep_block_level;
}

static void
gc_ms2_unblock_GC_sweep(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms2_unblock_GC_sweep)
    MarkSweep_GC *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    if (self->gc_sweep_block_level)
        --self->gc_sweep_block_level;
}

static unsigned int
gc_ms2_is_blocked_GC_mark(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms2_is_blocked_GC_mark)
    MarkSweep_GC *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    return self->gc_mark_block_level;
}

static unsigned int
gc_ms2_is_blocked_GC_sweep(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms2_is_blocked_GC_sweep)
    MarkSweep_GC *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
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
PARROT_CANNOT_RETURN_NULL
static void *
gc_ms2_allocate_memory_chunk(SHIM_INTERP, size_t size)
{
    ASSERT_ARGS(gc_ms2_allocate_memory_chunk)
    void * const ptr = malloc(size);
#ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "Allocated %i at %p\n", size, ptr);
#endif
    if (!ptr)
        PANIC_OUT_OF_MEM(size);
    return ptr;
}

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
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
    if (!ptr)
        PANIC_OUT_OF_MEM(size);
    return ptr;
}

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static void *
gc_ms2_allocate_memory_chunk_zeroed(SHIM_INTERP, size_t size)
{
    ASSERT_ARGS(gc_ms2_allocate_memory_chunk_zeroed)
    void * const ptr = calloc(1, (size_t)size);
#ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "Allocated %i at %p\n", size, ptr);
#endif
    if (!ptr)
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

Mark a PMC as needing timely destruction

=cut

*/

static void
gc_ms2_pmc_needs_early_collection(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(gc_ms2_pmc_needs_early_collection)
    MarkSweep_GC *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    ++self->num_early_gc_PMCs;
}

/*

=item C<static void gc_ms2_maybe_mark_and_sweep(PARROT_INTERP)>

Maybe M&S. Depends on total allocated memory, memory allocated since last alloc
and phase of the Moon.

=cut

*/
static void
gc_ms2_maybe_mark_and_sweep(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms2_maybe_mark_and_sweep)

    MarkSweep_GC *self = (MarkSweep_GC *)interp->gc_sys->gc_private;

    /* Collect every 256M. Hardcode for now. Will be configured via CLI */
    if (interp->gc_sys->stats.mem_used_last_collect > self->gc_threshold) {
        gc_ms2_mark_and_sweep(interp, 0);
    }
}

/*
=item C<static void gc_ms2_write_barrier(PARROT_INTERP, PMC *pmc)>

WriteBarrier for PMC. Add to root_objects list for mandatory next collecting.

=cut
*/
static void
gc_ms2_write_barrier(PARROT_INTERP, ARGIN(PMC *pmc))
{
    ASSERT_ARGS(gc_ms2_write_barrier)
    MarkSweep_GC     *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    List_Item_Header *item = Obj2LLH(pmc);
    size_t            gen  = PObj_to_generation(pmc);

    /* If we are already marked this one - skip it */
    if (pmc->flags & PObj_GC_wb_triggered_FLAG)
        return;

    if (!gen)
        return;

    LIST_REMOVE(self->objects[gen], item);
    LIST_APPEND(self->root_objects, item);
    pmc->flags |= PObj_GC_wb_triggered_FLAG;
    PObj_live_SET(pmc);
}

/*

=item C<static size_t gc_ms2_count_used_string_memory(PARROT_INTERP, Linked_List
*list)>

find amount of used string memory

=cut

*/

static size_t
gc_ms2_count_used_string_memory(PARROT_INTERP, ARGIN(Linked_List *list))
{
    ASSERT_ARGS(gc_ms2_count_used_string_memory)

    size_t total_amount = 0;

    List_Item_Header *tmp = list->first;
    while (tmp) {
        List_Item_Header *next = tmp->next;
        PObj             *obj  = LLH2Obj_typed(tmp, PObj);
        STRING           *str  = (STRING*)obj;

        /* Header size */
        total_amount += sizeof (List_Item_Header)
                        + sizeof (STRING*);
        total_amount += str->bufused;

        tmp = next;
    }

    return total_amount;
}

/*

=item C<static size_t gc_ms2_count_used_pmc_memory(PARROT_INTERP, Linked_List
*list)>

find amount of used pmc memory

=cut

*/

static size_t
gc_ms2_count_used_pmc_memory(PARROT_INTERP, ARGIN(Linked_List *list))
{
    ASSERT_ARGS(gc_ms2_count_used_pmc_memory)

    size_t total_amount = 0;

    List_Item_Header *tmp = list->first;
    while (tmp) {
        List_Item_Header *next = tmp->next;
        PMC              *obj  = LLH2Obj_typed(tmp, PMC);

        /* Header size */
        total_amount += sizeof (List_Item_Header)
                        + sizeof (PMC*);
        total_amount += obj->vtable->attr_size;

        tmp = next;
    }

    return total_amount;
}

/*

=item C<static int pobj2gen(PMC *pmc)>

=item C<static int gen2flags(int gen)>

helper functions to check and use macro

=cut

*/

static int
pobj2gen(ARGIN(PMC *pmc))
{
    ASSERT_ARGS(pobj2gen)

    return PObj_to_generation(pmc);
}

static int
gen2flags(int gen)
{
    ASSERT_ARGS(gen2flags)

    return generation_to_flags(gen);
}

/*
=item C<static void gc_ms2_seal_object(PARROT_INTERP, PMC *pmc)>

Seal object with write barrier.

=cut
*/
static void
gc_ms2_seal_object(PARROT_INTERP, ARGIN(PMC *pmc))
{
    ASSERT_ARGS(gc_ms2_seal_object)
    /* "Seal" object with write barrier */
    VTABLE  *t   = pmc->vtable;

    if (!(t->flags & VTABLE_IS_WRITE_BARRIER_FLAG)) {
        PARROT_ASSERT(pmc->vtable);
        PARROT_ASSERT(pmc->vtable->wb_variant_vtable);

        pmc->vtable = pmc->vtable->wb_variant_vtable;
        pmc->vtable->wb_variant_vtable = t;

        PARROT_ASSERT(pmc->vtable != pmc->vtable->wb_variant_vtable);
        PARROT_ASSERT(pmc->vtable != pmc->vtable->ro_variant_vtable);
    }

}

/*
=item C<static void gc_ms2_set_gen_flags(PARROT_INTERP, PObj *obj, int gen)>

Set flags for generation.

=cut
*/
static void
gc_ms2_set_gen_flags(PARROT_INTERP, ARGIN(PObj *obj), int gen)
{
    ASSERT_ARGS(gc_ms2_set_gen_flags)
    obj->flags &= ~(PObj_GC_generation_0_FLAG
        | PObj_GC_generation_1_FLAG);
    obj->flags |= gen2flags(gen);
}

/*

=item C<static void gc_ms2_check_sanity(PARROT_INTERP)>

sanity check

=cut

*/

static void
gc_ms2_check_sanity(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms2_check_sanity)

    MarkSweep_GC     *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    List_Item_Header *tmp;
    int gen;

    for (gen=0; gen < 2; gen++) {
        tmp = self->objects[gen]->first;
        while (tmp) {
            PMC * pmc = LLH2Obj_typed(tmp, PMC);

            PARROT_ASSERT(pobj2gen(pmc) == gen);

            tmp = tmp->next;
        }
    }
}

/*

=item C<static void gc_ms2_print_stats(PARROT_INTERP, const char* header, int
gen)>

debug function

=cut

*/

static void
gc_ms2_print_stats(PARROT_INTERP, const char* header, int gen)
{
    ASSERT_ARGS(gc_ms2_print_stats)
#ifdef DETAIL_MEMORY_DEBUG
    MarkSweep_GC     *self = (MarkSweep_GC *)interp->gc_sys->gc_private;

    fprintf(stderr, "%s\ngen: %d\n0: %d %d\n1: %d %d\n2: %d %d\n",
            header,
            gen,
            self->objects[0]->count, self->strings[0]->count,
            self->objects[1]->count, self->strings[1]->count,
            self->objects[2]->count, self->strings[2]->count);


    fprintf(stderr, "PMC: %d\n", Parrot_gc_pool_allocated_size(interp, self->pmc_allocator));
    fprintf(stderr, "STRING: %d\n", Parrot_gc_pool_allocated_size(interp, self->string_allocator));

    fprintf(stderr, "buffers: %d\n", self->string_gc.memory_pool->total_allocated);
    fprintf(stderr, "const buffers: %d\n", self->string_gc.constant_string_pool->total_allocated);

    fprintf(stderr, "attrs: %d\n", Parrot_gc_fixed_allocator_allocated_memory(interp,
                                                                      self->fixed_size_allocator));

    fprintf(stderr, "\n");

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
 * vim: expandtab shiftwidth=4:
 */
