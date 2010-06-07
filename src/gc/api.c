/*
Copyright (C) 2001-2010, Parrot Foundation.
$Id$

=head1 NAME

src/gc/api.c - general Parrot API for GC functions

=head1 DESCRIPTION

This file implements the external-facing API for Parrot's garbage collector.
The collector itself is composed of various interchangable cores that each
may operate very differently internally. The functions in this file can be used
throughout Parrot without having to be concerned about the internal operations
of the GC. This is documented in PDD 9 with supplementary notes in
F<docs/memory_internals.pod>.

=head1 GC OVERVIEW

The GC is broken into a number of different files that each represent different
components.

=over 4

=item F<src/gc/api.c>

This is the main API file which provides access to functions which are used by
the rest of Parrot core. In the long term, only the functions provided in this
file should be visible to files outside the src/gc/ directory. Because this
represents a public-facing API, the functions in this file are not related by
theme.

=item F<src/gc/alloc_memory.c>

This file provides a number of functions and macros for allocating memory from
the OS. These are typically wrapper functions with error-handling capabilities
over malloc, calloc, or realloc.

=item F<src/gc/alloc_register.c>

This file implements the custom management and interface logic for
Parrot_Context structures. The functions in this file are publicly available
and are used throughout Parrot core for interacting with contexts and registers

=item F<src/gc/alloc_resources.c>

This file implements handling logic for strings and arbitrary-sized memory
buffers. String storage is managed by special Variable_Size_Pool structures, and use
a separate compacting garbage collector to keep track of them.

=item F<src/gc/incremental_ms.c>

=item F<src/gc/generational_ms.c>

=item F<src/gc/gc_ms.c>

These files are the individual GC cores which implement the primary tracing
and sweeping logic. gc_ms.c is the mark & sweep collector core which is used in
Parrot by default. generational_ms.c is an experimental and incomplete
generational core.  incremental_ms.c is an experimental and incomplete
incremental collector core.

=item F<src/gc/mark_sweep.c>

This file implements some routines that are commonly needed by the various GC
cores and provide an abstraction layer that a GC core can use to interact with
some of the architecture of Parrot.

=item F<src/gc/system.c>

This file implements logic for tracing processor registers and the system stack.
Here there be dragons.

=item F<src/gc/malloc.c>

=item F<src/gc/malloc_trace.c>

These two files implement various unused features, including a custom malloc
implementation, and malloc wrappers for various purposes. These are unused.

=back


=head1 FUNCTIONS

=over 4

=cut

*/

#define GC_C_SOURCE
#include "parrot/parrot.h"
#include "parrot/gc_api.h"
#include "../string/grapheme.h"
#include "gc_private.h"

/* HEADERIZER HFILE: include/parrot/gc_api.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

#if ! DISABLE_GC_DEBUG

#endif

/*

=item C<void Parrot_gc_mark_PObj_alive(PARROT_INTERP, PObj *obj)>

Marks the PObj as "alive" for the Garbage Collector. Takes a pointer to a PObj,
and performs necessary marking to ensure the PMC and its direct children nodes
are marked alive. Implementation is generally dependant on the particular
garbage collector in use.

Previously known as C<pobject_lives>.

=cut

*/

PARROT_EXPORT
void
Parrot_gc_mark_PObj_alive(PARROT_INTERP, ARGMOD(PObj *obj))
{
    ASSERT_ARGS(Parrot_gc_mark_PObj_alive)
    /* TODO: Have each core register a ->pobject_lives function pointer in the
       Memory_Pools struct, and call that pointer directly instead of having a messy
       set of #if preparser conditions. */

    /* if object is live or on free list return */
    if (PObj_is_live_or_free_TESTALL(obj))
        return;

    /* mark it live */
    PObj_live_SET(obj);

    /* if object is a PMC and contains buffers or PMCs, then attach the PMC
     * to the chained mark list. */
    if (PObj_is_PMC_TEST(obj)) {
        PMC * const p = (PMC *)obj;

        if (PObj_is_special_PMC_TEST(obj))
            interp->gc_sys->mark_special(interp, p);

        else if (PMC_metadata(p))
            Parrot_gc_mark_PMC_alive(interp, PMC_metadata(p));
    }
}

