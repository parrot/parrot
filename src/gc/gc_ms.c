/*
Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

src/gc/gc_ms.c - Implementation of the basic mark & sweep collector

=head1 DESCRIPTION

This code implements the default mark and sweep garbage collector.

=cut

*/

#include "parrot/parrot.h"
#include "gc_private.h"
#include "parrot/list.h"

#define DEBUG_FREE_LIST 0

#define PANIC_OUT_OF_MEM(size) failed_allocation(__LINE__, (size))

/* HEADERIZER HFILE: src/gc/gc_private.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
static INTVAL contained_in_attr_pool(
    ARGIN(const PMC_Attribute_Pool *pool),
    ARGIN(const void *ptr))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_DOES_NOT_RETURN
static void failed_allocation(unsigned int line, unsigned long size);

static int gc_ms_active_sized_buffers(ARGIN(const Memory_Pools *mem_pools))
        __attribute__nonnull__(1);

static void gc_ms_add_free_object(PARROT_INTERP,
    Memory_Pools *mem_pools,
    ARGMOD(Fixed_Size_Pool *pool),
    ARGIN(void *to_add))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*pool);

static void gc_ms_alloc_objects(PARROT_INTERP,
    ARGMOD(Memory_Pools *mem_pools),
    ARGMOD(Fixed_Size_Pool *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*mem_pools)
        FUNC_MODIFIES(*pool);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static Buffer * gc_ms_allocate_bufferlike_header(PARROT_INTERP, size_t size)
        __attribute__nonnull__(1);

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static void * gc_ms_allocate_memory_chunk(PARROT_INTERP, size_t size);

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static void * gc_ms_allocate_memory_chunk_zeroed(PARROT_INTERP, size_t size);

PARROT_CANNOT_RETURN_NULL
static void * gc_ms_allocate_pmc_attributes(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

PARROT_CAN_RETURN_NULL
static PMC* gc_ms_allocate_pmc_header(PARROT_INTERP, UINTVAL flags)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static STRING* gc_ms_allocate_string_header(PARROT_INTERP, UINTVAL flags)
        __attribute__nonnull__(1);

static void gc_ms_block_GC_mark(PARROT_INTERP)
        __attribute__nonnull__(1);

static void gc_ms_block_GC_sweep(PARROT_INTERP)
        __attribute__nonnull__(1);

static void gc_ms_destroy_child_interp(
    ARGMOD(Interp *dest_interp),
    ARGIN(Interp *source_interp))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest_interp);

static void gc_ms_finalize(PARROT_INTERP)
        __attribute__nonnull__(1);

static void gc_ms_finalize_memory_pools(PARROT_INTERP,
    ARGIN(Memory_Pools * const mem_pools))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void gc_ms_free_attributes_from_pool(
    ARGMOD(PMC_Attribute_Pool *pool),
    ARGMOD(void *data))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool)
        FUNC_MODIFIES(*data);

static void gc_ms_free_bufferlike_header(PARROT_INTERP,
    ARGMOD(Buffer *obj),
    size_t size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*obj);

static void gc_ms_free_memory_chunk(PARROT_INTERP, ARGFREE(void *data));
static void gc_ms_free_pmc_header(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

static void gc_ms_free_string_header(PARROT_INTERP, ARGMOD(STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*s);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static void * gc_ms_get_free_object(PARROT_INTERP,
    ARGMOD(Memory_Pools *mem_pools),
    ARGMOD(Fixed_Size_Pool *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*mem_pools)
        FUNC_MODIFIES(*pool);

static size_t gc_ms_get_gc_info(PARROT_INTERP, Interpinfo_enum which)
        __attribute__nonnull__(1);

static unsigned int gc_ms_is_blocked_GC_mark(PARROT_INTERP)
        __attribute__nonnull__(1);

static unsigned int gc_ms_is_blocked_GC_sweep(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
static int gc_ms_is_pmc_ptr(PARROT_INTERP, ARGIN_NULLOK(void *ptr))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
static int gc_ms_is_string_ptr(PARROT_INTERP, ARGIN_NULLOK(void *ptr))
        __attribute__nonnull__(1);

static void gc_ms_iterate_live_strings(PARROT_INTERP,
    string_iterator_callback callback,
    ARGIN_NULLOK(void *data))
        __attribute__nonnull__(1);

static void gc_ms_mark_and_sweep(PARROT_INTERP, UINTVAL flags)
        __attribute__nonnull__(1);

static void gc_ms_mark_special(PARROT_INTERP, ARGIN(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void gc_ms_mark_str_header(PARROT_INTERP, ARGMOD_NULLOK(STRING *obj))
        FUNC_MODIFIES(*obj);

static void gc_ms_more_traceable_objects(PARROT_INTERP,
    Memory_Pools *mem_pools,
    ARGMOD(Fixed_Size_Pool *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pool);

static void gc_ms_pool_init(PARROT_INTERP, ARGMOD(Fixed_Size_Pool *pool))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static void * gc_ms_reallocate_memory_chunk(PARROT_INTERP,
    ARGFREE(void *from),
    size_t size);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static void * gc_ms_reallocate_memory_chunk_zeroed(PARROT_INTERP,
    ARGFREE(void *data),
    size_t newsize,
    size_t oldsize);

static int gc_ms_sweep_cb(PARROT_INTERP,
    ARGIN(Memory_Pools *mem_pools),
    ARGMOD(Fixed_Size_Pool *pool),
    int flag,
    ARGMOD(void *arg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*pool)
        FUNC_MODIFIES(*arg);

static int gc_ms_total_sized_buffers(ARGIN(const Memory_Pools *mem_pools))
        __attribute__nonnull__(1);

static int gc_ms_trace_active_PMCs(PARROT_INTERP,
    Parrot_gc_trace_type trace)
        __attribute__nonnull__(1);

static void gc_ms_unblock_GC_mark(PARROT_INTERP)
        __attribute__nonnull__(1);

static void gc_ms_unblock_GC_sweep(PARROT_INTERP)
        __attribute__nonnull__(1);

static void Parrot_gc_allocate_new_attributes_arena(
    ARGMOD(PMC_Attribute_Pool *pool))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*pool);

PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
static PMC_Attribute_Pool * Parrot_gc_create_attrib_pool(size_t attrib_idx);

PARROT_CANNOT_RETURN_NULL
static PMC_Attribute_Pool * Parrot_gc_get_attribute_pool(PARROT_INTERP,
    ARGMOD(Memory_Pools *mem_pools),
    size_t attrib_size)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*mem_pools);

PARROT_CANNOT_RETURN_NULL
static void * Parrot_gc_get_attributes_from_pool(PARROT_INTERP,
    ARGMOD(PMC_Attribute_Pool * pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(* pool);

static void Parrot_gc_initialize_fixed_size_pools(PARROT_INTERP,
    ARGMOD(Memory_Pools *mem_pools),
    size_t init_num_pools)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*mem_pools);

#define ASSERT_ARGS_contained_in_attr_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool) \
    , PARROT_ASSERT_ARG(ptr))
#define ASSERT_ARGS_failed_allocation __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_ms_active_sized_buffers __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(mem_pools))
#define ASSERT_ARGS_gc_ms_add_free_object __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pool) \
    , PARROT_ASSERT_ARG(to_add))
#define ASSERT_ARGS_gc_ms_alloc_objects __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(mem_pools) \
    , PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_gc_ms_allocate_bufferlike_header \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms_allocate_memory_chunk __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_ms_allocate_memory_chunk_zeroed \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_ms_allocate_pmc_attributes __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_gc_ms_allocate_pmc_header __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms_allocate_string_header __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms_block_GC_mark __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms_block_GC_sweep __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms_destroy_child_interp __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest_interp) \
    , PARROT_ASSERT_ARG(source_interp))
#define ASSERT_ARGS_gc_ms_finalize __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms_finalize_memory_pools __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(mem_pools))
#define ASSERT_ARGS_gc_ms_free_attributes_from_pool \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool) \
    , PARROT_ASSERT_ARG(data))
#define ASSERT_ARGS_gc_ms_free_bufferlike_header __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(obj))
#define ASSERT_ARGS_gc_ms_free_memory_chunk __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_ms_free_pmc_header __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_gc_ms_free_string_header __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_gc_ms_get_free_object __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(mem_pools) \
    , PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_gc_ms_get_gc_info __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms_is_blocked_GC_mark __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms_is_blocked_GC_sweep __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms_is_pmc_ptr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms_is_string_ptr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms_iterate_live_strings __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms_mark_and_sweep __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms_mark_special __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_gc_ms_mark_str_header __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_ms_more_traceable_objects __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_gc_ms_pool_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_gc_ms_reallocate_memory_chunk __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_ms_reallocate_memory_chunk_zeroed \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_ms_sweep_cb __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(mem_pools) \
    , PARROT_ASSERT_ARG(pool) \
    , PARROT_ASSERT_ARG(arg))
#define ASSERT_ARGS_gc_ms_total_sized_buffers __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(mem_pools))
#define ASSERT_ARGS_gc_ms_trace_active_PMCs __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms_unblock_GC_mark __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms_unblock_GC_sweep __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_gc_allocate_new_attributes_arena \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_Parrot_gc_create_attrib_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_gc_get_attribute_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(mem_pools))
#define ASSERT_ARGS_Parrot_gc_get_attributes_from_pool \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_Parrot_gc_initialize_fixed_size_pools \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(mem_pools))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=over 4

=item C<static void failed_allocation(unsigned int line, unsigned long size)>

Report error if allocation failed

=back

=cut

*/

