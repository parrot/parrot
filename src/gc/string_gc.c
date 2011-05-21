/*
Copyright (C) 2010-2011, Parrot Foundation.

=head1 NAME

src/gc/string_gc.c - String GC subsystem.

=head1 DESCRIPTION

GC subsystem to manage STRINGs.

=head2 Parrot Memory Management Code

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "gc_private.h"

typedef void (*compact_f) (Interp *, GC_Statistics *stats, Variable_Size_Pool *);

#define POOL_SIZE (65536 * 2)

/* show allocated blocks on stderr */
#define RESOURCE_DEBUG 0
#define RESOURCE_DEBUG_SIZE 1000000

#define RECLAMATION_FACTOR 0.20
#define WE_WANT_EVER_GROWING_ALLOCATIONS 0

/* HEADERIZER HFILE: src/gc/gc_private.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static char * aligned_mem(ARGIN(const Buffer *buffer), ARGIN(char *mem))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void alloc_new_block(
     ARGMOD(GC_Statistics *stats),
    size_t size,
    ARGMOD(Variable_Size_Pool *pool),
    ARGIN(const char *why))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*stats)
        FUNC_MODIFIES(*pool);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static const char * buffer_location(PARROT_INTERP, ARGIN(const Buffer *b))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void compact_pool(PARROT_INTERP,
    ARGMOD(GC_Statistics *stats),
    ARGMOD(Variable_Size_Pool *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*stats)
        FUNC_MODIFIES(*pool);

static void debug_print_buf(PARROT_INTERP, ARGIN(const Buffer *b))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void free_memory_pool(ARGFREE(Variable_Size_Pool *pool));
static void free_old_mem_blocks(
     ARGMOD(GC_Statistics *stats),
    ARGMOD(Variable_Size_Pool *pool),
    ARGMOD(Memory_Block *new_block),
    UINTVAL total_size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*stats)
        FUNC_MODIFIES(*pool)
        FUNC_MODIFIES(*new_block);

static int is_block_almost_full(ARGIN(const Memory_Block *block))
        __attribute__nonnull__(1);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static void * mem_allocate(PARROT_INTERP,
    ARGMOD(GC_Statistics *stats),
    size_t size,
    ARGMOD(Variable_Size_Pool *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*stats)
        FUNC_MODIFIES(*pool);

static void move_buffer_callback(PARROT_INTERP,
    ARGIN(Buffer *b),
    ARGIN(void *data))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void move_one_buffer(PARROT_INTERP,
    ARGIN(Memory_Block *pool),
    ARGMOD(Buffer *old_buf))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*old_buf);

PARROT_WARN_UNUSED_RESULT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static Variable_Size_Pool * new_memory_pool(
    size_t min_block,
    NULLOK(compact_f compact));

PARROT_CANNOT_RETURN_NULL
static UINTVAL pad_pool_size(ARGIN(const Variable_Size_Pool *pool))
        __attribute__nonnull__(1);

#define ASSERT_ARGS_aligned_mem __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(buffer_unused) \
    , PARROT_ASSERT_ARG(mem))
#define ASSERT_ARGS_alloc_new_block __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(stats) \
    , PARROT_ASSERT_ARG(pool) \
    , PARROT_ASSERT_ARG(why))
#define ASSERT_ARGS_buffer_location __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(b))
#define ASSERT_ARGS_compact_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(stats) \
    , PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_debug_print_buf __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(b))
#define ASSERT_ARGS_free_memory_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_free_old_mem_blocks __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(stats) \
    , PARROT_ASSERT_ARG(pool) \
    , PARROT_ASSERT_ARG(new_block))
#define ASSERT_ARGS_is_block_almost_full __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(block))
#define ASSERT_ARGS_mem_allocate __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(stats) \
    , PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_move_buffer_callback __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(b) \
    , PARROT_ASSERT_ARG(data))
#define ASSERT_ARGS_move_one_buffer __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pool) \
    , PARROT_ASSERT_ARG(old_buf))
#define ASSERT_ARGS_new_memory_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_pad_pool_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<void Parrot_gc_str_initialize(PARROT_INTERP, String_GC *gc)>

Initialize the managed memory pools. Parrot maintains two C<Variable_Size_Pool>
structures, the general memory pool and the constant string pool. Create
and initialize both pool structures, and allocate initial blocks of memory
for both.

=cut

*/