/*

=item C<void Parrot_gc_mark_PMC_alive_fun(PARROT_INTERP, PMC *obj)>

A type safe wrapper of Parrot_gc_mark_PObj_alive for PMC.

=cut

*/

PARROT_EXPORT
void
Parrot_gc_mark_PMC_alive_fun(PARROT_INTERP, ARGMOD_NULLOK(PMC *obj))
{
    ASSERT_ARGS(Parrot_gc_mark_PMC_alive_fun)
    if (!PMC_IS_NULL(obj)) {
        PARROT_ASSERT(PObj_is_PMC_TEST(obj));

        if (PObj_is_live_or_free_TESTALL(obj))
            return;

        /* mark it live */
        PObj_live_SET(obj);

        /* if object is a PMC and contains buffers or PMCs, then attach the PMC
         * to the chained mark list. */
        if (PObj_is_special_PMC_TEST(obj)) {
            if (PObj_custom_mark_TEST(obj))
                VTABLE_mark(interp, obj);
        }

        if (PMC_metadata(obj))
            Parrot_gc_mark_PMC_alive(interp, PMC_metadata(obj));
    }
}

/*

=item C<void Parrot_gc_mark_STRING_alive_fun(PARROT_INTERP, STRING *obj)>

A type safe wrapper of Parrot_gc_mark_PObj_alive for STRING.

=cut

*/

PARROT_EXPORT
void
Parrot_gc_mark_STRING_alive_fun(SHIM_INTERP, ARGMOD_NULLOK(STRING *obj))
{
    ASSERT_ARGS(Parrot_gc_mark_STRING_alive_fun)
    if (!STRING_IS_NULL(obj)) {
        PARROT_ASSERT(PObj_is_string_TEST(obj));

        /* mark it live */
        PObj_live_SET(obj);
    }
}

/*

=item C<void Parrot_gc_initialize(PARROT_INTERP, void *stacktop)>

Initializes the memory allocator and the garbage collection subsystem.
Calls the initialization function associated with each collector, which
is determined at compile time.

The "stacktop" parameter is required; it provides an upper bound for
stack scanning during a garbage collection run.

=cut

*/

void
Parrot_gc_initialize(PARROT_INTERP, ARGIN(void *stacktop))
{
    ASSERT_ARGS(Parrot_gc_initialize)

    interp->lo_var_ptr                    = stacktop;

    /*Call appropriate initialization function for GC subsystem*/
    switch (interp->gc_sys->sys_type) {
      case MS:
        Parrot_gc_ms_init(interp);
        break;
      case INF:
        Parrot_gc_inf_init(interp);
        break;
      default:
        /*die horribly because of invalid GC core specified*/
        break;
    };

    /* Assertions that GC subsystem has complete API */
    PARROT_ASSERT(interp->gc_sys->do_gc_mark);
    PARROT_ASSERT(interp->gc_sys->compact_string_pool);

    /* It should be mandatory. But there is abstraction leak in */
    /* mark_foo_alive. */
    /* PARROT_ASSERT(interp->gc_sys->mark_special); */

    PARROT_ASSERT(interp->gc_sys->allocate_pmc_header);
    PARROT_ASSERT(interp->gc_sys->free_pmc_header);

    PARROT_ASSERT(interp->gc_sys->allocate_string_header);
    PARROT_ASSERT(interp->gc_sys->free_string_header);

    PARROT_ASSERT(interp->gc_sys->allocate_bufferlike_header);
    PARROT_ASSERT(interp->gc_sys->free_bufferlike_header);

    PARROT_ASSERT(interp->gc_sys->allocate_pmc_attributes);
    PARROT_ASSERT(interp->gc_sys->free_pmc_attributes);

    PARROT_ASSERT(interp->gc_sys->allocate_string_storage);
    PARROT_ASSERT(interp->gc_sys->reallocate_string_storage);

    PARROT_ASSERT(interp->gc_sys->allocate_buffer_storage);
    PARROT_ASSERT(interp->gc_sys->reallocate_buffer_storage);

    PARROT_ASSERT(interp->gc_sys->allocate_fixed_size_storage);
    PARROT_ASSERT(interp->gc_sys->free_fixed_size_storage);

    PARROT_ASSERT(interp->gc_sys->allocate_memory_chunk);
    PARROT_ASSERT(interp->gc_sys->reallocate_memory_chunk);
    PARROT_ASSERT(interp->gc_sys->allocate_memory_chunk_with_interior_pointers);
    PARROT_ASSERT(interp->gc_sys->reallocate_memory_chunk_with_interior_pointers);
    PARROT_ASSERT(interp->gc_sys->free_memory_chunk);

    PARROT_ASSERT(interp->gc_sys->get_gc_info);
}