PARROT_DOES_NOT_RETURN
static void
failed_allocation(unsigned int line, unsigned long size)
{
    fprintf(stderr, "Failed allocation of %lu bytes\n", size);
    do_panic(NULL, "Out of mem", __FILE__, line);
}

/*

=head2 Primary MS Functions

=over 4

=item C<void Parrot_gc_ms_init(PARROT_INTERP, Parrot_GC_Init_Args *args)>

Initialize the state structures of the gc system. Called immediately before
creation of memory pools. This function must set the function pointers
for C<add_free_object_fn>, C<get_free_object_fn>, C<alloc_object_fn>, and
C<more_object_fn>.

=cut

*/

void
Parrot_gc_ms_init(PARROT_INTERP, SHIM(Parrot_GC_Init_Args *args))
{
    ASSERT_ARGS(Parrot_gc_ms_init)

    Memory_Pools *mem_pools = mem_internal_allocate_zeroed_typed(Memory_Pools);
    mem_pools->num_sized          = 0;
    mem_pools->num_attribs        = 0;
    mem_pools->attrib_pools       = NULL;
    mem_pools->sized_header_pools = NULL;

    interp->gc_sys->finalize_gc_system      = gc_ms_finalize;
    interp->gc_sys->destroy_child_interp    = gc_ms_destroy_child_interp;
    interp->gc_sys->init_pool               = gc_ms_pool_init;

    interp->gc_sys->do_gc_mark              = gc_ms_mark_and_sweep;
    interp->gc_sys->compact_string_pool     = gc_ms_compact_memory_pool;

    interp->gc_sys->mark_special                = gc_ms_mark_special;
    interp->gc_sys->pmc_needs_early_collection  = gc_ms_pmc_needs_early_collection;

    interp->gc_sys->allocate_pmc_header     = gc_ms_allocate_pmc_header;
    interp->gc_sys->free_pmc_header         = gc_ms_free_pmc_header;

    interp->gc_sys->allocate_string_header  = gc_ms_allocate_string_header;
    interp->gc_sys->free_string_header      = gc_ms_free_string_header;

    interp->gc_sys->allocate_bufferlike_header  = gc_ms_allocate_bufferlike_header;
    interp->gc_sys->free_bufferlike_header      = gc_ms_free_bufferlike_header;

    interp->gc_sys->is_pmc_ptr              = gc_ms_is_pmc_ptr;
    interp->gc_sys->is_string_ptr           = gc_ms_is_string_ptr;
    interp->gc_sys->mark_pmc_header         = gc_ms_mark_pmc_header;
    interp->gc_sys->mark_str_header         = gc_ms_mark_str_header;

    interp->gc_sys->allocate_pmc_attributes = gc_ms_allocate_pmc_attributes;
    interp->gc_sys->free_pmc_attributes     = gc_ms_free_pmc_attributes;

    interp->gc_sys->allocate_string_storage   = gc_ms_allocate_string_storage;
    interp->gc_sys->reallocate_string_storage = gc_ms_reallocate_string_storage;

    interp->gc_sys->allocate_buffer_storage   = gc_ms_allocate_buffer_storage;
    interp->gc_sys->reallocate_buffer_storage = gc_ms_reallocate_buffer_storage;

    interp->gc_sys->allocate_fixed_size_storage = gc_ms_allocate_fixed_size_storage;
    interp->gc_sys->free_fixed_size_storage     = gc_ms_free_fixed_size_storage;

    /* We don't distinguish between chunk and chunk_with_pointers */
    interp->gc_sys->allocate_memory_chunk   = gc_ms_allocate_memory_chunk;
    interp->gc_sys->reallocate_memory_chunk = gc_ms_reallocate_memory_chunk;
    interp->gc_sys->allocate_memory_chunk_with_interior_pointers
                = gc_ms_allocate_memory_chunk_zeroed;
    interp->gc_sys->reallocate_memory_chunk_with_interior_pointers
                = gc_ms_reallocate_memory_chunk_zeroed;
    interp->gc_sys->free_memory_chunk       = gc_ms_free_memory_chunk;

    interp->gc_sys->block_mark      = gc_ms_block_GC_mark;
    interp->gc_sys->unblock_mark    = gc_ms_unblock_GC_mark;
    interp->gc_sys->is_blocked_mark = gc_ms_is_blocked_GC_mark;

    interp->gc_sys->block_sweep      = gc_ms_block_GC_sweep;
    interp->gc_sys->unblock_sweep    = gc_ms_unblock_GC_sweep;
    interp->gc_sys->is_blocked_sweep = gc_ms_is_blocked_GC_sweep;

    interp->gc_sys->get_gc_info      = gc_ms_get_gc_info;

    interp->gc_sys->iterate_live_strings = gc_ms_iterate_live_strings;

    /* gc_private is Memory_Pools */
    interp->gc_sys->gc_private       = mem_pools;


    Parrot_gc_str_initialize(interp, &mem_pools->string_gc);
    initialize_fixed_size_pools(interp, mem_pools);
    Parrot_gc_initialize_fixed_size_pools(interp, mem_pools,
                                          GC_NUM_INITIAL_FIXED_SIZE_POOLS);
}

