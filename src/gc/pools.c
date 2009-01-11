/*
Copyright (C) 2001-2009, The Perl Foundation.
$Id$

=head1 NAME

src/gc/pools.c - Header management functions

=head1 DESCRIPTION

Handles pool creation for PMC headers.

=cut

*/

#include "parrot/parrot.h"
#include "parrot/gc_pools.h"

/* HEADERIZER HFILE: include/parrot/gc_pools.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void fix_pmc_syncs(
    ARGMOD(Interp *dest_interp),
    ARGIN(Small_Object_Pool *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest_interp);

static void free_pool(ARGMOD(Small_Object_Pool *pool))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*pool);

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
#define ASSERT_ARGS_free_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(pool)
#define ASSERT_ARGS_sweep_cb_buf __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pool) \
    || PARROT_ASSERT_ARG(arg)
#define ASSERT_ARGS_sweep_cb_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pool)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


#ifndef GC_IS_MALLOC
#  define PMC_HEADERS_PER_ALLOC    10240 / sizeof (PMC)
#  define BUFFER_HEADERS_PER_ALLOC  5120 / sizeof (Buffer)
#  define STRING_HEADERS_PER_ALLOC  5120 / sizeof (STRING)
#else /* GC_IS_MALLOC */
#  define PMC_HEADERS_PER_ALLOC    10240 / sizeof (PMC)
#  define BUFFER_HEADERS_PER_ALLOC 10240 / sizeof (Buffer)
#  define STRING_HEADERS_PER_ALLOC 10240 / sizeof (STRING)
#endif /* GC_IS_MALLOC */

#  define CONSTANT_PMC_HEADERS_PER_ALLOC 64

/*

=head2 Buffer Header Functions for small-object lookup table

=over 4

=item C<void * get_free_buffer>

Gets a free object or buffer from the given C<pool> and returns it.  If the
object is larger then a standard C<PObj> structure, all additional memory is
cleared.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
void *
get_free_buffer(PARROT_INTERP, ARGIN(Small_Object_Pool *pool))
{
    ASSERT_ARGS(get_free_buffer)
    PObj * const buffer = (PObj *)pool->get_free_object(interp, pool);

    /* don't mess around with flags */
    PObj_bufstart(buffer) = NULL;
    PObj_buflen(buffer)   = 0;

    if (pool->object_size - GC_HEADER_SIZE > sizeof (PObj))
        memset(buffer + 1, 0,
                pool->object_size - sizeof (PObj) - GC_HEADER_SIZE);

    return buffer;
}


