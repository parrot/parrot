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
#define MINIMUM_MEMPOOL_SIZE  1
#define MAXIMUM_MEMPOOL_SIZE  8
#define WE_WANT_EVER_GROWING_ALLOCATIONS
typedef void (*compact_f) (struct Parrot_Interp *, struct Memory_Pool *);

/*

=item C<static void *
alloc_new_block(struct Parrot_Interp *interpreter,
        size_t size, struct Memory_Pool *pool)>

Allocate a new memory block. We allocate the larger of however much was
asked for or the default size, whichever's larger.

=cut

*/

static void *
alloc_new_block(struct Parrot_Interp *interpreter,
        size_t size, struct Memory_Pool *pool)
{
    size_t alloc_size;
    struct Memory_Block *new_block;

    if (pool) {
        alloc_size = (size > pool->minimum_block_size)
                ? size : pool->minimum_block_size;
    }
    else {
        alloc_size = size;
    }

    /* Allocate a new block. Header info's on the front, plus a fudge factor
     * for good measure */
    new_block = mem_sys_allocate_zeroed(sizeof(struct Memory_Block) +
            alloc_size + 32);
    if (!new_block) {
        fprintf(stderr, "out of mem allocsize = %d\n", (int)alloc_size+32);
        exit(1);
        return NULL;
    }

    new_block->free = alloc_size;
    new_block->size = alloc_size;
    SET_NULL(new_block->next);
    new_block->start = (char *)new_block + sizeof(struct Memory_Block);
    new_block->top = new_block->start;

    /* Note that we've allocated it */
    interpreter->memory_allocated += alloc_size;

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
mem_allocate(struct Parrot_Interp *interpreter, size_t *req_size,
        struct Memory_Pool *pool, size_t align_1)>

Allocates memory for headers.

Alignment problems:  C<align_1> sets the size, but not the alignment of
the memory block we are about to allocate.  The alignment of I<this>
block is currently determined by the C<align_1> sent in by the
I<previous> allocation. See
L<http://archive.develooper.com/perl6-internals%40perl.org/msg12310.html
> for details. Currently, we work around it by forcing all the
C<*ALIGNMENT> C<#define>s in F<<include/parrot/<file>.h>> to be the
same.


=cut

*/

static void *
mem_allocate(struct Parrot_Interp *interpreter, size_t *req_size,
        struct Memory_Pool *pool, size_t align_1)
{
    char *return_val;
    size_t size = *req_size;

    /* Ensure that our minimum size requirements are met, so that we have room
     * for a forwarding COW pointer */
    if (size < sizeof(void *))
        size = sizeof(void *);

    /* Make sure we have room for the buffer's tail flags, also used by the
     * COW logic to detect moved buffers */
    size += sizeof(struct Buffer_Tail);

    /* Round up to requested alignment */
    size = (size + align_1) & ~align_1;

    /* If not enough room, try to find some */
    if (pool->top_block == NULL) {
        alloc_new_block(interpreter, size, pool);
        interpreter->mem_allocs_since_last_collect++;
    }
    if (0 && GC_DEBUG(interpreter)) {
        Parrot_do_dod_run(interpreter, DOD_trace_stack_FLAG);
        if (pool->compact) {
            (*pool->compact) (interpreter, pool);
        }
    }
    if (pool->top_block->free < size) {
        Parrot_do_dod_run(interpreter, DOD_trace_stack_FLAG);
        /* Compact the pool if allowed and worthwhile */
        if (pool->compact) {
            /* don't bother reclaiming if it's just chicken feed */
            if (pool->possibly_reclaimable * pool->reclaim_factor
                    > size
                    /* don't bother reclaiming if it won't even be enough */
                    || (pool->guaranteed_reclaimable > size)
                    ) {
                (*pool->compact) (interpreter, pool);
            }

        }
        if (pool->top_block->free < size) {
            if (pool->minimum_block_size < 65536*16)
                pool->minimum_block_size *= 2;
            alloc_new_block(interpreter, size, pool);
            interpreter->mem_allocs_since_last_collect++;
            if (pool->top_block->free < size) {
                fprintf(stderr, "out of mem\n");
                exit(1);
                return NULL;
            }
        }
    }

    return_val = pool->top_block->top;
    pool->top_block->top += size;
    pool->top_block->free -= size;
    *req_size = size - sizeof(struct Buffer_Tail);
    ((struct Buffer_Tail *)((char *)return_val + size - 1))->flags = 0;
    return (void *)return_val;
}

/*

=item C<static PARROT_INLINE void
profile_gc_start(Parrot_Interp interpreter)>

Called within C<compact_pool()> to record the start time of a GC run if
profiling is enabled.

=cut

*/

static PARROT_INLINE void
profile_gc_start(Parrot_Interp interpreter)
{
    if (Interp_flags_TEST(interpreter, PARROT_PROFILE_FLAG)) {
        interpreter->profile->gc_time = Parrot_floatval_time();
    }
}

/*

=item C<static PARROT_INLINE void
profile_gc_end(Parrot_Interp interpreter)>

Called within C<compact_pool()> to record the end time of a GC run if
profiling is enabled.

=cut

*/

static PARROT_INLINE void
profile_gc_end(Parrot_Interp interpreter)
{
    if (Interp_flags_TEST(interpreter, PARROT_PROFILE_FLAG)) {
        RunProfile *profile = interpreter->profile;
        FLOATVAL now = Parrot_floatval_time();

        profile->data[PARROT_PROF_GC].numcalls++;
        profile->data[PARROT_PROF_GC].time += now - profile->gc_time;
        profile->starttime += now - profile->gc_time;
    }
}

/*

=back

=head2 Compaction Code

=over

=item C<static void
compact_pool(struct Parrot_Interp *interpreter, struct Memory_Pool *pool)>

Compact the buffer pool.

=cut

*/

static void
compact_pool(struct Parrot_Interp *interpreter, struct Memory_Pool *pool)
{
    UINTVAL total_size;
    struct Memory_Block *new_block;     /* A pointer to our working block */
    char *cur_spot;             /* Where we're currently copying to */
    UINTVAL cur_size;           /* How big our chunk is going to be */
    struct Small_Object_Arena *cur_buffer_arena;
    struct Small_Object_Pool *header_pool;
    INTVAL j;
    UINTVAL object_size;

    /* Bail if we're blocked */
    if (interpreter->GC_block_level) {
        return;
    }
    Parrot_block_GC(interpreter);
    if (interpreter->profile)
        profile_gc_start(interpreter);

    /* We're collecting */
    interpreter->mem_allocs_since_last_collect = 0;
    interpreter->header_allocs_since_last_collect = 0;
    interpreter->collect_runs++;

    /* total-reclaimable == currently used. Add a minimum block to the current
     * amount, so we can avoid having to allocate it in the future. */
    {
        struct Memory_Block *cur_block;

        total_size = 0;
        cur_block = pool->top_block;
        while (cur_block) {
            total_size += cur_block->size - cur_block->free;
            cur_block = cur_block->prev;
        }
    }
    /* total_size -= pool->guaranteed_reclaimable; */
    /* this makes for ever increasing allocations but fewer collect runs */
#ifdef WE_WANT_EVER_GROWING_ALLOCATIONS
    total_size += pool->minimum_block_size;
#endif

    /* Snag a block big enough for everything */
    new_block = alloc_new_block(interpreter, total_size, pool);

    /* Start at the beginning */
    cur_spot = new_block->start;

    /* Run through all the Buffer header pools and copy */
    for (j = 0; j < (INTVAL)interpreter->arena_base->num_sized; j++) {
        header_pool = interpreter->arena_base->sized_header_pools[j];
        if (header_pool == NULL)
            continue;

        object_size = header_pool->object_size;

        for (cur_buffer_arena = header_pool->last_Arena;
                NULL != cur_buffer_arena;
                cur_buffer_arena = cur_buffer_arena->prev) {
            Buffer *b = cur_buffer_arena->start_objects;
            UINTVAL i;

            for (i = 0; i < cur_buffer_arena->used; i++) {
                /* ! (immobile | on_free_list | constant | external) */
                if (PObj_buflen(b) && PObj_is_movable_TESTALL(b)) {
                    struct Buffer_Tail *tail =
                            (struct Buffer_Tail *)((char *)PObj_bufstart(b) +
                            PObj_buflen(b));
                    ptrdiff_t offset = 0;

                    /* we can't perform the math all the time, because
                     * strstart might be in unallocated memory */
                    if (PObj_is_string_TEST(b)) {
                        offset = (ptrdiff_t)((STRING *)b)->strstart -
                                (ptrdiff_t)PObj_bufstart(b);
                    }
                    /* buffer has already been moved; just change the header */
                    if (PObj_COW_TEST(b) && tail->flags & TAIL_moved_FLAG) {
                        /* Find out who else references our data */
                        Buffer *hdr = *(Buffer **)(PObj_bufstart(b));

                        /* Make sure they know that we own it too */
                        PObj_COW_SET(hdr);
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
                    else if (!PObj_external_TEST(b)) {
                        struct Buffer_Tail *new_tail =
                                (struct Buffer_Tail *)((char *)cur_spot +
                                PObj_buflen(b));
                        /* Copy our memory to the new pool */
                        memcpy(cur_spot, PObj_bufstart(b), PObj_buflen(b));
                        new_tail->flags = 0;
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
                            tail->flags |= TAIL_moved_FLAG;
                        }
                        PObj_bufstart(b) = cur_spot;
                        if (PObj_is_string_TEST(b)) {
                            ((STRING *)b)->strstart = (char *)PObj_bufstart(b) +
                                    offset;
                        }
                        cur_size = PObj_buflen(b) + sizeof(struct Buffer_Tail);
                        cur_size = (cur_size + header_pool->align_1) &
                                ~header_pool->align_1;
                        cur_spot += cur_size;
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

    interpreter->memory_collected += (new_block->top - new_block->start);

    /* Now we're done. We're already on the pool's free list, so let us be the
     * only one on the free list and free the rest */
    {
        struct Memory_Block *cur_block, *next_block;

        assert(new_block == pool->top_block);
        cur_block = new_block->prev;
        while (cur_block) {
            next_block = cur_block->prev;
            /* Note that we don't have it any more */
            interpreter->memory_allocated -= cur_block->size;
            /* We know the pool body and pool header are a single chunk, so
             * this is enough to get rid of 'em both */
            mem_sys_free(cur_block);
            cur_block = next_block;
        }

        /* Set our new pool as the only pool */
        new_block->prev = NULL;
        pool->total_allocated = total_size;
    }

    pool->guaranteed_reclaimable = 0;
    pool->possibly_reclaimable = 0;
    if (interpreter->profile)
        profile_gc_end(interpreter);
    Parrot_unblock_GC(interpreter);

}

/*  */
/*

=item C<void
Parrot_go_collect(struct Parrot_Interp *interpreter)>

Go do a GC run. This only scans the string pools and compacts them, it
doesn't check for string liveness.

=cut

*/

void
Parrot_go_collect(struct Parrot_Interp *interpreter)
{
    compact_pool(interpreter, interpreter->arena_base->memory_pool);
}

/*

=back

=head2 Parrot Re/Allocate Code

=over 4

=item C<void *
Parrot_reallocate(struct Parrot_Interp *interpreter, void *from, size_t tosize)>

Takes an interpreter, a buffer pointer, and a new size. The buffer
pointer is in as a C<void *> because we may take a C<STRING> or
something, and C doesn't subclass.

=cut

*/

void *
Parrot_reallocate(struct Parrot_Interp *interpreter, void *from, size_t tosize)
{
    /* Put our void * pointer into something we don't have to cast around with
     */
    Buffer *buffer;
    size_t copysize;
    size_t alloc_size = tosize;
    void *mem;

    buffer = from;
    copysize = (PObj_buflen(buffer) > tosize ? tosize : PObj_buflen(buffer));
    if (!PObj_COW_TEST(buffer)) {
        interpreter->arena_base->memory_pool->guaranteed_reclaimable +=
                PObj_buflen(buffer);
    }
    interpreter->arena_base->memory_pool->possibly_reclaimable +=
            PObj_buflen(buffer);
    mem = mem_allocate(interpreter, &alloc_size,
            interpreter->arena_base->memory_pool, BUFFER_ALIGNMENT - 1);

    if (!mem) {
        return NULL;
    }
    /* We shouldn't ever have a 0 from size, but we do. If we can track down
     * those bugs, this can be removed which would make things cheaper */
    if (copysize) {
        memcpy(mem, PObj_bufstart(buffer), copysize);
    }
    PObj_bufstart(buffer) = mem;
    PObj_buflen(buffer) = tosize;
    return mem;
}

/*

=item C<void *
Parrot_reallocate_string(struct Parrot_Interp *interpreter, STRING *str,
        size_t tosize)>

Takes an interpreter, a C<STRING> pointer, and a new size. The
destination may be bigger, since we round up to the allocation quantum.

=cut

*/

void *
Parrot_reallocate_string(struct Parrot_Interp *interpreter, STRING *str,
        size_t tosize)
{
    size_t copysize;
    size_t alloc_size = tosize;
    void *mem;
    struct Memory_Pool *pool;

    copysize = (PObj_buflen(str) > tosize ? tosize : PObj_buflen(str));

    pool = PObj_constant_TEST(str)
            ? interpreter->arena_base->constant_string_pool
            : interpreter->arena_base->memory_pool;
    if (!PObj_COW_TEST(str)) {
        pool->guaranteed_reclaimable += PObj_buflen(str);
    }
    pool->possibly_reclaimable += PObj_buflen(str);

    mem = mem_allocate(interpreter, &alloc_size, pool, STRING_ALIGNMENT - 1);

    if (!mem) {
        return NULL;
    }
    /* We shouldn't ever have a 0 from size, but we do. If we can track down
     * those bugs, this can be removed which would make things cheaper */
    if (copysize) {
        memcpy(mem, PObj_bufstart(str), copysize);
    }
    PObj_bufstart(str) = mem;
    PObj_buflen(str) = alloc_size;
    str->strstart = PObj_bufstart(str);
    return mem;
}

/*

=item C<void *
Parrot_allocate(struct Parrot_Interp *interpreter, void *buffer, size_t size)>

Allocate exactly as much memory as they asked for.

=cut

*/

void *
Parrot_allocate(struct Parrot_Interp *interpreter, void *buffer, size_t size)
{
    size_t req_size = size;

    PObj_buflen((Buffer *)buffer) = 0;
    PObj_bufstart((Buffer *)buffer) = NULL;
    PObj_bufstart((Buffer *)buffer) = mem_allocate(interpreter, &req_size,
            interpreter->arena_base->memory_pool, BUFFER_ALIGNMENT - 1);
    PObj_buflen((Buffer *)buffer) = size;
    return buffer;
}

/*

=item C<void *
Parrot_allocate_zeroed(struct Parrot_Interp *interpreter,
        void *buffer, size_t size)>

Just calls C<Parrot_allocate()>, which also returns zeroed memory.

=cut

*/

void *
Parrot_allocate_zeroed(struct Parrot_Interp *interpreter,
        void *buffer, size_t size)
{
    return Parrot_allocate(interpreter, buffer, size);
}

/*

=item C<void *
Parrot_allocate_string(struct Parrot_Interp *interpreter, STRING *str,
        size_t size)>

Allocate at least as much memory as they asked for. We round the amount
up to the allocation quantum.

=cut

*/

void *
Parrot_allocate_string(struct Parrot_Interp *interpreter, STRING *str,
        size_t size)
{
    size_t req_size = size;
    struct Memory_Pool *pool;

    PObj_buflen(str) = 0;
    PObj_bufstart(str) = NULL;
    str->strstart = NULL;

    pool = PObj_constant_TEST(str)
            ? interpreter->arena_base->constant_string_pool
            : interpreter->arena_base->memory_pool;
    PObj_bufstart(str) = mem_allocate(interpreter, &req_size, pool,
            STRING_ALIGNMENT - 1);
    if (PObj_bufstart(str) == NULL) {
        internal_exception(ALLOCATION_ERROR, "Out of memory");
    }
    PObj_buflen(str) = req_size;
    str->strstart = PObj_bufstart(str);
    return str;
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

    pool = mem_sys_allocate(sizeof(struct Memory_Pool));
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
Parrot_initialize_memory_pools(struct Parrot_Interp *interpreter)>

Initialize the managed memory pools.

=cut

*/

#define POOL_SIZE 65536*2
void
Parrot_initialize_memory_pools(struct Parrot_Interp *interpreter)
{
    /* Buffers */
    /* setting min_size to 16384 makes this assert: assert(new_block->size >=
     * (size_t)new_block->top - (size_t)new_block->start); fail. 16 bytes
     * seem to be missing, or where copied and not accounted elsewhere. This
     * breaks 2 tests: t/op/string_29 and _94, when run with --gc-debug */

    interpreter->arena_base->memory_pool =
            new_memory_pool(POOL_SIZE, &compact_pool);
    alloc_new_block(interpreter, POOL_SIZE,
                    interpreter->arena_base->memory_pool);

    /* Constant strings - not compacted */
    interpreter->arena_base->constant_string_pool =
            new_memory_pool(8192, (compact_f)NULLfunc);
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
            mem_sys_free(cur_block);
            cur_block = next_block;
        }

        mem_sys_free(pool);
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
