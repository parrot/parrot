/*
Copyright (C) 2001-2010, Parrot Foundation.
$Id$

=head1 NAME

src/gc/gc_ms.c - Implementation of the basic mark & sweep collector

=head1 DESCRIPTION

This code implements the default mark and sweep garbage collector.

=cut

*/

#include "parrot/parrot.h"
#include "gc_private.h"

PARROT_DOES_NOT_RETURN
static void failed_allocation(unsigned int line, unsigned long size) /* HEADERIZER SKIP */
{
    fprintf(stderr, "Failed allocation of %lu bytes\n", size);
    do_panic(NULL, "Out of mem", __FILE__, line);
}

#define PANIC_OUT_OF_MEM(size) failed_allocation(__LINE__, (size))

/* HEADERIZER HFILE: src/gc/gc_private.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static int gc_ms_active_sized_buffers(ARGIN(const Memory_Pools *mem_pools))
        __attribute__nonnull__(1);

static void gc_ms_add_free_object(SHIM_INTERP,
    SHIM(Memory_Pools *mem_pools),
    ARGMOD(Fixed_Size_Pool *pool),
    ARGIN(void *to_add))
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*pool);

static void gc_ms_alloc_objects(PARROT_INTERP,
    ARGIN(Memory_Pools *mem_pools),
    ARGMOD(Fixed_Size_Pool *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pool);

static void gc_ms_allocate_buffer_storage(PARROT_INTERP,
    ARGOUT(Buffer *buffer),
    size_t size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*buffer);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static Buffer * gc_ms_allocate_bufferlike_header(PARROT_INTERP, size_t size)
        __attribute__nonnull__(1);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static void * gc_ms_allocate_memory_chunk(SHIM_INTERP, size_t size);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static void * gc_ms_allocate_memory_chunk_zeroed(SHIM_INTERP, size_t size);

PARROT_CAN_RETURN_NULL
static PMC* gc_ms_allocate_pmc_header(PARROT_INTERP, UINTVAL flags)
        __attribute__nonnull__(1);

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

static void gc_ms_free_memory_chunk(SHIM_INTERP, ARGFREE(void *data));
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
    ARGIN(Memory_Pools *mem_pools),
    ARGMOD(Fixed_Size_Pool *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pool);

static size_t gc_ms_get_gc_info(PARROT_INTERP, Interpinfo_enum which)
        __attribute__nonnull__(1);

static unsigned int gc_ms_is_blocked_GC_mark(PARROT_INTERP)
        __attribute__nonnull__(1);

static unsigned int gc_ms_is_blocked_GC_sweep(PARROT_INTERP)
        __attribute__nonnull__(1);

static void gc_ms_mark_and_sweep(PARROT_INTERP, UINTVAL flags)
        __attribute__nonnull__(1);

static void gc_ms_mark_special(PARROT_INTERP, ARGIN(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void gc_ms_more_traceable_objects(PARROT_INTERP,
    ARGIN(Memory_Pools *mem_pools),
    ARGMOD(Fixed_Size_Pool *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pool);

static void gc_ms_pool_init(SHIM_INTERP, ARGMOD(Fixed_Size_Pool *pool))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

static void gc_ms_reallocate_buffer_storage(PARROT_INTERP,
    ARGMOD(Buffer *buffer),
    size_t newsize)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*buffer);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static void * gc_ms_reallocate_memory_chunk(SHIM_INTERP,
    ARGFREE(void *from),
    size_t size);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static void * gc_ms_reallocate_memory_chunk_zeroed(SHIM_INTERP,
    ARGFREE(void *data),
    size_t newsize,
    size_t oldsize);

static void gc_ms_reallocate_string_storage(PARROT_INTERP,
    ARGMOD(STRING *str),
    size_t newsize)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*str);

static int gc_ms_sweep_cb(PARROT_INTERP,
    ARGIN(Memory_Pools *mem_pools),
    ARGMOD(Fixed_Size_Pool *pool),
    SHIM(int flag),
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

#define ASSERT_ARGS_gc_ms_active_sized_buffers __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(mem_pools))
#define ASSERT_ARGS_gc_ms_add_free_object __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool) \
    , PARROT_ASSERT_ARG(to_add))
#define ASSERT_ARGS_gc_ms_alloc_objects __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(mem_pools) \
    , PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_gc_ms_allocate_buffer_storage __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(buffer))
#define ASSERT_ARGS_gc_ms_allocate_bufferlike_header \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms_allocate_memory_chunk __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_ms_allocate_memory_chunk_zeroed \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
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
#define ASSERT_ARGS_gc_ms_mark_and_sweep __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms_mark_special __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_gc_ms_more_traceable_objects __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(mem_pools) \
    , PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_gc_ms_pool_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_gc_ms_reallocate_buffer_storage \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(buffer))
#define ASSERT_ARGS_gc_ms_reallocate_memory_chunk __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_ms_reallocate_memory_chunk_zeroed \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_ms_reallocate_string_storage \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(str))
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
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=head2 Primary MS Functions

=over 4

=item C<void Parrot_gc_ms_init(PARROT_INTERP)>

Initialize the state structures of the gc system. Called immediately before
creation of memory pools. This function must set the function pointers
for C<add_free_object_fn>, C<get_free_object_fn>, C<alloc_object_fn>, and
C<more_object_fn>.

=cut

*/

