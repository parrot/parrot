/* rxstacks.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
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

IntStack
intstack_new(struct Parrot_Interp *interpreter)
{
    IntStack stack = mem_sys_allocate(sizeof(struct IntStack_chunk_t));
    stack->used = 0;
    stack->next = stack;
    stack->prev = stack;
    return stack;
}

INTVAL
intstack_depth(struct Parrot_Interp *interpreter, IntStack stack)
{
    IntStack_Chunk chunk;
    INTVAL depth = stack->used;

    for (chunk = stack->next; chunk != stack; chunk = chunk->next)
        depth += chunk->used;

    return depth;
}

void
intstack_push(struct Parrot_Interp *interpreter, IntStack stack, INTVAL data)
{
    IntStack_Chunk chunk = stack->prev;
    IntStack_Entry entry = &chunk->entry[chunk->used];

    entry->value = data;

    /* Register the new entry */
    if (++chunk->used == STACK_CHUNK_DEPTH) {
        if (chunk->next == stack) {
            /* Need to add a new chunk */
            IntStack_Chunk new_chunk = mem_sys_allocate(sizeof(*new_chunk));
            new_chunk->used = 0;
            new_chunk->next = stack;
            new_chunk->prev = chunk;
            chunk->next = new_chunk;
            stack->prev = new_chunk;
        }
        else {
            /* Reuse the spare chunk we kept */
            chunk = chunk->next;
            stack->prev = chunk;
        }
    }
}

INTVAL
intstack_pop(struct Parrot_Interp *interpreter, IntStack stack)
{
    IntStack_Chunk chunk = stack->prev;
    IntStack_Entry entry;

    /* We may have an empty chunk at the end of the list */
    if (chunk->used == 0 && chunk != stack) {
        /* That chunk != stack check is just to allow the empty stack case
         * to fall through to the following exception throwing code. */

        /* If the chunk that has just become empty is not the last chunk
         * on the stack then we make it the last chunk */
        if (chunk->next != stack) {
            mem_sys_free(chunk->next);
            chunk->next = stack;
        }

        /* Now back to the previous chunk - we'll keep the one we have
         * just emptied around for now in case we need it again. */
        chunk = chunk->prev;
        stack->prev = chunk;
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


void
intstack_free(struct Parrot_Interp *interpreter, IntStack stack)
{
    IntStack chunk, temp;

    for (chunk = stack->next; chunk != stack; chunk = temp) {
        temp = chunk->next;
        mem_sys_free(chunk);
    }

    mem_sys_free(stack);
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
