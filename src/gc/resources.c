/*
Copyright (C) 2001-2009, Parrot Foundation.
$Id$

=head1 NAME

src/gc/resources.c - Allocate and deallocate tracked resources

=head1 DESCRIPTION

Functions to manage non-PObj memory, including strings and buffers.

=head2 Parrot Memory Management Code

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "gc_private.h"


#define RECLAMATION_FACTOR 0.20
#define WE_WANT_EVER_GROWING_ALLOCATIONS 0

/* show allocated blocks on stderr */
#define RESOURCE_DEBUG 0
#define RESOURCE_DEBUG_SIZE 1000000

#define POOL_SIZE 65536 * 2

typedef void (*compact_f) (Interp *, Memory_Pool *);

/* HEADERIZER HFILE: src/gc/gc_private.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void alloc_new_block(PARROT_INTERP,
    size_t size,
    ARGMOD(Memory_Pool *pool),
    ARGIN(const char *why))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*pool);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static const char* buffer_location(PARROT_INTERP, ARGIN(const PObj *b))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void debug_print_buf(PARROT_INTERP, ARGIN(const PObj *b))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static Memory_Pool * new_memory_pool(
    size_t min_block,
    NULLOK(compact_f compact));

#define ASSERT_ARGS_alloc_new_block __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pool) \
    || PARROT_ASSERT_ARG(why)
#define ASSERT_ARGS_buffer_location __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(b)
#define ASSERT_ARGS_debug_print_buf __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(b)
#define ASSERT_ARGS_new_memory_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = 0
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*

=item C<static void alloc_new_block(PARROT_INTERP, size_t size, Memory_Pool
*pool, const char *why)>

Allocate a new memory block. We allocate either the requested size or the
default size, whichever is larger. Add the new block to the given memory
pool. The given C<char *why> text is used for debugging.

=cut

*/

static void
alloc_new_block(PARROT_INTERP, size_t size, ARGMOD(Memory_Pool *pool),
        ARGIN(const char *why))
{
    ASSERT_ARGS(alloc_new_block)
    Memory_Block *new_block;

    const size_t alloc_size = (size > pool->minimum_block_size)
            ? size : pool->minimum_block_size;

#if RESOURCE_DEBUG
    fprintf(stderr, "new_block (%s) size %u -> %u\n",
        why, size, alloc_size);
#else
    UNUSED(why)
#endif

    /* Allocate a new block. Header info's on the front */
    new_block = (Memory_Block *)mem_internal_allocate_zeroed(
        sizeof (Memory_Block) + alloc_size);

    if (!new_block) {
        fprintf(stderr, "out of mem allocsize = %d\n", (int)alloc_size);
        exit(EXIT_FAILURE);
    }

    new_block->free  = alloc_size;
    new_block->size  = alloc_size;

    new_block->next  = NULL;
    new_block->start = (char *)new_block + sizeof (Memory_Block);
    new_block->top   = new_block->start;

    /* Note that we've allocated it */
    interp->arena_base->memory_allocated += alloc_size;

    /* If this is for a public pool, add it to the list */
    new_block->prev = pool->top_block;

    /* If we're not first, then tack us on the list */
    if (pool->top_block)
        pool->top_block->next = new_block;

    pool->top_block        = new_block;
    pool->total_allocated += alloc_size;
}