/*

=back

=head2 Header Pool Creation Functions

=over 4

=item C<Small_Object_Pool * new_pmc_pool>

Creates and initializes a new pool for PMCs and returns it.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Small_Object_Pool *
new_pmc_pool(PARROT_INTERP)
{
    ASSERT_ARGS(new_pmc_pool)
    const int num_headers = PMC_HEADERS_PER_ALLOC;
    Small_Object_Pool * const pmc_pool =
        new_small_object_pool(sizeof (PMC), num_headers);

    pmc_pool->mem_pool   = NULL;
    pmc_pool->dod_object = Parrot_gc_free_pmc;

    (interp->arena_base->init_pool)(interp, pmc_pool);
    return pmc_pool;
}


/*

=item C<Small_Object_Pool * new_bufferlike_pool>

Creates a new pool for buffer-like structures. This is called from
C<get_bufferlike_pool()>, and should probably not be called directly.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Small_Object_Pool *
new_bufferlike_pool(PARROT_INTERP, size_t actual_buffer_size)
{
    ASSERT_ARGS(new_bufferlike_pool)
    const int num_headers          = BUFFER_HEADERS_PER_ALLOC;
    const size_t buffer_size       =
            (actual_buffer_size + sizeof (void *) - 1) & ~(sizeof (void *) - 1);
    Small_Object_Pool * const pool =
            new_small_object_pool(buffer_size, num_headers);

    pool->dod_object = Parrot_gc_free_sysmem;
    pool->mem_pool   = interp->arena_base->memory_pool;
    (interp->arena_base->init_pool)(interp, pool);
    return pool;
}


/*

=item C<Small_Object_Pool * new_buffer_pool>

Creates a new C<Small_Object_Pool> structure for managing buffer objects.

Non-constant strings and plain Buffers are stored in the sized header pools.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Small_Object_Pool *
new_buffer_pool(PARROT_INTERP)
{
    ASSERT_ARGS(new_buffer_pool)
    Small_Object_Pool * const pool = get_bufferlike_pool(interp, sizeof (Buffer));

#ifdef GC_IS_MALLOC
    pool->dod_object = Parrot_gc_free_buffer_malloc;
#else
    pool->dod_object = Parrot_gc_free_buffer;
#endif

    return pool;
}


/*

=item C<Small_Object_Pool * new_string_pool>

Creates a new pool for C<STRING>s and returns it. This calls
C<get_bufferlike_pool> internally, which in turn calls C<new_bufferlike_pool>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Small_Object_Pool *
new_string_pool(PARROT_INTERP, INTVAL constant)
{
    ASSERT_ARGS(new_string_pool)
    Small_Object_Pool *pool;
    if (constant) {
        pool           = new_bufferlike_pool(interp, sizeof (STRING));
        pool->mem_pool = interp->arena_base->constant_string_pool;
    }
    else
        pool = get_bufferlike_pool(interp, sizeof (STRING));

    pool->objects_per_alloc = STRING_HEADERS_PER_ALLOC;

    return pool;
}


/*

=item C<Small_Object_Pool * get_bufferlike_pool>

Makes and return a bufferlike header pool for objects of a given size. If a
pool for objects of that size already exists, no new pool will be created and
the pointer to the existing pool is returned.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Small_Object_Pool *
get_bufferlike_pool(PARROT_INTERP, size_t buffer_size)
{
    ASSERT_ARGS(get_bufferlike_pool)
    Small_Object_Pool **sized_pools = interp->arena_base->sized_header_pools;
    const UINTVAL       num_old     = interp->arena_base->num_sized;
    const UINTVAL       idx         =
                            (buffer_size - sizeof (Buffer)) / sizeof (void *);

    /* Expands the array of sized resource pools, if necessary */
    if (num_old <= idx) {
        const UINTVAL num_new = idx + 1;
        /* XXX: use mem_sys_realloc_zeroed to do this easier? If we want the
                same debugging behavior as mem_internal_realloc, we would
                need to add a new function/macro for
                mem_internal_realloc_zeroed, to mirror mem_sys_realloc_zeroed. */
        sized_pools = (Small_Object_Pool **)mem_internal_realloc(sized_pools,
                                           num_new * sizeof (void *));
        memset(sized_pools + num_old, 0, sizeof (void *) * (num_new - num_old));

        interp->arena_base->sized_header_pools = sized_pools;
        interp->arena_base->num_sized = num_new;
    }

    if (sized_pools[idx] == NULL)
        sized_pools[idx] = new_bufferlike_pool(interp, buffer_size);

    return sized_pools[idx];
}


/*

=item C<size_t get_max_buffer_address>

Calculates the maximum buffer address and returns it. This is done by looping
through all the sized pools, and finding the pool whose C<end_arena_memory>
field is the highest. Notice that arenas in each pool are not necessarily
located directly next to each other in memory, and the last arena in the pool's
list may not be located at the highest memory address.

=cut

*/

PARROT_WARN_UNUSED_RESULT
size_t
get_max_buffer_address(PARROT_INTERP)
{
    ASSERT_ARGS(get_max_buffer_address)
    Arenas * const arena_base = interp->arena_base;
    size_t         max        = 0;
    UINTVAL        i;

    for (i = 0; i < arena_base->num_sized; i++) {
        if (arena_base->sized_header_pools[i]) {
            if (arena_base->sized_header_pools[i]->end_arena_memory > max)
                max = arena_base->sized_header_pools[i]->end_arena_memory;
        }
    }

    return max;
}


/*

=item C<size_t get_min_buffer_address>

Calculates the minimum buffer address and returns it. Loops through all sized
pools, and finds the one with the smallest C<start_arena_memory> field. Notice
that the memory region between C<get_min_buffer_address> and
C<get_max_buffer_address> may be fragmented, and parts of it may not be
available for Parrot to use directly (such as bookkeeping data for the OS
memory manager).

=cut

*/

