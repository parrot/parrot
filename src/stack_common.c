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

=item C<void stack_system_init(Interp *interpreter)>

Called from C<make_interpreter()> to initialize the interpreter's
register stacks.

=cut

*/

typedef struct {
    size_t size;
    Stack_Chunk_t *free_list;
} Stack_cache_entry;

#define MAX_CACHED_STACKS 10

typedef struct {
    Stack_cache_entry stack_cache[MAX_CACHED_STACKS];
} Stack_cache;

void
stack_system_init(Interp *interpreter)
{
    /*
     * TODO cleanup in Parrot_really_destroy
     */
    interpreter->stack_chunk_cache =
        mem_sys_allocate_zeroed(sizeof(Stack_cache));
}

static int
get_size_class(Parrot_Interp interpreter, size_t item_size)
{
    int i;
    Stack_cache *sc = interpreter->stack_chunk_cache;

    item_size += offsetof(Stack_Chunk_t, data);
    for (i = 0; i < MAX_CACHED_STACKS; ++i) {
        if (!sc->stack_cache[i].size)
            break;
        if (sc->stack_cache[i].size == item_size)
            return i;
    }
    if (i == MAX_CACHED_STACKS)
        PANIC("Too many cached stacks");
    make_bufferlike_pool(interpreter, item_size);
    sc->stack_cache[i].size = item_size;
    sc->stack_cache[i].free_list = NULL;
    return i;
}

void
mark_stack_chunk_cache(Parrot_Interp interpreter)
{
    int i;
    Stack_cache *sc = interpreter->stack_chunk_cache;
    Stack_cache_entry *e;
    Stack_Chunk_t *chunk;

    for (i = 0; i < MAX_CACHED_STACKS; ++i) {
        e = sc->stack_cache + i;
        if (!e->size)
            break;
        for (chunk = e->free_list; chunk; chunk = chunk->free_p)
            pobject_lives(interpreter, (PObj*) chunk);
    }
}
/*
 * s. also STACK_DATAP and mark routines in stacks.c and registers.c
 *
 * Create a header pool with the payload size attached
 */

Stack_Chunk_t *
register_new_stack(Interp *interpreter, const char *name, size_t item_size)
{
    Stack_cache *sc = interpreter->stack_chunk_cache;
    int s = get_size_class(interpreter, item_size);
    Stack_cache_entry *e = sc->stack_cache + s;
    Stack_Chunk_t *chunk = new_bufferlike_header(interpreter, e->size);

    chunk->prev = chunk;        /* mark the top of the stack */
    chunk->free_p = NULL;
    chunk->name = name;
    chunk->size_class = s;
    return chunk;
}

Stack_Chunk_t *
cst_new_stack_chunk(Parrot_Interp interpreter, Stack_Chunk_t *chunk)
{
    Stack_cache *sc = interpreter->stack_chunk_cache;
    int s = chunk->size_class;
    Stack_cache_entry *e = sc->stack_cache + s;
    Stack_Chunk_t * new_chunk;

    assert(s < MAX_CACHED_STACKS);
    if (e->free_list) {
        new_chunk = e->free_list;
        e->free_list = new_chunk->free_p;
        /*
         * freeP- is used as a flag too to avoid tracing into
         * the free list in mark_pmc_register_stack
         */
        new_chunk->free_p = NULL;
    }
    else {
        new_chunk = new_bufferlike_header(interpreter, e->size);
        new_chunk->size_class = s;
    }
    new_chunk->name = chunk->name;
    return new_chunk;
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

    new_chunk = cst_new_stack_chunk(interpreter, chunk);
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
    int s = chunk->size_class;
    Stack_cache_entry *e = sc->stack_cache + s;
    /*
     * the first entry (initial top) refers to itself
     */
    if (chunk == chunk->prev) {
        internal_exception(ERROR_STACK_EMPTY, "No entries on %sStack!",
                chunk->name);
    }
    *stack_p = chunk->prev;

    assert(s < MAX_CACHED_STACKS);
    chunk->free_p = e->free_list;
    e->free_list = chunk;

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

