/*
Copyright (C) 2001-2009, Parrot Foundation.
$Id$

=head1 NAME

src/gc/api.c - general Parrot API for GC functions

=head1 DESCRIPTION

This file implements the external-facing API for Parrot's garbage collector.
The collector itself is composed of various interchangable cores that each
may operate very differently internally. The functions in this file can be used
throughtout Parrot without having to be concerned about the internal operations
of the GC. This is documented in PDD 9 with supplementary notes in
F<docs/memory_internals.pod>.

=head1 FUNCTIONS

=over 4

=cut

*/

#define GC_C_SOURCE
#include "parrot/parrot.h"
#include "parrot/gc_api.h"
#include "gc_private.h"

/* HEADERIZER HFILE: include/parrot/gc_api.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void fix_pmc_syncs(
    ARGMOD(Interp *dest_interp),
    ARGIN(Small_Object_Pool *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest_interp);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC_EXT * new_pmc_ext(PARROT_INTERP)
        __attribute__nonnull__(1);

static int sweep_cb_buf(PARROT_INTERP,
    ARGMOD(Small_Object_Pool *pool),
    SHIM(int flag),
    ARGIN(void *arg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*pool);

static int sweep_cb_pmc(PARROT_INTERP,
    ARGMOD(Small_Object_Pool *pool),
    SHIM(int flag),
    SHIM(void *arg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

#define ASSERT_ARGS_fix_pmc_syncs __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(dest_interp) \
    || PARROT_ASSERT_ARG(pool)
#define ASSERT_ARGS_new_pmc_ext __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_sweep_cb_buf __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pool) \
    || PARROT_ASSERT_ARG(arg)
#define ASSERT_ARGS_sweep_cb_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pool)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

#if ! DISABLE_GC_DEBUG

#endif

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
    interp->arena_base = mem_allocate_zeroed_typed(Arenas);
    interp->arena_base->sized_header_pools = NULL;

    interp->lo_var_ptr = stacktop;

#if PARROT_GC_MS
    Parrot_gc_ms_init(interp);
#endif
#if PARROT_GC_IMS
    Parrot_gc_ims_init(interp);
#endif
#if PARROT_GC_GMS
    Parrot_gc_gms_init(interp);
#endif

    Parrot_initialize_memory_pools(interp);
    Parrot_initialize_header_pools(interp);
}


/*

=item C<PMC * Parrot_gc_new_pmc_header(PARROT_INTERP, UINTVAL flags)>

Gets a new PMC header from the PMC pool's free list. Guaranteed to return a
valid PMC object or else Parrot will panic. Sets the necessary flags for the
objects and initializes the PMC data pointer to C<NULL>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_gc_new_pmc_header(PARROT_INTERP, UINTVAL flags)
{
    ASSERT_ARGS(Parrot_gc_new_pmc_header)
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
            Parrot_gc_add_pmc_sync(interp, pmc);
    }
    else
        pmc->pmc_ext = NULL;

    PObj_get_FLAGS(pmc) = PObj_is_PMC_FLAG|flags;
    pmc->vtable         = NULL;
    PMC_data(pmc)       = NULL;

    return pmc;
}


/*

=item C<static PMC_EXT * new_pmc_ext(PARROT_INTERP)>

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
    return (PMC_EXT *)pool->get_free_object(interp, pool);
}


/*

=item C<void Parrot_gc_add_pmc_ext(PARROT_INTERP, PMC *pmc)>

Obtains a new C<PMC_EXT> structure, and attaches it to the given C<PMC>.
Sets the necessary flags associated with the PMC_EXT structure. Ensures
that the PMC_EXT structure is marked as "alive" by the GC.

=cut

*/

void
Parrot_gc_add_pmc_ext(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(Parrot_gc_add_pmc_ext)
    pmc->pmc_ext = new_pmc_ext(interp);
    if(!pmc->pmc_ext)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_ALLOCATION_ERROR,
            "Parrot VM: PMC_EXT allocation failed!\n");
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

=item C<void Parrot_gc_add_pmc_sync(PARROT_INTERP, PMC *pmc)>

Adds a C<Sync*> structure to the given C<PMC>. Initializes the PMC's owner
field and the synchronization mutext. Does not check to ensure the C<Sync *> is
non-null.

=cut

*/