void
Parrot_gc_str_initialize(PARROT_INTERP, ARGMOD(String_GC *gc))
{
    ASSERT_ARGS(Parrot_gc_str_initialize)

    gc->memory_pool   = new_memory_pool(POOL_SIZE, &compact_pool);
    alloc_new_block(&interp->gc_sys->stats, POOL_SIZE, gc->memory_pool, "init");

    /* Constant strings - not compacted */
    gc->constant_string_pool = new_memory_pool(POOL_SIZE, NULL);
    alloc_new_block(&interp->gc_sys->stats, POOL_SIZE, gc->constant_string_pool, "init");
}

/*

=item C<void Parrot_gc_str_finalize(PARROT_INTERP, String_GC *gc)>

Destroys the memory pool and the constant string pool. Loop through both
pools and destroy all memory blocks contained in them. Once all the
blocks are freed, free the pools themselves.

=cut

*/

void
Parrot_gc_str_finalize(SHIM_INTERP, ARGMOD(String_GC *gc))
{
    ASSERT_ARGS(Parrot_gc_str_finalize)

    free_memory_pool(gc->constant_string_pool);
    free_memory_pool(gc->memory_pool);
}

/*

=item C<void Parrot_gc_str_allocate_buffer_storage(PARROT_INTERP, String_GC *gc,
Buffer *buffer, size_t size)>

Allocates a chunk of memory of at least size C<size> for the given Buffer.
buffer is guaranteed to be properly aligned for things like C<FLOATVALS>,
so the size may be rounded up or down to guarantee that this alignment holds.

=cut

*/

void
Parrot_gc_str_allocate_buffer_storage(PARROT_INTERP,
        ARGIN(String_GC *gc),
        ARGOUT(Buffer *buffer),
        size_t size)
{
    ASSERT_ARGS(Parrot_gc_str_allocate_buffer_storage)
    const size_t new_size   = ALIGNED_STRING_SIZE(size);

    interp->gc_sys->stats.memory_used += new_size;

    Buffer_bufstart(buffer) = (void *)aligned_mem(buffer,
        (char *)mem_allocate(interp,
        &interp->gc_sys->stats, new_size, gc->memory_pool));

    /* Save pool used to allocate into buffer header */
    *Buffer_poolptr(buffer) = gc->memory_pool->top_block;

    Buffer_buflen(buffer)   = new_size - sizeof (void *);
}

/*

=item C<void Parrot_gc_str_reallocate_buffer_storage(PARROT_INTERP, String_GC
*gc, Buffer *buffer, size_t newsize)>

Reallocate the Buffer's buffer memory to the given size. The
allocated buffer will not shrink. If the buffer was allocated with
L<Parrot_allocate_aligned> the new buffer will also be aligned. As with
all reallocation, the new buffer might have moved and the additional
memory is not cleared.

=cut

*/

void
Parrot_gc_str_reallocate_buffer_storage(PARROT_INTERP,
        ARGIN(String_GC *gc),
        ARGMOD(Buffer *buffer),
        size_t newsize)
{
    ASSERT_ARGS(Parrot_gc_str_reallocate_buffer_storage)
    Variable_Size_Pool * const pool = gc->memory_pool;
    char   *mem;
    size_t  new_size, copysize;

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
    new_size = ALIGNED_STRING_SIZE(newsize);

    interp->gc_sys->stats.memory_used += new_size;

    mem = (char *)mem_allocate(interp, &interp->gc_sys->stats, new_size, pool);
    mem = aligned_mem(buffer, mem);

    /* We shouldn't ever have a 0 from size, but we do. If we can track down
     * those bugs, this can be removed which would make things cheaper */
    copysize = Buffer_buflen(buffer);

    if (copysize)
        memcpy(mem, Buffer_bufstart(buffer), copysize);

    Buffer_bufstart(buffer) = mem;
    Buffer_buflen(buffer)   = new_size - sizeof (void *);

    /* Save pool used to allocate into buffer header */
    *Buffer_poolptr(buffer) = gc->memory_pool->top_block;
}

