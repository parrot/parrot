/*
Copyright (C) 2001-2004, The Perl Foundation.
$Id$

=head1 NAME

src/stack_common.c - Common stack handling routines for Parrot

=head1 DESCRIPTION

Both the register stacks and stacks implemented in F<src/stacks.c>
have a common functionality, which is implemented in this file.

These stacks all differ only in the size of items.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include <assert.h>

/*

=item C<void stack_system_init(Interp *interp)>

Called from C<make_interpreter()> to initialize the interpreter's
register stacks.

=cut

*/

void
stack_system_init(Interp *interp)
{
}


/*

=item C<Stack_Chunk_t *
register_new_stack(Interp *interp, const char *name, size_t item_size)>

Create a new stack and name it. C<< stack->name >> is used for
debugging/error reporting.

=cut

*/

Stack_Chunk_t * register_new_stack(Interp *interp,
                                   const char *name /*NN*/, size_t item_size)
{
    Stack_Chunk_t *chunk;

    item_size += offsetof(Stack_Chunk_t, u.data);
    item_size += 7;
    item_size &= ~7;    /* round up to 8 so that the chunk is aligned at
                           the same size - the aligned MMX memcpy needs it */
    make_bufferlike_pool(interp, item_size);
    chunk = new_bufferlike_header(interp, item_size);
    chunk->prev = chunk;        /* mark the top of the stack */
    chunk->name = name;
    chunk->size = item_size;    /* TODO store the pool instead the size */
    return chunk;
}

/*

=item C<Stack_Chunk_t *
cst_new_stack_chunk(Interp *interp, const Stack_Chunk_t *chunk)>

Get a new chunk either from the freelist or allocate one.

=cut

*/

Stack_Chunk_t *cst_new_stack_chunk(Parrot_Interp interp,
                                   const Stack_Chunk_t *chunk /*NN*/)
{
    struct Small_Object_Pool * const pool =
        get_bufferlike_pool(interp, chunk->size);
    Stack_Chunk_t * const new_chunk = pool->get_free_object(interp, pool);

    PObj_bufstart(new_chunk) = NULL;
    PObj_buflen  (new_chunk) = 0;

    new_chunk->size = chunk->size;
    new_chunk->name = chunk->name;
    return new_chunk;
}

/*

=item C<void*
stack_prepare_push(Parrot_Interp interp, Stack_Chunk_t **stack_p)>

Return a pointer, where new entries go for push.

=cut

*/

void*
stack_prepare_push(Parrot_Interp interp, Stack_Chunk_t **stack_p /*NN*/)
{
    Stack_Chunk_t * const chunk = *stack_p;
    Stack_Chunk_t * const new_chunk = cst_new_stack_chunk(interp, chunk);

    new_chunk->prev = chunk;
    *stack_p = new_chunk;
    return STACK_DATAP(new_chunk);
}


/*

=item C<void*
stack_prepare_pop(Parrot_Interp interp, Stack_Chunk_t **stack_p)>

Return a pointer, where new entries are poped off.

=cut

*/

void*
stack_prepare_pop(Parrot_Interp interp, Stack_Chunk_t **stack_p /*NN*/)
{
    Stack_Chunk_t * const chunk = *stack_p;
    /*
     * the first entry (initial top) refers to itself
     */
    if (chunk == chunk->prev) {
        internal_exception(ERROR_STACK_EMPTY, "No entries on %sStack!",
                chunk->name);
    }
    *stack_p = chunk->prev;
    return STACK_DATAP(chunk);
}

/*

=back

=head1 SEE ALSO

F<include/parrot/stacks.h>, F<src/stacks.c>, F<src/registers.c>

=cut

*/



/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