void
Parrot_gc_add_pmc_sync(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(Parrot_gc_add_pmc_sync)
    if (!PObj_is_PMC_EXT_TEST(pmc))
        Parrot_gc_add_pmc_ext(interp, pmc);
    /* Would like to be able to do this, instead of allocating directly from
       the OS. Causes a segfault that hasn't been figured out yet. */
    /* PMC_sync(pmc) = (Sync *)Parrot_gc_new_bufferlike_header(interp, sizeof(Sync)); */
    PMC_sync(pmc) = mem_allocate_typed(Sync);
    if(!PMC_sync(pmc))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_ALLOCATION_ERROR,
            "Parrot VM: PMC Sync allocation failed!\n");

    PMC_sync(pmc)->owner = interp;
    MUTEX_INIT(PMC_sync(pmc)->pmc_lock);
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
    STRING * const string = (STRING *)get_free_buffer(interp,
        (flags & PObj_constant_FLAG)
            ? interp->arena_base->constant_string_header_pool
            : interp->arena_base->string_header_pool);
    if(!string)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_ALLOCATION_ERROR,
            "Parrot VM: STRING allocation failed!\n");

    string->strstart        = NULL;
    PObj_get_FLAGS(string) |=
        flags | PObj_is_string_FLAG | PObj_is_COWable_FLAG | PObj_live_FLAG;

    return string;
}


/*

=item C<void * Parrot_gc_new_bufferlike_header(PARROT_INTERP, size_t size)>

Returns a new buffer-like header from the appropriate sized pool.
A "bufferlike object" is an object that is considered to be isomorphic to the
PObj, so it will participate in normal GC. At the moment these are only used
to create ListChunk objects in src/list.c.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
void *
Parrot_gc_new_bufferlike_header(PARROT_INTERP, size_t size)
{
    ASSERT_ARGS(Parrot_gc_new_bufferlike_header)
    Small_Object_Pool * const pool = get_bufferlike_pool(interp, size);

    return get_free_buffer(interp, pool);
}

/*

=item C<void Parrot_gc_free_bufferlike_header(PARROT_INTERP, PObj *obj, size_t
size)>

=cut

*/

void
Parrot_gc_free_bufferlike_header(PARROT_INTERP, ARGMOD(PObj *obj),
    size_t size)
{
    Small_Object_Pool * const pool = get_bufferlike_pool(interp, size);
    pool->add_free_object(interp, pool, obj);
}

/*

=item C<void Parrot_gc_free_pmc_ext(PARROT_INTERP, PMC *p)>

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
        /* Small_Object_Pool * pool = get_bufferlike_pool(interp, sizeof(Sync)); */
        MUTEX_DESTROY(PMC_sync(p)->pmc_lock);
        mem_internal_free(PMC_sync(p));
        /* pool->add_free_object(interp, pool, PMC_sync(p)); */
        PMC_sync(p) = NULL;
    }

    if (p->pmc_ext)
        ext_pool->add_free_object(interp, ext_pool, p->pmc_ext);

    ext_pool->num_free_objects++;

    p->pmc_ext = NULL;
}




/*

=item C<void Parrot_gc_mark_and_sweep(PARROT_INTERP, UINTVAL flags)>

Calls the configured garbage collector to find and reclaim unused
headers.

=cut

*/

void
Parrot_gc_mark_and_sweep(PARROT_INTERP, UINTVAL flags)
{
    ASSERT_ARGS(Parrot_gc_mark_and_sweep)
    interp->arena_base->do_gc_mark(interp, flags);
    parrot_gc_context(interp);
}

/*

=item C<void Parrot_merge_header_pools(Interp *dest_interp, Interp
*source_interp)>

Merges the header pools of C<source_interp> into those of C<dest_interp>.
(Used to deal with shared objects left after interpreter destruction.)

=cut

*/

void
Parrot_merge_header_pools(ARGMOD(Interp *dest_interp), ARGIN(Interp *source_interp))
{
    ASSERT_ARGS(Parrot_merge_header_pools)

    Arenas * const dest_arena   = dest_interp->arena_base;
    Arenas * const source_arena = source_interp->arena_base;
    UINTVAL        i;

    /* heavily borrowed from forall_header_pools */
    fix_pmc_syncs(dest_interp, source_arena->constant_pmc_pool);
    Parrot_small_object_pool_merge(dest_interp, dest_arena->constant_pmc_pool,
            source_arena->constant_pmc_pool);

    fix_pmc_syncs(dest_interp, source_arena->pmc_pool);
    Parrot_small_object_pool_merge(dest_interp, dest_arena->pmc_pool,
            source_arena->pmc_pool);

    Parrot_small_object_pool_merge(dest_interp,
            dest_arena->constant_string_header_pool,
            source_arena->constant_string_header_pool);

    Parrot_small_object_pool_merge(dest_interp,
            dest_arena->pmc_ext_pool, source_arena->pmc_ext_pool);

    for (i = 0; i < source_arena->num_sized; ++i) {
        if (!source_arena->sized_header_pools[i])
            continue;

        if (i >= dest_arena->num_sized
        || !dest_arena->sized_header_pools[i]) {
            Small_Object_Pool *ignored = get_bufferlike_pool(dest_interp,
                    i * sizeof (void *));
            UNUSED(ignored);
            PARROT_ASSERT(dest_arena->sized_header_pools[i]);
        }

        Parrot_small_object_pool_merge(dest_interp,
            dest_arena->sized_header_pools[i],
            source_arena->sized_header_pools[i]);
    }
}