void
Parrot_gc_ms_init(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_ms_init)

    interp->mem_pools = mem_internal_allocate_zeroed_typed(Memory_Pools);
    interp->mem_pools->num_sized          = 0;
    interp->mem_pools->num_attribs        = 0;
    interp->mem_pools->attrib_pools       = NULL;
    interp->mem_pools->sized_header_pools = NULL;

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

    interp->gc_sys->allocate_pmc_attributes = gc_ms_allocate_pmc_attributes;
    interp->gc_sys->free_pmc_attributes     = gc_ms_free_pmc_attributes;

    interp->gc_sys->allocate_string_storage = gc_ms_allocate_string_storage;
    interp->gc_sys->reallocate_string_storage = gc_ms_reallocate_string_storage;

    interp->gc_sys->allocate_buffer_storage = gc_ms_allocate_buffer_storage;
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

    initialize_var_size_pools(interp, interp->mem_pools);
    initialize_fixed_size_pools(interp, interp->mem_pools);
    Parrot_gc_initialize_fixed_size_pools(interp, interp->mem_pools,
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

    /* buffer headers, PMCs */
    Parrot_gc_destroy_header_pools(interp, interp->mem_pools);

    /* memory pools in resources */
    Parrot_gc_destroy_memory_pools(interp, interp->mem_pools);

    /* mem subsystem is dead now */
    mem_internal_free(interp->mem_pools);
    interp->mem_pools = NULL;
}

/*

=item C<static void gc_ms_destroy_child_interp(Interp *dest_interp, Interp
*source_interp)>

Merges the header pools of C<source_interp> into those of C<dest_interp>.
(Used to deal with shared objects left after interpreter destruction.)

=cut

*/