/*

=item C<void Parrot_gc_finalize(PARROT_INTERP)>

Finalize the GC system, if the current GC core has defined a finalization
routine.

=cut

*/

void
Parrot_gc_finalize(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_finalize)
    if (interp->gc_sys->finalize_gc_system)
        interp->gc_sys->finalize_gc_system(interp);

    mem_internal_free(interp->gc_sys);
    interp->gc_sys = NULL;
}


/*

=item C<PMC * Parrot_gc_new_pmc_header(PARROT_INTERP, UINTVAL flags)>

Gets a new PMC header from the PMC pool's free list. Guaranteed to return a
valid PMC object or else Parrot will throw an exception. Sets the necessary
flags for the objects and initializes the PMC data pointer to C<NULL>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_gc_new_pmc_header(PARROT_INTERP, UINTVAL flags)
{
    ASSERT_ARGS(Parrot_gc_new_pmc_header)
    PMC * const pmc = interp->gc_sys->allocate_pmc_header(interp, flags);

    if (!pmc)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_ALLOCATION_ERROR,
            "Parrot VM: PMC allocation failed!\n");

    PObj_get_FLAGS(pmc) = PObj_is_PMC_FLAG|flags;
    pmc->vtable         = NULL;
    PMC_data(pmc)       = NULL;
    PMC_metadata(pmc)   = PMCNULL;

    return pmc;
}

/*

=item C<void Parrot_gc_free_pmc_header(PARROT_INTERP, PMC *pmc)>

Adds the given PMC to the free list for later reuse.

=cut

*/

void
Parrot_gc_free_pmc_header(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(Parrot_gc_free_pmc_header)
    interp->gc_sys->free_pmc_header(interp, pmc);
}

/*

=item C<STRING * Parrot_gc_new_string_header(PARROT_INTERP, UINTVAL flags)>

Returns a new C<STRING> header from the string pool or the constant string
pool. Sets default flags on the string object: C<PObj_is_string_FLAG>,
C<PObj_is_COWable_FLAG>, and C<PObj_live_FLAG> (for GC). Initializes the data
field of the string buffer to C<NULL>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
Parrot_gc_new_string_header(PARROT_INTERP, UINTVAL flags)
{
    ASSERT_ARGS(Parrot_gc_new_string_header)

    STRING * const string = interp->gc_sys->allocate_string_header(interp, flags);
    if (!string)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_ALLOCATION_ERROR,
            "Parrot VM: STRING allocation failed!\n");

    string->strstart        = NULL;
    PObj_get_FLAGS(string) |=
        flags | PObj_is_string_FLAG | PObj_is_COWable_FLAG | PObj_live_FLAG;

    return string;
}

/*

=item C<void Parrot_gc_free_string_header(PARROT_INTERP, STRING *s)>

Adds the given STRING to the free list for later reuse.

=cut

*/

void
Parrot_gc_free_string_header(PARROT_INTERP, ARGMOD(STRING *s))
{
    ASSERT_ARGS(Parrot_gc_free_string_header)
    if (s->encoding == Parrot_nfg_encoding_ptr && s->extra != NULL)
        destroy_grapheme_table(interp, s->extra);
    interp->gc_sys->free_string_header(interp, s);
}

/*

=item C<Buffer * Parrot_gc_new_bufferlike_header(PARROT_INTERP, size_t size)>

Returns a new buffer-like header from the appropriate sized pool.
A "bufferlike object" is an object that is considered to be isomorphic to the
PObj, so it will participate in normal GC. At the moment these are only used
to create ListChunk objects in src/list.c.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
Buffer *
Parrot_gc_new_bufferlike_header(PARROT_INTERP, size_t size)
{
    ASSERT_ARGS(Parrot_gc_new_bufferlike_header)
    return interp->gc_sys->allocate_bufferlike_header(interp, size);
}

/*

=item C<void Parrot_gc_free_bufferlike_header(PARROT_INTERP, Buffer *obj, size_t
size)>

Free a bufferlike header that is not being used, so that Parrot can recycle
it and use it again.

=cut

*/

