
#include <stdlib.h>
#include "imc.h"

/* Stack functions. Stolen from rxstacks.c */

IntStack
intstack_new()
{
    IntStack stack = malloc(sizeof(struct IntStack_chunk_t));
    stack->used = 0;
    stack->next = stack;
    stack->prev = stack;
    return stack;
}

int
intstack_depth(IntStack stack)
{
    IntStack_Chunk chunk;
    int depth = stack->used;

    for (chunk = stack->next; chunk != stack; chunk = chunk->next)
        depth += chunk->used;

    return depth;
}

void
intstack_push(IntStack stack, int data)
{
    IntStack_Chunk chunk = stack->prev;
    IntStack_Entry entry = &chunk->entry[chunk->used];

    entry->value = data;

    /* Register the new entry */
    if (++chunk->used == STACK_CHUNK_DEPTH) {
        /* Need to add a new chunk */
        IntStack_Chunk new_chunk = malloc(sizeof(*new_chunk));
        new_chunk->used = 0;
        new_chunk->next = stack;
        new_chunk->prev = chunk;
        chunk->next = new_chunk;
        stack->prev = new_chunk;
    }

}

int
intstack_pop(IntStack stack)
{
    IntStack_Chunk chunk = stack->prev;
    IntStack_Entry entry;

    /* We may have an empty chunk at the end of the list */
    if (chunk->used == 0 && chunk != stack) {
        /* That chunk != stack check is just to allow the empty stack case
         * to fall through to the following exception throwing code. */

        /* Need to pop off the last entry */
        stack->prev = chunk->prev;
        stack->prev->next = stack;
        /* MEMORY LEAK... */
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