static void
gc_ms_destroy_child_interp(ARGMOD(Interp *dest_interp),
    ARGIN(Interp *source_interp))
{
    ASSERT_ARGS(gc_ms_destroy_child_interp)

    Memory_Pools * const dest_arena   = dest_interp->mem_pools;
    Memory_Pools * const source_arena = source_interp->mem_pools;
    Parrot_gc_merge_memory_pools(dest_interp, dest_arena, source_arena);
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
    Memory_Pools * const mem_pools = interp->mem_pools;
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
    Parrot_gc_run_init(interp, interp->mem_pools);

    /* compact STRING pools to collect free headers and allocated buffers */
    Parrot_gc_compact_memory_pool(interp);

    /* Now go trace the PMCs. returning true means we did a complete trace.
       false means it was a lazy trace. */
    if (gc_ms_trace_active_PMCs(interp, (flags & GC_trace_stack_FLAG)
        ? GC_TRACE_FULL : GC_TRACE_ROOT_ONLY)) {

        mem_pools->gc_trace_ptr = NULL;
        mem_pools->gc_mark_ptr  = NULL;

        /* We've done the mark, now do the sweep. Pass the sweep callback
           function to the PMC pool and all the sized pools. */
        header_pools_iterate_callback(interp, interp->mem_pools, POOL_BUFFER | POOL_PMC,
            (void*)&total_free, gc_ms_sweep_cb);

    }
    else {
        ++mem_pools->gc_lazy_mark_runs;

        Parrot_gc_clear_live_bits(interp, mem_pools->pmc_pool);
    }

    pt_gc_stop_mark(interp);

    /* Note it */
    mem_pools->gc_mark_runs++;
    --mem_pools->gc_mark_block_level;
    mem_pools->header_allocs_since_last_collect = 0;

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
    compact_pool(interp, interp->mem_pools, interp->mem_pools->memory_pool);
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
    mark_special(interp, interp->mem_pools, pmc);
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
    PObj_needs_early_gc_SET(pmc);
    ++interp->mem_pools->num_early_gc_PMCs;
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

    Fixed_Size_Pool * const pool = flags & PObj_constant_FLAG
            ? interp->mem_pools->constant_pmc_pool
            : interp->mem_pools->pmc_pool;

    return (PMC*)pool->get_free_object(interp, interp->mem_pools, pool);
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
    Fixed_Size_Pool * const pool = (PObj_constant_TEST(pmc)) ?
        interp->mem_pools->constant_pmc_pool : interp->mem_pools->pmc_pool;

    Parrot_pmc_destroy(interp, pmc);

    PObj_flags_SETTO((PObj *)pmc, PObj_on_free_list_FLAG);
    pool->add_free_object(interp, interp->mem_pools, pool, (PObj *)pmc);
    pool->num_free_objects++;
}