void
Parrot_gc_free_bufferlike_header(PARROT_INTERP, ARGMOD(Buffer *obj),
    size_t size)
{
    ASSERT_ARGS(Parrot_gc_free_bufferlike_header)
    interp->gc_sys->free_bufferlike_header(interp, obj, size);
}

/*

=item C<void Parrot_gc_allocate_buffer_storage_aligned(PARROT_INTERP, Buffer
*buffer, size_t size)>

Allocates a chunk of memory of at least size C<size> for the given Buffer.
buffer is guaranteed to be properly aligned for things like C<FLOATVALS>,
so the size may be rounded up or down to guarantee that this alignment holds.

=cut

*/

void
Parrot_gc_allocate_buffer_storage_aligned(PARROT_INTERP,
    ARGOUT(Buffer *buffer), size_t size)
{
    ASSERT_ARGS(Parrot_gc_allocate_buffer_storage_aligned)
    interp->gc_sys->allocate_buffer_storage(interp, buffer, size);
}

/*

=item C<void Parrot_gc_reallocate_buffer_storage(PARROT_INTERP, Buffer *buffer,
size_t newsize)>

Reallocate the Buffer's buffer memory to the given size. The
allocated buffer will not shrink. If the buffer was allocated with
L<Parrot_allocate_aligned> the new buffer will also be aligned. As with
all reallocation, the new buffer might have moved and the additional
memory is not cleared.

=cut

*/

void
Parrot_gc_reallocate_buffer_storage(PARROT_INTERP, ARGMOD(Buffer *buffer),
    size_t newsize)
{
    ASSERT_ARGS(Parrot_gc_reallocate_buffer_storage)
    interp->gc_sys->reallocate_buffer_storage(interp, buffer, newsize);
}

/*

=item C<void Parrot_gc_allocate_string_storage(PARROT_INTERP, STRING *str,
size_t size)>

Allocate the STRING's buffer memory to the given size. The allocated
buffer maybe slightly bigger than the given C<size>. This function
sets also C<< str->strstart >> to the new buffer location, C<< str->bufused >>
is B<not> changed.

=cut

*/

void
Parrot_gc_allocate_string_storage(PARROT_INTERP, ARGOUT(STRING *str),
    size_t size)
{
    ASSERT_ARGS(Parrot_gc_allocate_string_storage)
    interp->gc_sys->allocate_string_storage(interp, str, size);
}

/*

=item C<void Parrot_gc_reallocate_string_storage(PARROT_INTERP, STRING *str,
size_t newsize)>

Reallocate the STRING's buffer memory to the given size. The allocated
buffer will not shrink. This function sets also C<str-E<gt>strstart> to the
new buffer location, C<str-E<gt>bufused> is B<not> changed.

=cut

*/

void
Parrot_gc_reallocate_string_storage(PARROT_INTERP, ARGMOD(STRING *str),
    size_t newsize)
{
    ASSERT_ARGS(Parrot_gc_reallocate_string_storage)
    interp->gc_sys->reallocate_string_storage(interp, str, newsize);
}

/*

=item C<void * Parrot_gc_allocate_pmc_attributes(PARROT_INTERP, PMC *pmc)>

Allocates a new attribute structure for a PMC if it has the auto_attrs flag
set.

=cut

*/

PARROT_CANNOT_RETURN_NULL
void *
Parrot_gc_allocate_pmc_attributes(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(Parrot_gc_allocate_pmc_attributes)
    return interp->gc_sys->allocate_pmc_attributes(interp, pmc);
}

/*

=item C<void Parrot_gc_free_pmc_attributes(PARROT_INTERP, PMC *pmc)>

Deallocates an attibutes structure from a PMC if it has the auto_attrs
flag set.

*/

void
Parrot_gc_free_pmc_attributes(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(Parrot_gc_free_pmc_attributes)
    interp->gc_sys->free_pmc_attributes(interp, pmc);
}

