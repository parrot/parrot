/*
Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/stack_common.c - Common stack handling routines for Parrot

=head1 DESCRIPTION

Both the register stacks and stacks implemented in F<src/stacks.c>
have a common funcionality, which is implemented in this file.

These stacks all differ only in the size of items and items per chunk.

=head2 Functions

=over 4

=item C<Stack_Chunk_t *
cst_new_stack(Interp *interpreter, const char *name, size_t item_size,
  size_t items_per_chunk)>

Create a new stack and name it. C<< stack->name >> is used for
debugging/error reporting.

=cut

*/

#include "parrot/parrot.h"
#include <assert.h>

Stack_Chunk_t *
cst_new_stack(Interp *interpreter, const char *name, size_t item_size,
		  size_t items_per_chunk)
{
    Stack_Chunk_t *chunk = new_bufferlike_header(interpreter,
            sizeof(Stack_Chunk_t));

    SET_NULL(chunk->next);
    SET_NULL(chunk->prev);
    chunk->n_chunks = 1;
    chunk->chunk_limit = STACK_CHUNK_LIMIT;
    chunk->name = name;
    chunk->item_size = item_size;
    chunk->items_per_chunk = items_per_chunk;
    chunk->used = 0;

    /* Block DOD from murdering our newly allocated stack buffer. */
    Parrot_block_DOD(interpreter);
    Parrot_allocate(interpreter, (Buffer *)chunk, item_size * items_per_chunk);
    Parrot_unblock_DOD(interpreter);

    return chunk;
}

/*

=item C<Stack_Chunk_t *
stack_copy(Parrot_Interp interpreter, Stack_Chunk_t *stack)>

COW copy a stack. This is done by allocating a new stack buffer header,
that points to possibly common next chunks and to common buffer memory.

=cut

*/

Stack_Chunk_t *
stack_copy(Parrot_Interp interpreter, Stack_Chunk_t *stack)
{
    Stack_Chunk_t *chunk = new_bufferlike_header(interpreter,
            sizeof(Stack_Chunk_t));
    /*
     * the private0_FLAG indiciates, that we might share the
     * next stack_chunk too
     */
    PObj_get_FLAGS((Buffer *) stack) |=
	(PObj_COW_FLAG | PObj_private0_FLAG);
    /* just copy the header, all pointers are shared now */
    mem_sys_memcopy(chunk, stack, sizeof(*stack));
    return chunk;
}

/*

=item C<void
stack_unmake_COW(Parrot_Interp interpreter, Stack_Chunk_t *stack)>

Make a COWed stack_chunk non-COWed.

=cut

*/

void
stack_unmake_COW(Parrot_Interp interpreter, Stack_Chunk_t *stack)
{
    Buffer for_alloc;
    /*
     * allocate a dummy stacks memory
     * also be sure not to allocate from the constant pool
     */
    PObj_flags_CLEARALL(&for_alloc);
    Parrot_allocate(interpreter, &for_alloc, stack->buflen);
    /*
     * copy over used items data
     */
    mem_sys_memcopy(for_alloc.bufstart, stack->bufstart,
	    stack->item_size * stack->items_per_chunk);
    stack->bufstart = for_alloc.bufstart;
    PObj_COW_CLEAR((Buffer*)stack);
}


/*

=item C<void*
stack_prepare_push(Parrot_Interp interpreter, Stack_Chunk_t **stack_p)>

Return a pointer, where new entries go for push. UnCOW if necessary

=cut

*/

void*
stack_prepare_push(Parrot_Interp interpreter, Stack_Chunk_t **stack_p)
{
    Stack_Chunk_t *chunk = *stack_p, *new_chunk;
    /*
     * before any change unCOW if necessary
     */
    if (PObj_COW_TEST((Buffer*)chunk))
	stack_unmake_COW(interpreter, chunk);
    /*
     * if this chunk is full, allocate a new one
     */
    if (chunk->used == chunk->items_per_chunk) {
        if (chunk->next == NULL) {
            new_chunk = cst_new_stack(interpreter, chunk->name,
		    chunk->item_size, chunk->items_per_chunk);
	    new_chunk->prev = chunk;
	    chunk->next = new_chunk;
            new_chunk->n_chunks = chunk->n_chunks + 1;
            if (new_chunk->n_chunks == new_chunk->chunk_limit)
                internal_exception(1, "Stack '%s' too deep\n",
                        chunk->name);
            *stack_p = chunk = new_chunk;
	}
	else {
	    /*
	     * we have a next chunk: this is either a spare chunk
	     * kept during stack_pop to avoid thrashing or
	     * a common next stack_chunk
	     */
	    if (PObj_get_FLAGS((Buffer*)chunk->next) & PObj_private0_FLAG) {
		new_chunk = cst_new_stack(interpreter, chunk->name,
		    chunk->item_size, chunk->items_per_chunk);
                new_chunk->prev = chunk;
		chunk->next = new_chunk;
	    }
            *stack_p = chunk = chunk->next;
            assert(!PObj_COW_TEST( (Buffer *) chunk));
	}
    }
    return (char*) chunk->bufstart + chunk->used++ * chunk->item_size;
}

/*

=item C<void*
stack_prepare_pop(Parrot_Interp interpreter, Stack_Chunk_t **stack_p)>

Return a pointer, where new entries are poped off. UnCOW if necessary.

=cut

*/

void*
stack_prepare_pop(Parrot_Interp interpreter, Stack_Chunk_t **stack_p)
{
    Stack_Chunk_t *chunk = *stack_p;
    /*
     * before any change unCOW if necessary
     */
    if (PObj_COW_TEST((Buffer*)chunk))
	stack_unmake_COW(interpreter, chunk);
    /*
     * if this chunk is empty go to previous if any
     */
    if (chunk->used == 0 && chunk->prev) {
        if (chunk->next) {
            /* GC will collect it */
            chunk->next = NULL;
        }

        /* Now back to the previous chunk - we'll keep the one we have
         * just emptied around for now in case we need it again. */
        *stack_p = chunk = chunk->prev;
	assert(!PObj_COW_TEST( (Buffer *) chunk));
    }
    if (chunk->used == 0) {
        internal_exception(ERROR_STACK_EMPTY, "No entries on %sStack!",
                chunk->name);
    }
    return (char*) chunk->bufstart + --chunk->used * chunk->item_size;
}

/*

=back

=head1 SEE ALSO

F<include/parrot/stacks.h>, F<src/stacks.c>, F<src/registers.c>

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/