/*

=item C<static void fix_pmc_syncs(Interp *dest_interp, Small_Object_Pool *pool)>

Walks through the given arena, looking for all live and shared PMCs,
transferring their sync values to the destination interpreter.

=cut

*/

static void
fix_pmc_syncs(ARGMOD(Interp *dest_interp), ARGIN(Small_Object_Pool *pool))
{
    ASSERT_ARGS(fix_pmc_syncs)
    Small_Object_Arena *cur_arena;
    const UINTVAL       object_size = pool->object_size;

    for (cur_arena = pool->last_Arena; cur_arena; cur_arena = cur_arena->prev) {
        PMC   *p = (PMC *)((char*)cur_arena->start_objects + GC_HEADER_SIZE);
        size_t i;

        for (i = 0; i < cur_arena->used; i++) {
            if (!PObj_on_free_list_TEST(p) && PObj_is_PMC_TEST(p)) {
                if (PObj_is_PMC_shared_TEST(p))
                    PMC_sync(p)->owner = dest_interp;
                else
                    Parrot_ex_throw_from_c_args(dest_interp, NULL,
                        EXCEPTION_INTERP_ERROR,
                        "Unshared PMC still alive after interpreter"
                        "destruction. address=%p, base_type=%d\n",
                        p, p->vtable->base_type);
            }

            p = (PMC *)((char *)p + object_size);
        }
    }
}

/*

=item C<void Parrot_destroy_header_pools(PARROT_INTERP)>

Performs a garbage collection sweep on all pools, then frees them.  Calls
C<Parrot_forall_header_pools> to loop over all the pools, passing
C<sweep_cb_pmc> and C<sweep_cb_buf> callback routines. Frees the array of sized
header pointers in the C<Arenas> structure too.

=cut

*/

void
Parrot_destroy_header_pools(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_destroy_header_pools)
    INTVAL pass;

    /* const/non const COW strings life in different pools
     * so in first pass
     * COW refcount is done, in 2. refcounting
     * in 3rd freeing
     */
#ifdef GC_IS_MALLOC
    const INTVAL start = 0;
#else
    const INTVAL start = 2;
#endif

    Parrot_forall_header_pools(interp, POOL_PMC, NULL, sweep_cb_pmc);
    Parrot_forall_header_pools(interp, POOL_PMC | POOL_CONST, NULL,
            sweep_cb_pmc);

    for (pass = start; pass <= 2; pass++) {
        Parrot_forall_header_pools(interp, POOL_BUFFER | POOL_CONST,
                (void *)pass, sweep_cb_buf);
    }

    free_pool(interp->arena_base->pmc_ext_pool);
    interp->arena_base->pmc_ext_pool = NULL;

    mem_internal_free(interp->arena_base->sized_header_pools);
    interp->arena_base->sized_header_pools = NULL;
}

/*

=item C<static int sweep_cb_pmc(PARROT_INTERP, Small_Object_Pool *pool, int
flag, void *arg)>

Performs a garbage collection sweep of the given pmc pool, then frees it. Calls
C<Parrot_gc_sweep> to perform the sweep, and C<free_pool> to free the pool and
all its arenas. Always returns C<0>.

=cut

*/

static int
sweep_cb_pmc(PARROT_INTERP, ARGMOD(Small_Object_Pool *pool),
        SHIM(int flag), SHIM(void *arg))
{
    Parrot_gc_sweep(interp, pool);
    free_pool(pool);
    return 0;
}

/*

=item C<static int sweep_cb_buf(PARROT_INTERP, Small_Object_Pool *pool, int
flag, void *arg)>

Performs a final garbage collection sweep, then frees the pool. Calls
C<Parrot_gc_sweep> to perform the sweep, and C<free_pool> to free the pool and
all its arenas.

=cut

*/

static int
sweep_cb_buf(PARROT_INTERP, ARGMOD(Small_Object_Pool *pool), SHIM(int flag),
        ARGIN(void *arg))
{
#ifdef GC_IS_MALLOC
    const int pass = (int)(INTVAL)arg;

    if (pass == 0)
        clear_cow(interp, pool, 1);
    else if (pass == 1)
        used_cow(interp, pool, 1);
    else
#endif

    {
        UNUSED(arg);
        Parrot_gc_sweep(interp, pool);
        free_pool(pool);
    }

    return 0;
}


/*

=back

=head1 SEE ALSO

F<include/parrot/gc_api.h>, F<src/cpu_dep.c> and F<docs/pdds/pdd09_gc.pod>.

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
