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

/* Push an already formed entry on the generic stack. Return a pointer to the entry */
void push_entry(struct Parrot_Interp *interpreter, struct Stack_Entry * entry) {
    struct StackChunk *chunk_base;
    
    chunk_base = STACK_CHUNK_BASE(interpreter->stack_top);
    /* Do we have any slots left in the current chunk? */
    if (chunk_base->free) {
        chunk_base->used++;
        chunk_base->free--;
        interpreter->stack_top = &chunk_base->entry[chunk_base->used-1];
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
        interpreter->stack_top = &new_chunk->entry[0];
    }

    /* Copy the entry */

    chunk_base->entry[chunk_base->used-1] = *entry;
}

/* Pop off an entry, copying it over an existing Stack_Entry structure */
void pop_entry(struct Parrot_Interp *interpreter, struct Stack_Entry * entry) {
    struct StackChunk *chunk_base;
    
    chunk_base = STACK_CHUNK_BASE(interpreter->stack_top);
    /* Quick sanity check */
    if (chunk_base->used == 0) {
        INTERNAL_EXCEPTION(ERROR_STACK_EMPTY, "No entries on stack!\n");
    }

    *entry = *(interpreter->stack_top);

    /* Now decrement the SP */
    chunk_base->used--;
    chunk_base->free++;
    /* Can we toss a whole chunk? */
    if (0 == chunk_base->used && chunk_base->prev) {
        chunk_base = chunk_base->prev;
    } 
    if (chunk_base->used) {
        interpreter->stack_top = &chunk_base->entry[chunk_base->used - 1];
    }
}

/* Swap the top two entries on the stack */
void swap_entry(struct Parrot_Interp *interpreter) {
    struct Stack_Entry top;
    struct Stack_Entry next;

    pop_entry(interpreter, &top);
    pop_entry(interpreter, &next);

    push_entry(interpreter, &top);
    push_entry(interpreter, &next);
}

/* Push something on the generic stack. Return a pointer to the entry */
struct Stack_Entry *push_generic_entry(struct Parrot_Interp *interpreter, void *thing, INTVAL type, void *cleanup) {
    struct StackChunk *chunk_base;
    
    chunk_base = STACK_CHUNK_BASE(interpreter->stack_top);
    /* Do we have any slots left in the current chunk? */
    if (chunk_base->free) {
        chunk_base->used++;
        chunk_base->free--;
        interpreter->stack_top = &chunk_base->entry[chunk_base->used-1];
    }
    /* Nope, so plan B time. Allocate a new chunk of integer register frames */
    else {
        struct StackChunk *new_chunk;
        new_chunk = mem_allocate_aligned(sizeof(struct StackChunk));
        new_chunk->used = 1;
        new_chunk->free = STACK_CHUNK_DEPTH - 1;
        new_chunk->next = NULL;
        new_chunk->prev = chunk_base;
        chunk_base->next = new_chunk;
        interpreter->stack_top = &new_chunk->entry[0];
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

    return interpreter->stack_top;

}

/* Pop off an entry and return a pointer to the contents*/
void *pop_generic_entry(struct Parrot_Interp *interpreter, void *where, INTVAL type) {
    struct StackChunk *chunk_base;
    
    chunk_base = STACK_CHUNK_BASE(interpreter->stack_top);
    /* Quick sanity check */
    if (chunk_base->used == 0) {
        INTERNAL_EXCEPTION(ERROR_STACK_EMPTY, "No entries on stack!\n");
    }
    if (interpreter->stack_top->entry_type != type) {
        INTERNAL_EXCEPTION(ERROR_BAD_STACK_TYPE, "Wrong type on top of stack!\n");
    }

    /* Snag the value */
    switch(type) {
    case STACK_ENTRY_INT:
        *(INTVAL *)where = interpreter->stack_top->entry.int_val;
        break;
    case STACK_ENTRY_FLOAT:
        *(FLOATVAL *)where = interpreter->stack_top->entry.num_val;
        break;
    case STACK_ENTRY_PMC:
        *(PMC **)where = interpreter->stack_top->entry.pmc_val;
        break;
    case STACK_ENTRY_STRING:
        *(STRING **)where = interpreter->stack_top->entry.string_val;
        break;
    case STACK_ENTRY_POINTER:
        *(void **)where = interpreter->stack_top->entry.generic_pointer;
        break;
    case STACK_ENTRY_DESTINATION:
        *(void **)where = interpreter->stack_top->entry.generic_pointer;
        break;
    }
    /* Cleanup routine? */
    if (interpreter->stack_top->flags && STACK_ENTRY_CLEANUP) {
        (interpreter->stack_top->cleanup)(interpreter->stack_top);
    }

    /* Now decrement the SP */
    chunk_base->used--;
    chunk_base->free++;
    /* Can we toss a whole chunk? */
    if (0 == chunk_base->used && chunk_base->prev) {
        chunk_base = chunk_base->prev;
    } 
    if (chunk_base->used) {
        interpreter->stack_top = &chunk_base->entry[chunk_base->used - 1];
    }
    
    return where;
}

/* Pop off an entry and throw it out */
void toss_generic_entry(struct Parrot_Interp *interpreter, INTVAL type) {
    void *foo;
    pop_generic_entry(interpreter, &foo, type);
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
