/* stacks.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Stack handling routines for Parrot
 *  Data Structure and Algorithms:
 *     The stack is stored as a doubly-linked list of
 *     chunks, where each chunk has room for STACK_CHUNK_DEPTH
 *     entries. The invariant maintained is that there is always room
 *     for another entry; if a chunk is filled, a new chunk is added
 *     onto the list before returning.
 *  History:
 *  Notes:
 * References: */

#include "parrot/parrot.h"

Stack_Chunk_t *
new_stack(Interp *interpreter)
{
#ifdef TIDY
    int i;
    Stack_Entry_t *entry;
#endif

    Stack_Chunk_t *stack = mem_sys_allocate_zeroed(sizeof(Stack_Chunk_t));

    stack->flags = NO_STACK_CHUNK_FLAGS;
    SET_NULL(stack->next);
    SET_NULL(stack->prev);
    SET_NULL(stack->buffer);
    stack->buffer = new_buffer_header(interpreter);

    /* Block DOD from murdering our newly allocated stack->buffer. */
    Parrot_block_DOD(interpreter);
    Parrot_allocate(interpreter, stack->buffer,
                    sizeof(Stack_Entry_t) * STACK_CHUNK_DEPTH);
    Parrot_unblock_DOD(interpreter);

#ifdef TIDY
    entry = (Stack_Entry_t *)stack->buffer->bufstart;
    for (i = 0; i < STACK_CHUNK_DEPTH; i++)
        entry[i].flags = NO_STACK_ENTRY_FLAGS;
#endif
    return stack;
}

void
stack_mark_cow(Stack_Chunk_t *stack)
{
    Stack_Chunk_t *chunk = stack;
    /* Skip it all if we're already COW'd */
    if (chunk->flags & STACK_CHUNK_COW_FLAG) {
        return;
    }
    chunk->flags |= STACK_CHUNK_COW_FLAG;
    for (chunk = chunk->prev; chunk && !(chunk->flags& STACK_CHUNK_COW_FLAG); chunk = chunk->prev)
        chunk->flags |= STACK_CHUNK_COW_FLAG;
}

/* Returns the height of the stack.  The maximum "depth" is height - 1 */
size_t
stack_height(Interp *interpreter, Stack_Chunk_t *stack)
{
    Stack_Chunk_t *chunk;
    size_t height = stack->used;

    for (chunk = stack->prev; chunk; chunk = chunk->prev)
        height += chunk->used;

    return height;
}

/* Copy a stack (probably with COW flag) to a private writable stack.
 * We currently copy the whole stack. After we get rid of the circular
 * references, fix this to do COW by chunk.
 */
Stack_Chunk_t *
stack_copy(struct Parrot_Interp *interp, Stack_Chunk_t *old_top)
{
    Stack_Chunk_t *old_chunk = old_top;
    Stack_Chunk_t *new_chunk;
    Stack_Chunk_t *new_top = NULL;
    Stack_Chunk_t *last = NULL;
    do {
        new_chunk = mem_sys_allocate(sizeof(Stack_Chunk_t));
        if (new_top == NULL) {
            new_top = new_chunk;
            new_top->next = NULL;
            new_top->prev = NULL;
            last = new_top;
        }
        else {
            new_chunk->next = last;
            new_chunk->prev = NULL;
            last->prev = new_chunk;
            last = new_chunk;
        }
        new_chunk->used = old_chunk->used;

        /* Can't do bit arithmetic directly on enums, must cast via ints. */
        new_chunk->flags = (Stack_chunk_flags)((int)old_chunk->flags
                                               & ~(int)STACK_CHUNK_COW_FLAG);

        /* Copy stack buffer */
        new_chunk->buffer = NULL;
        new_chunk->buffer = new_buffer_header(interp);
        Parrot_allocate(interp, new_chunk->buffer,
                        sizeof(Stack_Entry_t) * STACK_CHUNK_DEPTH);
        memcpy(new_chunk->buffer->bufstart, old_chunk->buffer->bufstart,
               old_chunk->buffer->buflen);
        old_chunk = old_chunk->prev;
    }
    while (old_chunk);
    return new_top;
}

