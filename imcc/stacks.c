
#include <stdlib.h>
#include "imc.h"

/* Stack functions. Stolen from rxstacks.c */

IMCStack
imcstack_new()
{
    IMCStack stack = malloc(sizeof(struct IMCStack_chunk_t));
    stack->used = 0;
    stack->next = stack;
    stack->prev = stack;
    return stack;
}

int
imcstack_depth(IMCStack stack)
{
    IMCStack_Chunk chunk;
    int depth = stack->used;

    for (chunk = stack->next; chunk != stack; chunk = chunk->next)
        depth += chunk->used;

    return depth;
}

void
imcstack_free(IMCStack stack)
{
    IMCStack_Chunk chunk, next;

    for (chunk = stack->next; chunk != stack; ) {
       next = chunk->next;
        free(chunk);
       chunk = next;
    }
    free(stack);
}

void
imcstack_push(IMCStack stack, int data)
{
    IMCStack_Chunk chunk = stack->prev;
    IMCStack_Entry entry = &chunk->entry[chunk->used];

    entry->value = data;

    /* Register the new entry */
    if (++chunk->used == STACK_CHUNK_DEPTH) {
        /* Need to add a new chunk */
        IMCStack_Chunk new_chunk = malloc(sizeof(*new_chunk));
        new_chunk->used = 0;
        new_chunk->next = stack;
        new_chunk->prev = chunk;
        chunk->next = new_chunk;
        stack->prev = new_chunk;
    }

}

int
imcstack_pop(IMCStack stack)
{
    IMCStack_Chunk chunk = stack->prev;
    IMCStack_Entry entry;

    /* We may have an empty chunk at the end of the list */
    if (chunk->used == 0 && chunk != stack) {
        /* That chunk != stack check is just to allow the empty stack case
         * to fall through to the following exception throwing code. */

        /* Need to pop off the last entry */
        stack->prev = chunk->prev;
        stack->prev->next = stack;
	free(chunk);
        chunk = stack->prev;
    }

    /* Quick sanity check */
    if (chunk->used == 0) {
        fprintf(stderr, "No entries on stack!\n");
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
