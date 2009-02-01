/*
Copyright (C) 2001-2009, The Perl Foundation.
$Id$

=head1 NAME

src/gc/api.c - general Parrot API for GC functions

=head1 DESCRIPTION

This file implements the external-facing API for Parrot's garbage collector.
The collector itself is composed of various interchangable cores that each
may operate very differently internally. The functions in this file can be used
throughtout Parrot without having to be concerned about the internal operations
of the GC. This is documented in PDD 9 with supplementary notes in
F<docs/dev/dod.pod> and F<docs/memory_internals.pod>.

It's possible to turn on/off the checking of the system stack and
processor registers. The actual checking is set up in F<src/cpu_dep.c>
and is performed in the function C<trace_memory_block> here.

There's also a verbose mode for garbage collection.

=head1 FUNCTIONS

=over 4

=cut

*/

#define DOD_C_SOURCE
#include "parrot/parrot.h"
#include "parrot/gc_api.h"

/* HEADERIZER HFILE: include/parrot/gc_api.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CONST_FUNCTION
static size_t find_common_mask(PARROT_INTERP, size_t val1, size_t val2)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC_EXT * new_pmc_ext(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_find_common_mask __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_new_pmc_ext __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

#if ! DISABLE_GC_DEBUG

/* Set when walking the system stack */
int CONSERVATIVE_POINTER_CHASING = 0;

#endif

/*

=item C<PMC * new_pmc_header>

Gets a new PMC header from the PMC pool's free list. Guaranteed to return a
valid PMC object or else Parrot will panic. Sets the necessary flags for the
objects and initializes the PMC data pointer to C<NULL>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
new_pmc_header(PARROT_INTERP, UINTVAL flags)
{
    ASSERT_ARGS(new_pmc_header)
    Small_Object_Pool * const pool = flags & PObj_constant_FLAG
            ? interp->arena_base->constant_pmc_pool
            : interp->arena_base->pmc_pool;
    PMC * const pmc = (PMC *)pool->get_free_object(interp, pool);

    if (!pmc)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_ALLOCATION_ERROR,
            "Parrot VM: PMC allocation failed!\n");

    /* clear flags, set is_PMC_FLAG */
    if (flags & PObj_is_PMC_EXT_FLAG) {
        flags |= PObj_is_special_PMC_FLAG;
        pmc->pmc_ext = new_pmc_ext(interp);

        if (flags & PObj_is_PMC_shared_FLAG)
            add_pmc_sync(interp, pmc);
    }
    else
        pmc->pmc_ext = NULL;

    PObj_get_FLAGS(pmc) = PObj_is_PMC_FLAG|flags;
    pmc->vtable         = NULL;

#if ! PMC_DATA_IN_EXT
    PMC_data(pmc)       = NULL;
#endif

    return pmc;
}


/*

=item C<static PMC_EXT * new_pmc_ext>

Gets a new free C<PMC_EXT> structure from the PMC_EXT pool. A pointer to the
new PMC_EXT is returned. Does not check to ensure the PMC_EXT is non-null
before it is returned (yet).

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC_EXT *
new_pmc_ext(PARROT_INTERP)
{
    ASSERT_ARGS(new_pmc_ext)
    Small_Object_Pool * const pool = interp->arena_base->pmc_ext_pool;
    /* XXX: Should we check here to ensure the PMC_EXT is non-null
            like we do in C<new_pmc>? */
    return (PMC_EXT *)pool->get_free_object(interp, pool);
}


/*

=item C<void add_pmc_ext>

Obtains a new C<PMC_EXT> structure, and attaches it to the given C<PMC>.
Sets the necessary flags associated with the PMC_EXT structure. Ensures
that the PMC_EXT structure is marked as "alive" by the GC.

=cut

*/

void
add_pmc_ext(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(add_pmc_ext)
    pmc->pmc_ext = new_pmc_ext(interp);
    PObj_is_PMC_EXT_SET(pmc);

#ifdef PARROT_GC_IMS
    /*
     * preserve DDD color: a simple PMC  live = black
     *                     an aggregate  live = grey
     * set'em black
     */
    if (PObj_live_TEST(pmc))
        PObj_get_FLAGS(pmc) |= PObj_custom_GC_FLAG;
#endif

    PMC_next_for_GC(pmc) = PMCNULL;
}


