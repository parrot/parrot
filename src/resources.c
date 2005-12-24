/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/resources.c - Allocate and deallocate tracked resources

=head1 DESCRIPTION

=head2 Parrot Memory Management Code

=over 4

=cut

*/

#include <assert.h>
#include "parrot/parrot.h"

#define RECLAMATION_FACTOR 0.20
#define WE_WANT_EVER_GROWING_ALLOCATIONS 0

typedef void (*compact_f) (Interp *, struct Memory_Pool *);
static void* aligned_mem(Buffer *buffer, char *mem);

/*

=item C<static void *
alloc_new_block(Interp *interpreter,
        size_t size, struct Memory_Pool *pool)>

Allocate a new memory block. We allocate the larger of however much was
asked for or the default size, whichever's larger.

=cut

*/

static void *
alloc_new_block(Interp *interpreter,
        size_t size, struct Memory_Pool *pool)
{
    size_t alloc_size;
    struct Memory_Block *new_block;

    alloc_size = (size > pool->minimum_block_size)
            ? size : pool->minimum_block_size;

    /* Allocate a new block. Header info's on the front */
    new_block = mem_internal_allocate_zeroed(sizeof(struct Memory_Block) +
            alloc_size);
    if (!new_block) {
        fprintf(stderr, "out of mem allocsize = %d\n", (int)alloc_size);
        exit(1);
        return NULL;
    }

    new_block->free = alloc_size;
    new_block->size = alloc_size;
    SET_NULL(new_block->next);
    new_block->start = (char *)new_block + sizeof(struct Memory_Block);
    new_block->top = new_block->start;

    /* Note that we've allocated it */
    interpreter->arena_base->memory_allocated += alloc_size;

    /* If this is for a public pool, add it to the list */
    new_block->prev = pool->top_block;
    /* If we're not first, then tack us on the list */
    if (pool->top_block) {
        pool->top_block->next = new_block;
    }
    pool->top_block = new_block;
    pool->total_allocated += alloc_size;

    return new_block;
}

/*

=item C<static void *
mem_allocate(Interp *, size_t size, struct Memory_Pool *pool)>

Allocates memory for headers.

Alignment problems history:  

See L<http://archive.develooper.com/perl6-internals%40perl.org/msg12310.html>
for details. 

- return aligned pointer *if needed*
- return strings et al at unaligned i.e. void* boundaries 
- remember alignment in a buffer header bit
  use this in compaction code
- reduce alignment to a reasonable value i.e. MALLOC_ALIGNMENT  
  aka 2*sizeof(size_t) or just 8 (TODO make a config hint)

Buffer memory layout:

                    +-----------------+  
                    |  ref_count   |f |    # GC header
  obj->bufstart  -> +-----------------+
                    |  data           |
                    v                 v

 * if PObj_is_COWable is set, then we have
   - a ref_count, {inc,dec}remented by 2 always
   - the lo bit 'f' means 'is being forwarded" - what TAIL_flag was

 * if PObj_align_FLAG is set, obj->bufstart is aligned like discussed above  
 * obj->buflen is the usable length excluding the optional GC part.

=cut

*/


static char *
mem_allocate(Interp *interpreter, size_t size, struct Memory_Pool *pool)
{
    char *return_val;

    /* we always should have one block at least */
    assert(pool->top_block);
    /* If not enough room, try to find some */
    if (pool->top_block->free < size) {
        /*
         * force a DOD run to get live flags set
         * for incremental M&S collection is run from there
         * TODO pass required allocation size to the DOD system,
         *      so that collection can be skipped if needed
         */
        Parrot_do_dod_run(interpreter, DOD_trace_stack_FLAG);
#if !PARROT_GC_IMS
        /* Compact the pool if allowed and worthwhile */
        if (pool->compact) {
            /* don't bother reclaiming if it's just chicken feed */
            if ((pool->possibly_reclaimable * pool->reclaim_factor +
                    pool->guaranteed_reclaimable) > size) {
                (*pool->compact) (interpreter, pool);
            }

        }
#endif
        if (pool->top_block->free < size) {
            if (pool->minimum_block_size < 65536*16)
                pool->minimum_block_size *= 2;
            /*
             * TODO - Big blocks
             *
             * Mark the block as big block (it has just one item)
             * And don't set big blocks as the top_block.
             */
            alloc_new_block(interpreter, size, pool);
            interpreter->arena_base->mem_allocs_since_last_collect++;
            if (pool->top_block->free < size) {
                fprintf(stderr, "out of mem\n");
                exit(1);
                return NULL;
            }
        }
    }
    /* TODO inline the fast path */
    return_val = pool->top_block->top;
    pool->top_block->top += size;
    pool->top_block->free -= size;
    return (void *)return_val;
}


