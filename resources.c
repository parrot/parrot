/* resources.c 
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Allocate and deallocate tracked resources
 *  Data Structure and Algorithms:
 *     
 *  History:
 *     Initial version by Dan on 2001.10.2
 *  Notes:
 *  References:
 */

#include <assert.h>
#include "parrot/parrot.h"

#define RECLAMATION_FACTOR 0.20
#define MINIMUM_MEMPOOL_SIZE  1
#define MAXIMUM_MEMPOOL_SIZE  8

/** Parrot Memory Management Code **/

/* Allocate a new memory block. We allocate the larger of however much
 * was asked for or the default size, whichever's larger */
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

    /* Allocate a new block. Header info's on the front, plus a fudge
     * factor for good measure */
    new_block = mem_sys_allocate(sizeof(struct Memory_Block) +
                                 alloc_size + 32);
    if (!new_block) {
        return NULL;
    }

    new_block->free = alloc_size;
    new_block->size = alloc_size;
    new_block->next = NULL;
    new_block->prev = NULL;
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

/*  Alignment problems:  align_1 sets the size, but not the alignment
    of the memory block we are about to allocate.  The alignment of *this*
    block is currently determined by the align_1 sent in by the
    *previous* allocation.  See
    http://archive.develooper.com/perl6-internals%40perl.org/msg12310.html
    for details.
    Currently, we work around it by forcing all the *ALIGNMENT
    #defines in include/parrot/<file>.h to be the same :-).
*/
/* Allocates memory for headers */
static void *
mem_allocate(struct Parrot_Interp *interpreter, size_t *req_size,
             struct Memory_Pool *pool, size_t align_1)
{
    char *return_val;
    size_t size = *req_size;

    /* Ensure that our minimum size requirements are met, 
     * so that we have room for a forwarding COW pointer */
    if( size < sizeof(void*) )
        size = sizeof(void*);

    /* Make sure we have room for the buffer's tail flags,
     * also used by the COW logic to detect moved buffers */
    size += sizeof(struct Buffer_Tail);

    /* Round up to requested alignment */
    size = (size + align_1) & ~align_1;

    if (NULL == interpreter) {
        void *mem = mem_sys_allocate(size);
        return mem;
    }

    /* If not enough room, try to find some */
    if (pool->top_block == NULL) {
        alloc_new_block(interpreter, size, pool);
        interpreter->mem_allocs_since_last_collect++;
    }
    if (GC_DEBUG(interpreter)) {
        Parrot_do_dod_run(interpreter);
        if (pool->compact) {
            (*pool->compact)(interpreter, pool);
        }
    }
    if (pool->top_block->free < size) {
        /* Compact the pool if allowed and worthwhile */
        if (pool->compact) {
             /* don't bother reclaiming if its just chicken feed */
            if ((pool->possibly_reclaimable + pool->guaranteed_reclaimable) / 2
                > (size_t)(pool->total_allocated * pool->reclaim_factor)
                 /* don't bother reclaiming if it won't even be enough */
                 && (pool->guaranteed_reclaimable > size)
                 ) 
            {
                (*pool->compact)(interpreter, pool);
            } 
            else {
                Parrot_do_dod_run(interpreter);
            }

        }
        if (pool->top_block->free < size) {
            alloc_new_block(interpreter, size, pool);
            interpreter->mem_allocs_since_last_collect++;
            if (pool->top_block->free < size) {
                return NULL;
            }
        }
    }

    return_val = pool->top_block->top;
    pool->top_block->top += size;
    pool->top_block->free -= size;
    *req_size = size - sizeof(struct Buffer_Tail);
    ((struct Buffer_Tail*)((char *)return_val + size - 1))->flags = 0;
    return (void *)return_val;
}



/** Compaction Code **/

static INTVAL
buffer_movable(UINTVAL flags)
{
    UINTVAL mask = BUFFER_on_free_list_FLAG
                 | BUFFER_constant_FLAG
                 | BUFFER_immobile_FLAG
                 | BUFFER_external_FLAG;
    return !(flags & mask);
}

