/* rxstacks.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Regex stack handling routines for Parrot
 *  Data Structure and Algorithms:
 *     Same as regular stacks, except they store only INTVALs and don't have
 *     cleanup routines.
 *  History:
 *  Notes:
 * References: */

#include "parrot/parrot.h"
#include "parrot/rxstacks.h"

#define STACK_CHUNK_BASE(x) (void *)(MASK_STACK_CHUNK_LOW_BITS & (ptrcast_t)x)

rxStack
rxstack_new(struct Parrot_Interp *interpreter)
{
    rxStack stack = mem_allocate_aligned(sizeof(struct rxStack_chunk_t));
    stack->used = 0;
    stack->next = stack;
    stack->prev = stack;
    return stack;
}

INTVAL
rxstack_depth(struct Parrot_Interp *interpreter, rxStack stack)
{
    rxStack_Chunk chunk;
    INTVAL depth = stack->used;

    for (chunk = stack->next; chunk != stack; chunk = chunk->next)
        depth += chunk->used;

    return depth;
}

void
rxstack_push(struct Parrot_Interp *interpreter, rxStack stack, INTVAL data)
{
    rxStack_Chunk chunk = stack->prev;
    rxStack_Entry entry = &chunk->entry[chunk->used];

    entry->value = data;

    /* Register the new entry */
    if (++chunk->used == STACK_CHUNK_DEPTH) {
        /* Need to add a new chunk */
        rxStack_Chunk new_chunk = mem_allocate_aligned(sizeof(*new_chunk));
        new_chunk->used = 0;
        new_chunk->next = stack;
        new_chunk->prev = chunk;
        chunk->next = new_chunk;
        stack->prev = new_chunk;
    }
}

INTVAL
rxstack_pop(struct Parrot_Interp *interpreter, rxStack stack)
{
    rxStack_Chunk chunk = stack->prev;
    rxStack_Entry entry;

    /* We may have an empty chunk at the end of the list */
    if (chunk->used == 0 && chunk != stack) {
        /* That chunk != stack check is just to allow the empty stack case
         * to fall through to the following exception throwing code. */

        /* Need to pop off the last entry */
        stack->prev = chunk->prev;
        stack->prev->next = stack;
        /* Relying on GC feels dirty... */
        chunk = stack->prev;
    }

    /* Quick sanity check */
    if (chunk->used == 0) {
        internal_exception(ERROR_STACK_EMPTY, "No entries on stack!\n");
    }

    entry = &chunk->entry[chunk->used - 1];

    /* Now decrement the SP */
    chunk->used--;

    /* Snag the value */
    return entry->value;
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
