/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/rxstacks.c - Regex stack handling routines for Parrot

=head1 DESCRIPTION

Same as regular stacks, except they store only C<INTVAL> values and
don't have cleanup routines.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/rxstacks.h"

/*

=item C<IntStack
intstack_new(Interp *interpreter)>

Creates and returns a new stack.

=cut

*/

IntStack
intstack_new(Interp *interpreter)
{
    IntStack stack = mem_sys_allocate(sizeof(struct IntStack_chunk_t));
    stack->used = 0;
    stack->next = stack;
    stack->prev = stack;
    return stack;
}

/*

=item C<INTVAL
intstack_depth(Interp *interpreter, IntStack stack)>

Returns the depth of the stack.

=cut

*/

INTVAL
intstack_depth(Interp *interpreter, IntStack stack)
{
    IntStack_Chunk chunk;
    INTVAL depth = stack->used;

    for (chunk = stack->next; chunk != stack; chunk = chunk->next)
        depth += chunk->used;

    return depth;
}

/*

=item C<void
intstack_push(Interp *interpreter, IntStack stack, INTVAL data)>

Pushes C<data> onto the stack.

=cut

*/

void
intstack_push(Interp *interpreter, IntStack stack, INTVAL data)
{
    IntStack_Chunk chunk = stack->prev;
    IntStack_Entry entry = &chunk->entry[chunk->used];

    entry->value = data;

    /* Register the new entry */
    if (++chunk->used == STACK_CHUNK_DEPTH) {
        if (chunk->next == stack) {
            /* Need to add a new chunk */
            IntStack_Chunk new_chunk = mem_sys_allocate(sizeof(*new_chunk));
            new_chunk->used = 0;
            new_chunk->next = stack;
            new_chunk->prev = chunk;
            chunk->next = new_chunk;
            stack->prev = new_chunk;
        }
        else {
            /* Reuse the spare chunk we kept */
            chunk = chunk->next;
            stack->prev = chunk;
        }
    }
}

/*

=item C<INTVAL
intstack_pop(Interp *interpreter, IntStack stack)>

Pops the top value off the stack and returns it.

=cut

*/

INTVAL
intstack_pop(Interp *interpreter, IntStack stack)
{
    IntStack_Chunk chunk = stack->prev;
    IntStack_Entry entry;

    /* We may have an empty chunk at the end of the list */
    if (chunk->used == 0 && chunk != stack) {
        /* That chunk != stack check is just to allow the empty stack case
         * to fall through to the following exception throwing code. */

        /* If the chunk that has just become empty is not the last chunk
         * on the stack then we make it the last chunk */
        if (chunk->next != stack) {
            mem_sys_free(chunk->next);
            chunk->next = stack;
        }

        /* Now back to the previous chunk - we'll keep the one we have
         * just emptied around for now in case we need it again. */
        chunk = chunk->prev;
        stack->prev = chunk;
    }

    /* Quick sanity check */
    if (chunk->used == 0) {
        internal_exception(ERROR_STACK_EMPTY, "No entries on stack!\n");
    }

    entry = &chunk->entry[chunk->used - 1];

    /* Now decrement the SP */
    chunk->used--;

    /* Snag the value */
    return entry->value;
}

/*

=item C<void
intstack_free(Interp *interpreter, IntStack stack)>

Frees all the memory used by the stack.

=cut

*/

void
intstack_free(Interp *interpreter, IntStack stack)
{
    IntStack chunk, temp;

    for (chunk = stack->next; chunk != stack; chunk = temp) {
        temp = chunk->next;
        mem_sys_free(chunk);
    }

    mem_sys_free(stack);
}

/*

=back

=head1 SEE ALSO

F<src/rx.c>, F<include/parrot/rx.h>, F<src/rxstacks.c>,
include/parrot/rxstacks.h>.

=head1 HISTORY

You'll note that F<src/intlist.c> and F<src/rxstacks.c> both claim to do
the stack handling. Steve Fink explains why:

I<The integer stack is fairly useless for a complete regex engine. It
prevents reentrancy and complicates some of the trickier things that
need to be done in regexes. We can drop it anytime, and instead use an
integer-only array PMC instead. (Such a PMC exists and is called
"intlist.pmc", and uses the same stack engine as the control, user,
and pad stacks.)>

I<I would remove the rxstack, but I didn't want to break the closest
thing we have to a regex engine until I or someone else managed to
release a different working implementation. The particular technique
of using a single stack tied directly the interpreter is an
evolutionary dead end, however. Good for a proof of concept, but
that's it.>

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