/*

=item C<static STRING* gc_ms_allocate_string_header(PARROT_INTERP, UINTVAL
flags)>

Allocate new STRING header from pool.

=cut

*/
PARROT_CAN_RETURN_NULL
static STRING*
gc_ms_allocate_string_header(PARROT_INTERP, UINTVAL flags)
{
    ASSERT_ARGS(gc_ms_allocate_string_header)

    Fixed_Size_Pool * const pool = flags & PObj_constant_FLAG
            ? interp->mem_pools->constant_string_header_pool
            : interp->mem_pools->string_header_pool;

    return (STRING *)pool->get_free_object(interp, interp->mem_pools, pool);
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
    if (!PObj_constant_TEST(s)) {
        Fixed_Size_Pool * const pool = interp->mem_pools->string_header_pool;
        PObj_flags_SETTO((PObj *)s, PObj_on_free_list_FLAG);
        pool->add_free_object(interp, interp->mem_pools, pool, s);
        pool->num_free_objects++;
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

    Fixed_Size_Pool * const pool = get_bufferlike_pool(interp, interp->mem_pools, size);

    return (Buffer *)pool->get_free_object(interp, interp->mem_pools, pool);
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
    Fixed_Size_Pool * const pool = get_bufferlike_pool(interp, interp->mem_pools, size);
    pool->add_free_object(interp, interp->mem_pools, pool, obj);
}

/*

=item C<void * gc_ms_allocate_pmc_attributes(PARROT_INTERP, PMC *pmc)>

Allocates a new attribute structure for a PMC if it has the auto_attrs flag
set.

=cut

*/

PARROT_CANNOT_RETURN_NULL
void *
gc_ms_allocate_pmc_attributes(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(gc_ms_allocate_pmc_attributes)
    const size_t attr_size = pmc->vtable->attr_size;
#if GC_USE_FIXED_SIZE_ALLOCATOR
    PMC_Attribute_Pool * const pool = Parrot_gc_get_attribute_pool(interp,
            interp->mem_pools, attr_size);
    void * const attrs = Parrot_gc_get_attributes_from_pool(interp, pool);
    memset(attrs, 0, attr_size);
    PMC_data(pmc) = attrs;
    return attrs;
#else
    void * const data =  gc_ms_allocate_memory_chunk(attr_size);
    PMC_data(pmc) = data;
    return data;
#endif
}

/*

=item C<void gc_ms_free_pmc_attributes(PARROT_INTERP, PMC *pmc)>

Deallocates an attibutes structure from a PMC if it has the auto_attrs
flag set.

*/

void
gc_ms_free_pmc_attributes(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(gc_ms_free_pmc_attributes)
    void * const data = PMC_data(pmc);

    if (data) {

#if GC_USE_FIXED_SIZE_ALLOCATOR
        const size_t attr_size = pmc->vtable->attr_size;
        const size_t item_size = attr_size < sizeof (void *) ? sizeof (void *) : attr_size;
        PMC_Attribute_Pool ** const pools = interp->mem_pools->attrib_pools;
        const size_t idx = item_size - sizeof (void *);
        gc_ms_free_attributes_from_pool(pools[idx], data);
#else
        gc_ms_free_memory_chunk(intepr, PMC_data(pmc));
        PMC_data(pmc) = NULL;
#endif
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

    item->next      = pool->free_list;
    pool->free_list = item;

    pool->num_free_objects++;
}

/*

=item C<static void gc_ms_allocate_buffer_storage(PARROT_INTERP, Buffer *buffer,
size_t size)>

Allocates a chunk of memory of at least size C<size> for the given Buffer.
buffer is guaranteed to be properly aligned for things like C<FLOATVALS>,
so the size may be rounded up or down to guarantee that this alignment holds.

=cut

*/

static void
gc_ms_allocate_buffer_storage(PARROT_INTERP,
    ARGOUT(Buffer *buffer), size_t size)
{
    ASSERT_ARGS(gc_ms_allocate_buffer_storage)
    size_t new_size;
    char *mem;

    Buffer_buflen(buffer) = 0;
    Buffer_bufstart(buffer) = NULL;
    new_size = aligned_string_size(size);
    mem = (char *)mem_allocate(interp, interp->mem_pools, new_size,
        interp->mem_pools->memory_pool);
    mem = aligned_mem(buffer, mem);
    Buffer_bufstart(buffer) = mem;
    new_size -= sizeof (void*);
    Buffer_buflen(buffer) = new_size;
}

/*

=item C<static void gc_ms_reallocate_buffer_storage(PARROT_INTERP, Buffer
*buffer, size_t newsize)>

Reallocate the Buffer's buffer memory to the given size. The
allocated buffer will not shrink. If the buffer was allocated with
L<Parrot_allocate_aligned> the new buffer will also be aligned. As with
all reallocation, the new buffer might have moved and the additional
memory is not cleared.

=cut

*/

static void
gc_ms_reallocate_buffer_storage(PARROT_INTERP, ARGMOD(Buffer *buffer),
    size_t newsize)
{
    ASSERT_ARGS(gc_ms_reallocate_buffer_storage)
    size_t copysize;
    char  *mem;
    Variable_Size_Pool * const pool = interp->mem_pools->memory_pool;
    size_t new_size, needed, old_size;

    /* we don't shrink buffers */
    if (newsize <= Buffer_buflen(buffer))
        return;

    /*
     * same as below but barely used and tested - only 3 list related
     * tests do use true reallocation
     *
     * list.c, which does _reallocate, has 2 reallocations
     * normally, which play ping pong with buffers.
     * The normal case is therefore always to allocate a new block
     */
    new_size = aligned_string_size(newsize);
    old_size = aligned_string_size(Buffer_buflen(buffer));
    needed   = new_size - old_size;

    if ((pool->top_block->free >= needed)
    &&  (pool->top_block->top  == (char *)Buffer_bufstart(buffer) + old_size)) {
        pool->top_block->free -= needed;
        pool->top_block->top  += needed;
        Buffer_buflen(buffer) = newsize;
        return;
    }

    copysize = Buffer_buflen(buffer);

    if (!PObj_COW_TEST(buffer))
        pool->guaranteed_reclaimable += copysize;
    else
        pool->possibly_reclaimable   += copysize;

    mem = (char *)mem_allocate(interp, interp->mem_pools, new_size, pool);
    mem = aligned_mem(buffer, mem);

    /* We shouldn't ever have a 0 from size, but we do. If we can track down
     * those bugs, this can be removed which would make things cheaper */
    if (copysize)
        memcpy(mem, Buffer_bufstart(buffer), copysize);

    Buffer_bufstart(buffer) = mem;

    new_size -= sizeof (void *);

    Buffer_buflen(buffer) = new_size;
}

/*

=item C<void gc_ms_allocate_string_storage(PARROT_INTERP, STRING *str, size_t
size)>

Allocate the STRING's buffer memory to the given size. The allocated
buffer maybe slightly bigger than the given C<size>. This function
sets also C<< str->strstart >> to the new buffer location, C<< str->bufused >>
is B<not> changed.

=cut

*/

void
gc_ms_allocate_string_storage(PARROT_INTERP, ARGOUT(STRING *str),
    size_t size)
{
    ASSERT_ARGS(gc_ms_allocate_string_storage)
    size_t       new_size;
    Variable_Size_Pool *pool;
    char        *mem;

    Buffer_buflen(str)   = 0;
    Buffer_bufstart(str) = NULL;

    if (size == 0)
        return;

    pool     = PObj_constant_TEST(str)
                ? interp->mem_pools->constant_string_pool
                : interp->mem_pools->memory_pool;

    new_size = aligned_string_size(size);
    mem      = (char *)mem_allocate(interp, interp->mem_pools, new_size, pool);
    mem     += sizeof (void*);

    Buffer_bufstart(str) = str->strstart = mem;
    Buffer_buflen(str)   = new_size - sizeof (void*);
}

/*

=item C<static void gc_ms_reallocate_string_storage(PARROT_INTERP, STRING *str,
size_t newsize)>

Reallocate the STRING's buffer memory to the given size. The allocated
buffer will not shrink. This function sets also C<str-E<gt>strstart> to the
new buffer location, C<str-E<gt>bufused> is B<not> changed.

=cut

*/

static void
gc_ms_reallocate_string_storage(PARROT_INTERP, ARGMOD(STRING *str),
    size_t newsize)
{
    ASSERT_ARGS(gc_ms_reallocate_string_storage)
    size_t copysize;
    char *mem, *oldmem;
    size_t new_size, needed, old_size;

    Variable_Size_Pool * const pool =
        PObj_constant_TEST(str)
            ? interp->mem_pools->constant_string_pool
            : interp->mem_pools->memory_pool;

    /* if the requested size is smaller then buflen, we are done */
    if (newsize <= Buffer_buflen(str))
        return;

    /*
     * first check, if we can reallocate:
     * - if the passed strings buffer is the last string in the pool and
     * - if there is enough size, we can just move the pool's top pointer
     */
    new_size = aligned_string_size(newsize);
    old_size = aligned_string_size(Buffer_buflen(str));
    needed   = new_size - old_size;

    if (pool->top_block->free >= needed
    &&  pool->top_block->top  == (char *)Buffer_bufstart(str) + old_size) {
        pool->top_block->free -= needed;
        pool->top_block->top  += needed;
        Buffer_buflen(str) = new_size - sizeof (void*);
        return;
    }

    PARROT_ASSERT(str->bufused <= newsize);

    /* only copy used memory, not total string buffer */
    copysize = str->bufused;

    if (!PObj_COW_TEST(str))
        pool->guaranteed_reclaimable += Buffer_buflen(str);
    else
        pool->possibly_reclaimable   += Buffer_buflen(str);

    mem = (char *)mem_allocate(interp, interp->mem_pools, new_size, pool);
    mem += sizeof (void *);

    /* copy mem from strstart, *not* bufstart */
    oldmem             = str->strstart;
    Buffer_bufstart(str) = (void *)mem;
    str->strstart      = mem;
    Buffer_buflen(str)   = new_size - sizeof (void*);

    /* We shouldn't ever have a 0 from size, but we do. If we can track down
     * those bugs, this can be removed which would make things cheaper */
    if (copysize)
        memcpy(mem, oldmem, copysize);
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
    PMC_Attribute_Pool *pool = NULL;
    const size_t idx = (size < sizeof (void *)) ? 0 : (size - sizeof (void *));

    /* get the pool directly, if possible, for great speed */
    if (interp->mem_pools->num_attribs > idx)
        pool = interp->mem_pools->attrib_pools[idx];

    /* otherwise create it */
    if (!pool)
        pool = Parrot_gc_get_attribute_pool(interp, interp->mem_pools, size);

    return Parrot_gc_get_attributes_from_pool(interp, pool);
}

/*

=item C<void gc_ms_free_fixed_size_storage(PARROT_INTERP, size_t size, void
*data)>

Manually deallocates fixed size storage allocated with
C<gc_ms_allocate_fixed_size_storage>

*/

void
gc_ms_free_fixed_size_storage(PARROT_INTERP, size_t size, ARGMOD(void *data))
{
    ASSERT_ARGS(gc_ms_free_fixed_size_storage)

    const size_t idx   = size - sizeof (void *);
    PMC_Attribute_Pool ** const pools = interp->mem_pools->attrib_pools;
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
PARROT_CANNOT_RETURN_NULL
static void *
gc_ms_allocate_memory_chunk(SHIM_INTERP, size_t size)
{
    ASSERT_ARGS(gc_ms_allocate_memory_chunk)
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
    if (!ptr)
        PANIC_OUT_OF_MEM(size);
    return ptr;
}

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static void *
gc_ms_allocate_memory_chunk_zeroed(SHIM_INTERP, size_t size)
{
    ASSERT_ARGS(gc_ms_allocate_memory_chunk_zeroed)
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

    if (!Parrot_gc_trace_root(interp, interp->mem_pools, trace))
        return 0;

    pt_gc_mark_root_finished(interp);
    interp->mem_pools->gc_trace_ptr  = NULL;
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
        ARGIN(Memory_Pools *mem_pools),
        ARGMOD(Fixed_Size_Pool *pool))
{
    ASSERT_ARGS(gc_ms_more_traceable_objects)

    if (pool->skip == GC_ONE_SKIP)
        pool->skip = GC_NO_SKIP;
    else if (pool->skip == GC_NEVER_SKIP
         || (pool->skip == GC_NO_SKIP
         &&  mem_pools->header_allocs_since_last_collect >= GC_SIZE_THRESHOLD))
            Parrot_gc_mark_and_sweep(interp, GC_trace_stack_FLAG);

    /* requires that num_free_objects be updated in Parrot_gc_mark_and_sweep.
       If gc is disabled, then we must check the free list directly. */
#if GC_USE_LAZY_ALLOCATOR
    if ((!pool->free_list || pool->num_free_objects < pool->replenish_level)
        && !pool->newfree)
        (*pool->alloc_objects) (interp, interp->mem_pools, pool);
#else
    if (!pool->free_list || pool->num_free_objects < pool->replenish_level)
    (*pool->alloc_objects) (interp, interp->mem_pools, pool);
#endif
}

/*

=item C<static void gc_ms_add_free_object(PARROT_INTERP, Memory_Pools
*mem_pools, Fixed_Size_Pool *pool, void *to_add)>

Add an unused object back to the pool's free list for later reuse. Set
the PObj flags to indicate that the item is free.

=cut

*/

static void
gc_ms_add_free_object(SHIM_INTERP,
        SHIM(Memory_Pools *mem_pools),
        ARGMOD(Fixed_Size_Pool *pool),
        ARGIN(void *to_add))
{
    ASSERT_ARGS(gc_ms_add_free_object)
    GC_MS_PObj_Wrapper *object = (GC_MS_PObj_Wrapper *)to_add;

    PObj_flags_SETTO(object, PObj_on_free_list_FLAG);

    object->next_ptr = pool->free_list;
    pool->free_list  = object;
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
        ARGIN(Memory_Pools *mem_pools),
        ARGMOD(Fixed_Size_Pool *pool))
{
    ASSERT_ARGS(gc_ms_get_free_object)
    PObj *ptr;
    PObj *free_list = (PObj *)pool->free_list;

#if GC_USE_LAZY_ALLOCATOR
    if (!free_list && !pool->newfree) {
        (*pool->more_objects)(interp, mem_pools, pool);
        free_list = (PObj *)pool->free_list;
    }

    if (free_list) {
        ptr             = free_list;
        pool->free_list = ((GC_MS_PObj_Wrapper *)ptr)->next_ptr;
    }
    else {
        Fixed_Size_Arena * const arena = pool->last_Arena;
        ptr           = (PObj *)pool->newfree;
        pool->newfree = (void *)((char *)pool->newfree + pool->object_size);
        arena->used++;

        if (pool->newfree >= pool->newlast)
            pool->newfree = NULL;

        PARROT_ASSERT(ptr < (PObj *)pool->newlast);
    }
#else
    /* if we don't have any objects */
    if (!free_list) {
        (*pool->more_objects)(interp, mem_pools, pool);
        free_list = (PObj *)pool->free_list;
    }

    ptr             = free_list;
    pool->free_list = ((GC_MS_PObj_Wrapper*)ptr)->next_ptr;
#endif

    /* PObj_flags_SETTO(ptr, 0); */
    memset(ptr, 0, pool->object_size);

    --pool->num_free_objects;

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
gc_ms_alloc_objects(PARROT_INTERP,
        ARGIN(Memory_Pools *mem_pools),
        ARGMOD(Fixed_Size_Pool *pool))
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
    if (GC_DEBUG(interp)) {
        pool->objects_per_alloc *= GC_DEBUG_UNITS_PER_ALLOC_GROWTH_FACTOR;
        pool->replenish_level =
                (size_t)(pool->total_objects *
                GC_DEBUG_REPLENISH_LEVEL_FACTOR);
    }
    else {
        pool->objects_per_alloc = (size_t)(pool->objects_per_alloc *
            UNITS_PER_ALLOC_GROWTH_FACTOR);
        pool->replenish_level   =
                (size_t)(pool->total_objects * REPLENISH_LEVEL_FACTOR);
    }

    /* check alloc size against maximum */
    alloc_size = pool->object_size * pool->objects_per_alloc;

    if (alloc_size > POOL_MAX_BYTES)
        pool->objects_per_alloc = POOL_MAX_BYTES / pool->object_size;

    if (alloc_size > GC_SIZE_THRESHOLD)
        pool->skip = GC_NEVER_SKIP;
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
    interp->mem_pools->gc_mark_block_level++;
    Parrot_shared_gc_block(interp);
}

static void
gc_ms_unblock_GC_mark(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms_unblock_GC_mark)
    if (interp->mem_pools->gc_mark_block_level) {
        interp->mem_pools->gc_mark_block_level--;
        Parrot_shared_gc_unblock(interp);
    }
}

static void
gc_ms_block_GC_sweep(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms_block_GC_sweep)
    interp->mem_pools->gc_sweep_block_level++;
}

static void
gc_ms_unblock_GC_sweep(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms_unblock_GC_sweep)
    if (interp->mem_pools->gc_sweep_block_level)
        interp->mem_pools->gc_sweep_block_level--;
}