/*

=item C<void Parrot_gc_str_allocate_string_storage(PARROT_INTERP, String_GC *gc,
STRING *str, size_t size)>

Allocate the STRING's buffer memory to the given size. The allocated
buffer maybe slightly bigger than the given C<size>. This function
sets also C<< str->strstart >> to the new buffer location, C<< str->bufused >>
is B<not> changed.

=cut

*/

void
Parrot_gc_str_allocate_string_storage(PARROT_INTERP,
        ARGIN(String_GC *gc),
        ARGMOD(STRING *str),
        size_t size)
{
    ASSERT_ARGS(Parrot_gc_str_allocate_string_storage)
    Variable_Size_Pool *pool;
    size_t  new_size;
    char   *mem;

    if (size == 0) {
        Buffer_buflen(str)   = 0;
        Buffer_bufstart(str) = NULL;
        return;
    }

    new_size = ALIGNED_STRING_SIZE(size);

    if (PObj_constant_TEST(str)) {
        pool = gc->constant_string_pool;
    }
    else {
        pool = gc->memory_pool;
        interp->gc_sys->stats.memory_used += new_size;
    }

    mem      = (char *)mem_allocate(interp, &interp->gc_sys->stats, new_size, pool);
    mem     += sizeof (void *);

    Buffer_bufstart(str) = str->strstart = mem;
    Buffer_buflen(str)   = new_size - sizeof (void *);

    /* Save pool used to allocate into buffer header */
    *Buffer_poolptr(str) = pool->top_block;
}

/*

=item C<void Parrot_gc_str_reallocate_string_storage(PARROT_INTERP, String_GC
*gc, STRING *str, size_t newsize)>

Reallocate the STRING's buffer memory to the given size. The allocated
buffer will not shrink. This function sets also C<str-E<gt>strstart> to the
new buffer location, C<str-E<gt>bufused> is B<not> changed.

=cut

*/

void
Parrot_gc_str_reallocate_string_storage(PARROT_INTERP,
        ARGIN(String_GC *gc),
        ARGMOD(STRING *str),
        size_t newsize)
{
    ASSERT_ARGS(Parrot_gc_str_reallocate_string_storage)
    Variable_Size_Pool *pool;
    char   *mem;
    size_t  new_size, old_size;

    /* if the requested size is smaller then buflen, we are done */
    if (newsize <= Buffer_buflen(str))
        return;

    new_size = ALIGNED_STRING_SIZE(newsize);
    old_size = ALIGNED_STRING_SIZE(Buffer_buflen(str));

    if (PObj_constant_TEST(str)) {
        pool = gc->constant_string_pool;
    }
    else {
        pool = gc->memory_pool;
        interp->gc_sys->stats.memory_used += new_size;
    }

    mem = (char *)mem_allocate(interp, &interp->gc_sys->stats, new_size, pool);
    mem += sizeof (void *);

    /* Update Memory_Block usage */
    /* We must not reallocate non-movable buffers! */
    PARROT_ASSERT(PObj_is_movable_TESTALL(str));

    /* We must not reallocate shared buffers! */
    PARROT_ASSERT(!(*Buffer_bufflagsptr(str) & Buffer_shared_FLAG));

    /* Decrease usage */
    PARROT_ASSERT(Buffer_pool(str));
    Buffer_pool(str)->freed += old_size;

    PARROT_ASSERT(str->bufused <= Buffer_buflen(str));

    /* copy mem from strstart, *not* bufstart */
    /* only copy used memory, not total string buffer */
    /* We shouldn't ever have a 0 from size, but we do. If we can track down
     * those bugs, this can be removed which would make things cheaper */
    if (str->bufused)
        memcpy(mem, str->strstart, str->bufused);

    Buffer_bufstart(str) = str->strstart = mem;
    Buffer_buflen(str)   = new_size - sizeof (void *);

    /* Save pool used to allocate into buffer header */
    *Buffer_poolptr(str) = pool->top_block;
}