/*

=item C<static void gc_ms_finalize(PARROT_INTERP)>

Finalyze MS GC subsystem. Destroy everything.

=cut

*/
static void
gc_ms_finalize(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms_finalize)
    Memory_Pools *mem_pools = (Memory_Pools*)interp->gc_sys->gc_private;

    /* buffer headers, PMCs */
    Parrot_gc_destroy_header_pools(interp, mem_pools);

    /* memory pools in resources */
    Parrot_gc_str_finalize(interp, &mem_pools->string_gc);

    /* mem subsystem is dead now */
    mem_internal_free(mem_pools);
    interp->gc_sys->gc_private = NULL;
}

/*

=item C<static void gc_ms_destroy_child_interp(Interp *dest_interp, Interp
*source_interp)>

Merges the header pools of C<source_interp> into those of C<dest_interp>.
(Used to deal with shared objects left after interpreter destruction.)

=cut

*/

static void
gc_ms_destroy_child_interp(ARGMOD(Interp *dest_interp), ARGIN(Interp *source_interp))
{
    ASSERT_ARGS(gc_ms_destroy_child_interp)

    Memory_Pools * const dest_arena   = (Memory_Pools*)dest_interp->gc_sys->gc_private;
    Memory_Pools * const source_arena = (Memory_Pools*)source_interp->gc_sys->gc_private;
    Parrot_gc_merge_memory_pools(dest_interp, dest_arena, source_arena);
}

/*

=item C<int Parrot_gc_ms_needed(PARROT_INTERP)>

Determines whether a GC run is needed. The decision is based on the amount
of memory used since the last GC run. This amount is compared to a static
and a dynamic threshold. The dynamic threshold roughly limits the memory
wasted by objects that could be freed but are not yet collected to a
percentage of total memory that is actually needed.

Increasing the dynamic threshold results in fewer GC runs and more memory
consumption.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
int
Parrot_gc_ms_needed(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_ms_needed)

    size_t dynamic_threshold;

    /* new_mem is the additional amount of memory used since the last GC */
    const size_t new_mem = interp->gc_sys->stats.memory_used
                   - interp->gc_sys->stats.mem_used_last_collect;

    /* Never run a GC if new_mem is below static GC_SIZE_THRESHOLD */
    if (new_mem <= GC_SIZE_THRESHOLD)
        return 0;

    /* The dynamic threshold is a configurable percentage of the amount of
       memory used after the last GC */
    dynamic_threshold = (size_t)(interp->gc_sys->stats.mem_used_last_collect *
                                 0.25);

    return new_mem > dynamic_threshold;
}

/*

=item C<static void gc_ms_mark_and_sweep(PARROT_INTERP, UINTVAL flags)>

Runs the stop-the-world mark & sweep (MS) collector.

=cut

*/

static void
gc_ms_mark_and_sweep(PARROT_INTERP, UINTVAL flags)
{
    ASSERT_ARGS(gc_ms_mark_and_sweep)
    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;
    int total_free = 0;

    if (mem_pools->gc_mark_block_level)
        return;

    if (interp->pdb && interp->pdb->debugger) {
        /* The debugger could have performed a mark. Make sure everything is
           marked dead here, so that when we sweep it all gets collected */
        Parrot_gc_clear_live_bits(interp, mem_pools->pmc_pool);
    }

    if (flags & GC_finish_FLAG) {
        gc_ms_finalize_memory_pools(interp, mem_pools);
        return;
    }

    ++mem_pools->gc_mark_block_level;
    mem_pools->lazy_gc = flags & GC_lazy_FLAG;

    /* tell the threading system that we're doing GC mark */
    pt_gc_start_mark(interp);
    Parrot_gc_run_init(interp, mem_pools);

    /* Now go trace the PMCs. returning true means we did a complete trace.
       false means it was a lazy trace. */
    if (gc_ms_trace_active_PMCs(interp, (flags & GC_trace_stack_FLAG)
        ? GC_TRACE_FULL : GC_TRACE_ROOT_ONLY)) {

        mem_pools->gc_trace_ptr = NULL;
        mem_pools->gc_mark_ptr  = NULL;

        /* We've done the mark, now do the sweep. Pass the sweep callback
           function to the PMC pool and all the sized pools. */
       header_pools_iterate_callback(interp, mem_pools,
            POOL_BUFFER | POOL_PMC, (void *)&total_free, gc_ms_sweep_cb);

    }
    else {
        ++interp->gc_sys->stats.gc_lazy_mark_runs;

        Parrot_gc_clear_live_bits(interp, mem_pools->pmc_pool);
    }

    /* compact STRING pools to collect free headers and allocated buffers */
    Parrot_gc_compact_memory_pool(interp);

    pt_gc_stop_mark(interp);

    /* Note it */
    ++interp->gc_sys->stats.gc_mark_runs;

    --mem_pools->gc_mark_block_level;
    interp->gc_sys->stats.mem_used_last_collect = interp->gc_sys->stats.memory_used;

    return;
}

/*

=item C<void gc_ms_compact_memory_pool(PARROT_INTERP)>

Scan the string pools and compact them. This does not perform a GC mark or
sweep run, and does not check whether string buffers are still alive.
Redirects to C<compact_pool>.

=cut

*/

void
gc_ms_compact_memory_pool(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms_compact_memory_pool)
    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;
    Parrot_gc_str_compact_pool(interp, &mem_pools->string_gc);
}

/*

=item C<void gc_ms_allocate_string_storage(PARROT_INTERP, STRING *str, size_t
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

void
gc_ms_allocate_string_storage(PARROT_INTERP, ARGIN(STRING *str), size_t size)
{
    ASSERT_ARGS(gc_ms_allocate_string_storage)
    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;
    Parrot_gc_str_allocate_string_storage(interp, &mem_pools->string_gc, str, size);
}

void
gc_ms_reallocate_string_storage(PARROT_INTERP, ARGIN(STRING *str), size_t size)
{
    ASSERT_ARGS(gc_ms_reallocate_string_storage)
    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;
    Parrot_gc_str_reallocate_string_storage(interp, &mem_pools->string_gc, str, size);
}

void
gc_ms_allocate_buffer_storage(PARROT_INTERP, ARGIN(Buffer *str), size_t size)
{
    ASSERT_ARGS(gc_ms_allocate_buffer_storage)
    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;
    Parrot_gc_str_allocate_buffer_storage(interp, &mem_pools->string_gc, str, size);
}

void
gc_ms_reallocate_buffer_storage(PARROT_INTERP, ARGIN(Buffer *str), size_t size)
{
    ASSERT_ARGS(gc_ms_reallocate_buffer_storage)
    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;
    Parrot_gc_str_reallocate_buffer_storage(interp, &mem_pools->string_gc, str, size);
}

/*

=item C<static void gc_ms_mark_special(PARROT_INTERP, PMC *pmc)>

Mark PMC special.

=cut
*/
static void
gc_ms_mark_special(PARROT_INTERP, ARGIN(PMC *pmc))
{
    ASSERT_ARGS(gc_ms_mark_special)
    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;
    mark_special(interp, mem_pools, pmc);
}