/*

=item C<void * Parrot_gc_allocate_fixed_size_storage(PARROT_INTERP, size_t
size)>

Allocates a fixed-size chunk of memory for use. This memory is not manually
managed and needs to be freed with C<Parrot_gc_free_fixed_size_storage>

*/

PARROT_CANNOT_RETURN_NULL
void *
Parrot_gc_allocate_fixed_size_storage(PARROT_INTERP, size_t size)
{
    ASSERT_ARGS(Parrot_gc_allocate_fixed_size_storage)
    return interp->gc_sys->allocate_fixed_size_storage(interp, size);
}

/*

=item C<void Parrot_gc_free_fixed_size_storage(PARROT_INTERP, size_t size, void
*data)>

Manually deallocates fixed size storage allocated with
C<Parrot_gc_allocate_fixed_size_storage>

*/

void
Parrot_gc_free_fixed_size_storage(PARROT_INTERP, size_t size, ARGMOD(void *data))
{
    ASSERT_ARGS(Parrot_gc_free_fixed_size_storage)
    interp->gc_sys->free_fixed_size_storage(interp, size, data);
}

/*

=item C<void * Parrot_gc_allocate_memory_chunk(PARROT_INTERP, size_t size)>

=item C<void * Parrot_gc_reallocate_memory_chunk(PARROT_INTERP, void *data,
size_t newsize)>

=item C<void Parrot_gc_free_memory_chunk(PARROT_INTERP, void *data)>

=item C<void *
Parrot_gc_allocate_memory_chunk_with_interior_pointers(PARROT_INTERP, size_t
size)>

=item C<void *
Parrot_gc_reallocate_memory_chunk_with_interior_pointers(PARROT_INTERP, void
*data, size_t newsize, size_t oldsize)>

TODO Write docu.

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
void *
Parrot_gc_allocate_memory_chunk(PARROT_INTERP, size_t size)
{
    ASSERT_ARGS(Parrot_gc_allocate_memory_chunk)
    return interp->gc_sys->allocate_memory_chunk(interp, size);
}

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
void *
Parrot_gc_reallocate_memory_chunk(PARROT_INTERP, ARGFREE(void *data), size_t newsize)
{
    ASSERT_ARGS(Parrot_gc_reallocate_memory_chunk)
    return interp->gc_sys->reallocate_memory_chunk(interp, data, newsize);
}

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
void
Parrot_gc_free_memory_chunk(PARROT_INTERP, ARGIN_NULLOK(void *data))
{
    ASSERT_ARGS(Parrot_gc_free_memory_chunk)
    interp->gc_sys->free_memory_chunk(interp, data);
}


PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
void *
Parrot_gc_allocate_memory_chunk_with_interior_pointers(PARROT_INTERP, size_t size)
{
    ASSERT_ARGS(Parrot_gc_allocate_memory_chunk_with_interior_pointers)
    return interp->gc_sys->allocate_memory_chunk_with_interior_pointers(interp, size);
}

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
void *
Parrot_gc_reallocate_memory_chunk_with_interior_pointers(PARROT_INTERP,
        ARGFREE(void *data), size_t newsize, size_t oldsize)
{
    ASSERT_ARGS(Parrot_gc_reallocate_memory_chunk_with_interior_pointers)
    return interp->gc_sys->reallocate_memory_chunk_with_interior_pointers(interp,
            data, newsize, oldsize);
}


/*

=item C<void Parrot_gc_mark_and_sweep(PARROT_INTERP, UINTVAL flags)>

Calls the configured garbage collector to find and reclaim unused
headers. Performs a complete mark & sweep run of the GC.

=cut

*/

void
Parrot_gc_mark_and_sweep(PARROT_INTERP, UINTVAL flags)
{
    ASSERT_ARGS(Parrot_gc_mark_and_sweep)
    interp->gc_sys->do_gc_mark(interp, flags);
}

/*

=item C<void Parrot_gc_compact_memory_pool(PARROT_INTERP)>

Compact string pool if supported by GC.

=cut

*/

void
Parrot_gc_compact_memory_pool(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_compact_memory_pool)
    interp->gc_sys->compact_string_pool(interp);
}