/*

=item C<void * mem_allocate(PARROT_INTERP, size_t size, Memory_Pool *pool)>

Allocates memory for headers.

Alignment problems history:

See L<http://archive.develooper.com/perl6-internals%40perl.org/msg12310.html>
for details.

- return aligned pointer *if needed*
- return strings et al at unaligned i.e. void* boundaries
- remember alignment in a buffer header bit
  use this in compaction code
- reduce alignment to a reasonable value i.e. MALLOC_ALIGNMENT
  aka 2*sizeof (size_t) or just 8 (TODO make a config hint)

Buffer memory layout:

                    +-----------------+
                    |  ref_count   |f |    # GC header
  obj->bufstart  -> +-----------------+
                    |  data           |
                    v                 v

 * if PObj_is_COWable is set, then we have
   - a ref_count, {inc, dec}remented by 2 always
   - the lo bit 'f' means 'is being forwarded" - what TAIL_flag was

 * if PObj_align_FLAG is set, obj->bufstart is aligned like discussed above
 * obj->buflen is the usable length excluding the optional GC part.

=cut

*/

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
void *
mem_allocate(PARROT_INTERP, size_t size, ARGMOD(Memory_Pool *pool))
{
    ASSERT_ARGS(mem_allocate)
    void *return_val;

    /* we always should have one block at least */
    PARROT_ASSERT(pool->top_block);

    /* If not enough room, try to find some */
    if (pool->top_block->free < size) {
        /*
         * force a GC mark run to get live flags set
         * for incremental M&S collection is run from there
         * but only if there may be something worth collecting!
         * TODO pass required allocation size to the GC system,
         *      so that collection can be skipped if needed
         */
        if (!interp->arena_base->gc_mark_block_level
        &&   interp->arena_base->mem_allocs_since_last_collect) {
            Parrot_gc_mark_and_sweep(interp, GC_trace_stack_FLAG);
#if !PARROT_GC_IMS
            /* Compact the pool if allowed and worthwhile */
            if (pool->compact) {
                /* don't bother reclaiming if it's just chicken feed */
                if ((pool->possibly_reclaimable * pool->reclaim_factor +
                            pool->guaranteed_reclaimable) > size) {
                    (*pool->compact) (interp, pool);
                }

            }
#endif
        }
        if (pool->top_block->free < size) {
            if (pool->minimum_block_size < 65536 * 16)
                pool->minimum_block_size *= 2;
            /*
             * TODO - Big blocks
             *
             * Mark the block as big block (it has just one item)
             * And don't set big blocks as the top_block.
             */
            alloc_new_block(interp, size, pool, "compact failed");

            interp->arena_base->mem_allocs_since_last_collect++;

            if (pool->top_block->free < size) {
                fprintf(stderr, "out of mem\n");
                exit(EXIT_FAILURE);
            }
        }
    }

    /* TODO inline the fast path */
    return_val             = pool->top_block->top;
    pool->top_block->top  += size;
    pool->top_block->free -= size;

    return return_val;
}

/*

=item C<static const char* buffer_location(PARROT_INTERP, const PObj *b)>

Recturns a constant string representing the location of the given
PObj C<b> in one of the PMC registers. If the PMC is not located
in one of the PMC registers of the current context, returns the
string C<"???">.

=cut

*/

#if RESOURCE_DEBUG
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static const char*
buffer_location(PARROT_INTERP, ARGIN(const PObj *b))
{
    ASSERT_ARGS(buffer_location)
    int i;
    static char reg[10];

    Parrot_Context* const ctx = CONTEXT(interp);

    for (i = 0; i < ctx->n_regs_used[REGNO_STR]; ++i) {
        PObj * const obj = (PObj *) CTX_REG_STR(interp, ctx, i);
        if (obj == b) {
            sprintf(reg, "S%d", i);
            return reg;
        }
    }

    return "???";
}

/*

=item C<static void debug_print_buf(PARROT_INTERP, const PObj *b)>

Prints a debug statement with information about the given PObj C<b>.
=cut

*/

static void
debug_print_buf(PARROT_INTERP, ARGIN(const PObj *b))
{
    ASSERT_ARGS(debug_print_buf)
    fprintf(stderr, "found %p, len %d, flags 0x%08x at %s\n",
            b, (int)PObj_buflen(b), (uint)PObj_get_FLAGS(b),
            buffer_location(interp, b));
}
#endif

/*

=back

=head2 Compaction Code

=over 4

=item C<void compact_pool(PARROT_INTERP, Memory_Pool *pool)>

Compact the string buffer pool. Does not perform a GC scan, or mark items
as being alive in any way.

=cut

*/