/*

=item C<void gc_ms_pmc_needs_early_collection(PARROT_INTERP, PMC *pmc)>

Mark a PMC as needing timely destruction

=cut

*/

void
gc_ms_pmc_needs_early_collection(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(gc_ms_pmc_needs_early_collection)
    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;
    PObj_needs_early_gc_SET(pmc);
    ++mem_pools->num_early_gc_PMCs;
}

/*

=item C<static void gc_ms_finalize_memory_pools(PARROT_INTERP, Memory_Pools *
const mem_pools)>

Perform the finalization run, freeing all PMCs in Memory_Pools.

=cut

*/

static void
gc_ms_finalize_memory_pools(PARROT_INTERP, ARGIN(Memory_Pools * const mem_pools))
{
    ASSERT_ARGS(gc_ms_finalize_memory_pools)
    Parrot_gc_clear_live_bits(interp, mem_pools->pmc_pool);
    Parrot_gc_clear_live_bits(interp, mem_pools->constant_pmc_pool);

    /* keep the scheduler and its kids alive for Task-like PMCs to destroy
     * themselves; run a sweep to collect them */
    if (interp->scheduler) {
        Parrot_gc_mark_PMC_alive(interp, interp->scheduler);
        VTABLE_mark(interp, interp->scheduler);
        Parrot_gc_sweep_pool(interp, mem_pools, mem_pools->pmc_pool);
    }

    /* now sweep everything that's left */
    Parrot_gc_sweep_pool(interp, mem_pools, mem_pools->pmc_pool);
    Parrot_gc_sweep_pool(interp, mem_pools, mem_pools->constant_pmc_pool);
}

/*

=item C<static PMC* gc_ms_allocate_pmc_header(PARROT_INTERP, UINTVAL flags)>

Allocate new PMC header from pool.

=cut

*/
PARROT_CAN_RETURN_NULL
static PMC*
gc_ms_allocate_pmc_header(PARROT_INTERP, UINTVAL flags)
{
    ASSERT_ARGS(gc_ms_allocate_pmc_header)

    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;
    Fixed_Size_Pool * const pool = flags & PObj_constant_FLAG
            ? mem_pools->constant_pmc_pool
            : mem_pools->pmc_pool;

    return (PMC *)pool->get_free_object(interp, mem_pools, pool);
}

/*

=item C<static void gc_ms_free_pmc_header(PARROT_INTERP, PMC *pmc)>

Return PMC header into pool.

=cut

*/
static void
gc_ms_free_pmc_header(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(gc_ms_free_pmc_header)
    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;
    Fixed_Size_Pool * const pool = (PObj_constant_TEST(pmc))
                                   ? mem_pools->constant_pmc_pool
                                   : mem_pools->pmc_pool;

    Parrot_pmc_destroy(interp, pmc);

    PObj_flags_SETTO((PObj *)pmc, PObj_on_free_list_FLAG);
    pool->add_free_object(interp, mem_pools, pool, (PObj *)pmc);
    ++pool->num_free_objects;
}

/*

=item C<void gc_ms_mark_pmc_header(PARROT_INTERP, PMC *obj)>

Mark the PMC *obj as live and attach PMCs and/or buffers

=cut

*/

void
gc_ms_mark_pmc_header(PARROT_INTERP, ARGMOD_NULLOK(PMC *obj))
{
    ASSERT_ARGS(gc_ms_mark_pmc_header)
    if (!PMC_IS_NULL(obj)) {
        PARROT_ASSERT(PObj_is_PMC_TEST(obj));

        if (PObj_is_live_or_free_TESTALL(obj))
            return;

        /* mark it live */
        PObj_live_SET(obj);

        /* if object is a PMC and contains buffers or PMCs, then attach the PMC
         * to the chained mark list. */
        if (PObj_custom_mark_TEST(obj))
            VTABLE_mark(interp, obj);

        if (PMC_metadata(obj))
            Parrot_gc_mark_PMC_alive(interp, PMC_metadata(obj));
    }
}

/*

=item C<static int gc_ms_is_pmc_ptr(PARROT_INTERP, void *ptr)>

return True if *ptr is contained in the pool

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
gc_ms_is_pmc_ptr(PARROT_INTERP, ARGIN_NULLOK(void *ptr))
{
    ASSERT_ARGS(gc_ms_is_pmc_ptr)
    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;
    return contained_in_pool(mem_pools->pmc_pool, ptr);
}

/*

=item C<static int gc_ms_is_string_ptr(PARROT_INTERP, void *ptr)>

establish if string *ptr is owned

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
gc_ms_is_string_ptr(PARROT_INTERP, ARGIN_NULLOK(void *ptr))
{
    ASSERT_ARGS(gc_ms_is_string_ptr)
    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;
    UINTVAL        i;

    for (i = 0; i < mem_pools->num_sized; ++i) {
        if (mem_pools->sized_header_pools[i]
            &&  contained_in_pool(mem_pools->sized_header_pools[i], ptr))
            return 1;
    }

    return 0;
}

/*

=item C<static STRING* gc_ms_allocate_string_header(PARROT_INTERP, UINTVAL
flags)>

Allocate new STRING header from pool.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static STRING*
gc_ms_allocate_string_header(PARROT_INTERP, UINTVAL flags)
{
    ASSERT_ARGS(gc_ms_allocate_string_header)

    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;
    Fixed_Size_Pool * const pool = flags & PObj_constant_FLAG
            ? mem_pools->constant_string_header_pool
            : mem_pools->string_header_pool;

    STRING * const s = (STRING *)pool->get_free_object(interp, mem_pools, pool);
    memset(s, 0, sizeof (STRING));
    return s;
}


/*

=item C<static void gc_ms_free_string_header(PARROT_INTERP, STRING *s)>

Return STRING header into pool.

=cut

*/
static void
gc_ms_free_string_header(PARROT_INTERP, ARGMOD(STRING *s))
{
    ASSERT_ARGS(gc_ms_free_string_header)
    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;
    if (!PObj_constant_TEST(s)) {
        Fixed_Size_Pool * const pool = mem_pools->string_header_pool;
        PObj_flags_SETTO((PObj *)s, PObj_on_free_list_FLAG);
        pool->add_free_object(interp, mem_pools, pool, s);
        ++pool->num_free_objects;
    }
}

/*

=item C<static void gc_ms_mark_str_header(PARROT_INTERP, STRING *obj)>

mark *obj as live

=cut

*/

static void
gc_ms_mark_str_header(SHIM_INTERP, ARGMOD_NULLOK(STRING *obj))
{
    ASSERT_ARGS(gc_ms_mark_str_header)
    if (obj) {
        /* mark it live */
        PObj_live_SET(obj);
    }
}