PARROT_WARN_UNUSED_RESULT
size_t
get_min_buffer_address(PARROT_INTERP)
{
    ASSERT_ARGS(get_min_buffer_address)
    Arenas * const arena_base = interp->arena_base;
    size_t         min        = (size_t) -1;
    UINTVAL        i;

    for (i = 0; i < arena_base->num_sized; i++) {
        if (arena_base->sized_header_pools[i]
        &&  arena_base->sized_header_pools[i]->start_arena_memory) {
            if (arena_base->sized_header_pools[i]->start_arena_memory < min)
                min = arena_base->sized_header_pools[i]->start_arena_memory;
        }
    }

    return min;
}


/*

=item C<size_t get_max_pmc_address>

Returns the maximum memory address used by the C<pmc_pool>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
size_t
get_max_pmc_address(PARROT_INTERP)
{
    ASSERT_ARGS(get_max_pmc_address)
    return interp->arena_base->pmc_pool->end_arena_memory;
}


/*

=item C<size_t get_min_pmc_address>

Returns the minimum memory address used by the C<pmc_pool>. Notice that the
memory region between C<get_min_pmc_address> and C<get_max_pmc_address> may be
fragmented, and not all of it may be used directly by Parrot for storing PMCs.

=cut

*/

PARROT_WARN_UNUSED_RESULT
size_t
get_min_pmc_address(PARROT_INTERP)
{
    ASSERT_ARGS(get_min_pmc_address)
    return interp->arena_base->pmc_pool->start_arena_memory;
}


/*

=item C<int is_buffer_ptr>

Checks whether the given C<ptr> is located within one of the sized
header pools. Returns C<1> if it is, and C<0> if not.

=cut

*/

PARROT_WARN_UNUSED_RESULT
int
is_buffer_ptr(PARROT_INTERP, ARGIN(const void *ptr))
{
    ASSERT_ARGS(is_buffer_ptr)
    Arenas * const arena_base = interp->arena_base;
    UINTVAL        i;

    for (i = 0; i < arena_base->num_sized; i++) {
        if (arena_base->sized_header_pools[i]
        &&  contained_in_pool(arena_base->sized_header_pools[i], ptr))
            return 1;
    }

    return 0;
}


/*

=item C<int is_pmc_ptr>

Checks that C<ptr> is actually a PMC pointer. Returns C<1> if it is, C<0>
otherwise.

=cut

*/

PARROT_WARN_UNUSED_RESULT
int
is_pmc_ptr(PARROT_INTERP, ARGIN(const void *ptr))
{
    ASSERT_ARGS(is_pmc_ptr)
    return contained_in_pool(interp->arena_base->pmc_pool, ptr);
}


/*

=item C<void Parrot_initialize_header_pools>

The initialization routine for the interpreter's header pools. Initializes
pools for string headers, constant string headers, buffers, PMCs, PMC_EXTs, and
constant PMCs.

The C<string_header_pool> and C<buffer_header_pool> are actually both in the
sized pools, although no other sized pools are created here.

=cut

*/

void
Parrot_initialize_header_pools(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_initialize_header_pools)
    Arenas * const arena_base                     = interp->arena_base;

    /* Init the constant string header pool */
    arena_base->constant_string_header_pool       = new_string_pool(interp, 1);
    arena_base->constant_string_header_pool->name = "constant_string_header";

    /* Init the buffer header pool
     *
     * The buffer_header_pool and the string_header_pool actually live in the
     * sized_header_pools. These pool pointers only provide faster access in
     * new_*_header */
    arena_base->buffer_header_pool       = new_buffer_pool(interp);
    arena_base->buffer_header_pool->name = "buffer_header";

    /* Init the string header pool */
    arena_base->string_header_pool       = new_string_pool(interp, 0);
    arena_base->string_header_pool->name = "string_header";

    /* Init the PMC header pool */
    arena_base->pmc_pool                 = new_pmc_pool(interp);
    arena_base->pmc_pool->name           = "pmc";

    /* pmc extension buffer */
    arena_base->pmc_ext_pool             =
        new_small_object_pool(sizeof (PMC_EXT), 1024);

