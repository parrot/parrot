/*
Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/stack_common.c - Common stack handling routines for Parrot

=head1 DESCRIPTION

Both the register stacks and stacks implemented in F<src/stacks.c>
have a common funcionality, which is implemented in this file.

These stacks all differ only in the size of items.

=head2 Functions

=over 4

=item C<Stack_Chunk_t *
cst_new_stack(Interp *interpreter, const char *name, size_t item_size)>

Create a new stack and name it. C<< stack->name >> is used for
debugging/error reporting.

=cut

*/

#include "parrot/parrot.h"
#include <assert.h>

/*
 * s. also STACK_DATAP and mark routines in stacks.c and registers.c
 *
 * It'll be replaced very likely by some more macros in src/generic_register.c
 */

Stack_Chunk_t *
cst_new_stack(Interp *interpreter, const char *name, size_t item_size)
{
    /*
     * TODO cleanup in Parrot_really_destroy
     */
    Stack_Chunk_t *chunk = mem_sys_allocate(item_size +
            offsetof(Stack_Chunk_t, data));

    chunk->prev = chunk;        /* mark the top of the stack */
    chunk->item_size = item_size;
    chunk->free_p = NULL;
    chunk->name = name;

    return chunk;
}


/*

=item C<void stack_system_init(Interp *interpreter)>

Called from C<make_interpreter()> to initialize the interpreter's
register stacks.

=cut

*/

/*
 * we have currently: NUM, {INT,PMC*,STRING*} frames and Stack_Entry_t
 */
#define N_CHUNK_CACHES 3

typedef struct {
    Stack_Chunk_t *free_list[N_CHUNK_CACHES];
} Stack_cache;

void
stack_system_init(Interp *interpreter)
{
    int i;
    Stack_cache *sc;

    /*
     * TODO cleanup in Parrot_really_destroy
     */
    sc = interpreter->stack_chunk_cache = mem_sys_allocate(sizeof(Stack_cache));
    for (i = 0; i < N_CHUNK_CACHES; ++i)
        sc->free_list[i] = NULL;
}


/*

=item C<void*
stack_prepare_push(Parrot_Interp interpreter, Stack_Chunk_t **stack_p)>

Return a pointer, where new entries go for push.

=cut

*/

void*
stack_prepare_push(Parrot_Interp interpreter, Stack_Chunk_t **stack_p)
{
    Stack_Chunk_t *chunk = *stack_p, *new_chunk;
    Stack_cache *sc = interpreter->stack_chunk_cache;
    int s;

    /*
     * XXX this should be all macroized to get rid of the switch,
     * s. src/generic_register.c
     */
    switch (STACK_ITEMSIZE(chunk)) {
        case sizeof(struct IRegFrame):
            s = 0;
            break;
        case sizeof(struct NRegFrame):
            s = 1;
            break;
        case sizeof(Stack_Entry_t):
            s = 2;
            break;
        default:
            PANIC("Unhandled stack chunk size");
            _exit(1); /* avoid warning */
    }
    if (sc->free_list[s]) {
        new_chunk = sc->free_list[s];
        sc->free_list[s] = new_chunk->free_p;
        /*
         * freeP- is used as a flag too to avoid tracing into
         * the free list in mark_pmc_register_stack
         */
        new_chunk->free_p = NULL;
    }
    else
        new_chunk = cst_new_stack(interpreter, chunk->name,
                STACK_ITEMSIZE(chunk));
    new_chunk->prev = chunk;
    *stack_p = new_chunk;
    return STACK_DATAP(new_chunk);
}

/*

=item C<void*
stack_prepare_pop(Parrot_Interp interpreter, Stack_Chunk_t **stack_p)>

Return a pointer, where new entries are poped off.

=cut

*/

void*
stack_prepare_pop(Parrot_Interp interpreter, Stack_Chunk_t **stack_p)
{
    Stack_Chunk_t *chunk = *stack_p;
    Stack_cache *sc = interpreter->stack_chunk_cache;
    int s;
    /*
     * the first entry (initial top) refers to itself
     */
    if (chunk == chunk->prev) {
        internal_exception(ERROR_STACK_EMPTY, "No entries on %sStack!",
                chunk->name);
    }
    switch (STACK_ITEMSIZE(chunk)) {
        case sizeof(struct IRegFrame):
            s = 0;
            break;
        case sizeof(struct NRegFrame):
            s = 1;
            break;
        case sizeof(Stack_Entry_t):
            s = 2;
            break;
        default:
            PANIC("Unhandled stack chunk size");
            _exit(1); /* avoid warning */
    }
    *stack_p = chunk->prev;

    chunk->free_p = sc->free_list[s];
    sc->free_list[s] = chunk;

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
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/