/*

=item C<static Buffer * gc_ms_allocate_bufferlike_header(PARROT_INTERP, size_t
size)>

Returns a new buffer-like header from the appropriate sized pool.
A "bufferlike object" is an object that is considered to be isomorphic to the
PObj, so it will participate in normal GC. At the moment these are only used
to create ListChunk objects in src/list.c.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static Buffer *
gc_ms_allocate_bufferlike_header(PARROT_INTERP, size_t size)
{
    ASSERT_ARGS(gc_ms_allocate_bufferlike_header)

    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;
    Fixed_Size_Pool * const pool = get_bufferlike_pool(interp, mem_pools, size);

    return (Buffer *)pool->get_free_object(interp, mem_pools, pool);
}

/*

=item C<static void gc_ms_free_bufferlike_header(PARROT_INTERP, Buffer *obj,
size_t size)>

Free a bufferlike header that is not being used, so that Parrot can recycle
it and use it again.

=cut

*/

static void
gc_ms_free_bufferlike_header(PARROT_INTERP, ARGMOD(Buffer *obj),
    size_t size)
{
    ASSERT_ARGS(gc_ms_free_bufferlike_header)
    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;
    Fixed_Size_Pool * const pool = get_bufferlike_pool(interp, mem_pools, size);
    pool->add_free_object(interp, mem_pools, pool, obj);
}

/*

=over 4

=item C<static void * Parrot_gc_get_attributes_from_pool(PARROT_INTERP,
PMC_Attribute_Pool * pool)>

Get a new fixed-size storage space from the given pool. The pool contains
information on the size of the item to allocate already.

=item C<static void Parrot_gc_allocate_new_attributes_arena(PMC_Attribute_Pool
*pool)>

Allocate a new arena of fixed-sized data structures for the given pool.

=item C<static void Parrot_gc_initialize_fixed_size_pools(PARROT_INTERP,
Memory_Pools *mem_pools, size_t init_num_pools)>

Initialize the pools (zeroize)

=item C<static PMC_Attribute_Pool * Parrot_gc_get_attribute_pool(PARROT_INTERP,
Memory_Pools *mem_pools, size_t attrib_size)>

Find a fixed-sized data structure pool given the size of the object to
allocate. If the pool does not exist, create it.

=item C<static PMC_Attribute_Pool * Parrot_gc_create_attrib_pool(size_t
attrib_idx)>

Create a new pool for fixed-sized data items with the given C<attrib_size>.

=back

=cut

*/

PARROT_CANNOT_RETURN_NULL
static void *
Parrot_gc_get_attributes_from_pool(PARROT_INTERP, ARGMOD(PMC_Attribute_Pool * pool))
{
    ASSERT_ARGS(Parrot_gc_get_attributes_from_pool)
    PMC_Attribute_Free_List *item;

    if (pool->free_list) {
        item            = pool->free_list;
        pool->free_list = item->next;
    }
    else if (pool->newfree) {
        item          = pool->newfree;
        pool->newfree = (PMC_Attribute_Free_List *)
                        ((char *)(pool->newfree) + pool->attr_size);
        if (pool->newfree >= pool->newlast)
            pool->newfree = NULL;
    }
    else {
        Parrot_gc_allocate_new_attributes_arena(pool);
        return Parrot_gc_get_attributes_from_pool(interp, pool);
    }

    --pool->num_free_objects;
    return (void *)item;
}


static void
Parrot_gc_allocate_new_attributes_arena(ARGMOD(PMC_Attribute_Pool *pool))
{
    ASSERT_ARGS(Parrot_gc_allocate_new_attributes_arena)
    PMC_Attribute_Free_List *next;

    const size_t num_items  = pool->objects_per_alloc;
    const size_t item_size  = pool->attr_size;
    const size_t item_space = item_size * num_items;
    const size_t total_size = sizeof (PMC_Attribute_Arena) + item_space;

    PMC_Attribute_Arena * const new_arena = (PMC_Attribute_Arena *)mem_internal_allocate(
        total_size);

    new_arena->prev = NULL;
    new_arena->next = pool->top_arena;
    pool->top_arena = new_arena;
    next            = (PMC_Attribute_Free_List *)(new_arena + 1);

    pool->newfree   = next;
    pool->newlast   = (PMC_Attribute_Free_List *)((char *)next + item_space);

    pool->num_free_objects += num_items;
    pool->total_objects    += num_items;
}

static void
Parrot_gc_initialize_fixed_size_pools(SHIM_INTERP,
        ARGMOD(Memory_Pools *mem_pools),
        size_t init_num_pools)
{
    ASSERT_ARGS(Parrot_gc_initialize_fixed_size_pools)
    PMC_Attribute_Pool **pools;
    const size_t total_size = (init_num_pools + 1) * sizeof (void *);

    pools = (PMC_Attribute_Pool **)mem_internal_allocate(total_size);
    memset(pools, 0, total_size);

    mem_pools->attrib_pools = pools;
    mem_pools->num_attribs = init_num_pools;
}


PARROT_CANNOT_RETURN_NULL
static PMC_Attribute_Pool *
Parrot_gc_get_attribute_pool(SHIM_INTERP,
        ARGMOD(Memory_Pools *mem_pools),
        size_t attrib_size)
{
    ASSERT_ARGS(Parrot_gc_get_attribute_pool)

    PMC_Attribute_Pool **pools = mem_pools->attrib_pools;
    const size_t         idx   = (attrib_size < sizeof (void *))
                               ? 0
                               : attrib_size - sizeof (void *);

    if (mem_pools->num_attribs <= idx) {
        const size_t total_length = idx + GC_ATTRIB_POOLS_HEADROOM;
        const size_t total_size   = total_length * sizeof (void *);
        const size_t current_size = mem_pools->num_attribs;
        const size_t diff         = total_length - current_size;

        pools = (PMC_Attribute_Pool **)mem_internal_realloc(pools, total_size);
        memset(pools + current_size, 0, diff * sizeof (void *));
        mem_pools->attrib_pools = pools;
        mem_pools->num_attribs = total_length;
    }

    if (!pools[idx]) {
        PMC_Attribute_Pool * const pool = Parrot_gc_create_attrib_pool(idx);
        /* Create the first arena now, so we don't have to check for it later */
        Parrot_gc_allocate_new_attributes_arena(pool);
        pools[idx] = pool;
    }

    return pools[idx];
}

PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
static PMC_Attribute_Pool *
Parrot_gc_create_attrib_pool(size_t attrib_idx)
{
    ASSERT_ARGS(Parrot_gc_create_attrib_pool)
    const size_t attrib_size = attrib_idx + sizeof (void *);
    const size_t num_objs_raw =
        (GC_FIXED_SIZE_POOL_SIZE - sizeof (PMC_Attribute_Arena)) / attrib_size;
    const size_t num_objs = (num_objs_raw == 0)?(1):(num_objs_raw);
    PMC_Attribute_Pool * const newpool = mem_internal_allocate_typed(PMC_Attribute_Pool);

    newpool->attr_size         = attrib_size;
    newpool->total_objects     = 0;
    newpool->objects_per_alloc = num_objs;
    newpool->num_free_objects  = 0;
    newpool->free_list         = NULL;
    newpool->top_arena         = NULL;

    return newpool;
}


