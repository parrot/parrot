/* stacks.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Stack handling routines for Parrot
 *  Data Structure and Algorithms:
 *     The stack is stored as a circular, doubly-linked list of
 *     chunks, where each chunk has room for STACK_CHUNK_DEPTH
 *     entries. The invariant maintained is that there is always room
 *     for another entry; if a chunk is filled, a new chunk is added
 *     onto the list before returning.
 *  History:
 *  Notes:
 * References: */

#include <assert.h>
#include "parrot/parrot.h"

#define STACK_CHUNK_BASE(x) (void *)(MASK_STACK_CHUNK_LOW_BITS & (ptrcast_t)x)

Stack
new_stack(struct Parrot_Interp *interpreter)
{
    Stack stack=mem_allocate_aligned(sizeof(struct Stack_chunk_t));
    stack->used=0;
    stack->next=stack;
    stack->prev=stack;
    return stack;
}

INTVAL
stack_depth(struct Parrot_Interp *interpreter, Stack stack)
{
    Stack_Chunk chunk;
    INTVAL depth = stack->used;

    for (chunk = stack->next; chunk != stack; chunk = chunk->next)
        depth += chunk->used;

    return depth;
}

/* Returns NULL if depth > number of entries in stack */
Stack_Entry
stack_entry(struct Parrot_Interp *interpreter, Stack stack, INTVAL depth)
{
    Stack_Chunk chunk = stack->prev; /* Start at top */

    while (depth >= chunk->used && chunk != stack) {
        depth -= chunk->used;
        chunk = chunk->prev;
    }

    if (depth >= chunk->used) return NULL;

    return &chunk->entry[chunk->used - depth - 1];
}

/* Rotate the top N entries by one */
void
rotate_entries(struct Parrot_Interp *interpreter, Stack stack, INTVAL depth)
{
    struct Stack_entry_t temp;
    INTVAL i;

    if (depth <= 0) {
        return;
    }

    if (stack_depth(interpreter, stack) < depth) {
        internal_exception(ERROR_STACK_SHALLOW, "Stack too shallow!\n");
    }

    if (depth == 1) {
        return;
    }

    temp = *stack_entry(interpreter, stack, 0);

    for(i = 0; i < depth - 1; i++) {
      *stack_entry(interpreter, stack, i) = 
          *stack_entry(interpreter, stack, i + 1);
    }

    *stack_entry(interpreter, stack, depth - 1) = temp;
}

/* Push something on the generic stack.

   Note that the cleanup pointer, if non-NULL, points to a routine
   that'll be called when the entry is removed from the stack. This is
   handy for those cases where you need some sort of activity to take
   place when an entry is removed, such as when you push a lexical
   lock onto the call stack, or localize (or tempify, or whatever
   we're calling it) variable or something
 */
void
stack_push(struct Parrot_Interp *interpreter, Stack stack,
           void *thing, INTVAL type, void (*cleanup)(Stack_Entry))
{
    Stack_Chunk chunk = stack->prev;
    Stack_Entry entry = &chunk->entry[chunk->used];

    /* Remember the type */
    entry->entry_type = type;
    /* If we were passed a cleanup function, mark the flag entry
       for this as needing cleanup*/
    entry->flags = (cleanup ? STACK_ENTRY_CLEANUP : 0);
    /* Remember the cleanup function */
    entry->cleanup = cleanup;
    /* Store our thing */
    switch (type) {
    case STACK_ENTRY_INT:
        entry->entry.int_val = *(INTVAL *)thing;
        break;
    case STACK_ENTRY_FLOAT:
        entry->entry.num_val = *(FLOATVAL *)thing;
        break;
    case STACK_ENTRY_PMC:
        entry->entry.pmc_val = thing;
        break;
    case STACK_ENTRY_STRING:
        entry->entry.string_val = thing;
        break;
    case STACK_ENTRY_POINTER:
        entry->entry.generic_pointer = thing;
        break;
    case STACK_ENTRY_DESTINATION:
        entry->entry.generic_pointer = thing;
        break;
    }

    /* Register the new entry */
    if (++chunk->used == STACK_CHUNK_DEPTH) {
        /* Need to add a new chunk */
        Stack_Chunk new_chunk = mem_allocate_aligned(sizeof(*new_chunk));
        new_chunk->used = 0;
        new_chunk->next = stack;
        new_chunk->prev = chunk;
        chunk->next = new_chunk;
        stack->prev = new_chunk;
    }
}

/* Pop off an entry and return a pointer to the contents */
void *
stack_pop(struct Parrot_Interp *interpreter, Stack stack,
          void *where, INTVAL type)
{
    Stack_Chunk chunk = stack->prev;
    Stack_Entry entry;

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

    /* Types of 0 mean we don't care */
    if (type && entry->entry_type != type) {
        internal_exception(ERROR_BAD_STACK_TYPE, 
                           "Wrong type on top of stack!\n");
    }

    /* Cleanup routine? */
    if (entry->flags & STACK_ENTRY_CLEANUP) {
        (*entry->cleanup)(entry);
    }

    /* Now decrement the SP */
    chunk->used--;

    /* Sometimes the caller doesn't care what the value was */
    if (where == NULL) return NULL;

    /* Snag the value */
    switch(type) {
    case STACK_ENTRY_INT:
        *(INTVAL *)where = entry->entry.int_val;
        break;
    case STACK_ENTRY_FLOAT:
        *(FLOATVAL *)where = entry->entry.num_val;
        break;
    case STACK_ENTRY_PMC:
        *(PMC **)where = entry->entry.pmc_val;
        break;
    case STACK_ENTRY_STRING:
        *(STRING **)where = entry->entry.string_val;
        break;
    case STACK_ENTRY_POINTER:
        *(void **)where = entry->entry.generic_pointer;
        break;
    case STACK_ENTRY_DESTINATION:
        *(void **)where = entry->entry.generic_pointer;
        break;
    }

    return where;
}

/* Pop off a destination entry and return a pointer to the contents*/
void *
pop_dest(struct Parrot_Interp *interpreter)
{
    /* We don't mind the extra call, so we do this: (previous comment
     * said we *do* mind, but I say let the compiler decide) */
    void* dest;
    stack_pop(interpreter, interpreter->control_stack,
              &dest, STACK_ENTRY_DESTINATION);
    return dest;
}

void *
stack_peek(struct Parrot_Interp *interpreter, Stack stack, INTVAL* type)
{
    Stack_Entry entry = stack_entry(interpreter, stack, 0);
    if (entry == NULL) return NULL;
    if (type != NULL) *type = entry->entry_type;
    return entry->entry.generic_pointer;
}

INTVAL
get_entry_type(struct Parrot_Interp *interpreter, Stack_Entry entry)
{
    return entry->entry_type;
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