/* Compact the buffer pool */
static void compact_pool(struct Parrot_Interp *interpreter,
                         struct Memory_Pool *pool)
{
    UINTVAL total_size;
    struct Memory_Block *new_block;        /* A pointer to our working block */
    char *cur_spot;               /* Where we're currently copying to */
    UINTVAL cur_size;     /* How big our chunk is going to be */
    struct Small_Object_Arena *cur_buffer_arena;
    struct Small_Object_Pool *header_pool;
    INTVAL j;
    UINTVAL object_size;
    /* Bail if we're blocked */
    if (interpreter->GC_block_level) {
        return;
    }
    interpreter->GC_block_level++;

    /* We're collecting */
    interpreter->mem_allocs_since_last_collect = 0;
    interpreter->header_allocs_since_last_collect = 0;
    interpreter->collect_runs++;

    /* total-reclaimable == currently used. Add a minimum block to the
     * current amount, so we can avoid having to allocate it in the
     * future. */
    {
        struct Memory_Block *cur_block;
        total_size = 0;
        cur_block = pool->top_block;
        while (cur_block) {
            total_size += cur_block->size - cur_block->free;
            cur_block = cur_block->prev;
        }
    }
    /* this makes for ever increasing allocations but
     * fewer collect runs */
#ifdef WE_WANT_EVER_GROWING_ALLOCATIONS
    total_size += pool->minimum_block_size;
#endif

    /* Snag a block big enough for everything */
    new_block = alloc_new_block(interpreter, total_size, pool);
  
    /* Start at the beginning */
    cur_spot = new_block->start;
  
    /* Run through all the Buffer header pools and copy */
    for (j = -2; j < (INTVAL) interpreter->arena_base->num_sized; j++) {
        if (j == -2) header_pool = interpreter->arena_base->buffer_header_pool;
        else if (j == -1) header_pool =
            interpreter->arena_base->string_header_pool;
        else header_pool = interpreter->arena_base->sized_header_pools[j];
        if (header_pool == NULL) continue;
        
        object_size = header_pool->object_size;
        
        for (cur_buffer_arena = header_pool->last_Arena;
             NULL != cur_buffer_arena;
             cur_buffer_arena = cur_buffer_arena->prev)
        {
            Buffer *b = cur_buffer_arena->start_objects;
            UINTVAL i;
            for (i = 0; i < cur_buffer_arena->used; i++) {
                if (b->bufstart && buffer_movable(b->flags)) {
                    struct Buffer_Tail *tail = 
                        (struct Buffer_Tail *)((char *)b->bufstart +b->buflen);
                    ptrdiff_t offset = 0;
                    /* we can't perform the math all the time, 
                     * because strstart might be in unallocated memory */
                    if (b->flags & BUFFER_strstart_FLAG) {
                        offset = (ptrdiff_t)((STRING*)b)->strstart - 
                            (ptrdiff_t)b->bufstart;
                    }
                    /* buffer has already been moved; just change the header */
                    if (b->flags & BUFFER_COW_FLAG
                        && tail->flags & TAIL_moved_FLAG)
                    {
                        /* Find out who else references our data */
                        Buffer* hdr = *(Buffer**)(b->bufstart);
                        /* Make sure they know that we own it too */
                        hdr->flags |= BUFFER_COW_FLAG;
                        /* Now make sure we point to where the other guy does*/
                        b->bufstart = hdr->bufstart;
                        /* And if we're a string, update strstart */
                        /* Somewhat of a hack, but if we get per-pool
                         * collections, it should help ease the pain */
                        if (b->flags & BUFFER_strstart_FLAG) {
                            ((STRING*)b)->strstart = (char *)b->bufstart + 
                                offset;
                        }
                    }
                    else if (!(b->flags & BUFFER_external_FLAG))
                    {
                        struct Buffer_Tail *new_tail = 
                            (struct Buffer_Tail *)((char *)cur_spot + 
                                b->buflen);
                        /* Copy our memory to the new pool */
                        memcpy(cur_spot, b->bufstart, b->buflen);
                        new_tail->flags = 0;
                        /* If we're COW */
                        if (b->flags & BUFFER_COW_FLAG) {
                          /* Let the old buffer know how to find us */
                          *(Buffer**)(b->bufstart) = b;
                          /* No guaranatees that our data is still COW, 
                           * so assume not, and let the above code fix-up */
                          b->flags &= ~BUFFER_COW_FLAG;
                          /* Finally, let the tail know that we've moved,
                           * so that any other references can know to look
                           * for us and not re-copy */
                          tail->flags |= TAIL_moved_FLAG;
                        }
                        b->bufstart = cur_spot;
                        if (b->flags & BUFFER_strstart_FLAG) {
                            ((STRING*)b)->strstart = (char *)b->bufstart + 
                                offset;
                        }
                        cur_size = b->buflen + sizeof(struct Buffer_Tail);
                        cur_size = (cur_size + header_pool->align_1) & 
                            ~header_pool->align_1;
                        cur_spot += cur_size;
                    }
                }
                b = (Buffer *)((char*)b + object_size);
            }
        }
    }