/*

=item C<static void * gc_ms_allocate_pmc_attributes(PARROT_INTERP, PMC *pmc)>

Allocates a new attribute structure for a PMC if it has the auto_attrs flag
set.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static void *
gc_ms_allocate_pmc_attributes(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(gc_ms_allocate_pmc_attributes)
    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;
    const size_t attr_size = pmc->vtable->attr_size;
    PMC_Attribute_Pool * const pool = Parrot_gc_get_attribute_pool(interp,
            mem_pools, attr_size);
    void * const attrs = Parrot_gc_get_attributes_from_pool(interp, pool);
    memset(attrs, 0, attr_size);
    PMC_data(pmc) = attrs;
    return attrs;
}

#if DEBUG_FREE_LIST
/*

=item C<static INTVAL contained_in_attr_pool(const PMC_Attribute_Pool *pool,
const void *ptr)>

Returns whether the given C<*ptr> points to a location in C<pool>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static INTVAL
contained_in_attr_pool(ARGIN(const PMC_Attribute_Pool *pool), ARGIN(const void *ptr))
{
    ASSERT_ARGS(contained_in_attr_pool)
    const PMC_Attribute_Arena *arena;
    const ptrdiff_t item_space = pool->objects_per_alloc * pool->attr_size;

    for (arena = pool->top_arena; arena; arena = arena->next) {
        const ptrdiff_t ptr_diff = (const char *)ptr - (const char *)(arena + 1);

        if (ptr_diff >= 0
        &&  ptr_diff < item_space
        &&  ptr_diff % pool->attr_size == 0)
            return 1;
    }

    return 0;
}
#endif

/*

=item C<void gc_ms_free_pmc_attributes(PARROT_INTERP, PMC *pmc)>

Deallocates an attibutes structure from a PMC if it has the auto_attrs
flag set.

*/

void
gc_ms_free_pmc_attributes(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(gc_ms_free_pmc_attributes)
    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;
    void * const data = PMC_data(pmc);

    if (data) {
        const size_t attr_size = pmc->vtable->attr_size;
        const size_t item_size = attr_size < sizeof (void *) ? sizeof (void *) : attr_size;
        PMC_Attribute_Pool ** const pools = mem_pools->attrib_pools;
        const size_t idx = item_size - sizeof (void *);
        gc_ms_free_attributes_from_pool(pools[idx], data);
    }
}

/*

=item C<static void gc_ms_free_attributes_from_pool(PMC_Attribute_Pool *pool,
void *data)>

Frees a fixed-size data item back to the pool for later reallocation.  Private
to this file.

*/

static void
gc_ms_free_attributes_from_pool(ARGMOD(PMC_Attribute_Pool *pool), ARGMOD(void *data))
{
    ASSERT_ARGS(gc_ms_free_attributes_from_pool)
    PMC_Attribute_Free_List * const item = (PMC_Attribute_Free_List *)data;

#if DEBUG_FREE_LIST
    PARROT_ASSERT(contained_in_attr_pool(pool, data));
#endif

    item->next      = pool->free_list;
    pool->free_list = item;

    ++pool->num_free_objects;
}

/*

=item C<void * gc_ms_allocate_fixed_size_storage(PARROT_INTERP, size_t size)>

Allocates a fixed-size chunk of memory for use. This memory is not manually
managed and needs to be freed with C<gc_ms_free_fixed_size_storage>

*/

PARROT_CANNOT_RETURN_NULL
void *
gc_ms_allocate_fixed_size_storage(PARROT_INTERP, size_t size)
{
    ASSERT_ARGS(gc_ms_allocate_fixed_size_storage)
    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;
    PMC_Attribute_Pool *pool = NULL;
    const size_t idx = (size < sizeof (void *)) ? 0 : (size - sizeof (void *));

    /* get the pool directly, if possible, for great speed */
    if (mem_pools->num_attribs > idx)
        pool = mem_pools->attrib_pools[idx];

    /* otherwise create it */
    if (!pool)
        pool = Parrot_gc_get_attribute_pool(interp, mem_pools, size);

    return Parrot_gc_get_attributes_from_pool(interp, pool);
}

/*

=item C<void gc_ms_free_fixed_size_storage(PARROT_INTERP, size_t size, void
*data)>

Manually deallocates fixed size storage allocated with
C<gc_ms_allocate_fixed_size_storage>

*/

void
gc_ms_free_fixed_size_storage(PARROT_INTERP, size_t size, ARGFREE_NOTNULL(void *data))
{
    ASSERT_ARGS(gc_ms_free_fixed_size_storage)

    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;
    const size_t idx   = size - sizeof (void *);
    PMC_Attribute_Pool ** const pools = mem_pools->attrib_pools;
    gc_ms_free_attributes_from_pool(pools[idx], data);
}