/*

=item C<void Parrot_gc_destroy_child_interp(Interp *dest_interp, Interp
*source_interp)>

Merges the header pools of C<source_interp> into those of C<dest_interp>.
(Used to deal with shared objects left after interpreter destruction.)

=cut

*/

void
Parrot_gc_destroy_child_interp(ARGMOD(Interp *dest_interp),
    ARGIN(Interp *source_interp))
{
    ASSERT_ARGS(Parrot_gc_destroy_child_interp)
    if (dest_interp->gc_sys->destroy_child_interp)
        dest_interp->gc_sys->destroy_child_interp(dest_interp, source_interp);
}

/*

=item C<int Parrot_gc_active_sized_buffers(PARROT_INTERP)>

Returns the number of actively used sized buffers.

=cut

*/

int
Parrot_gc_active_sized_buffers(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_active_sized_buffers)
    return interp->gc_sys->get_gc_info(interp, ACTIVE_BUFFERS);
}

/*

=item C<int Parrot_gc_total_sized_buffers(PARROT_INTERP)>

Returns the total number of sized buffers that we are managing.

=cut

*/

int
Parrot_gc_total_sized_buffers(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_total_sized_buffers)
    return interp->gc_sys->get_gc_info(interp, TOTAL_BUFFERS);
}

/*

=item C<int Parrot_gc_active_pmcs(PARROT_INTERP)>

Return the number of actively used PMCs.

=cut

*/

int
Parrot_gc_active_pmcs(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_active_pmcs)
    return interp->gc_sys->get_gc_info(interp, ACTIVE_PMCS);
}

/*

=item C<int Parrot_gc_total_pmcs(PARROT_INTERP)>

Return the total number of PMCs that we are managing.

=cut

*/

int
Parrot_gc_total_pmcs(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_total_pmcs)
    return interp->gc_sys->get_gc_info(interp, TOTAL_PMCS);
}

/*

=item C<size_t Parrot_gc_count_mark_runs(PARROT_INTERP)>

Return the number of mark runs the GC has performed.

=item C<size_t Parrot_gc_count_collect_runs(PARROT_INTERP)>

Return the number of collect runs the GC has performed.

=item C<size_t Parrot_gc_count_lazy_mark_runs(PARROT_INTERP)>

Return the number of lazy mark runs the GC has performed.

=item C<size_t Parrot_gc_total_memory_allocated(PARROT_INTERP)>

Return the total number of memory allocations made by the GC.

=item C<size_t Parrot_gc_headers_alloc_since_last_collect(PARROT_INTERP)>

Return the number of new headers allocated since the last collection run.

=item C<size_t Parrot_gc_mem_alloc_since_last_collect(PARROT_INTERP)>

Return the number of memory allocations made since the last collection run.

=item C<UINTVAL Parrot_gc_total_copied(PARROT_INTERP)>

=item C<UINTVAL Parrot_gc_impatient_pmcs(PARROT_INTERP)>

Returns the number of PMCs that are marked as needing timely destruction.

*/

size_t
Parrot_gc_count_mark_runs(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_count_mark_runs)
    return interp->gc_sys->get_gc_info(interp, GC_MARK_RUNS);
}

size_t
Parrot_gc_count_collect_runs(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_count_collect_runs)
    return interp->gc_sys->get_gc_info(interp, GC_COLLECT_RUNS);
}

size_t
Parrot_gc_count_lazy_mark_runs(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_count_lazy_mark_runs)
    return interp->gc_sys->get_gc_info(interp, GC_LAZY_MARK_RUNS);
}

size_t
Parrot_gc_total_memory_allocated(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_total_memory_allocated)
    return interp->gc_sys->get_gc_info(interp, TOTAL_MEM_ALLOC);
}

size_t
Parrot_gc_headers_alloc_since_last_collect(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_headers_alloc_since_last_collect)
    return interp->gc_sys->get_gc_info(interp, HEADER_ALLOCS_SINCE_COLLECT);
}

size_t
Parrot_gc_mem_alloc_since_last_collect(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_mem_alloc_since_last_collect)
    return interp->gc_sys->get_gc_info(interp, MEM_ALLOCS_SINCE_COLLECT);
}