void
compact_pool(PARROT_INTERP, ARGMOD(Memory_Pool *pool))
{
    ASSERT_ARGS(compact_pool)
    INTVAL        j;
    UINTVAL       total_size;

    Memory_Block *new_block;     /* A pointer to our working block */
    char         *cur_spot;      /* Where we're currently copying to */

    Small_Object_Arena *cur_buffer_arena;
    Arenas * const      arena_base = interp->arena_base;

    /* Bail if we're blocked */
    if (arena_base->gc_sweep_block_level)
        return;

    ++arena_base->gc_sweep_block_level;

    if (interp->profile)
        Parrot_gc_profile_start(interp);

    /* We're collecting */
    arena_base->mem_allocs_since_last_collect    = 0;
    arena_base->header_allocs_since_last_collect = 0;
    arena_base->gc_collect_runs++;

    /* total - reclaimable == currently used. Add a minimum block to the
     * current amount, so we can avoid having to allocate it in the future. */
    {
        Memory_Block *cur_block = pool->top_block;

        total_size = 0;

        while (cur_block) {
            /*
             * TODO - Big blocks
             *
             * Currently all available blocks are compacted into on new
             * block with total_size. This is more than suboptimal, if
             * the block has just one live item from a big allocation.
             *
             * But currently it's unknown if the buffer memory is alive
             * as the live bits are in Buffer headers. We have to run the
             * compaction loop below to check liveness. OTOH if this
             * compaction is running through all the buffer headers, there
             * is no relation to the block.
             *
             *
             * Moving the life bit into the buffer thus also solves this
             * problem easily.
             */
            total_size += cur_block->size - cur_block->free;
            cur_block   = cur_block->prev;
        }
    }
    /*
     * XXX for some reason the guarantee isn't correct
     *     TODO check why
     */

    /* total_size -= pool->guaranteed_reclaimable; */

    /* this makes for ever increasing allocations but fewer collect runs */
#if WE_WANT_EVER_GROWING_ALLOCATIONS
    total_size += pool->minimum_block_size;
#endif

    /* Snag a block big enough for everything */
    alloc_new_block(interp, total_size, pool, "inside compact");

    new_block = pool->top_block;

    /* Start at the beginning */
    cur_spot  = new_block->start;

    /* Run through all the Buffer header pools and copy */
    for (j = (INTVAL)arena_base->num_sized - 1; j >= 0; --j) {
        Small_Object_Pool * const header_pool = arena_base->sized_header_pools[j];
        UINTVAL       object_size;

        if (!header_pool)
            continue;

        object_size = header_pool->object_size;

        for (cur_buffer_arena = header_pool->last_Arena;
                cur_buffer_arena;
                cur_buffer_arena = cur_buffer_arena->prev) {
            Buffer *b = (Buffer *)ARENA_to_PObj(cur_buffer_arena->start_objects);
            UINTVAL i;

            for (i = cur_buffer_arena->used; i; --i) {
                INTVAL *ref_count = NULL;

                /* ! (on_free_list | constant | external | sysmem) */
                if (PObj_buflen(b) && PObj_is_movable_TESTALL(b)) {
                    ptrdiff_t offset = 0;
#if RESOURCE_DEBUG
                    if (PObj_buflen(b) >= RESOURCE_DEBUG_SIZE)
                        debug_print_buf(interp, b);
#endif

                    /* we can't perform the math all the time, because
                     * strstart might be in unallocated memory */
                    if (PObj_is_COWable_TEST(b)) {
                        ref_count = PObj_bufrefcountptr(b);

                        if (PObj_is_string_TEST(b)) {
                            offset = (ptrdiff_t)((STRING *)b)->strstart -
                                (ptrdiff_t)PObj_bufstart(b);
                        }
                    }

                    /* buffer has already been moved; just change the header */
                    if (PObj_COW_TEST(b) &&
                        (ref_count && *ref_count & Buffer_moved_FLAG)) {
                        /* Find out who else references our data */
                        Buffer * const hdr = *(Buffer **)(PObj_bufstart(b));

                        PARROT_ASSERT(PObj_is_COWable_TEST(b));

                        /* Make sure they know that we own it too */
                        PObj_COW_SET(hdr);

                        /* TODO incr ref_count, after fixing string too
                         * Now make sure we point to where the other guy does */
                        PObj_bufstart(b) = PObj_bufstart(hdr);

                        /* And if we're a string, update strstart */
                        /* Somewhat of a hack, but if we get per-pool
                         * collections, it should help ease the pain */
                        if (PObj_is_string_TEST(b)) {
                            ((STRING *)b)->strstart = (char *)PObj_bufstart(b) +
                                    offset;
                        }
                    }
                    else {
                        cur_spot = aligned_mem(b, cur_spot);

                        if (PObj_is_COWable_TEST(b)) {
                            INTVAL * const new_ref_count = ((INTVAL*) cur_spot) - 1;
                            *new_ref_count        = 2;
                        }

                        /* Copy our memory to the new pool */
                        memcpy(cur_spot, PObj_bufstart(b), PObj_buflen(b));

                        /* If we're COW */
                        if (PObj_COW_TEST(b)) {
                            PARROT_ASSERT(PObj_is_COWable_TEST(b));

                            /* Let the old buffer know how to find us */
                            *(Buffer **)(PObj_bufstart(b)) = b;

                            /* No guarantees that our data is still COW, so
                             * assume not, and let the above code fix-up */
                            PObj_COW_CLEAR(b);

                            /* Finally, let the tail know that we've moved, so
                             * that any other references can know to look for
                             * us and not re-copy */
                            if (ref_count)
                                *ref_count |= Buffer_moved_FLAG;
                        }

                        PObj_bufstart(b) = cur_spot;

                        if (PObj_is_string_TEST(b)) {
                            ((STRING *)b)->strstart = (char *)PObj_bufstart(b) +
                                    offset;
                        }

                        cur_spot += PObj_buflen(b);
                    }
                }
                b = (Buffer *)((char *)b + object_size);
            }
        }
    }

    /* Okay, we're done with the copy. Set the bits in the pool struct */
    /* First, where we allocate next */
    new_block->top = cur_spot;

    PARROT_ASSERT(new_block->size >= (size_t)new_block->top -
            (size_t)new_block->start);

    /* How much is free. That's the total size minus the amount we used */
    new_block->free = new_block->size - (new_block->top - new_block->start);

    arena_base->memory_collected += (new_block->top - new_block->start);

    /* Now we're done. We're already on the pool's free list, so let us be the
     * only one on the free list and free the rest */
    {
        Memory_Block *cur_block = new_block->prev;

        PARROT_ASSERT(new_block == pool->top_block);

        while (cur_block) {
            Memory_Block * const next_block = cur_block->prev;

            /* Note that we don't have it any more */
            arena_base->memory_allocated -= cur_block->size;

            /* We know the pool body and pool header are a single chunk, so
             * this is enough to get rid of 'em both */
            mem_internal_free(cur_block);
            cur_block = next_block;
        }

        /* Set our new pool as the only pool */
        new_block->prev       = NULL;
        pool->total_allocated = total_size;
    }

    pool->guaranteed_reclaimable = 0;
    pool->possibly_reclaimable   = 0;

    if (interp->profile)
        Parrot_gc_profile_end(interp, PARROT_PROF_GC);

    --arena_base->gc_sweep_block_level;
}