/*

=item C<static void * gc_ms_allocate_memory_chunk(PARROT_INTERP, size_t size)>

=item C<static void * gc_ms_reallocate_memory_chunk(PARROT_INTERP, void *from,
size_t size)>

=item C<static void * gc_ms_allocate_memory_chunk_zeroed(PARROT_INTERP, size_t
size)>

=item C<static void * gc_ms_reallocate_memory_chunk_zeroed(PARROT_INTERP, void
*data, size_t newsize, size_t oldsize)>

=item C<static void gc_ms_free_memory_chunk(PARROT_INTERP, void *data)>

TODO Write docu.

*/

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static void *
gc_ms_allocate_memory_chunk(SHIM_INTERP, size_t size)
{
    ASSERT_ARGS(gc_ms_allocate_memory_chunk)
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
gc_ms_reallocate_memory_chunk(SHIM_INTERP, ARGFREE(void *from), size_t size)
{
    ASSERT_ARGS(gc_ms_reallocate_memory_chunk)
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
gc_ms_allocate_memory_chunk_zeroed(SHIM_INTERP, size_t size)
{
    ASSERT_ARGS(gc_ms_allocate_memory_chunk_zeroed)
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
gc_ms_reallocate_memory_chunk_zeroed(SHIM_INTERP, ARGFREE(void *data),
        size_t newsize, size_t oldsize)
{
    ASSERT_ARGS(gc_ms_reallocate_memory_chunk_zeroed)
    void * const ptr = realloc(data, newsize);
    if (newsize > oldsize)
        memset((char*)ptr + oldsize, 0, newsize - oldsize);
    return ptr;
}

static void
gc_ms_free_memory_chunk(SHIM_INTERP, ARGFREE(void *data))
{
    ASSERT_ARGS(gc_ms_free_memory_chunk)
#ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "Freed %p\n", data);
#endif
    if (data)
        free(data);
}


/*

=item C<static int gc_ms_trace_active_PMCs(PARROT_INTERP, Parrot_gc_trace_type
trace)>

Performs a full trace run and marks all the PMCs as active if they
are. Returns whether the run completed, that is, whether it's safe
to proceed with GC.

=cut

*/

static int
gc_ms_trace_active_PMCs(PARROT_INTERP, Parrot_gc_trace_type trace)
{
    ASSERT_ARGS(gc_ms_trace_active_PMCs)
    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;

    if (!Parrot_gc_trace_root(interp, mem_pools, trace))
        return 0;

    pt_gc_mark_root_finished(interp);
    mem_pools->gc_trace_ptr  = NULL;
    return 1;

}

/*

=item C<static int gc_ms_sweep_cb(PARROT_INTERP, Memory_Pools *mem_pools,
Fixed_Size_Pool *pool, int flag, void *arg)>

Sweeps the given pool for the MS collector. This function also ends
the profiling timer, if profiling is enabled. Returns the total number
of objects freed.

=cut

*/

static int
gc_ms_sweep_cb(PARROT_INTERP,
        ARGIN(Memory_Pools *mem_pools),
        ARGMOD(Fixed_Size_Pool *pool),
        SHIM(int flag), ARGMOD(void *arg))
{
    ASSERT_ARGS(gc_ms_sweep_cb)
    int * const total_free = (int *) arg;

    Parrot_gc_sweep_pool(interp, mem_pools, pool);

    *total_free += pool->num_free_objects;

    return 0;
}

/*

=back

=head2 MS Pool Functions

=over 4

=item C<static void gc_ms_pool_init(PARROT_INTERP, Fixed_Size_Pool *pool)>

Initialize a memory pool for the MS garbage collector system. Sets the
function pointers necessary to perform basic operations on a pool, such
as object allocation.

=cut

*/

static void
gc_ms_pool_init(SHIM_INTERP, ARGMOD(Fixed_Size_Pool *pool))
{
    ASSERT_ARGS(gc_ms_pool_init)
    pool->add_free_object = gc_ms_add_free_object;
    pool->get_free_object = gc_ms_get_free_object;
    pool->alloc_objects   = gc_ms_alloc_objects;
    pool->more_objects    = gc_ms_more_traceable_objects;
}

/*

=item C<static void gc_ms_more_traceable_objects(PARROT_INTERP, Memory_Pools
*mem_pools, Fixed_Size_Pool *pool)>

We're out of traceable objects. First we try a GC run to free some up. If
that doesn't work, allocate a new arena.

=cut

*/

static void
gc_ms_more_traceable_objects(PARROT_INTERP,
        SHIM(Memory_Pools *mem_pools),
        ARGMOD(Fixed_Size_Pool *pool))
{
    ASSERT_ARGS(gc_ms_more_traceable_objects)
    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;

    if (pool->skip == GC_ONE_SKIP)
        pool->skip = GC_NO_SKIP;
    else if (pool->skip == GC_NEVER_SKIP
         || (pool->skip == GC_NO_SKIP
         &&  Parrot_gc_ms_needed(interp)))
            Parrot_gc_mark_and_sweep(interp, GC_trace_stack_FLAG);

    /* requires that num_free_objects be updated in Parrot_gc_mark_and_sweep.
       If gc is disabled, then we must check the free list directly. */
    if ((!pool->free_list || pool->num_free_objects < pool->replenish_level)
        && !pool->newfree)
        (*pool->alloc_objects) (interp, mem_pools, pool);
}

/*

=item C<static void gc_ms_add_free_object(PARROT_INTERP, Memory_Pools
*mem_pools, Fixed_Size_Pool *pool, void *to_add)>

Add an unused object back to the pool's free list for later reuse. Set
the PObj flags to indicate that the item is free.

=cut

*/

static void
gc_ms_add_free_object(PARROT_INTERP,
        SHIM(Memory_Pools *mem_pools),
        ARGMOD(Fixed_Size_Pool *pool),
        ARGIN(void *to_add))
{
    ASSERT_ARGS(gc_ms_add_free_object)
    GC_MS_PObj_Wrapper *object = (GC_MS_PObj_Wrapper *)to_add;

#if DEBUG_FREE_LIST
    PARROT_ASSERT(contained_in_pool(pool, to_add));
#endif

    PObj_flags_SETTO(object, PObj_on_free_list_FLAG);

    object->next_ptr = pool->free_list;
    pool->free_list  = object;
    interp->gc_sys->stats.memory_used -= pool->object_size;
}

/*

=item C<static void * gc_ms_get_free_object(PARROT_INTERP, Memory_Pools
*mem_pools, Fixed_Size_Pool *pool)>

Free object allocator for the MS garbage collector system. If there are no
free objects, call C<gc_ms_add_free_object> to either free them up with a
GC run, or allocate new objects. If there are objects available on the
free list, pop it off and return it.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static void *
gc_ms_get_free_object(PARROT_INTERP,
        ARGMOD(Memory_Pools *mem_pools),
        ARGMOD(Fixed_Size_Pool *pool))
{
    ASSERT_ARGS(gc_ms_get_free_object)
    PObj *ptr;
    PObj *free_list = (PObj *)pool->free_list;

  HAVE_FREE:
    if (free_list) {
        ptr             = free_list;
        pool->free_list = ((GC_MS_PObj_Wrapper *)ptr)->next_ptr;
    }
    else if (pool->newfree) {
        Fixed_Size_Arena * const arena = pool->last_Arena;
        ptr           = (PObj *)pool->newfree;
        pool->newfree = (void *)((char *)pool->newfree + pool->object_size);
        ++arena->used;

        if (pool->newfree >= pool->newlast)
            pool->newfree = NULL;

        PARROT_ASSERT(ptr < (PObj *)pool->newlast);
    }
    else {
        (*pool->more_objects)(interp, mem_pools, pool);
        free_list = (PObj *)pool->free_list;
        goto HAVE_FREE;
    }

    --pool->num_free_objects;
    interp->gc_sys->stats.memory_used += pool->object_size;

    return ptr;
}


/*

=item C<static void gc_ms_alloc_objects(PARROT_INTERP, Memory_Pools *mem_pools,
Fixed_Size_Pool *pool)>

New arena allocator function for the MS garbage collector system. Allocates
and initializes a new memory arena in the given pool. Adds all the new
objects to the pool's free list for later allocation.

=cut

*/

static void
gc_ms_alloc_objects(PARROT_INTERP, ARGMOD(Memory_Pools *mem_pools), ARGMOD(Fixed_Size_Pool *pool))
{
    ASSERT_ARGS(gc_ms_alloc_objects)
    /* Setup memory for the new objects */

    Fixed_Size_Arena * const new_arena =
        mem_internal_allocate_typed(Fixed_Size_Arena);

    const size_t size = pool->object_size * pool->objects_per_alloc;
    size_t alloc_size;

    /* could be mem_internal_allocate too, but calloc is fast */
    new_arena->start_objects = mem_internal_allocate_zeroed(size);

    Parrot_append_arena_in_pool(interp, mem_pools, pool, new_arena, size);

    PARROT_ASSERT(pool->last_Arena);

    Parrot_add_to_free_list(interp, pool, new_arena);

    /* Allocate more next time */
    pool->objects_per_alloc *= GC_DEBUG_UNITS_PER_ALLOC_GROWTH_FACTOR;
    pool->replenish_level =
            (size_t)(pool->total_objects *
            GC_DEBUG_REPLENISH_LEVEL_FACTOR);

    /* check alloc size against maximum */
    alloc_size = pool->object_size * pool->objects_per_alloc;

    if (alloc_size > POOL_MAX_BYTES)
        pool->objects_per_alloc = POOL_MAX_BYTES / pool->object_size;
}


/*

=item C<static void gc_ms_block_GC_mark(PARROT_INTERP)>

Blocks the GC from performing its mark phase.

=item C<static void gc_ms_unblock_GC_mark(PARROT_INTERP)>

Unblocks the GC mark.

=item C<static void gc_ms_block_GC_sweep(PARROT_INTERP)>

Blocks the GC from performing its sweep phase.

=item C<static void gc_ms_unblock_GC_sweep(PARROT_INTERP)>

Unblocks GC sweep.

=item C<static unsigned int gc_ms_is_blocked_GC_mark(PARROT_INTERP)>

Determines if the GC mark is currently blocked.

=item C<static unsigned int gc_ms_is_blocked_GC_sweep(PARROT_INTERP)>

Determines if the GC sweep is currently blocked.

=cut

*/

static void
gc_ms_block_GC_mark(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms_block_GC_mark)
    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;
    ++mem_pools->gc_mark_block_level;
    Parrot_shared_gc_block(interp);
}

static void
gc_ms_unblock_GC_mark(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms_unblock_GC_mark)
    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;
    if (mem_pools->gc_mark_block_level) {
        --mem_pools->gc_mark_block_level;
        Parrot_shared_gc_unblock(interp);
    }
}

static void
gc_ms_block_GC_sweep(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms_block_GC_sweep)
    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;
    ++mem_pools->gc_sweep_block_level;
}