/* If depth >= 0, return the entry at that depth from the top of the stack,
   with 0 being the top entry.  If depth < 0, then return the entry |depth|
   entries from the bottom of the stack.
   Returns NULL if |depth| > number of entries in stack
*/
Stack_Entry_t *
stack_entry(Interp *interpreter, Stack_Chunk_t *stack, Intval depth)
{
    Stack_Chunk_t *chunk;
    Stack_Entry_t *entry = NULL;
    size_t offset = (size_t)depth;

    /* For negative depths, look from the bottom of the stack up. */
    if (depth < 0) {
        depth = stack_height(interpreter, interpreter->ctx.user_stack) + depth;
        if (depth < 0)
            return NULL;
        offset = (size_t)depth;
    }
    chunk = stack;          /* Start at top */
    while (chunk != NULL && offset >= chunk->used) {
        offset -= chunk->used;
        chunk = chunk->prev;
    }
    if (chunk == NULL)
        return NULL;
    if (offset < chunk->used) {
        entry = (Stack_Entry_t *)chunk->buffer->bufstart +
            chunk->used - offset - 1;
    }
    return entry;
}

/* Rotate the top N entries by one.  If N > 0, the rotation is bubble up,
   so the top most element becomes the Nth element.  If N < 0, the rotation
   is bubble down, so that the Nth element becomes the top most element.
*/
void
rotate_entries(Interp *interpreter, Stack_Chunk_t **stack_p, Intval num_entries)
{
    Stack_Chunk_t *stack = *stack_p;
    Stack_Entry_t temp;
    Intval i;
    Intval depth = num_entries - 1;

    if (num_entries >= -1 && num_entries <= 1) {
        return;
    }
    /* If stack is copy-on-write, copy it before we can execute on it */
    if (stack->flags & STACK_CHUNK_COW_FLAG) {
        *stack_p = stack = stack_copy(interpreter, stack);
    }

    if (num_entries < 0) {
        num_entries = -num_entries;
        depth = num_entries - 1;

        if (stack_height(interpreter, stack) < (size_t)num_entries) {
            internal_exception(ERROR_STACK_SHALLOW, "Stack too shallow!\n");
        }

        temp = *stack_entry(interpreter, stack, depth);
        for (i = depth; i > 0; i--) {
            *stack_entry(interpreter, stack, i) =
                *stack_entry(interpreter, stack, i - 1);
        }

        *stack_entry(interpreter, stack, 0) = temp;
    }
    else {

        if (stack_height(interpreter, stack) < (size_t)num_entries) {
            internal_exception(ERROR_STACK_SHALLOW, "Stack too shallow!\n");
        }

        temp = *stack_entry(interpreter, stack, 0);
        for (i = 0; i < depth; i++) {
            *stack_entry(interpreter, stack, i) =
                *stack_entry(interpreter, stack, i + 1);
        }

        *stack_entry(interpreter, stack, depth) = temp;
    }
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
stack_push(Interp *interpreter, Stack_Chunk_t **stack_p,
           void *thing, Stack_entry_type type, Stack_cleanup_method cleanup)
{
    Stack_Chunk_t *stack = *stack_p;
    Stack_Chunk_t *chunk;
    Stack_Entry_t *entry;

    /* If stack is copy-on-write, copy it before we can execute on it */
    if (stack->flags & STACK_CHUNK_COW_FLAG) {
        *stack_p = stack = stack_copy(interpreter, stack);
    }

    chunk = stack;

    /* Do we need a new chunk? */
    if (chunk->used == STACK_CHUNK_DEPTH) {
        if (chunk->next == NULL) {
            /* Need to add a new chunk */
            Stack_Chunk_t *new_chunk = mem_sys_allocate_zeroed(
                    sizeof(Stack_Chunk_t));
            SET_NULL(new_chunk->next);
            new_chunk->prev = chunk;
            chunk->next = new_chunk;
            *stack_p = chunk = new_chunk;
            SET_NULL(new_chunk->buffer);
            new_chunk->buffer = new_buffer_header(interpreter);

            Parrot_allocate(interpreter, new_chunk->buffer,
                            sizeof(Stack_Entry_t) * STACK_CHUNK_DEPTH);
        }
        else {
            /* Reuse the spare chunk we kept */
            chunk = chunk->next;
            *stack_p = chunk;
        }
    }

    entry = (Stack_Entry_t *)(chunk->buffer->bufstart) + chunk->used;

    /* Remember the type */
    entry->entry_type = type;
    /* Remember the cleanup function */
    entry->cleanup = cleanup;
    /* Store our thing */
    switch (type) {
    case STACK_ENTRY_INT:
        entry->entry.int_val = *(Intval *)thing;
        break;
    case STACK_ENTRY_FLOAT:
        entry->entry.num_val = *(Floatval *)thing;
        break;
    case STACK_ENTRY_PMC:
        entry->entry.pmc_val = (PMC *)thing;
        break;
    case STACK_ENTRY_STRING:
        entry->entry.string_val = (String *)thing;
        break;
    case STACK_ENTRY_POINTER:
        entry->entry.generic_pointer = thing;
        break;
    case STACK_ENTRY_DESTINATION:
        entry->entry.generic_pointer = thing;
        break;
    default:
        internal_exception(ERROR_BAD_STACK_TYPE,
                           "Invalid Stack_Entry_type!\n");
        break;
    }

    chunk->used++;
}

/* Pop off an entry and return a pointer to the contents */
void *
stack_pop(Interp *interpreter, Stack_Chunk_t **stack_p,
          void *where, Stack_entry_type type)
{
    Stack_Chunk_t *stack = *stack_p;
    Stack_Entry_t *entry;
    Stack_Chunk_t *chunk;

    /* If stack is copy-on-write, copy it before we can execute on it */
    if (stack->flags & STACK_CHUNK_COW_FLAG) {
        *stack_p = stack = stack_copy(interpreter, stack);
    }

    chunk = stack;

    /* We may have an empty chunk at the end of the list */
    if (chunk->used == 0 && chunk->prev != NULL) {
        /* That chunk != NULL is just to allow the empty stack case
         * to fall through to the following exception throwing code. */

        /* If the chunk that has just become empty is not the last chunk
         * on the stack then we make it the last chunk - the GC will clean
         * up any chunks that are discarded by this operation. */
        if (chunk->next) {
            /* FIXME: Free this while GC isn't collecting stacks */
            mem_sys_free(chunk->next);
            chunk->next = NULL;
        }

        /* Now back to the previous chunk - we'll keep the one we have
         * just emptied around for now in case we need it again. */
        chunk = chunk->prev;
        *stack_p = chunk;
    }

    /* Quick sanity check */
    if (chunk->used == 0) {
        internal_exception(ERROR_STACK_EMPTY, "No entries on stack!\n");
    }

    /* Now decrement the SP */
    chunk->used--;

    entry = (Stack_Entry_t *)(chunk->buffer->bufstart) + chunk->used;

    /* Types of 0 mean we don't care */
    if (type && entry->entry_type != type) {
        internal_exception(ERROR_BAD_STACK_TYPE,
                           "Wrong type on top of stack!\n");
    }

    /* Cleanup routine? */
    if (entry->cleanup) {
        (*entry->cleanup) (entry);
    }

    /* Sometimes the caller doesn't care what the value was */
    if (where == NULL) {
        return NULL;
    }

    /* Snag the value */
    switch (type) {
    case STACK_ENTRY_INT:
        *(Intval *)where = entry->entry.int_val;
        break;
    case STACK_ENTRY_FLOAT:
        *(Floatval *)where = entry->entry.num_val;
        break;
    case STACK_ENTRY_PMC:
        *(PMC **)where = entry->entry.pmc_val;
        break;
    case STACK_ENTRY_STRING:
        *(String **)where = entry->entry.string_val;
        break;
    case STACK_ENTRY_POINTER:
        *(void **)where = entry->entry.generic_pointer;
        break;
    case STACK_ENTRY_DESTINATION:
        *(void **)where = entry->entry.generic_pointer;
        break;
    default:
        internal_exception(ERROR_BAD_STACK_TYPE,
                           "Wrong type on top of stack!\n");
        break;
    }

    return where;
}

/* Pop off a destination entry and return a pointer to the contents*/
void *
pop_dest(Interp *interpreter)
{
    /* We don't mind the extra call, so we do this: (previous comment
     * said we *do* mind, but I say let the compiler decide) */
    void *dest;
    (void)stack_pop(interpreter, &interpreter->ctx.control_stack,
                    &dest, STACK_ENTRY_DESTINATION);
    return dest;
}

void *
stack_peek(Interp *interpreter, Stack_Chunk_t *stack_base,
           Stack_entry_type *type)
{
    Stack_Entry_t *entry = stack_entry(interpreter, stack_base, 0);
    if (entry == NULL) {
        return NULL;
    }

    if (type != NULL) {
        *type = entry->entry_type;
    }

    return entry->entry.generic_pointer;
}

Stack_entry_type
get_entry_type(Interp *interpreter, Stack_Entry_t *entry)
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