/*
=item C<void Parrot_gc_str_compact_pool(PARROT_INTERP, String_GC *gc)>

Compact string pool.

=cut
*/
void
Parrot_gc_str_compact_pool(PARROT_INTERP, ARGIN(String_GC *gc))
{
    ASSERT_ARGS(Parrot_gc_str_compact_pool)
    compact_pool(interp, &interp->gc_sys->stats, gc->memory_pool);
}

/*

=item C<void Parrot_gc_str_free_buffer_storage(PARROT_INTERP, String_GC *gc,
Buffer *b)>

Frees a buffer, returning it to the memory pool for Parrot to possibly
reuse later.

=cut

*/

void
Parrot_gc_str_free_buffer_storage(SHIM_INTERP,
        ARGIN(String_GC *gc),
        ARGMOD(Buffer *b))
{
    ASSERT_ARGS(Parrot_gc_str_free_buffer_storage)
    Variable_Size_Pool * const mem_pool = gc->memory_pool;

    /* If there is no allocated buffer - bail out */
    if (!Buffer_buflen(b))
        return;

    if (mem_pool) {
        /* Update Memory_Block usage */
        if (PObj_is_movable_TESTALL(b)) {
            const INTVAL * const buffer_flags = Buffer_bufflagsptr(b);

            /* Mask low 2 bits used for flags */
            Memory_Block * block = Buffer_pool(b);

            PARROT_ASSERT(block);

            /* We can have shared buffers. Don't count them (yet) */
            if (!(*buffer_flags & Buffer_shared_FLAG)) {
                block->freed  += ALIGNED_STRING_SIZE(Buffer_buflen(b));
            }

        }
    }

    Buffer_buflen(b) = 0;
}

/*
=item C<static Variable_Size_Pool * new_memory_pool(size_t min_block, compact_f
compact)>

Allocate a new C<Variable_Size_Pool> structures, and set some initial values.
return a pointer to the new pool.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static Variable_Size_Pool *
new_memory_pool(size_t min_block, NULLOK(compact_f compact))
{
    ASSERT_ARGS(new_memory_pool)
    Variable_Size_Pool * const pool = mem_internal_allocate_typed(Variable_Size_Pool);

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

=item C<static void alloc_new_block( GC_Statistics *stats, size_t size,
Variable_Size_Pool *pool, const char *why)>

Allocate a new memory block. We allocate either the requested size or the
default size, whichever is larger. Add the new block to the given memory
pool. The given C<char *why> text is used for debugging.

=cut

*/

static void
alloc_new_block(
        ARGMOD(GC_Statistics *stats),
        size_t size,
        ARGMOD(Variable_Size_Pool *pool),
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
    stats->memory_allocated += alloc_size;

    /* If this is for a public pool, add it to the list */
    new_block->prev = pool->top_block;

    /* If we're not first, then tack us on the list */
    if (pool->top_block)
        pool->top_block->next = new_block;

    pool->top_block        = new_block;
    pool->total_allocated += alloc_size;
}