/*

=item C<size_t aligned_size(const Buffer *buffer, size_t len)>

Determines the size of Buffer C<buffer> which has nominal length C<len>.
The actual size in RAM of the Buffer might be different because of
alignment issues.

=cut

*/

PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
size_t
aligned_size(ARGIN(const Buffer *buffer), size_t len)
{
    ASSERT_ARGS(aligned_size)
    if (PObj_is_COWable_TEST(buffer))
        len += sizeof (void*);
    if (PObj_aligned_TEST(buffer))
        len = (len + BUFFER_ALIGN_1) & BUFFER_ALIGN_MASK;
    else
        len = (len + WORD_ALIGN_1) & WORD_ALIGN_MASK;
    return len;
}

/*

=item C<char * aligned_mem(const Buffer *buffer, char *mem)>

Returns a pointer to the aligned allocated storage for Buffer C<buffer>,
which might not be the same as the pointer to C<buffeR> because of
memory alignment.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
char *
aligned_mem(ARGIN(const Buffer *buffer), ARGIN(char *mem))
{
    ASSERT_ARGS(aligned_mem)
    if (PObj_is_COWable_TEST(buffer))
        mem += sizeof (void*);
    if (PObj_aligned_TEST(buffer))
        mem = (char*)(((unsigned long)(mem + BUFFER_ALIGN_1)) &
                BUFFER_ALIGN_MASK);
    else
        mem = (char*)(((unsigned long)(mem + WORD_ALIGN_1)) & WORD_ALIGN_MASK);

    return mem;
}

/*

=item C<size_t aligned_string_size(size_t len)>

Determines the size of a string of length C<len> in RAM, accounting for
alignment.

=cut

*/

