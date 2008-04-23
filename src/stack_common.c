/*
Copyright (C) 2001-2007, The Perl Foundation.
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
#include "parrot/stacks.h"

/* HEADERIZER HFILE: include/parrot/stacks.h */

/*

=item C<void stack_system_init>

Called from C<make_interpreter()> to initialize the interpreter's
register stacks.

=cut

*/

PARROT_API
void
stack_system_init(SHIM_INTERP)
{
}


/*

=item C<Stack_Chunk_t * register_new_stack>

Create a new stack and name it. C<< stack->name >> is used for
debugging/error reporting.

=cut

*/

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Stack_Chunk_t *
register_new_stack(PARROT_INTERP, ARGIN(const char *name), size_t item_size)
{
    Stack_Chunk_t     *chunk;
    Small_Object_Pool *ignored;

    item_size += offsetof(Stack_Chunk_t, u.data);
    ignored    = make_bufferlike_pool(interp, item_size);

    UNUSED(ignored);

    chunk       = (Stack_Chunk_t *)new_bufferlike_header(interp, item_size);
    chunk->prev = chunk;        /* mark the top of the stack */
    chunk->name = name;
    chunk->size = item_size;    /* TODO store the pool instead the size */

    /* that's one more reference to this chunk */
    chunk->refcount++;
    return chunk;
}

/*

=item C<Stack_Chunk_t * cst_new_stack_chunk>

Get a new chunk either from the freelist or allocate one.

=cut

*/

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Stack_Chunk_t *
cst_new_stack_chunk(PARROT_INTERP, ARGIN(const Stack_Chunk_t *chunk))
{
    Small_Object_Pool * const pool =
        get_bufferlike_pool(interp, chunk->size);
    Stack_Chunk_t * const new_chunk = (Stack_Chunk_t *)pool->get_free_object(interp, pool);

    PObj_bufstart(new_chunk) = NULL;
    PObj_buflen(new_chunk)   = 0;

    new_chunk->size          = chunk->size;
    new_chunk->name          = chunk->name;

    return new_chunk;
}

/*

=item C<void* stack_prepare_push>

Return a pointer, where new entries go for push.

=cut

*/

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
void*
stack_prepare_push(PARROT_INTERP, ARGMOD(Stack_Chunk_t **stack_p))
{
    Stack_Chunk_t * const chunk     = *stack_p;
    Stack_Chunk_t * const new_chunk = cst_new_stack_chunk(interp, chunk);

    new_chunk->prev = chunk;
    *stack_p        = new_chunk;

    chunk->refcount++;

    return STACK_DATAP(new_chunk);
}


/*

=item C<void* stack_prepare_pop>

Return a pointer, where new entries are popped off.

=cut

*/

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
void*
stack_prepare_pop(PARROT_INTERP, ARGMOD(Stack_Chunk_t **stack_p))
{
    Stack_Chunk_t * const chunk = *stack_p;

    /* the first entry (initial top) refers to itself */
    if (chunk == chunk->prev)
        real_exception(interp, NULL, ERROR_STACK_EMPTY,
            "No entries on %sStack!", chunk->name);

    *stack_p = chunk->prev;

    /* that's one fewer reference to this chunk */
    chunk->refcount--;
    if ((*stack_p)->refcount < chunk->refcount)
        (*stack_p)->refcount = chunk->refcount;

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