/*

=item C<static void * mem_allocate(PARROT_INTERP, GC_Statistics *stats, size_t
size, Variable_Size_Pool *pool)>

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

See pobj.h for a discussion of the Buffer descriptor and the buffer itself,
including its header.

=cut

*/

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static void *
mem_allocate(PARROT_INTERP,
        ARGMOD(GC_Statistics *stats),
        size_t size,
        ARGMOD(Variable_Size_Pool *pool))
{
    ASSERT_ARGS(mem_allocate)
    void *return_val;

    /* we always should have one block at least */
    PARROT_ASSERT(pool->top_block);

    /* If not enough room, try to find some */
    if (pool->top_block->free < size) {
        /* Run a GC if needed */
        Parrot_gc_maybe_mark_and_sweep(interp, GC_trace_stack_FLAG);

        if (pool->top_block->free < size) {
            if (pool->minimum_block_size < 65536 * 16)
                pool->minimum_block_size *= 2;
            /*
             * TODO - Big blocks
             *
             * Mark the block as big block (it has just one item)
             * And don't set big blocks as the top_block.
             */
            alloc_new_block(stats, size, pool, "compact failed");

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

=item C<static char * aligned_mem(const Buffer *buffer, char *mem)>

Returns a pointer to the aligned allocated storage for Buffer C<buffer>,
which might not be the same as the pointer to C<buffer> because of
memory alignment.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static char *
aligned_mem(ARGIN(SHIM(const Buffer *buffer)), ARGIN(char *mem))
{
    ASSERT_ARGS(aligned_mem)
    mem += sizeof (void *);
    mem  = (char *)(((unsigned long)(mem + WORD_ALIGN_1)) & WORD_ALIGN_MASK);

    return mem;
}

/*

=item C<static const char * buffer_location(PARROT_INTERP, const Buffer *b)>

Returns a constant string representing the location of the given
Buffer C<b> in one of the PMC registers. If the PMC is not located
in one of the PMC registers of the current context, returns the
string C<"???">.

=cut

*/

#if RESOURCE_DEBUG
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static const char *
buffer_location(PARROT_INTERP, ARGIN(const Buffer *b))
{
    ASSERT_ARGS(buffer_location)
    Parrot_Context * const ctx = CONTEXT(interp);
    static char reg[10];
    UINTVAL i;

    for (i = 0; i < ctx->n_regs_used[REGNO_STR]; ++i) {
        PObj * const obj = (PObj *)Parrot_pcc_get_STRING_reg(interp, ctx, i);
        if ((PObj *)obj == b) {
            sprintf(reg, "S%d", (int)i);
            return reg;
        }
    }

    return "???";
}

/*

=item C<static void debug_print_buf(PARROT_INTERP, const Buffer *b)>

Prints a debug statement with information about the given PObj C<b>.
=cut

*/

static void
debug_print_buf(PARROT_INTERP, ARGIN(const Buffer *b))
{
    ASSERT_ARGS(debug_print_buf)
    fprintf(stderr, "found %p, len %d, flags 0x%08x at %s\n",
            b, (int)Buffer_buflen(b), (uint)PObj_get_FLAGS(b),
            buffer_location(interp, b));
}
#endif

/*

=back

=head2 Compaction Code

=over 4

=item C<static void compact_pool(PARROT_INTERP, GC_Statistics *stats,
Variable_Size_Pool *pool)>

Compact the string buffer pool. Does not perform a GC scan, or mark items
as being alive in any way.

=cut

*/

static void
compact_pool(PARROT_INTERP,
        ARGMOD(GC_Statistics *stats),
        ARGMOD(Variable_Size_Pool *pool))
{
    ASSERT_ARGS(compact_pool)
    UINTVAL       total_size, new_size;
    Memory_Block *new_block;

    /* Bail if we're blocked */
    if (Parrot_is_blocked_GC_sweep(interp))
        return;

    Parrot_block_GC_sweep(interp);

    /* We're collecting */
    ++stats->gc_collect_runs;

    /* Snag a block big enough for everything */
    total_size = pad_pool_size(pool);

    if (total_size == 0) {
        free_old_mem_blocks(stats, pool, pool->top_block, total_size);
        Parrot_unblock_GC_sweep(interp);
        return;
    }

    alloc_new_block(stats, total_size, pool, "inside compact");
    new_block = pool->top_block;

    /* Run through all the Buffer header pools and copy */
    interp->gc_sys->iterate_live_strings(interp, move_buffer_callback, new_block);

    new_size = new_block->top - new_block->start;

    PARROT_ASSERT(new_block->size >= new_size);

    /* How much is free. That's the total size minus the amount we used */
    new_block->free          = new_block->size - new_size;

    stats->memory_collected += new_size;
    stats->memory_used      += new_size;

    free_old_mem_blocks(stats, pool, new_block, total_size);

    Parrot_unblock_GC_sweep(interp);
}

/*
=item C<static void move_buffer_callback(PARROT_INTERP, Buffer *b, void *data)>

Callback for live STRING/Buffer for compating.

=cut
*/
static void
move_buffer_callback(PARROT_INTERP, ARGIN(Buffer *b), ARGIN(void *data))
{
    ASSERT_ARGS(move_buffer_callback)
    Memory_Block * const new_block = (Memory_Block *)data;

    if (Buffer_buflen(b) && PObj_is_movable_TESTALL(b)) {
        Memory_Block * const old_block = Buffer_pool(b);

        if (!is_block_almost_full(old_block))
            move_one_buffer(interp, new_block, b);
    }

}

/*

=item C<static UINTVAL pad_pool_size(const Variable_Size_Pool *pool)>

Calculate the size of the new pool. The currently used size equals the total
size minus the reclaimable size. Add a minimum block to the current amount, so
we can avoid having to allocate it in the future.

Returns 0 if all blocks below the top block are almost full. In this case
compacting is not needed.

TODO - Big blocks

Currently all available blocks are compacted into one new
block with total_size. This is suboptimal, if the block has
just one live item from a big allocation.

But currently it's unknown if the buffer memory is alive
as the live bits are in Buffer headers. We have to run the
compaction loop to check liveness. OTOH if this compaction
is running through all the buffer headers, there is no
relation to the block.

Moving the live bit into the buffer thus also solves this
problem easily.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static UINTVAL
pad_pool_size(ARGIN(const Variable_Size_Pool *pool))
{
    ASSERT_ARGS(pad_pool_size)
    Memory_Block *cur_block = pool->top_block->prev;

    UINTVAL total_size   = 0;
#if RESOURCE_DEBUG
    size_t  total_blocks = 1;
#endif

    while (cur_block) {
        if (!is_block_almost_full(cur_block))
            total_size += cur_block->size - cur_block->freed - cur_block->free;
        cur_block   = cur_block->prev;
#if RESOURCE_DEBUG
        ++total_blocks;
#endif
    }

    if (total_size == 0)
        return 0;

    cur_block = pool->top_block;
    if (!is_block_almost_full(cur_block))
        total_size += cur_block->size - cur_block->freed - cur_block->free;

    /* this makes for ever increasing allocations but fewer collect runs */
#if WE_WANT_EVER_GROWING_ALLOCATIONS
    total_size += pool->minimum_block_size;
#endif

#if RESOURCE_DEBUG
    fprintf(stderr, "Total blocks: %d\n", total_blocks);
#endif

    return total_size;
}

/*

=item C<static void move_one_buffer(PARROT_INTERP, Memory_Block *pool, Buffer
*old_buf)>

The compact_pool operation collects disjointed blocks of memory allocated on a
given pool's free list into one large block of memory. Once the new larger
memory block has been allocated, this function moves one buffer from the old
memory block to the new memory block and marks that it has been moved.

=cut

*/

static void
move_one_buffer(PARROT_INTERP, ARGIN(Memory_Block *pool),
        ARGMOD(Buffer *old_buf))
{
    ASSERT_ARGS(move_one_buffer)

    INTVAL       *flags     = NULL;
    ptrdiff_t     offset    = 0;
#if RESOURCE_DEBUG
    if (Buffer_buflen(old_buf) >= RESOURCE_DEBUG_SIZE)
        debug_print_buf(interp, old_buf);
#else
    UNUSED(interp);
#endif

    /* we can't perform the math all the time, because
        * strstart might be in unallocated memory */
    if (PObj_is_COWable_TEST(old_buf)) {
        flags = Buffer_bufflagsptr(old_buf);

        if (PObj_is_string_TEST(old_buf)) {
            offset = ((STRING *)old_buf)->strstart -
                (char *)Buffer_bufstart(old_buf);
        }
    }

    /* buffer has already been moved; just change the header */
    if (flags && (*flags & Buffer_shared_FLAG)
              && (*flags & Buffer_moved_FLAG)) {
        /* Find out who else references our data */
        Buffer * const hdr = *((Buffer **)Buffer_bufstart(old_buf));

        PARROT_ASSERT(PObj_is_COWable_TEST(old_buf));

        /* Make sure they know that we own it too */
        /* Set Buffer_shared_FLAG in new buffer */
        *Buffer_bufflagsptr(hdr) |= Buffer_shared_FLAG;

        /* Now make sure we point to where the other guy does */
        Buffer_bufstart(old_buf) = Buffer_bufstart(hdr);
    }
    else {
        char * const new_pool_ptr = aligned_mem(old_buf, pool->top);

        /* Copy our memory to the new pool */
        memcpy(new_pool_ptr, Buffer_bufstart(old_buf), Buffer_buflen(old_buf));

        /* If we're shared */
        if (flags && (*flags & Buffer_shared_FLAG)) {
            PARROT_ASSERT(PObj_is_COWable_TEST(old_buf));

            /* Let the old buffer know how to find us */
            *((Buffer **)Buffer_bufstart(old_buf)) = old_buf;

            /* Finally, let the tail know that we've moved, so
                * that any other references can know to look for
                * us and not re-copy */
            *flags |= Buffer_moved_FLAG;
        }

        Buffer_bufstart(old_buf) = new_pool_ptr;

        /* Remember new pool inside */
        *Buffer_poolptr(old_buf) = pool;

        pool->top = new_pool_ptr + Buffer_buflen(old_buf);
    }

    /* And if we're a string, update strstart */
    /* Somewhat of a hack */
    if (PObj_is_string_TEST(old_buf))
        ((STRING *)old_buf)->strstart =
            (char *)Buffer_bufstart(old_buf) + offset;
}

/*

=item C<static void free_old_mem_blocks( GC_Statistics *stats,
Variable_Size_Pool *pool, Memory_Block *new_block, UINTVAL total_size)>

The compact_pool operation collects disjointed blocks of memory allocated on a
given pool's free list into one large block of memory, setting it as the new
top block for the pool. Once that is done, and all items have been moved into
the new block of memory, this function iterates through the old blocks and
frees each one. It also performs the necessary housekeeping to record the
freed memory blocks. At the end of this function, the pool will have only one
block of memory on its free list.

=cut

*/

static void
free_old_mem_blocks(
        ARGMOD(GC_Statistics *stats),
        ARGMOD(Variable_Size_Pool *pool),
        ARGMOD(Memory_Block *new_block),
        UINTVAL total_size)
{
    ASSERT_ARGS(free_old_mem_blocks)
    Memory_Block *prev_block = new_block;
    Memory_Block *cur_block  = new_block->prev;

    PARROT_ASSERT(new_block == pool->top_block);

    while (cur_block) {
        Memory_Block * const next_block = cur_block->prev;

        if (is_block_almost_full(cur_block)) {
            /* Skip block */
            prev_block = cur_block;
            cur_block  = next_block;
        }
        else {
            /* Note that we don't have it any more */
            stats->memory_allocated -= cur_block->size;
            stats->memory_used      -= cur_block->size - cur_block->free;

            /* We know the pool body and pool header are a single chunk, so
             * this is enough to get rid of 'em both */
            mem_internal_free(cur_block);
            cur_block        = next_block;

            /* Unlink it from list */
            prev_block->prev = next_block;
        }
    }

    /* Terminate list */
    prev_block->prev = NULL;


    /* ANR: I suspect this should be set to new_block->size, instead of passing
     * in the raw value of total_size, because alloc_new_block pads the size of
     * the new block under certain conditions. Leaving it unmodified for now,
     * so this refactor has no functionality changes, only code cleanups.*/
    pool->total_allocated        = total_size;
    pool->guaranteed_reclaimable = 0;
    pool->possibly_reclaimable   = 0;
}

/*

=item C<static int is_block_almost_full(const Memory_Block *block)>

Tests if the block is almost full and should be skipped during compacting.

Returns true if less that 20% of block is available

=cut

*/

static int
is_block_almost_full(ARGIN(const Memory_Block *block))
{
    ASSERT_ARGS(is_block_almost_full)
    return 5 * (block->free + block->freed) < block->size;
}

/*

=item C<static void free_memory_pool(Variable_Size_Pool *pool)>

Frees a memory pool; helper function for C<Parrot_gc_destroy_memory_pools>.

=cut

*/

static void
free_memory_pool(ARGFREE(Variable_Size_Pool *pool))
{
    ASSERT_ARGS(free_memory_pool)

    Memory_Block *cur_block = pool->top_block;

    while (cur_block) {
        Memory_Block * const next_block = cur_block->prev;
        mem_internal_free(cur_block);
        cur_block = next_block;
    }

    mem_internal_free(pool);
}

/*

=back

=head1 SEE ALSO

F<src/gc/memory.c>.
F<src/gc/alloc_resources.c>.

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