#if PARROT_GC_MS
    /*
     * pmc_ext isn't a managed item. If a PMC has a pmc_ext structure
     * it is returned to the pool instantly - the structure is never
     * marked.
     * Use GS MS pool functions
     */
    gc_pmc_ext_pool_init(arena_base->pmc_ext_pool);
#else
    /* rational, consistant behavior (as yet unwritten) */
#endif

    arena_base->pmc_ext_pool->name = "pmc_ext";

    /* constant PMCs */
    arena_base->constant_pmc_pool                    = new_pmc_pool(interp);
    arena_base->constant_pmc_pool->name              = "constant_pmc";
    arena_base->constant_pmc_pool->objects_per_alloc =
       CONSTANT_PMC_HEADERS_PER_ALLOC;
}


/*

=item C<int Parrot_forall_header_pools>

Iterates through header pools, invoking the given callback function on each
pool in the list matching the given criteria. Determines which pools to iterate
over depending on flags passed to the function.  Returns the callback's return
value, if non-zero. A non-zero return value from the callback function will
terminate the iteration prematurely.

=over 4

=item flag is one of

  POOL_PMC
  POOL_BUFFER
  POOL_CONST
  POOL_ALL

Only matching pools will be used. Notice that it is not possible to iterate
over certain sets of pools using the provided flags in the single pass. For
instance, both the PMC pool and the constant PMC pool cannot be iterated over
in a single pass.

=item arg

This argument is passed on to the iteration function.

=item pool_iter_fn

Called with C<(Parrot_Interp, Small_Object_Pool *, int flag, void *arg)>.  If
the function returns a non-zero value, iteration will stop.

=back

=cut

*/

PARROT_IGNORABLE_RESULT
int
Parrot_forall_header_pools(PARROT_INTERP, int flag, ARGIN_NULLOK(void *arg),
        NOTNULL(pool_iter_fn func))
{
    ASSERT_ARGS(Parrot_forall_header_pools)
    Arenas * const arena_base = interp->arena_base;

    if (flag & POOL_PMC) {
        Small_Object_Pool *pool = flag & POOL_CONST
            ? arena_base->constant_pmc_pool
            : arena_base->pmc_pool;

        const int ret_val = (func)(interp, pool,
            flag & (POOL_PMC | POOL_CONST) , arg);

        if (ret_val)
            return ret_val;
    }

    if (flag & POOL_BUFFER) {
        INTVAL i;

        if (flag & POOL_CONST) {
            const int ret_val = (func)(interp,
                arena_base->constant_string_header_pool,
                POOL_BUFFER | POOL_CONST, arg);

            if (ret_val)
                return ret_val;
        }

        for (i = interp->arena_base->num_sized - 1; i >= 0; --i) {
            Small_Object_Pool * const pool = arena_base->sized_header_pools[i];

            if (pool) {
                const int ret_val = (func)(interp, pool, POOL_BUFFER, arg);
                if (ret_val)
                    return ret_val;
            }
        }
    }

    return 0;
}


/*

=item C<static void free_pool>

Frees a pool and all of its arenas. Loops through the list of arenas backwards
and returns each to the memory manager. Then, frees the pool structure itself.

=cut

*/

static void
free_pool(ARGMOD(Small_Object_Pool *pool))
{
    ASSERT_ARGS(free_pool)
    Small_Object_Arena *cur_arena;

    for (cur_arena = pool->last_Arena; cur_arena;) {
        Small_Object_Arena * const next = cur_arena->prev;
        mem_internal_free(cur_arena->start_objects);
        mem_internal_free(cur_arena);
        cur_arena = next;
    }
    mem_internal_free(pool);
}


/*

=item C<static int sweep_cb_buf>

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

=item C<static int sweep_cb_pmc>

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

=item C<void Parrot_destroy_header_pools>

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

=item C<static void fix_pmc_syncs>

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

=item C<void Parrot_merge_header_pools>

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
                    i * sizeof (void *) + sizeof (Buffer));
            UNUSED(ignored);
            PARROT_ASSERT(dest_arena->sized_header_pools[i]);
        }

        Parrot_small_object_pool_merge(dest_interp,
            dest_arena->sized_header_pools[i],
            source_arena->sized_header_pools[i]);
    }
}


/*

=back

=head1 SEE ALSO

F<include/parrot/gc_pools.h>.

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