    /* Run through all the out-of-band Buffer header pools and copy */
    /* This code ignores COW, for now. This essentially means that if 
     * any other buffers COW-reference data with the buffers below, 
     * that data will get duplicated during this collection run. */
    for (j = 0;
         j < (INTVAL)( interpreter->arena_base->extra_buffer_headers.buflen /
            sizeof(Buffer*) );
         j++
        ) {
        Buffer** buffers = 
            interpreter->arena_base->extra_buffer_headers.bufstart;
        Buffer* b = buffers[j];
        if (b->bufstart && buffer_movable(b->flags)) {
            struct Buffer_Tail *new_tail = 
                   (struct Buffer_Tail *)((char *)cur_spot + b->buflen);
            /* we can't perform the math all the time, 
             * because strstart might be in unallocated memory */
            ptrdiff_t offset = 0;
            if (b->flags & BUFFER_strstart_FLAG) {
                offset = (ptrdiff_t)((STRING*)b)->strstart - 
                    (ptrdiff_t)b->bufstart;
            }
            memcpy(cur_spot, b->bufstart, b->buflen);
            new_tail->flags = 0;
            b->bufstart = cur_spot;
            cur_size = b->buflen;
            cur_size = (cur_size + BUFFER_ALIGNMENT - 1) & 
                ~(BUFFER_ALIGNMENT - 1);
            cur_spot += cur_size;
            if (b->flags & BUFFER_strstart_FLAG) {
                ((STRING*)b)->strstart = (char *)b->bufstart + offset;
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

    /* Now we're done. We're already on the pool's free list, 
     * so let us be the only one on the free list and free the rest */
    {
        struct Memory_Block *cur_block, *next_block;
    
        assert( new_block == pool->top_block );
        cur_block = pool->top_block->prev;
        while (cur_block) {
            next_block = cur_block->prev;
            /* Note that we don't have it any more */
            interpreter->memory_allocated -= cur_block->size;
            /* We know the pool body and pool header are a single chunk, so
               this is enough to get rid of 'em both */
            mem_sys_free(cur_block);
            cur_block = next_block;
        }

        /* Set our new pool as the only pool */
        new_block->prev = NULL;
        pool->total_allocated = total_size;
    }

    pool->guaranteed_reclaimable = 0;
    pool->possibly_reclaimable = 0;
    interpreter->GC_block_level--;

}

/* Go do a GC run. This only scans the string pools and compacts them,
 * it doesn't check for string liveness */
void
Parrot_go_collect(struct Parrot_Interp *interpreter)
{
    compact_pool(interpreter, interpreter->arena_base->memory_pool);
}


/** Parrot Re/Allocate Code **/

/* Takes an interpreter, a buffer pointer, and a new size. The buffer
 * pointer is in as a void * because we may take a STRING or
 * something, and C doesn't subclass */
void *
Parrot_reallocate(struct Parrot_Interp *interpreter, void *from, size_t tosize)
{
    /* Put our void * pointer into something we don't have to cast
     * around with */
    Buffer *buffer;
    size_t copysize;
    size_t alloc_size = tosize;
    void *mem;

    buffer = from;
    copysize = (buffer->buflen > tosize ? tosize : buffer->buflen);
    if (interpreter) {
        if (!(buffer->flags & BUFFER_COW_FLAG)) {
            interpreter->arena_base->memory_pool->guaranteed_reclaimable +=
                buffer->buflen;
        }
        interpreter->arena_base->memory_pool->possibly_reclaimable +=
            buffer->buflen;
        mem = mem_allocate(interpreter, &alloc_size, 
            interpreter->arena_base->memory_pool, BUFFER_ALIGNMENT-1);
    }
    else {
        mem = mem_allocate(NULL, &alloc_size, NULL, BUFFER_ALIGNMENT-1);
    }

    if (!mem) {
        return NULL;
    }
    /* We shouldn't ever have a 0 from size, but we do. If we can
     * track down those bugs, this can be removed which would make
     * things cheaper */
    if (copysize) {
        memcpy(mem, buffer->bufstart, copysize);
    }
    buffer->bufstart = mem;
    buffer->buflen = tosize;
    return mem;
}

/* Takes an interpreter, a STRING pointer, and a new size. 
 * The destination may be bigger, since we round up to the allocation quantum*/
void *
Parrot_reallocate_string(struct Parrot_Interp *interpreter, STRING *str, 
                         size_t tosize)
{
    size_t copysize;
    size_t alloc_size = tosize;
    void *mem;
    struct Memory_Pool *pool;

    copysize = (str->buflen > tosize ? tosize : str->buflen);
    pool = (str->flags & BUFFER_constant_FLAG)
         ? interpreter->arena_base->constant_string_pool
         : interpreter->arena_base->memory_pool;
    if (!(str->flags & BUFFER_COW_FLAG)) {
        pool->guaranteed_reclaimable += str->buflen;
    }
    pool->possibly_reclaimable += str->buflen;

    mem = mem_allocate(interpreter, &alloc_size, pool, STRING_ALIGNMENT-1);
    if (!mem) {
        return NULL;
    }
    /* We shouldn't ever have a 0 from size, but we do. If we can
     * track down those bugs, this can be removed which would make
     * things cheaper */
    if (copysize) {
         memcpy(mem, str->bufstart, copysize);
    }
    str->bufstart = mem;
    str->buflen = alloc_size;
    str->strstart = str->bufstart;
    return mem;
}

/* Allocate exactly as much memory as they asked for */
void *
Parrot_allocate(struct Parrot_Interp *interpreter, void *buffer, size_t size)
{
    size_t req_size = size;
    ((Buffer *)buffer)->buflen = 0;
    ((Buffer *)buffer)->bufstart = NULL;
    ((Buffer *)buffer)->bufstart = mem_allocate(interpreter, &req_size, 
        interpreter->arena_base->memory_pool, BUFFER_ALIGNMENT-1);
    ((Buffer *)buffer)->buflen = size;
    return buffer;
}

/* Allocate at least as much memory as they asked for. We round the
 * amount up to the allocation quantum */
void *
Parrot_allocate_string(struct Parrot_Interp *interpreter, STRING *str, 
                       size_t size)
{
    size_t req_size = size;
    struct Memory_Pool *pool;

    str->buflen = 0;
    str->bufstart = NULL;
    str->strstart = NULL;

    if (!interpreter) {
        str->bufstart = mem_allocate(NULL, &req_size, NULL,STRING_ALIGNMENT-1);
    }
    else {
        pool = (str->flags & BUFFER_constant_FLAG)
             ? interpreter->arena_base->constant_string_pool
             : interpreter->arena_base->memory_pool;
        str->bufstart = mem_allocate(interpreter, &req_size, pool,
            STRING_ALIGNMENT-1);
    }
    str->buflen = req_size;
    str->strstart = str->bufstart;
    return str;
}




/* Create a new memory pool */
static struct Memory_Pool *
new_memory_pool(size_t min_block, 
                void (*compact)(struct Parrot_Interp *, struct Memory_Pool *))
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

/* Initialize the managed memory pools */
void
Parrot_initialize_memory_pools(struct Parrot_Interp *interpreter)
{
    /* Buffers */
    interpreter->arena_base->memory_pool = 
        new_memory_pool(16384, 
                        &compact_pool);
    alloc_new_block(interpreter, 32768, 
                    interpreter->arena_base->memory_pool);

    /* Constant strings - not compacted */
    interpreter->arena_base->constant_string_pool = 
        new_memory_pool(8192, NULL);
}


/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