/*

=item C<void add_pmc_sync>

Adds a C<Sync*> structure to the given C<PMC>. Initializes the PMC's owner
field and the synchronization mutext. Does not check to ensure the C<Sync *> is
non-null.

=cut

*/

void
add_pmc_sync(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(add_pmc_sync)
    if (!PObj_is_PMC_EXT_TEST(pmc))
        add_pmc_ext(interp, pmc);

    /* XXX: Should we test the Sync * for non-null? should we allocate these
            from a bufferlike pool instead of directly from the system? */
    PMC_sync(pmc)        = mem_allocate_typed(Sync);
    PMC_sync(pmc)->owner = interp;

    MUTEX_INIT(PMC_sync(pmc)->pmc_lock);
}


/*

=item C<STRING * new_string_header>

Returns a new C<STRING> header from the string pool or the constant string
pool. Sets default flags on the string object: C<PObj_is_string_FLAG>,
C<PObj_is_COWable_FLAG>, and C<PObj_live_FLAG> (for GC). Initializes the data
field of the string buffer to C<NULL>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
new_string_header(PARROT_INTERP, UINTVAL flags)
{
    ASSERT_ARGS(new_string_header)
    STRING * const string = (STRING *)get_free_buffer(interp,
        (flags & PObj_constant_FLAG)
            ? interp->arena_base->constant_string_header_pool
            : interp->arena_base->string_header_pool);

    string->strstart        = NULL;
    PObj_get_FLAGS(string) |=
        flags | PObj_is_string_FLAG | PObj_is_COWable_FLAG | PObj_live_FLAG;

    return string;
}


/*

=item C<Buffer * new_buffer_header>

Creates and returns a new C<Buffer> from the buffer header pool.  Calls
C<get_free_buffer> to do all the work.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
Buffer *
new_buffer_header(PARROT_INTERP)
{
    ASSERT_ARGS(new_buffer_header)
    return (Buffer *)get_free_buffer(interp,
            interp->arena_base->buffer_header_pool);
}


/*

=item C<void * new_bufferlike_header>

Returns a new buffer-like header from the appropriate sized pool.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
void *
new_bufferlike_header(PARROT_INTERP, size_t size)
{
    ASSERT_ARGS(new_bufferlike_header)
    Small_Object_Pool * const pool = get_bufferlike_pool(interp, size);

    return get_free_buffer(interp, pool);
}


/*

=item C<void Parrot_gc_free_pmc>

Frees a PMC that is no longer being used. Calls a custom C<destroy> VTABLE
method if one is available. If the PMC uses a PMC_EXT structure, that is freed
as well.

=cut

*/

void
Parrot_gc_free_pmc(PARROT_INTERP, SHIM(Small_Object_Pool *pool),
        ARGMOD(PObj *p))
{
    ASSERT_ARGS(Parrot_gc_free_pmc)
    PMC    * const pmc        = (PMC *)p;
    Arenas * const arena_base = interp->arena_base;

    /* TODO collect objects with finalizers */
    if (PObj_needs_early_DOD_TEST(p))
        --arena_base->num_early_DOD_PMCs;

    if (PObj_active_destroy_TEST(p))
        VTABLE_destroy(interp, pmc);

    if (PObj_is_PMC_EXT_TEST(p))
         Parrot_gc_free_pmc_ext(interp, pmc);

#ifndef NDEBUG

    pmc->pmc_ext     = (PMC_EXT *)0xdeadbeef;
    pmc->vtable      = (VTABLE  *)0xdeadbeef;
    PMC_pmc_val(pmc) = (PMC     *)0xdeadbeef;

#endif

}

/*

=item C<void Parrot_gc_free_pmc_ext>

Frees the C<PMC_EXT> structure attached to a PMC, if it exists.

=cut

*/

void
Parrot_gc_free_pmc_ext(PARROT_INTERP, ARGMOD(PMC *p))
{
    ASSERT_ARGS(Parrot_gc_free_pmc_ext)
    /* if the PMC has a PMC_EXT structure, return it to the pool/arena */
    Arenas            * const arena_base = interp->arena_base;
    Small_Object_Pool * const ext_pool   = arena_base->pmc_ext_pool;

    if (PObj_is_PMC_shared_TEST(p) && PMC_sync(p)) {
        MUTEX_DESTROY(PMC_sync(p)->pmc_lock);
        mem_internal_free(PMC_sync(p));
        PMC_sync(p) = NULL;
    }

    if (p->pmc_ext)
        ext_pool->add_free_object(interp, ext_pool, p->pmc_ext);

    ext_pool->num_free_objects++;

    p->pmc_ext = NULL;
}

