/*
Copyright (C) 2001-2010, Parrot Foundation.
$Id$

=head1 NAME

src/gc/gc_ms2.c - Non-recursive M&S

=head1 DESCRIPTION

=cut

*/

#include "parrot/parrot.h"
#include "parrot/gc_api.h"
#include "parrot/list.h"
#include "gc_private.h"
#include "fixed_allocator.h"

#define PANIC_OUT_OF_MEM(size) failed_allocation(__LINE__, (size))

/* Private information */
typedef struct MarkSweep_GC {
    /* Allocator for PMC headers */
    struct Pool_Allocator *pmc_allocator;
    /* Currently allocate objects */
    struct Linked_List    *objects;
    /* During M&S gather new live objects in this list */
    struct Linked_List    *new_objects;

    /* Allocator for strings */
    struct Pool_Allocator *string_allocator;
    struct Linked_List    *strings;

    /* Fixed-size allocator */
    struct Fixed_Allocator *fixed_size_allocator;

    /* String GC */
    struct String_GC        string_gc;

    /* Number of allocated objects before trigger gc */
    size_t gc_threshold;

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

static void gc_ms2_mark_and_sweep(PARROT_INTERP, UINTVAL flags)
        __attribute__nonnull__(1);

static void gc_ms2_mark_pmc_header(PARROT_INTERP, ARGIN(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void gc_ms2_mark_pobj_header(PARROT_INTERP, ARGIN_NULLOK(PObj * obj))
        __attribute__nonnull__(1);

static void gc_ms2_maybe_mark_and_sweep(PARROT_INTERP)
        __attribute__nonnull__(1);

static void gc_ms2_pmc_needs_early_collection(PARROT_INTERP,
    ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

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
#define ASSERT_ARGS_gc_ms2_mark_and_sweep __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_mark_pmc_header __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_gc_ms2_mark_pobj_header __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_maybe_mark_and_sweep __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms2_pmc_needs_early_collection \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
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
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=head1 Functions

=over 4

=item C<static void gc_ms2_mark_and_sweep(PARROT_INTERP, UINTVAL flags)>

This function would perform a GC run, if we needed to. Luckily we have
infinite memory!

This function is called from the GC API function C<Parrot_gc_mark_and_sweep>.

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

=item C<void Parrot_gc_ms2_init(PARROT_INTERP)>

Initializes the infinite memory collector. Installs the necessary function
pointers into the Memory_Pools structure. The two most important are the
C<mark_and_sweep> and C<pool_init> functions. C<finalize_gc_system> function
will be called at Parrot exit and will shut down the GC system if things
need to be flushed/closed/deactivated/freed/etc. It can be set to NULL if no
finalization is necessary.

=cut

*/

void
Parrot_gc_ms2_init(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_ms2_init)
    struct MarkSweep_GC *self;

    /* We have to transfer ownership of memory to parent interp in threaded parrot */
    interp->gc_sys->finalize_gc_system = NULL; /* gc_ms2_finalize; */

    interp->gc_sys->do_gc_mark              = gc_ms2_mark_and_sweep;
    interp->gc_sys->compact_string_pool     = gc_ms2_compact_memory_pool;

    /*
    interp->gc_sys->mark_special                = gc_ms2_mark_special;
    */
    interp->gc_sys->pmc_needs_early_collection  = gc_ms2_pmc_needs_early_collection;

    interp->gc_sys->allocate_pmc_header     = gc_ms2_allocate_pmc_header;
    interp->gc_sys->free_pmc_header         = gc_ms2_free_pmc_header;

    interp->gc_sys->allocate_string_header  = gc_ms2_allocate_string_header;
    interp->gc_sys->free_string_header      = gc_ms2_free_string_header;

    interp->gc_sys->allocate_bufferlike_header  = gc_ms2_allocate_buffer_header;
    interp->gc_sys->free_bufferlike_header      = gc_ms2_free_buffer_header;

    interp->gc_sys->allocate_pmc_attributes = gc_ms2_allocate_pmc_attributes;
    interp->gc_sys->free_pmc_attributes     = gc_ms2_free_pmc_attributes;

    interp->gc_sys->is_pmc_ptr              = gc_ms2_is_pmc_ptr;
    interp->gc_sys->is_string_ptr           = gc_ms2_is_string_ptr;
    interp->gc_sys->mark_pmc_header         = gc_ms2_mark_pmc_header;
    interp->gc_sys->mark_pobj_header        = gc_ms2_mark_pobj_header;

    interp->gc_sys->block_mark      = gc_ms2_block_GC_mark;
    interp->gc_sys->unblock_mark    = gc_ms2_unblock_GC_mark;
    interp->gc_sys->is_blocked_mark = gc_ms2_is_blocked_GC_mark;

    interp->gc_sys->block_sweep      = gc_ms2_block_GC_sweep;
    interp->gc_sys->unblock_sweep    = gc_ms2_unblock_GC_sweep;
    interp->gc_sys->is_blocked_sweep = gc_ms2_is_blocked_GC_sweep;

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

    interp->gc_sys->iterate_live_strings = gc_ms2_iterate_live_strings;

    interp->gc_sys->get_gc_info      = gc_ms2_get_gc_info;

    if (interp->parent_interpreter && interp->parent_interpreter->gc_sys) {
        /* This is a "child" interpreter. Just reuse parent one */
        self = (MarkSweep_GC*)interp->parent_interpreter->gc_sys->gc_private;
    }
    else {
        self = mem_allocate_zeroed_typed(MarkSweep_GC);

        self->pmc_allocator = Parrot_gc_pool_new(interp,
            sizeof (List_Item_Header) + sizeof (PMC));
        self->objects = Parrot_list_new(interp);

        self->string_allocator = Parrot_gc_pool_new(interp,
            sizeof (List_Item_Header) + sizeof (STRING));
        self->strings = Parrot_list_new(interp);

        self->fixed_size_allocator = Parrot_gc_fixed_allocator_new(interp);

        /* Collect every 256M allocated. */
        /* Hardcode for now. Will be configured via CLI */
        self->gc_threshold = 256 * 1024 * 1024;
    }
    interp->gc_sys->gc_private = self;

    Parrot_gc_str_initialize(interp, &self->string_gc);
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

    Parrot_list_destroy(interp, self->objects);
    Parrot_list_destroy(interp, self->strings);
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
    LIST_APPEND(self->objects, ptr);

    ret = LLH2Obj_typed(ptr, PMC);

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
        Parrot_list_remove(interp, self->objects, Obj2LLH(pmc));
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

    /* Object was already marked as grey. Or live. Or dead. Skip it */
    if (PObj_is_live_or_free_TESTALL(pmc) || PObj_constant_TEST(pmc))
        return;

    /* mark it live */
    PObj_live_SET(pmc);

    LIST_REMOVE(self->objects, item);
    LIST_APPEND(self->new_objects, item);

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
    return gc_ms2_is_ptr_owned(interp, ptr, self->pmc_allocator, self->objects);
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
    LIST_APPEND(self->strings, ptr);

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
        Parrot_list_remove(interp, self->strings, Obj2LLH(s));
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

=item C<static void gc_ms2_mark_pobj_header(PARROT_INTERP, PObj * obj)>

Mark PObj as live.

=cut

*/

static void
gc_ms2_mark_pobj_header(PARROT_INTERP, ARGIN_NULLOK(PObj * obj))
{
    ASSERT_ARGS(gc_ms2_mark_pobj_header)
    if (obj) {
        if (PObj_is_PMC_TEST(obj))
            gc_ms2_mark_pmc_header(interp, (PMC *)obj);
        else
            PObj_live_SET(obj);
    }
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
    List_Item_Header *tmp = self->strings->first;

    while (tmp) {
        Buffer *b = LLH2Obj_typed(tmp, Buffer);
        callback(interp, b, data);
        tmp = tmp->next;
    }
}


static void
gc_ms2_mark_and_sweep(PARROT_INTERP, UINTVAL flags)
{
    ASSERT_ARGS(gc_ms2_mark_and_sweep)
    MarkSweep_GC      *self = (MarkSweep_GC *)interp->gc_sys->gc_private;
    List_Item_Header *tmp;
    Linked_List      *list;
    size_t            counter;
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

    /* Allocate list for gray objects */
    self->new_objects = Parrot_list_new(interp);

    /* Trace "roots" into new_objects */
    gc_ms2_mark_pmc_header(interp, PMCNULL);

    Parrot_gc_trace_root(interp, NULL, GC_TRACE_FULL);
    if (interp->pdb && interp->pdb->debugger) {
        Parrot_gc_trace_root(interp->pdb->debugger, NULL, (Parrot_gc_trace_type)0);
    }

    /* new_objects are "gray" untill fully marked */
    /* Additional gray objects will appened to new_objects list */
    /* So, iterate over them in one go */
    tmp = self->new_objects->first;
    while (tmp) {
        PMC *pmc = LLH2Obj_typed(tmp, PMC);
        /* if object is a PMC and contains buffers or PMCs, then attach the PMC
         * to the chained mark list. */
        if (PObj_is_special_PMC_TEST(pmc)) {
            if (PObj_custom_mark_TEST(pmc))
                VTABLE_mark(interp, pmc);
        }

        if (PMC_metadata(pmc))
            Parrot_gc_mark_PMC_alive(interp, PMC_metadata(pmc));

        tmp = tmp->next;
    }

    /* At this point of time new_objects contains only live PMCs */
    /* objects contains "dead" or "constant" PMCs */
    /* sweep of new_objects will repaint them white */
    /* sweep of objects will destroy dead objects leaving only "constant" */
    gc_ms2_sweep_pool(interp, self->pmc_allocator, self->new_objects, gc_ms2_sweep_pmc_cb);
    gc_ms2_sweep_pool(interp, self->pmc_allocator, self->objects, gc_ms2_sweep_pmc_cb);
    gc_ms2_sweep_pool(interp, self->string_allocator, self->strings, gc_ms2_sweep_string_cb);

    /* Replace objects with new_objects. Ignoring "constant" one */
    list = self->objects;
    self->objects = self->new_objects;
    Parrot_list_destroy(interp, list);

    interp->gc_sys->stats.header_allocs_since_last_collect = 0;
    interp->gc_sys->stats.mem_used_last_collect            = 0;
    interp->gc_sys->stats.gc_mark_runs++;
    self->gc_mark_block_level--;
    /* We swept all dead objects */
    self->num_early_gc_PMCs                      = 0;

    gc_ms2_compact_memory_pool(interp);
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
        }
        else if (!PObj_constant_TEST(obj)) {
            PObj_on_free_list_SET(obj);
            LIST_REMOVE(list, tmp);

            callback(interp, obj);

            Parrot_gc_pool_free(interp, pool, tmp);
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

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
