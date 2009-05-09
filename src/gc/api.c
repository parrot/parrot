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

static void cleanup_next_for_GC_pool(ARGIN(Small_Object_Pool *pool))
        __attribute__nonnull__(1);

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

#define ASSERT_ARGS_cleanup_next_for_GC_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(pool)
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

=item C<void Parrot_gc_mark_PObj_alive(PARROT_INTERP, PObj *obj)>

Marks the PObj as "alive" for the Garbage Collector. Takes a pointer to a PObj,
and performs necessary marking to ensure the PMC and its direct children nodes
are marked alive. Implementation is generally dependant on the particular
garbage collector in use.

=cut

*/

PARROT_EXPORT
void
Parrot_gc_mark_PObj_alive(PARROT_INTERP, ARGMOD(PObj *obj))
{
    ASSERT_ARGS(Parrot_gc_mark_PObj_alive)
#if PARROT_GC_GMS
    do {
        if (!PObj_live_TEST(obj) && \
                PObj_to_GMSH(obj)->gen->gen_no >= interp->gc_generation) \
            parrot_gc_gms_Parrot_gc_mark_PObj_alive(interp, obj); \
    } while (0);
#else /* not PARROT_GC_GMS */

    /* if object is live or on free list return */
    if (PObj_is_live_or_free_TESTALL(obj))
        return;

#  if ! DISABLE_GC_DEBUG
#    if GC_VERBOSE
    if (CONSERVATIVE_POINTER_CHASING)
        fprintf(stderr, "GC Warning! Unanchored %s %p found in system areas \n",
                PObj_is_PMC_TEST(obj) ? "PMC" : "Buffer", obj);

#    endif
#  endif
    /* mark it live */
    PObj_live_SET(obj);

    /* if object is a PMC and contains buffers or PMCs, then attach the PMC
     * to the chained mark list. */
    if (PObj_is_PMC_TEST(obj)) {
        PMC * const p = (PMC *)obj;

        if (PObj_is_special_PMC_TEST(obj))
            mark_special(interp, p);

#  ifndef NDEBUG
        else if (p->pmc_ext && PMC_metadata(p))
            fprintf(stderr, "GC: error obj %p (%s) has properties\n",
                    (void *)p, (char*)p->vtable->whoami->strstart);
#  endif
    }
#  if GC_VERBOSE
    /* buffer GC_DEBUG stuff */
    if (GC_DEBUG(interp) && PObj_report_TEST(obj))
        fprintf(stderr, "GC: buffer %p pointing to %p marked live\n",
                obj, PObj_bufstart((Buffer *)obj));
#  endif
#endif  /* PARROT_GC_GMS */
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
field and the synchronization mutext. Throws an exception if Sync allocation
fails.

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
to create ListChunk objects in src/list.c and Stack_Chunk objects in
src/stacks.c.

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

Free a bufferlike header that is not being used, so that Parrot can recycle
it and use it again.

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
headers. Performs a complete mark & sweep run of the GC.

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

=item C<void Parrot_gc_merge_header_pools(Interp *dest_interp, Interp
*source_interp)>

Merges the header pools of C<source_interp> into those of C<dest_interp>.
(Used to deal with shared objects left after interpreter destruction.)

=cut

*/

void
Parrot_gc_merge_header_pools(ARGMOD(Interp *dest_interp),
    ARGIN(Interp *source_interp))
{
    ASSERT_ARGS(Parrot_gc_merge_header_pools)

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

=item C<void Parrot_gc_destroy_header_pools(PARROT_INTERP)>

Performs a garbage collection sweep on all pools, then frees them.  Calls
C<Parrot_forall_header_pools> to loop over all the pools, passing
C<sweep_cb_pmc> and C<sweep_cb_buf> callback routines. Frees the array of sized
header pointers in the C<Arenas> structure too.

=cut

*/

void
Parrot_gc_destroy_header_pools(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_destroy_header_pools)
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

=item C<void Parrot_gc_allocate_aligned(PARROT_INTERP, Buffer *buffer, size_t
size)>

Allocates a chunk of memory of at least size C<size> for the given Buffer.
buffer is guaranteed to be properly aligned for things like C<FLOATVALS>,
so the size may be rounded up or down to guarantee that this alignment holds.

=cut

*/

void
Parrot_gc_allocate_aligned(PARROT_INTERP, ARGOUT(Buffer *buffer), size_t size)
{
    ASSERT_ARGS(Parrot_gc_allocate_aligned)
    size_t new_size;
    char *mem;

    PObj_buflen(buffer) = 0;
    PObj_bufstart(buffer) = NULL;
    new_size = aligned_size(buffer, size);
    mem = (char *)mem_allocate(interp, new_size,
        interp->arena_base->memory_pool);
    mem = aligned_mem(buffer, mem);
    PObj_bufstart(buffer) = mem;
    if (PObj_is_COWable_TEST(buffer))
        new_size -= sizeof (void*);
    PObj_buflen(buffer) = new_size;
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
Parrot_gc_allocate_string_storage(PARROT_INTERP, ARGOUT(STRING *str), size_t size)
{
    ASSERT_ARGS(Parrot_gc_allocate_string_storage)
    size_t       new_size;
    Memory_Pool *pool;
    char        *mem;

    PObj_buflen(str)   = 0;
    PObj_bufstart(str) = NULL;

    /* there's no sense in allocating zero memory, when the overhead of
     * allocating a string is one pointer; this can fill the pools in an
     * uncompactable way.  See RT #42320.
     */
    if (size == 0)
        return;

    pool     = PObj_constant_TEST(str)
                ? interp->arena_base->constant_string_pool
                : interp->arena_base->memory_pool;

    new_size = aligned_string_size(size);
    mem      = (char *)mem_allocate(interp, new_size, pool);
    mem     += sizeof (void*);

    PObj_bufstart(str) = str->strstart = mem;
    PObj_buflen(str)   = new_size - sizeof (void*);
}

/*

=item C<void Parrot_reallocate(PARROT_INTERP, Buffer *buffer, size_t newsize)>

Reallocate the Buffer's buffer memory to the given size. The
allocated buffer will not shrink. If the buffer was allocated with
L<Parrot_allocate_aligned> the new buffer will also be aligned. As with
all reallocation, the new buffer might have moved and the additional
memory is not cleared.

=cut

*/

void
Parrot_reallocate(PARROT_INTERP, ARGMOD(Buffer *buffer), size_t newsize)
{
    ASSERT_ARGS(Parrot_reallocate)
    size_t copysize;
    char  *mem;
    Memory_Pool * const pool = interp->arena_base->memory_pool;
    size_t new_size, needed, old_size;

    /*
     * we don't shrink buffers
     */
    if (newsize <= PObj_buflen(buffer))
        return;

    /*
     * same as below but barely used and tested - only 3 list related
     * tests do use true reallocation
     *
     * list.c, which does _reallocate, has 2 reallocations
     * normally, which play ping pong with buffers.
     * The normal case is therefore always to allocate a new block
     */
    new_size = aligned_size(buffer, newsize);
    old_size = aligned_size(buffer, PObj_buflen(buffer));
    needed   = new_size - old_size;

    if ((pool->top_block->free >= needed)
    &&  (pool->top_block->top  == (char *)PObj_bufstart(buffer) + old_size)) {
        pool->top_block->free -= needed;
        pool->top_block->top  += needed;
        PObj_buflen(buffer) = newsize;
        return;
    }

    copysize = PObj_buflen(buffer);

    if (!PObj_COW_TEST(buffer))
        pool->guaranteed_reclaimable += copysize;

    pool->possibly_reclaimable += copysize;
    mem                         = (char *)mem_allocate(interp, new_size, pool);
    mem                         = aligned_mem(buffer, mem);

    /* We shouldn't ever have a 0 from size, but we do. If we can track down
     * those bugs, this can be removed which would make things cheaper */
    if (copysize)
        memcpy(mem, PObj_bufstart(buffer), copysize);

    PObj_bufstart(buffer) = mem;

    if (PObj_is_COWable_TEST(buffer))
        new_size -= sizeof (void *);

    PObj_buflen(buffer) = new_size;
}


/*

=item C<void Parrot_gc_compact_memory_pool(PARROT_INTERP)>

Scan the string pools and compact them. This does not perform a GC mark or
sweep run, and does not check whether string buffers are still alive.
Redirects to C<compact_pool>.

=cut

*/

void
Parrot_gc_compact_memory_pool(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_compact_memory_pool)
    compact_pool(interp, interp->arena_base->memory_pool);
}

/*

=item C<int Parrot_gc_ptr_in_memory_pool(PARROT_INTERP, void *bufstart)>

Determines if the given C<bufstart> pointer points to a location inside the
memory pool. Returns 1 if the pointer is in the memory pool, 0 otherwise.

=cut

*/

PARROT_WARN_UNUSED_RESULT
int
Parrot_gc_ptr_in_memory_pool(PARROT_INTERP, ARGIN(void *bufstart))
{
    ASSERT_ARGS(Parrot_gc_ptr_in_memory_pool)
    Memory_Pool * const pool = interp->arena_base->memory_pool;
    Memory_Block * cur_block = pool->top_block;

    while (cur_block) {
        if ((char *)bufstart >= cur_block->start &&
            (char *) bufstart < cur_block->start + cur_block->size) {
            return 1;
        }
        cur_block = cur_block->prev;
    }
    return 0;
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
Parrot_gc_reallocate_string_storage(PARROT_INTERP, ARGMOD(STRING *str), size_t newsize)
{
    ASSERT_ARGS(Parrot_gc_reallocate_string_storage)
    size_t copysize;
    char *mem, *oldmem;
    size_t new_size, needed, old_size;

    Memory_Pool * const pool =
        PObj_constant_TEST(str)
            ? interp->arena_base->constant_string_pool
            : interp->arena_base->memory_pool;

    /* if the requested size is smaller then buflen, we are done */
    if (newsize <= PObj_buflen(str))
        return;

    /*
     * first check, if we can reallocate:
     * - if the passed strings buffer is the last string in the pool and
     * - if there is enough size, we can just move the pool's top pointer
     */
    new_size = aligned_string_size(newsize);
    old_size = aligned_string_size(PObj_buflen(str));
    needed   = new_size - old_size;

    if (pool->top_block->free >= needed
    &&  pool->top_block->top  == (char *)PObj_bufstart(str) + old_size) {
        pool->top_block->free -= needed;
        pool->top_block->top  += needed;
        PObj_buflen(str) = new_size - sizeof (void*);
        return;
    }

    PARROT_ASSERT(str->bufused <= newsize);

    /* only copy used memory, not total string buffer */
    copysize = str->bufused;

    if (!PObj_COW_TEST(str))
        pool->guaranteed_reclaimable += PObj_buflen(str);

    pool->possibly_reclaimable += PObj_buflen(str);

    mem = (char *)mem_allocate(interp, new_size, pool);
    mem += sizeof (void *);

    /* copy mem from strstart, *not* bufstart */
    oldmem             = str->strstart;
    PObj_bufstart(str) = (void *)mem;
    str->strstart      = mem;
    PObj_buflen(str)   = new_size - sizeof (void*);

    /* We shouldn't ever have a 0 from size, but we do. If we can track down
     * those bugs, this can be removed which would make things cheaper */
    if (copysize)
        memcpy(mem, oldmem, copysize);
}

/*

=item C<void Parrot_gc_destroy_memory_pools(PARROT_INTERP)>

Destroys the memory pool and the constant string pool. Loop through both
pools and destroy all memory blocks contained in them. Once all the
blocks are freed, free the pools themselves.

=cut

*/

void
Parrot_gc_destroy_memory_pools(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_destroy_memory_pools)
    int i;

    for (i = 0; i < 2; i++) {
        Memory_Pool * const pool = i ?
                interp->arena_base->constant_string_pool :
                interp->arena_base->memory_pool;
        Memory_Block *cur_block;

        cur_block = pool->top_block;

        while (cur_block) {
            Memory_Block * const next_block = cur_block->prev;
            mem_internal_free(cur_block);
            cur_block = next_block;
        }

        mem_internal_free(pool);
    }
}

/*

=item C<void Parrot_gc_cleanup_next_for_GC(PARROT_INTERP)>

Cleans up the C<next_for_GC> pointers.

=cut

*/

void
Parrot_gc_cleanup_next_for_GC(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_cleanup_next_for_GC)
    cleanup_next_for_GC_pool(interp->arena_base->pmc_pool);
    cleanup_next_for_GC_pool(interp->arena_base->constant_pmc_pool);
}

/*

=item C<static void cleanup_next_for_GC_pool(Small_Object_Pool *pool)>

Sets all the C<next_for_GC> pointers to C<NULL>.

=cut

*/

static void
cleanup_next_for_GC_pool(ARGIN(Small_Object_Pool *pool))
{
    ASSERT_ARGS(cleanup_next_for_GC_pool)
    Small_Object_Arena *arena;

    for (arena = pool->last_Arena; arena; arena = arena->prev) {
        PMC *p = (PMC *)arena->start_objects;
        UINTVAL i;

        for (i = 0; i < arena->used; i++) {
            if (!PObj_on_free_list_TEST(p)) {
                if (p->pmc_ext)
                    PMC_next_for_GC(p) = PMCNULL;
            }
            p++;
        }
    }
}

/*

=item C<int Parrot_gc_ptr_is_pmc(PARROT_INTERP, void *ptr)>

=cut

*/

int
Parrot_gc_ptr_is_pmc(PARROT_INTERP, ARGIN(void *ptr))
{
    return contained_in_pool(interp->arena_base->pmc_pool, ptr) ||
           contained_in_pool(interp->arena_base->constant_pmc_pool, ptr);
}

/*

=item C<int Parrot_gc_get_pmc_index(PARROT_INTERP, PMC* pmc)>

Gets the index of the PMC in the pool. The first PMC in the first pool is 1,
the second is 2, etc.

=cut

*/

int
Parrot_gc_get_pmc_index(PARROT_INTERP, ARGIN(PMC* pmc))
{
    ASSERT_ARGS(Parrot_gc_get_pmc_index)
    UINTVAL id = 1;     /* first PMC in first arena */
    Small_Object_Arena *arena;
    Small_Object_Pool *pool;

    pmc = (PMC*)PObj_to_ARENA(pmc);
    pool = interp->arena_base->pmc_pool;
    for (arena = pool->last_Arena; arena; arena = arena->prev) {
        const ptrdiff_t ptr_diff = (ptrdiff_t)pmc - (ptrdiff_t)arena->start_objects;
        if (ptr_diff >= 0 && ptr_diff <
                (ptrdiff_t)(arena->used * pool->object_size)) {
            PARROT_ASSERT(ptr_diff % pool->object_size == 0);
            id += ptr_diff / pool->object_size;
            return id;
        }
        id += arena->total_objects;
    }

    pool = interp->arena_base->constant_pmc_pool;
    for (arena = pool->last_Arena; arena; arena = arena->prev) {
        const ptrdiff_t ptr_diff = (ptrdiff_t)pmc - (ptrdiff_t)arena->start_objects;
        if (ptr_diff >= 0 && ptr_diff <
                (ptrdiff_t)(arena->used * pool->object_size)) {
            PARROT_ASSERT(ptr_diff % pool->object_size == 0);
            id += ptr_diff / pool->object_size;
            return id;
        }
        id += arena->total_objects;
    }

    Parrot_ex_throw_from_c_args(interp, NULL, 1, "Couldn't find PMC in arenas");
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