static void
gc_ms_unblock_GC_sweep(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms_unblock_GC_sweep)
    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;
    if (mem_pools->gc_sweep_block_level)
        --mem_pools->gc_sweep_block_level;
}

static unsigned int
gc_ms_is_blocked_GC_mark(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms_is_blocked_GC_mark)
    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;
    return mem_pools->gc_mark_block_level;
}

static unsigned int
gc_ms_is_blocked_GC_sweep(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms_is_blocked_GC_sweep)
    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;
    return mem_pools->gc_sweep_block_level;
}

/*

=item C<static size_t gc_ms_get_gc_info(PARROT_INTERP, Interpinfo_enum which)>

Get information about MS GC.

=cut

*/

static size_t
gc_ms_get_gc_info(PARROT_INTERP, Interpinfo_enum which)
{
    ASSERT_ARGS(gc_ms_get_gc_info)

    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;
    switch (which) {
        case ACTIVE_PMCS:
            return mem_pools->pmc_pool->total_objects -
                   mem_pools->pmc_pool->num_free_objects;
        case ACTIVE_BUFFERS:
            return gc_ms_active_sized_buffers(mem_pools);
        case TOTAL_PMCS:
            return mem_pools->pmc_pool->total_objects;
        case TOTAL_BUFFERS:
            return gc_ms_total_sized_buffers(mem_pools);
        case IMPATIENT_PMCS:
            return mem_pools->num_early_gc_PMCs;
        default:
            return Parrot_gc_get_info(interp, which, &interp->gc_sys->stats);
            break;
    }
    return 0;
}

/*
TODO Move it somewhere.
*/

/*

=item C<size_t Parrot_gc_get_info(PARROT_INTERP, Interpinfo_enum which,
GC_Statistics *stats)>

returns stats as required by enum which

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
size_t
Parrot_gc_get_info(SHIM_INTERP, Interpinfo_enum which, ARGIN(GC_Statistics *stats))
{
    ASSERT_ARGS(Parrot_gc_get_info)

    switch (which) {
        case TOTAL_MEM_ALLOC:
            return stats->memory_allocated;
        case TOTAL_MEM_USED:
            return stats->memory_used;
        case GC_MARK_RUNS:
            return stats->gc_mark_runs;
        case GC_COLLECT_RUNS:
            return stats->gc_collect_runs;
        case HEADER_ALLOCS_SINCE_COLLECT:
            return stats->header_allocs_since_last_collect;
        case MEM_ALLOCS_SINCE_COLLECT:
            return stats->mem_allocs_since_last_collect;
        case TOTAL_COPIED:
            return stats->memory_collected;
        case GC_LAZY_MARK_RUNS:
            return stats->gc_lazy_mark_runs;
        default:
            break;
    }
    return 0;
}

/*

=item C<static int gc_ms_active_sized_buffers(const Memory_Pools *mem_pools)>

Returns the number of actively used sized buffers.

=cut

*/

static int
gc_ms_active_sized_buffers(ARGIN(const Memory_Pools *mem_pools))
{
    ASSERT_ARGS(gc_ms_active_sized_buffers)
    int j, ret = 0;
    for (j = 0; j < (INTVAL)mem_pools->num_sized; ++j) {
        Fixed_Size_Pool * const header_pool =
            mem_pools->sized_header_pools[j];
        if (header_pool)
            ret += header_pool->total_objects -
                header_pool->num_free_objects;
    }
    return ret;
}

/*

=item C<static int gc_ms_total_sized_buffers(const Memory_Pools *mem_pools)>

Returns the total number of sized buffers that we are managing.

=cut

*/

static int
gc_ms_total_sized_buffers(ARGIN(const Memory_Pools *mem_pools))
{
    ASSERT_ARGS(gc_ms_total_sized_buffers)
    int j, ret = 0;
    for (j = 0; j < (INTVAL)mem_pools->num_sized; ++j) {
        Fixed_Size_Pool * const header_pool =
            mem_pools->sized_header_pools[j];
        if (header_pool)
            ret += header_pool->total_objects;
    }
    return ret;
}

/*
=item C<static void gc_ms_iterate_live_strings(PARROT_INTERP,
string_iterator_callback callback, void *data)>

Iterate over live string invoking callback for each of them. Used during
compacting of string pool.

=cut
*/
static void
gc_ms_iterate_live_strings(PARROT_INTERP,
        string_iterator_callback callback,
        ARGIN_NULLOK(void *data))
{
    ASSERT_ARGS(gc_ms_iterate_live_strings)

    Memory_Pools * const mem_pools = (Memory_Pools *)interp->gc_sys->gc_private;
    INTVAL j;

    /* Run through all the Buffer header pools and invoke callback */
    for (j = (INTVAL)mem_pools->num_sized - 1; j >= 0; --j) {
        Fixed_Size_Pool  * const header_pool = mem_pools->sized_header_pools[j];
        Fixed_Size_Arena       * cur_buffer_arena;
        UINTVAL       object_size;

        if (!header_pool)
            continue;

        object_size = header_pool->object_size;

        for (cur_buffer_arena = header_pool->last_Arena;
                cur_buffer_arena;
                cur_buffer_arena = cur_buffer_arena->prev) {
            Buffer *b = (Buffer *) cur_buffer_arena->start_objects;
            UINTVAL i;
            const size_t objects_end = cur_buffer_arena->used;

            for (i = objects_end; i; --i) {
                if (Buffer_buflen(b) && PObj_is_movable_TESTALL(b)) {
                    Memory_Block *old_block = Buffer_pool(b);
                    if (5 * (old_block->free + old_block->freed) >= old_block->size)
                        callback(interp, b, data);
                }
                b = (Buffer *)((char *)b + object_size);
            }
        }
    }
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