/*

=item C<void Parrot_gc_free_sysmem>

If the PMC uses memory allocated directly from the system, this function
frees that memory.

=cut

*/

void
Parrot_gc_free_sysmem(SHIM_INTERP, SHIM(Small_Object_Pool *pool),
        ARGMOD(PObj *b))
{
    ASSERT_ARGS(Parrot_gc_free_sysmem)
    /* has sysmem allocated, e.g. string_pin */
    if (PObj_sysmem_TEST(b) && PObj_bufstart(b))
        mem_sys_free(PObj_bufstart(b));

    PObj_bufstart(b) = NULL;
    PObj_buflen(b)   = 0;
}

/*

=item C<void Parrot_gc_free_buffer_malloc>

Frees the given buffer, returning the storage space to the operating system
and removing it from Parrot's memory management system. If the buffer is COW,
The buffer is not freed if the reference count is greater then 1.

=cut

*/

void
Parrot_gc_free_buffer_malloc(SHIM_INTERP, SHIM(Small_Object_Pool *pool),
        ARGMOD(PObj *b))
{
    ASSERT_ARGS(Parrot_gc_free_buffer_malloc)
    /* free allocated space at (int *)bufstart - 1, but not if it used COW or is
     * external */
    PObj_buflen(b) = 0;

    if (!PObj_bufstart(b) || PObj_is_external_or_free_TESTALL(b))
        return;

    if (PObj_COW_TEST(b)) {
        INTVAL * const refcount = PObj_bufrefcountptr(b);

        if (--(*refcount) == 0) {
            mem_sys_free(refcount); /* the actual bufstart */
        }
    }
    else
        mem_sys_free(PObj_bufrefcountptr(b));
}

/*

=item C<void Parrot_gc_free_buffer>

Frees a buffer, returning it to the memory pool for Parrot to possibly
reuse later.

=cut

*/

void
Parrot_gc_free_buffer(SHIM_INTERP, ARGMOD(Small_Object_Pool *pool), ARGMOD(PObj *b))
{
    ASSERT_ARGS(Parrot_gc_free_buffer)
    Memory_Pool * const mem_pool = (Memory_Pool *)pool->mem_pool;

    /* XXX Jarkko reported that on irix pool->mem_pool was NULL, which really
     * shouldn't happen */
    if (mem_pool) {
        if (!PObj_COW_TEST(b))
            mem_pool->guaranteed_reclaimable += PObj_buflen(b);

         mem_pool->possibly_reclaimable += PObj_buflen(b);
    }

    PObj_buflen(b)        = 0;
}

#ifndef PLATFORM_STACK_WALK

/*

=item C<static size_t find_common_mask>

Finds a mask covering the longest common bit-prefix of C<val1>
and C<val2>.

=cut

*/

PARROT_CONST_FUNCTION
static size_t
find_common_mask(PARROT_INTERP, size_t val1, size_t val2)
{
    ASSERT_ARGS(find_common_mask)
    int       i;
    const int bound = sizeof (size_t) * 8;

    /* Shifting a value by its size (in bits) or larger is undefined behaviour.
       So need an explicit check to return 0 if there is no prefix, rather than
       attempting to rely on (say) 0xFFFFFFFF << 32 being 0.  */
    for (i = 0; i < bound; i++) {
        if (val1 == val2)
            return ~(size_t)0 << i;

        val1 >>= 1;
        val2 >>= 1;
    }

    if (val1 == val2) {
        PARROT_ASSERT(i == bound);
        return 0;
    }

    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INTERP_ERROR,
            "Unexpected condition in find_common_mask()!\n");
}

/*

=item C<void trace_mem_block>

Traces the memory block between C<lo_var_ptr> and C<hi_var_ptr>.
Attempt to find pointers to PObjs or buffers, and mark them as "alive"
if found. See src/cpu_dep.c for more information about tracing memory
areas.

=cut

*/