UINTVAL
Parrot_gc_total_copied(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_total_copied)
    return interp->gc_sys->get_gc_info(interp, TOTAL_COPIED);
}

UINTVAL
Parrot_gc_impatient_pmcs(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_impatient_pmcs)
    return interp->gc_sys->get_gc_info(interp, IMPATIENT_PMCS);
}

/*

=item C<void Parrot_block_GC_mark(PARROT_INTERP)>

Blocks the GC from performing its mark phase.

=item C<void Parrot_unblock_GC_mark(PARROT_INTERP)>

Unblocks the GC mark.

=item C<void Parrot_block_GC_sweep(PARROT_INTERP)>

Blocks the GC from performing its sweep phase.

=item C<void Parrot_unblock_GC_sweep(PARROT_INTERP)>

Unblocks GC sweep.

=item C<unsigned int Parrot_is_blocked_GC_mark(PARROT_INTERP)>

Determines if the GC mark is currently blocked.

=item C<unsigned int Parrot_is_blocked_GC_sweep(PARROT_INTERP)>

Determines if the GC sweep is currently blocked.

=item C<void Parrot_gc_completely_unblock(PARROT_INTERP)>

Completely unblock the GC mark and sweep. This is only used at interpreter
destruction, using it anywhere else will cause problems.

=cut

*/

PARROT_EXPORT
void
Parrot_block_GC_mark(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_block_GC_mark)
    if (interp->gc_sys->block_mark)
        interp->gc_sys->block_mark(interp);
}

PARROT_EXPORT
void
Parrot_unblock_GC_mark(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_unblock_GC_mark)
    if (interp->gc_sys->unblock_mark)
        interp->gc_sys->unblock_mark(interp);
}

PARROT_EXPORT
void
Parrot_block_GC_sweep(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_block_GC_sweep)
    if (interp->gc_sys->block_sweep)
        interp->gc_sys->block_sweep(interp);
}

PARROT_EXPORT
void
Parrot_unblock_GC_sweep(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_unblock_GC_sweep)
    if (interp->gc_sys->unblock_sweep)
        interp->gc_sys->unblock_sweep(interp);
}

PARROT_EXPORT
unsigned int
Parrot_is_blocked_GC_mark(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_is_blocked_GC_mark)
    if (interp->gc_sys->is_blocked_mark)
        return interp->gc_sys->is_blocked_mark(interp);
    else
        return 0;
}

PARROT_EXPORT
unsigned int
Parrot_is_blocked_GC_sweep(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_is_blocked_GC_sweep)
    if (interp->gc_sys->is_blocked_sweep)
        return interp->gc_sys->is_blocked_mark(interp);
    else
        return 0;
}

void
Parrot_gc_completely_unblock(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_completely_unblock)
    while (Parrot_is_blocked_GC_mark(interp))
           Parrot_unblock_GC_mark(interp);
    while (Parrot_is_blocked_GC_sweep(interp))
           Parrot_unblock_GC_sweep(interp);
}

/*

=item C<void Parrot_gc_pmc_needs_early_collection(PARROT_INTERP, PMC *pmc)>

Mark a PMC as needing timely destruction

=cut

*/

void
Parrot_gc_pmc_needs_early_collection(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(Parrot_gc_pmc_needs_early_collection)
    if (interp->gc_sys->pmc_needs_early_collection)
        interp->gc_sys->pmc_needs_early_collection(interp, pmc);
}

/*

=item C<STRING * Parrot_gc_sys_name(PARROT_INTERP)>

Retrieve the name of the currently active GC system.

=cut

*/

PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_gc_sys_name(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_sys_name)
    STRING *name = NULL;
    switch (interp->gc_sys->sys_type) {
        case MS:
            name = Parrot_str_new(interp, "ms", 2);
            break;
        case INF:
            name = Parrot_str_new(interp, "inf", 3);
            break;
        default:
            name = Parrot_str_new(interp, "unknown", 7);
            break;
    }
    PARROT_ASSERT(name != NULL);
    return name;
}

/*

=back

=head1 SEE ALSO

F<include/parrot/gc_api.h>, F<src/gc/system.c> and F<docs/pdds/pdd09_gc.pod>.

=head1 HISTORY

Initial version by Mike Lambert on 2002.05.27.

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