/*

=back

=head2 Compaction Code

=over

=item C<static void
compact_pool(Interp *interpreter, struct Memory_Pool *pool)>

Compact the buffer pool.

=cut

*/

static void
compact_pool(Interp *interpreter, struct Memory_Pool *pool)
{
    UINTVAL total_size;
    struct Memory_Block *new_block;     /* A pointer to our working block */
    char *cur_spot;             /* Where we're currently copying to */
    UINTVAL cur_size;           /* How big our chunk is going to be */
    struct Arenas *arena_base = interpreter->arena_base;
    struct Small_Object_Arena *cur_buffer_arena;
    struct Small_Object_Pool *header_pool;
    INTVAL j;
    UINTVAL object_size;
    INTVAL *ref_count = NULL;

    /* Bail if we're blocked */
    if (arena_base->GC_block_level) {
        return;
    }
    ++arena_base->GC_block_level;
    if (interpreter->profile)
        Parrot_dod_profile_start(interpreter);

    /* We're collecting */
    arena_base->mem_allocs_since_last_collect = 0;
    arena_base->header_allocs_since_last_collect = 0;
    arena_base->collect_runs++;

    /* total-reclaimable == currently used. Add a minimum block to the current
     * amount, so we can avoid having to allocate it in the future. */
    {
        struct Memory_Block *cur_block;

        total_size = 0;
        cur_block = pool->top_block;
        while (cur_block) {
            /*
             * TODO - Big blocks
             *
             * Currently all available blocks are compacted into on new
             * block with total_size. This is more than suboptimal, if
             * the block has just one live item from a big allocation.
             *
             * But currently it's not known, if the buffer memory is alive
             * as the live bits are in Buffer headers. We have to run the
             * compaction loop below to check liveness. OTOH is this
             * compaction is running through all the buffer headers, there
             * is no relation to the block.
             *
             *
             * Moving the life bit into the buffer thus also solves this
             * problem easily.
             */
            total_size += cur_block->size - cur_block->free;
            cur_block = cur_block->prev;
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
    new_block = alloc_new_block(interpreter, total_size, pool);

    /* Start at the beginning */
    cur_spot = new_block->start;

    /* Run through all the Buffer header pools and copy */
    for (j = 0; j < (INTVAL)arena_base->num_sized; j++) {
        header_pool = arena_base->sized_header_pools[j];
        if (header_pool == NULL)
            continue;

        object_size = header_pool->object_size;

        for (cur_buffer_arena = header_pool->last_Arena;
                NULL != cur_buffer_arena;
                cur_buffer_arena = cur_buffer_arena->prev) {
            Buffer *b;
            UINTVAL i;

            b = ARENA_to_PObj(cur_buffer_arena->start_objects);
            for (i = 0; i < cur_buffer_arena->used; i++) {
                /* ! (on_free_list | constant | external | sysmem) */
                if (PObj_buflen(b) && PObj_is_movable_TESTALL(b)) {
                    ptrdiff_t offset = 0;

                    /* we can't perform the math all the time, because
                     * strstart might be in unallocated memory */
                    if (PObj_is_COWable_TEST(b)) {
                        ref_count = ((INTVAL*) PObj_bufstart(b)) - 1;
                        if (PObj_is_string_TEST(b)) {
                            offset = (ptrdiff_t)((STRING *)b)->strstart -
                                (ptrdiff_t)PObj_bufstart(b);
                        }
                    }
                    /* buffer has already been moved; just change the header */
                    if (PObj_COW_TEST(b) && *ref_count & Buffer_moved_FLAG) {
                        /* Find out who else references our data */
                        Buffer *hdr = *(Buffer **)(PObj_bufstart(b));

                        /* Make sure they know that we own it too */
                        PObj_COW_SET(hdr);
                        /* TODO incr ref_count, after fixing string
                         * too */
                        /* Now make sure we point to where the other guy
                         * does */
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
                            INTVAL *new_ref_count = ((INTVAL*) cur_spot) - 1;
                            *new_ref_count = 2;
                        }
                        /* Copy our memory to the new pool */
                        memcpy(cur_spot, PObj_bufstart(b), PObj_buflen(b));
                        /* If we're COW */
                        if (PObj_COW_TEST(b)) {
                            /* Let the old buffer know how to find us */
                            *(Buffer **)(PObj_bufstart(b)) = b;
                            /* No guarantees that our data is still COW, so
                             * assume not, and let the above code fix-up */
                            PObj_COW_CLEAR(b);
                            /* Finally, let the tail know that we've moved, so
                             * that any other references can know to look for
                             * us and not re-copy */
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

    assert(new_block->size >= (size_t)new_block->top -
            (size_t)new_block->start);

    /* How much is free. That's the total size minus the amount we used */
    new_block->free = new_block->size - (new_block->top - new_block->start);

    arena_base->memory_collected += (new_block->top - new_block->start);

    /* Now we're done. We're already on the pool's free list, so let us be the
     * only one on the free list and free the rest */
    {
        struct Memory_Block *cur_block, *next_block;

        assert(new_block == pool->top_block);
        cur_block = new_block->prev;
        while (cur_block) {
            next_block = cur_block->prev;
            /* Note that we don't have it any more */
            arena_base->memory_allocated -= cur_block->size;
            /* We know the pool body and pool header are a single chunk, so
             * this is enough to get rid of 'em both */
            mem_internal_free(cur_block);
            cur_block = next_block;
        }

        /* Set our new pool as the only pool */
        new_block->prev = NULL;
        pool->total_allocated = total_size;
    }

    pool->guaranteed_reclaimable = 0;
    pool->possibly_reclaimable = 0;
    if (interpreter->profile)
        Parrot_dod_profile_end(interpreter, PARROT_PROF_GC);
    --arena_base->GC_block_level;
}

/*  */
/*

=item C<void
Parrot_go_collect(Interp *interpreter)>

Go do a GC run. This only scans the string pools and compacts them, it
doesn't check for string liveness.

=cut

*/

void
Parrot_go_collect(Interp *interpreter)
{
    compact_pool(interpreter, interpreter->arena_base->memory_pool);
}

static size_t
aligned_size(Buffer *buffer, size_t len)
{
    if (PObj_is_COWable_TEST(buffer))
        len += sizeof(void*);
    if (PObj_aligned_TEST(buffer)) {
        len = (len + BUFFER_ALIGN_1) & BUFFER_ALIGN_MASK;
    }
    else {
        len = (len + WORD_ALIGN_1) & WORD_ALIGN_MASK;
    }
    return len;
}

static void*
aligned_mem(Buffer *buffer, char *mem)
{
    if (PObj_is_COWable_TEST(buffer))
        mem += sizeof(void*);
    if (PObj_aligned_TEST(buffer)) {
        mem = (char*)(((unsigned long)(mem + BUFFER_ALIGN_1)) & 
                BUFFER_ALIGN_MASK);
    }
    else {
        mem = (char*)(((unsigned long)(mem + WORD_ALIGN_1)) & WORD_ALIGN_MASK);
    }
    return mem;
}

static size_t
aligned_string_size(STRING *buffer, size_t len)
{
    len += sizeof(void*);
    len = (len + WORD_ALIGN_1) & WORD_ALIGN_MASK;
    return len;
}


/*

=back

=head2 Parrot Re/Allocate Code

=over 4

=item C<void 
Parrot_reallocate(Interp *interpreter, Buffer *from, size_t tosize)>

Reallocate the Buffer's buffer memory to the given size. The allocated
buffer will not shrink. If the buffer was allocated with 
<Parrot_allocate_aligned> the new buffer will also be aligned. As
with all reallocation, the new buffer might have moved and the additional
memory is not cleared.

=cut

*/

void 
Parrot_reallocate(Interp *interpreter, Buffer *buffer, size_t tosize)
{
    size_t copysize;
    void *mem;
    struct Memory_Pool *pool = interpreter->arena_base->memory_pool;
    size_t new_size, needed, old_size;

    /*
     * we don't shrink buffers
     */
    if (tosize <= PObj_buflen(buffer))
        return;

    /*
     * same as below but barely used and tested - only 3 list related
     * tests do use true reallocation
     *
     * list.c, which does _reallocate, has 2 reallocations
     * normally, which play ping pong with buffers.
     * The normal case is therefore always to allocate a new block
     */
    new_size = aligned_size(buffer, tosize);
    old_size = aligned_size(buffer, PObj_buflen(buffer));
    needed = new_size - old_size;
    if (pool->top_block->free >= needed &&
            pool->top_block->top == (char*)PObj_bufstart(buffer) +
            old_size) {
        pool->top_block->free -= needed;
        pool->top_block->top  += needed;
        PObj_buflen(buffer) = tosize;
        return;
    }
    copysize = PObj_buflen(buffer);
    if (!PObj_COW_TEST(buffer)) {
        pool->guaranteed_reclaimable += copysize;
    }
    pool->possibly_reclaimable += copysize;
    mem = mem_allocate(interpreter, new_size, pool);
    mem = aligned_mem(buffer, mem);

    /* We shouldn't ever have a 0 from size, but we do. If we can track down
     * those bugs, this can be removed which would make things cheaper */
    if (copysize) {
        memcpy(mem, PObj_bufstart(buffer), copysize);
    }
    PObj_bufstart(buffer) = mem;
    if (PObj_is_COWable_TEST(buffer))
        new_size -= sizeof(void*);
    PObj_buflen(buffer) = new_size;
}

/*

=item C<void 
Parrot_reallocate_string(Interp *interpreter, STRING *str,
        size_t tosize)>

Reallocate the STRING's buffer memory to the given size. The allocated
buffer will not shrink. This function sets also C<str-E<gt>strstart> to the
new buffer location, C<str-E<gt>bufused> is B<not> changed.

=cut

*/

void 
Parrot_reallocate_string(Interp *interpreter, STRING *str,
        size_t tosize)
{
    size_t copysize;
    char *mem, *oldmem;
    struct Memory_Pool *pool;
    size_t new_size, needed, old_size;

    pool = PObj_constant_TEST(str)
        ? interpreter->arena_base->constant_string_pool
        : interpreter->arena_base->memory_pool;
    /*
     * if the requested size is smaller then buflen, we are done
     */
    if (tosize <= PObj_buflen(str))
        return;

    /*
     * first check, if we can reallocate:
     * - if the passed strings buffer is the last string in the pool and
     * - if there is enough size, we can just move the pool's top pointer
     */
    new_size = aligned_string_size(str, tosize);
    old_size = aligned_string_size(str, PObj_buflen(str));
    needed = new_size - old_size;
    if (pool->top_block->free >= needed &&
            pool->top_block->top == (char*)PObj_bufstart(str) +
            old_size) {
        pool->top_block->free -= needed;
        pool->top_block->top  += needed;
        PObj_buflen(str) = new_size - sizeof(void*);
        return;
    }
    assert(str->bufused <= tosize);
    /* only copy used memory, not total string buffer */
    copysize = str->bufused;

    if (!PObj_COW_TEST(str)) {
        pool->guaranteed_reclaimable += PObj_buflen(str);
    }
    pool->possibly_reclaimable += PObj_buflen(str);

    mem = mem_allocate(interpreter, new_size, pool);
    mem += sizeof(void*);

    /* copy mem from strstart, *not* bufstart */
    oldmem = str->strstart;
    str->strstart = PObj_bufstart(str) = mem;
    PObj_buflen(str) = new_size - sizeof(void*);

    /* We shouldn't ever have a 0 from size, but we do. If we can track down
     * those bugs, this can be removed which would make things cheaper */
    if (copysize) {
        memcpy(mem, oldmem, copysize);
    }
}

/*

=item C<void 
Parrot_allocate(Interp *interpreter, Buffer *buffer, size_t size)>

Allocate buffer memory for the given Buffer pointer. The C<size>
has to be a multiple of the word size.
C<PObj_buflen> will be set to exactly the given C<size>.

=item C<void 
Parrot_allocate_aligned(Interp *interpreter, Buffer *buffer, size_t size)>

Like above, except the C<size> will be rounded up and the address of
the buffer will have the same alignment as a pointer returned by
malloc(3) suitable to hold e.g. a C<FLOATVAL> array.

=cut

*/

void 
Parrot_allocate(Interp *interpreter, Buffer *buffer, size_t size)
{

    PObj_buflen(buffer) = 0;
    PObj_bufstart(buffer) = NULL;
    assert((size & WORD_ALIGN_1) == 0);
    PObj_bufstart(buffer) = mem_allocate(interpreter, size,
            interpreter->arena_base->memory_pool);
    PObj_buflen(buffer) = size;
}


void 
Parrot_allocate_aligned(Interp *interpreter, Buffer *buffer, size_t size)
{
    size_t new_size;
    char *mem;

    PObj_buflen(buffer) = 0;
    PObj_bufstart(buffer) = NULL;
    new_size = aligned_size(buffer, size);
    mem = mem_allocate(interpreter, new_size,
            interpreter->arena_base->memory_pool);
    mem = aligned_mem(buffer, mem);
    PObj_bufstart(buffer) = mem;
    if (PObj_is_COWable_TEST(buffer))
        new_size -= sizeof(void*);
    PObj_buflen(buffer) = new_size;
}

/*

=item C<void 
Parrot_allocate_string(Interp *interpreter, STRING *str,
        size_t size)>

Allocate the STRING's buffer memory to the given size. The allocated
buffer maybe be slightly bigger than the given C<size>. This function
sets also C<str-E<gt>strstart> to the new buffer location, C<str-E<gt>bufused>
is B<not> changed.

=cut

*/

void 
Parrot_allocate_string(Interp *interpreter, STRING *str,
        size_t size)
{
    size_t new_size;
    struct Memory_Pool *pool;
    char *mem;

    PObj_buflen(str) = 0;
    PObj_bufstart(str) = NULL;

    pool = PObj_constant_TEST(str)
            ? interpreter->arena_base->constant_string_pool
            : interpreter->arena_base->memory_pool;
    new_size = aligned_string_size(str, size);
    mem = mem_allocate(interpreter, new_size, pool);
    mem += sizeof(void*);
    PObj_bufstart(str) =  str->strstart = mem;
    PObj_buflen(str) = new_size - sizeof(void*);
}

/*

=item C<static struct Memory_Pool *
new_memory_pool(size_t min_block, compact_f compact)>

Create a new memory pool.

=cut

*/

static struct Memory_Pool *
new_memory_pool(size_t min_block, compact_f compact)
{
    struct Memory_Pool *pool;

    pool = mem_internal_allocate(sizeof(struct Memory_Pool));
    if (pool) {
        pool->top_block = NULL;
        pool->compact = compact;
        pool->minimum_block_size = min_block;
        pool->total_allocated = 0;
        pool->guaranteed_reclaimable = 0;
        pool->possibly_reclaimable = 0;
        pool->reclaim_factor = RECLAMATION_FACTOR;
    }
    return pool;
}

/*

=item C<void
Parrot_initialize_memory_pools(Interp *interpreter)>

Initialize the managed memory pools.

=cut

*/

#define POOL_SIZE 65536*2
void
Parrot_initialize_memory_pools(Interp *interpreter)
{
    struct Arenas *arena_base = interpreter->arena_base;

    arena_base->memory_pool = new_memory_pool(POOL_SIZE, &compact_pool);
    alloc_new_block(interpreter, POOL_SIZE, arena_base->memory_pool);

    /* Constant strings - not compacted */
    arena_base->constant_string_pool = new_memory_pool(POOL_SIZE, (compact_f)NULLfunc);
    alloc_new_block(interpreter, POOL_SIZE, arena_base->constant_string_pool);
}

/*

=item C<void
Parrot_destroy_memory_pools(Interp *interpreter)>

Destroys the memory pools.

=cut

*/

void
Parrot_destroy_memory_pools(Interp *interpreter)
{
    int i;

    for (i = 0; i < 2; i++) {
        struct Memory_Pool *pool = i ?
                interpreter->arena_base->constant_string_pool :
                interpreter->arena_base->memory_pool;
        struct Memory_Block *cur_block, *next_block;

        cur_block = pool->top_block;
        while (cur_block) {
            next_block = cur_block->prev;
            mem_internal_free(cur_block);
            cur_block = next_block;
        }

        mem_internal_free(pool);
    }
}

/*

=back

=head1 SEE ALSO

F<include/parrot/resources.h>, F<src/memory.c>.

=head1 HISTORY

Initial version by Dan on 2001.10.2.

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