void
trace_mem_block(PARROT_INTERP, size_t lo_var_ptr, size_t hi_var_ptr)
{
    ASSERT_ARGS(trace_mem_block)
    size_t    prefix;
    ptrdiff_t cur_var_ptr;

    const size_t buffer_min = get_min_buffer_address(interp);
    const size_t buffer_max = get_max_buffer_address(interp);
    const size_t pmc_min    = get_min_pmc_address(interp);
    const size_t pmc_max    = get_max_pmc_address(interp);

    const size_t mask       =
        find_common_mask(interp,
                         buffer_min < pmc_min ? buffer_min : pmc_min,
                         buffer_max > pmc_max ? buffer_max : pmc_max);

    if (!lo_var_ptr || !hi_var_ptr)
        return;

    if (lo_var_ptr < hi_var_ptr) {
        const size_t tmp_ptr = hi_var_ptr;
        hi_var_ptr           = lo_var_ptr;
        lo_var_ptr           = tmp_ptr;
    }

    /* Get the expected prefix */
    prefix = mask & buffer_min;

    for (cur_var_ptr = hi_var_ptr;
            (ptrdiff_t)cur_var_ptr < (ptrdiff_t)lo_var_ptr;
            cur_var_ptr = (size_t)((ptrdiff_t)cur_var_ptr + sizeof (void *))) {
        const size_t ptr = *(size_t *)cur_var_ptr;

        /* Do a quick approximate range check by bit-masking */
        if ((ptr & mask) == prefix || !prefix) {
            /* Note that what we find via the stack or registers are not
             * guaranteed to be live pmcs/buffers, and could very well have
             * had their bufstart/vtable destroyed due to the linked list of
             * free headers... */
            if (pmc_min <= ptr && ptr < pmc_max &&
                    is_pmc_ptr(interp, (void *)ptr)) {
                /* ...so ensure that pobject_lives checks PObj_on_free_list_FLAG
                 * before adding it to the next_for_GC list, to have
                 * vtable->mark() called. */
                pobject_lives(interp, (PObj *)ptr);
            }
            else if (buffer_min <= ptr && ptr < buffer_max &&
                    is_buffer_ptr(interp, (void *)ptr)) {
                /* ...and since pobject_lives doesn't care about bufstart, it
                 * doesn't really matter if it sets a flag */
                pobject_lives(interp, (PObj *)ptr);
            }
        }
    }

    return;
}
#endif

/*

=item C<void Parrot_gc_profile_start>

Records the start time of a DOD run when profiling is enabled.

=cut

*/

void
Parrot_gc_profile_start(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_profile_start)
    if (Interp_flags_TEST(interp, PARROT_PROFILE_FLAG))
        interp->profile->dod_time = Parrot_floatval_time();
}

/*

=item C<void Parrot_gc_profile_end>

Records the end time of the DOD part C<what> run when profiling is
enabled. Also record start time of next part.

=cut

*/

void
Parrot_gc_profile_end(PARROT_INTERP, int what)
{
    ASSERT_ARGS(Parrot_gc_profile_end)
    if (Interp_flags_TEST(interp, PARROT_PROFILE_FLAG)) {
        RunProfile * const profile = interp->profile;
        const FLOATVAL     now     = Parrot_floatval_time();

        profile->data[what].numcalls++;
        profile->data[what].time += now - profile->dod_time;

        /*
         * we've recorded the time of a DOD/GC piece from
         * dod_time until now, so add this to the start of the
         * currently executing opcode, which hasn't run this
         * interval.
         */
        profile->starttime += now - profile->dod_time;

        /* prepare start for next step */
        profile->dod_time   = now;
    }
}

/*

=item C<void Parrot_gc_ms_run_init>

Prepares the collector for a mark & sweep DOD run. This is the
initializer function for the MS garbage collector.

=cut

*/

void
Parrot_gc_ms_run_init(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_ms_run_init)
    Arenas * const arena_base       = interp->arena_base;

    arena_base->dod_trace_ptr       = NULL;
    arena_base->dod_mark_start      = NULL;
    arena_base->num_early_PMCs_seen = 0;
    arena_base->num_extended_PMCs   = 0;
}


/*

=item C<void Parrot_do_dod_run>

Calls the configured garbage collector to find and reclaim unused
headers.

=cut

*/

void
Parrot_do_dod_run(PARROT_INTERP, UINTVAL flags)
{
    ASSERT_ARGS(Parrot_do_dod_run)
    interp->arena_base->do_gc_mark(interp, flags);
    parrot_gc_context(interp);
}

/*

=back

=head1 SEE ALSO

F<include/parrot/gc_api.h>, F<src/cpu_dep.c>, F<docs/dev/dod.dev> and
F<docs/pdds/pdd09_gc.pod>.

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
