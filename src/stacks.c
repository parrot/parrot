/* stacks.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Stack handling routines for Parrot
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

INTVAL
stack_depth(struct Parrot_Interp *interpreter, struct StackChunk *chunk) {
  INTVAL               depth;

  depth = chunk->used;

  while (chunk->next) {
    chunk = chunk->next;
    depth += chunk->used;
  }
  return depth;
}

struct Stack_Entry *
stack_entry(struct Parrot_Interp *interpreter, struct StackChunk *chunk, INTVAL depth) {
    while (chunk->next) {
      chunk = chunk->next;
    }

    while (depth > chunk->used - 1) {
      depth -= chunk->used;
      chunk = chunk->prev; /* Expect caller to have checked bounds */
    }
    return &(chunk->entry[chunk->used - depth - 1]);
}

/* Rotate the top N entries by one */
void rotate_entries(struct Parrot_Interp *interpreter, struct StackChunk *base_chunk, struct Stack_Entry *top, INTVAL depth) {
    struct Stack_Entry temp;
    INTVAL i;

    if (depth <= 0) {
        return;
    }

    if (stack_depth(interpreter, base_chunk) < depth) {
        INTERNAL_EXCEPTION(ERROR_STACK_SHALLOW, "Stack too shallow!\n");
    }

    if (depth == 1) {
        return;
    }

    temp = *(top);

    for(i = 0; i < depth - 1; i++) {
      *stack_entry(interpreter, base_chunk, i) = *stack_entry(interpreter, base_chunk, i + 1);
    }

    *stack_entry(interpreter, base_chunk, depth - 1) = temp;
}

/* Push something on the generic stack. Return a pointer to the entry

   Note that the cleanup pointer, if non-NULL, points to a routine
   that'll be called when the entry is removed from the stack. This is
   handy for those cases where you need some sort of activity to take
   place when an entry is removed, such as when you push a lexical
   lock onto the call stack, or localize (or tempify, or whatever
   we're calling it)  variable or something */
struct Stack_Entry *push_generic_entry(struct Parrot_Interp *interpreter, struct Stack_Entry **top, void *thing, INTVAL type,  void (*cleanup)(struct Stack_Entry *)) {
    struct StackChunk *chunk_base;
    
    chunk_base = STACK_CHUNK_BASE(*top);
    /* Do we have any slots left in the current chunk? */
    if (chunk_base->free) {
        chunk_base->used++;
        chunk_base->free--;
        *top = &chunk_base->entry[chunk_base->used-1];
    }
    /* Nope, so plan B time. Allocate a new chunk of stack entries */
    else {
        struct StackChunk *new_chunk;
        new_chunk = mem_allocate_aligned(sizeof(struct StackChunk));
        new_chunk->used = 1;
        new_chunk->free = STACK_CHUNK_DEPTH - 1;
        new_chunk->next = NULL;
        new_chunk->prev = chunk_base;
        chunk_base->next = new_chunk;
        *top = &new_chunk->entry[0];
        chunk_base = new_chunk;
    }

    /* Remember the type */
    chunk_base->entry[chunk_base->used-1].entry_type = type;
    /* If we were passed a cleanup function, mark the flag entry
       for this as needing cleanup*/
    chunk_base->entry[chunk_base->used-1].flags =
        (cleanup ? STACK_ENTRY_CLEANUP : 0);
    /* Remember the cleanup function */
    chunk_base->entry[chunk_base->used-1].cleanup = cleanup;
    /* Store our thing */
    switch (type) {
    case STACK_ENTRY_INT:
        chunk_base->entry[chunk_base->used-1].entry.int_val = *(INTVAL *)thing;
        break;
    case STACK_ENTRY_FLOAT:
        chunk_base->entry[chunk_base->used-1].entry.num_val = *(FLOATVAL *)thing;
        break;
    case STACK_ENTRY_PMC:
        chunk_base->entry[chunk_base->used-1].entry.pmc_val = thing;
        break;
    case STACK_ENTRY_STRING:
        chunk_base->entry[chunk_base->used-1].entry.string_val = thing;
        break;
    case STACK_ENTRY_POINTER:
        chunk_base->entry[chunk_base->used-1].entry.generic_pointer = thing;
        break;
    case STACK_ENTRY_DESTINATION:
        chunk_base->entry[chunk_base->used-1].entry.generic_pointer = thing;
        break;
    }

    return *top;

}

/* Pop off an entry and return a pointer to the contents*/
void *pop_generic_entry(struct Parrot_Interp *interpreter, struct Stack_Entry **top, void *where, INTVAL type) {
    struct StackChunk *chunk_base;
    
    chunk_base = STACK_CHUNK_BASE(*top);
    /* Quick sanity check */
    if (chunk_base->used == 0) {
        INTERNAL_EXCEPTION(ERROR_STACK_EMPTY, "No entries on stack!\n");
    }
    /* Types of 0 mean we don't care */
    if (type && (*top)->entry_type != type) {
        INTERNAL_EXCEPTION(ERROR_BAD_STACK_TYPE, "Wrong type on top of stack!\n");
    }

    /* Snag the value */
    switch(type) {
    case STACK_ENTRY_INT:
        *(INTVAL *)where = (*top)->entry.int_val;
        break;
    case STACK_ENTRY_FLOAT:
        *(FLOATVAL *)where = (*top)->entry.num_val;
        break;
    case STACK_ENTRY_PMC:
        *(PMC **)where = (*top)->entry.pmc_val;
        break;
    case STACK_ENTRY_STRING:
        *(STRING **)where = (*top)->entry.string_val;
        break;
    case STACK_ENTRY_POINTER:
        *(void **)where = (*top)->entry.generic_pointer;
        break;
    case STACK_ENTRY_DESTINATION:
        *(void **)where = (*top)->entry.generic_pointer;
        break;
    }
    /* Cleanup routine? */
    if ((*top)->flags && STACK_ENTRY_CLEANUP) {
        ((*top)->cleanup)(*top);
    }

    /* Now decrement the SP */
    chunk_base->used--;
    chunk_base->free++;
    /* Can we toss a whole chunk? */
    if (0 == chunk_base->used && chunk_base->prev) {
        chunk_base = chunk_base->prev;
    } 
    if (chunk_base->used) {
        *top = &chunk_base->entry[chunk_base->used - 1];
    }
    
    return where;
}

/* Pop off an entry and throw it out */
void toss_generic_entry(struct Parrot_Interp *interpreter, struct Stack_Entry **top, INTVAL type) {
    void *foo;
    pop_generic_entry(interpreter, top, &foo, type);
}

/* get the type of  the topmost stack entry */
INTVAL get_entry_type(struct Parrot_Interp *interpreter, struct Stack_Entry *entry) {
    return( entry->entry_type);
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
