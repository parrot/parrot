/* stacks.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
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
 *
 *     We use "tree-stacks" and COW (copy-on-write) semantics in order
 *     to make continuations easy. A stack chunk is a bufferlike structure
 *     and may be GCed or COWed. As top chunks are COWed on usage, its only
 *     safe to walk the stack from top down via the prev pointers.
 *     stack_chunk->prev->next may not equal stack_chunk if prev is
 *     COWed and not copied yet.
 *
 *     COWed chunks are NOT magically copied, so any attempts to write should
 *     take care that the chunk may be shared. "Write" in this case is not only
 *     limited to pushing an item on. ANY change to the stack state, including
 *     a pop, is a "write". Think "write" in terms of changing any execution
 *     context, not values.
 *
 *     However:
 *     API calls stack_push, stack_pop and rotate_entries will take care of
 *     COW semantics themselves.
 *     
 *
 *  History:
 *  Notes:
 * References: */

#include "parrot/parrot.h"
#include <assert.h>

void stack_system_init(Interp *interpreter)
{
    make_bufferlike_pool(interpreter, sizeof(Stack_Chunk_t));
}

/*
 * Create a new stack and name it. stack->name is used
 * for debugging/error reporting.
 */
Stack_Chunk_t *
new_stack(Interp *interpreter, const char *name)
{

    Stack_Chunk_t *chunk = new_bufferlike_header(interpreter,
            sizeof(Stack_Chunk_t));

    SET_NULL(chunk->items);
    SET_NULL(chunk->next);
    SET_NULL(chunk->prev);
    chunk->n_chunks = 1;
    chunk->chunk_limit = STACK_CHUNK_LIMIT;
    chunk->name = name;

    /* Block DOD from murdering our newly allocated stack buffer. */
    Parrot_block_DOD(interpreter);
    Parrot_allocate(interpreter, (Buffer *)chunk,
                    sizeof(Stack_Entry_t) * STACK_CHUNK_DEPTH);
    Parrot_unblock_DOD(interpreter);

    return chunk;
}

void
stack_destroy(Stack_Chunk_t * top)
{
   /* GC does it all */
}

/* mark a stack COW */
void
stack_mark_cow(Stack_Chunk_t *top)
{
    for ( ; top ; top = top->prev)
        PObj_COW_SET( (Buffer *) top);
}

/* Returns the height of the stack.  The maximum "depth" is height - 1 */
size_t
stack_height(Interp *interpreter, Stack_Chunk_t *top)
{
    Stack_Chunk_t *chunk;
    size_t height = top->used;

    for (chunk = top->prev; chunk; chunk = chunk->prev)
        height += chunk->used;
    assert(height == (top->n_chunks - 1) * STACK_CHUNK_DEPTH +
            top->used);

    return height;
}

/* Copy COWed chunk(s) from top down depth entries
 * return new top of stack
 */