static unsigned int
gc_ms_is_blocked_GC_mark(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms_is_blocked_GC_mark)
    return interp->mem_pools->gc_mark_block_level;
}

static unsigned int
gc_ms_is_blocked_GC_sweep(PARROT_INTERP)
{
    ASSERT_ARGS(gc_ms_is_blocked_GC_sweep)
    return interp->mem_pools->gc_sweep_block_level;
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

    Memory_Pools * const mem_pools = interp->mem_pools;
    switch (which) {
        case TOTAL_MEM_ALLOC:
            return mem_pools->memory_allocated;
        case GC_MARK_RUNS:
            return mem_pools->gc_mark_runs;
        case GC_COLLECT_RUNS:
            return mem_pools->gc_collect_runs;
        case ACTIVE_PMCS:
            return mem_pools->pmc_pool->total_objects -
                   mem_pools->pmc_pool->num_free_objects;
        case ACTIVE_BUFFERS:
            return gc_ms_active_sized_buffers(mem_pools);
        case TOTAL_PMCS:
            return mem_pools->pmc_pool->total_objects;
        case TOTAL_BUFFERS:
            return gc_ms_total_sized_buffers(mem_pools);
        case HEADER_ALLOCS_SINCE_COLLECT:
            return mem_pools->header_allocs_since_last_collect;
        case MEM_ALLOCS_SINCE_COLLECT:
            return mem_pools->mem_allocs_since_last_collect;
        case TOTAL_COPIED:
            return mem_pools->memory_collected;
        case IMPATIENT_PMCS:
            return mem_pools->num_early_gc_PMCs;
        case GC_LAZY_MARK_RUNS:
            return mem_pools->gc_lazy_mark_runs;
        case EXTENDED_PMCS:
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
    for (j = 0; j < (INTVAL)mem_pools->num_sized; j++) {
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
    for (j = 0; j < (INTVAL)mem_pools->num_sized; j++) {
        Fixed_Size_Pool * const header_pool =
            mem_pools->sized_header_pools[j];
        if (header_pool)
            ret += header_pool->total_objects;
    }
    return ret;
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