/* XXX Looks like we can lose buffer here */
PARROT_CONST_FUNCTION
PARROT_WARN_UNUSED_RESULT
size_t
aligned_string_size(size_t len)
{
    ASSERT_ARGS(aligned_string_size)
    len += sizeof (void*);
    len = (len + WORD_ALIGN_1) & WORD_ALIGN_MASK;
    return len;
}

/*

=back

=head2 Parrot Re/Allocate Code

=over 4

=item C<static Memory_Pool * new_memory_pool(size_t min_block, compact_f
compact)>

Allocate a new C<Memory_Pool> structures, and set some initial values.
return a pointer to the new pool.

=cut

*/

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static Memory_Pool *
new_memory_pool(size_t min_block, NULLOK(compact_f compact))
{
    ASSERT_ARGS(new_memory_pool)
    Memory_Pool * const pool = mem_internal_allocate_typed(Memory_Pool);

    pool->top_block              = NULL;
    pool->compact                = compact;
    pool->minimum_block_size     = min_block;
    pool->total_allocated        = 0;
    pool->guaranteed_reclaimable = 0;
    pool->possibly_reclaimable   = 0;
    pool->reclaim_factor         = RECLAMATION_FACTOR;

    return pool;
}

/*

=item C<void initialize_memory_pools(PARROT_INTERP)>

Initialize the managed memory pools. Parrot maintains two C<Memory_Pool>
structures, the general memory pool and the constant string pool. Create
and initialize both pool structures, and allocate initial blocks of memory
for both.

=cut

*/

void
initialize_memory_pools(PARROT_INTERP)
{
    ASSERT_ARGS(initialize_memory_pools)
    Arenas * const arena_base = interp->arena_base;

    arena_base->memory_pool   = new_memory_pool(POOL_SIZE, &compact_pool);
    alloc_new_block(interp, POOL_SIZE, arena_base->memory_pool, "init");

    /* Constant strings - not compacted */
    arena_base->constant_string_pool = new_memory_pool(POOL_SIZE, NULL);

    alloc_new_block(interp, POOL_SIZE, arena_base->constant_string_pool, "init");
}


/*

=item C<void merge_pools(Memory_Pool *dest, Memory_Pool *source)>

Merge two memory pools together. Do this by moving all memory blocks
from the C<*source> pool into the C<*dest> pool. The C<source> pool
is emptied, but is not destroyed here.

=cut

*/

void
merge_pools(ARGMOD(Memory_Pool *dest), ARGMOD(Memory_Pool *source))
{
    ASSERT_ARGS(merge_pools)
    Memory_Block *cur_block;

    cur_block = source->top_block;

    while (cur_block) {
        Memory_Block * const next_block = cur_block->prev;

        if (cur_block->free == cur_block->size) {
            mem_internal_free(cur_block);
        }
        else {
            cur_block->next        = NULL;
            cur_block->prev        = dest->top_block;

            dest->top_block        = cur_block;
            dest->total_allocated += cur_block->size;
        }
        cur_block = next_block;
    }

    dest->guaranteed_reclaimable += source->guaranteed_reclaimable;
    dest->possibly_reclaimable   += dest->possibly_reclaimable;

    source->top_block              = NULL;
    source->total_allocated        = 0;
    source->possibly_reclaimable   = 0;
    source->guaranteed_reclaimable = 0;
}

/*

=back

=head1 SEE ALSO

F<src/gc/memory.c>.

=head1 HISTORY

Initial version by Dan on 2001.10.2.

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