static Stack_Chunk_t *
chunk_copy(struct Parrot_Interp *interp, Stack_Chunk_t *old_top, int depth)
{
    Stack_Chunk_t *old_chunk = old_top;
    Stack_Chunk_t *new_chunk;
    Stack_Chunk_t *new_top = NULL;
    Stack_Chunk_t *last = NULL;
    do {
        new_chunk = new_bufferlike_header(interp, sizeof(Stack_Chunk_t));
        if (new_top == NULL) {
            new_top = new_chunk;
            new_top->next = NULL;
            last = new_top;
        }
        else {
            new_chunk->next = last;
            last->prev = new_chunk;
            last = new_chunk;
        }
        new_chunk->prev = old_chunk->prev;
        new_chunk->used = old_chunk->used;
        new_chunk->n_chunks = old_chunk->n_chunks;
        new_chunk->chunk_limit = old_chunk->chunk_limit;
        new_chunk->name = old_chunk->name;
        depth -= new_chunk->used;

        SET_NULL(new_chunk->items);
        Parrot_block_DOD(interp);
        Parrot_allocate(interp, (Buffer *)new_chunk,
                sizeof(Stack_Entry_t) * STACK_CHUNK_DEPTH);
        Parrot_unblock_DOD(interp);
        memcpy(new_chunk->items.bufstart, old_chunk->items.bufstart,
                old_chunk->items.buflen);
        old_chunk = old_chunk->prev;
    }
    while (old_chunk && depth >= 0);
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
        entry = (Stack_Entry_t *)chunk->items.bufstart +
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

    if (num_entries < 0) {
        num_entries = -num_entries;
        depth = num_entries - 1;

        if (stack_height(interpreter, stack) < (size_t)num_entries) {
            internal_exception(ERROR_STACK_SHALLOW, "Stack too shallow!\n");
        }
        /* If stack is copy-on-write, copy it before we can execute on it */
        if (PObj_COW_TEST( (Buffer *) stack))
            *stack_p = stack = chunk_copy(interpreter, stack, depth);

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
        if (PObj_COW_TEST( (Buffer *) stack))
            *stack_p = stack = chunk_copy(interpreter, stack, depth);

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
    Stack_Chunk_t *chunk = *stack_p;
    Stack_Entry_t *entry;


    /* Do we need a new chunk? */
    if (chunk->used == STACK_CHUNK_DEPTH) {
        if (chunk->next == NULL) {
            /* Need to add a new chunk */
            Stack_Chunk_t *new_chunk =
                new_bufferlike_header(interpreter, sizeof(Stack_Chunk_t));
            SET_NULL(new_chunk->next);
            new_chunk->prev = chunk;
            chunk->next = new_chunk;
            new_chunk->n_chunks = chunk->n_chunks + 1;
            new_chunk->chunk_limit = chunk->chunk_limit;
            new_chunk->name = chunk->name;
            if (new_chunk->n_chunks == new_chunk->chunk_limit)
                internal_exception(1, "Stack '%s' too deep\n",
                        chunk->name);
            *stack_p = chunk = new_chunk;
            SET_NULL(new_chunk->items);

            Parrot_block_DOD(interpreter);
            Parrot_allocate(interpreter, (Buffer *)new_chunk,
                    sizeof(Stack_Entry_t) * STACK_CHUNK_DEPTH);
            Parrot_unblock_DOD(interpreter);
        }
        else {
            /* Reuse the spare chunk we kept */
            chunk = chunk->next;
            assert(!PObj_COW_TEST( (Buffer *) chunk));
            *stack_p = chunk;
        }
    }
    /* If stack is copy-on-write, copy it before we can execute on it */
    else if (PObj_COW_TEST( (Buffer *) chunk))
        *stack_p = chunk = chunk_copy(interpreter, chunk, 0);

    entry = (Stack_Entry_t *)(chunk->items.bufstart) + chunk->used++;

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
        case STACK_ENTRY_DESTINATION:
        case STACK_ENTRY_CORO_MARK:
            entry->entry.struct_val = thing;
            break;
        default:
            internal_exception(ERROR_BAD_STACK_TYPE,
                    "Invalid Stack_Entry_type!\n");
            break;
    }
}

/* Pop off an entry and return a pointer to the contents */
void *
stack_pop(Interp *interpreter, Stack_Chunk_t **stack_p,
          void *where, Stack_entry_type type)
{
    Stack_Chunk_t *chunk = *stack_p;
    Stack_Entry_t *entry;

    /* If stack is copy-on-write, copy it before we can execute on it */
    if (PObj_COW_TEST( (Buffer *) chunk))
        *stack_p = chunk = chunk_copy(interpreter, chunk, 0);

    /* We may have an empty chunk at the end of the list */
    if (chunk->used == 0 && chunk->prev != NULL) {
        /* That chunk != NULL is just to allow the empty stack case
         * to fall through to the following exception throwing code. */

        /* If the chunk that has just become empty is not the last chunk
         * on the stack then we make it the last chunk - the GC will clean
         * up any chunks that are discarded by this operation. */
        if (chunk->next) {
            /* GC will collect it */
            chunk->next = NULL;
        }

        /* Now back to the previous chunk - we'll keep the one we have
         * just emptied around for now in case we need it again. */
        chunk = chunk->prev;
        *stack_p = chunk;
        if (PObj_COW_TEST( (Buffer *) chunk))
            *stack_p = chunk = chunk_copy(interpreter, chunk, 0);
    }

    /* Quick sanity check */
    if (chunk->used == 0) {
        internal_exception(ERROR_STACK_EMPTY, "No entries on %sStack!\n",
                chunk->name);
    }
    assert(!PObj_COW_TEST( (Buffer *) chunk));

    /* Now decrement the SP */
    chunk->used--;

    entry = (Stack_Entry_t *)(chunk->items.bufstart) + chunk->used;

    /* Types of 0 mean we don't care */
    if (type && entry->entry_type != type) {
        internal_exception(ERROR_BAD_STACK_TYPE,
                           "Wrong type on top of stack!\n");
    }

    /* Cleanup routine? */
    if (type != STACK_ENTRY_CORO_MARK && entry->cleanup) {
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
    case STACK_ENTRY_DESTINATION:
    case STACK_ENTRY_CORO_MARK:
        *(void **)where = entry->entry.struct_val;
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

/*
 * Peek at stack and return pointer to entry and the type of the entry
 */
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
    switch (entry->entry_type) {
        case STACK_ENTRY_POINTER:
        case STACK_ENTRY_DESTINATION:
        case STACK_ENTRY_CORO_MARK:
            return entry->entry.struct_val;
        default:
            return (void *)entry->entry.pmc_val;
    }
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
