/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/stacks.c - Stack handling routines for Parrot

=head1 DESCRIPTION

The stack is stored as a linked list of chunks (C<Stack_Chunk>),
where each chunk has room for one entry.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include <assert.h>

/*

=item C<Stack_Chunk_t *
new_stack(Interp *interpreter, const char *name)>

Create a new stack and name it. C<< stack->name >> is used for
debugging/error reporting.

=cut

*/

Stack_Chunk_t *
new_stack(Interp *interpreter, const char *name)
{

    return register_new_stack(interpreter, name, sizeof(Stack_Entry_t));
}


/*

=item C<void
mark_stack(Interp *interpreter,
           Stack_Chunk_t *chunk)>

Mark entries in a stack structure during DOD.

=cut

*/

void
mark_stack(Interp *interpreter,
           Stack_Chunk_t *chunk)
{
    Stack_Entry_t *entry;

    for (; ; chunk = chunk->prev) {

        pobject_lives(interpreter, (PObj*)chunk);
        if (chunk == chunk->prev)
            break;
        entry = (Stack_Entry_t *)STACK_DATAP(chunk);
        switch (entry->entry_type) {
            case STACK_ENTRY_PMC:
                if (entry->entry.pmc_val) {
                    pobject_lives(interpreter,
                            (PObj *)entry->entry.pmc_val);
                }
                break;
            case STACK_ENTRY_STRING:
                if (entry->entry.string_val) {
                    pobject_lives(interpreter,
                            (PObj *)entry->entry.string_val);
                }
                break;
            default:
                break;
        }
    }
}
/*

=item C<void
stack_destroy(Stack_Chunk_t * top)>

GC does it all.

=cut

*/

void
stack_destroy(Stack_Chunk_t * top)
{
   /* GC does it all */
}

/*

=item C<size_t
stack_height(Interp *interpreter, Stack_Chunk_t *top)>

Returns the height of the stack. The maximum "depth" is height - 1.

=cut

*/

size_t
stack_height(Interp *interpreter, Stack_Chunk_t *chunk)
{
    size_t height = 0;

    for (; ; chunk = chunk->prev) {
        if (chunk == chunk->prev)
            break;
        ++height;
    }

    return height;
}


/*

=item C<Stack_Entry_t *
stack_entry(Interp *interpreter, Stack_Chunk_t *stack, Intval depth)>

If C<< depth >= 0 >>, return the entry at that depth from the top of the
stack, with 0 being the top entry. If C<depth < 0>, then return the
entry C<|depth|> entries from the bottom of the stack. Returns C<NULL>
if C<|depth| > number> of entries in stack.

=cut

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
    while ( offset) {
        if (chunk == chunk->prev)
            break;
        --offset;
        chunk = chunk->prev;
    }
    if (chunk == chunk->prev)
        return NULL;
    entry = (Stack_Entry_t *)STACK_DATAP(chunk);
    return entry;
}

/*

=item C<void
rotate_entries(Interp *interpreter, Stack_Chunk_t **stack_p,
               Intval num_entries)>

Rotate the top N entries by one.  If C<N > 0>, the rotation is bubble
up, so the top most element becomes the Nth element.  If C<N < 0>, the
rotation is bubble down, so that the Nth element becomes the top most
element.

=cut

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
            internal_exception(ERROR_STACK_SHALLOW, "Stack too shallow!");
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
            internal_exception(ERROR_STACK_SHALLOW, "Stack too shallow!");
        }
        temp = *stack_entry(interpreter, stack, 0);
        for (i = 0; i < depth; i++) {
            *stack_entry(interpreter, stack, i) =
                *stack_entry(interpreter, stack, i + 1);
        }

        *stack_entry(interpreter, stack, depth) = temp;
    }
}

/*

=item C<void
stack_push(Interp *interpreter, Stack_Chunk_t **stack_p,
           void *thing, Stack_entry_type type, Stack_cleanup_method cleanup)>

Push something on the generic stack.

Note that the cleanup pointer, if non-C<NULL>, points to a routine
that'll be called when the entry is removed from the stack. This is
handy for those cases where you need some sort of activity to take place
when an entry is removed, such as when you push a lexical lock onto the
call stack, or localize (or tempify, or whatever we're calling it)
variable or something.

=cut

*/

void
stack_push(Interp *interpreter, Stack_Chunk_t **stack_p,
           void *thing, Stack_entry_type type, Stack_cleanup_method cleanup)
{
    Stack_Entry_t *entry = stack_prepare_push(interpreter, stack_p);

    /* Remember the type */
    entry->entry_type = type;
    /* Remember the cleanup function */
    entry->cleanup = cleanup;
    /* Store our thing */
    switch (type) {
        case STACK_ENTRY_INT:
        case STACK_ENTRY_MARK:
            UVal_int(entry->entry) = *(Intval *)thing;
            break;
        case STACK_ENTRY_FLOAT:
            UVal_num(entry->entry) = *(Floatval *)thing;
            break;
        case STACK_ENTRY_ACTION:
        case STACK_ENTRY_PMC:
            UVal_pmc(entry->entry) = (PMC *)thing;
            break;
        case STACK_ENTRY_STRING:
            UVal_str(entry->entry) = (String *)thing;
            break;
        case STACK_ENTRY_POINTER:
        case STACK_ENTRY_DESTINATION:
            UVal_ptr(entry->entry) = thing;
            break;
        default:
            internal_exception(ERROR_BAD_STACK_TYPE,
                    "Invalid Stack_Entry_type!");
            break;
    }
}

/*

=item C<void *
stack_pop(Interp *interpreter, Stack_Chunk_t **stack_p,
          void *where, Stack_entry_type type)>

Pop off an entry and return a pointer to the contents.

=cut

*/

void *
stack_pop(Interp *interpreter, Stack_Chunk_t **stack_p,
          void *where, Stack_entry_type type)
{
    Stack_Entry_t *entry = stack_prepare_pop(interpreter, stack_p);

    /* Types of 0 mean we don't care */
    if (type && entry->entry_type != type) {
        internal_exception(ERROR_BAD_STACK_TYPE,
                           "Wrong type on top of stack!\n");
    }

    /* Cleanup routine? */
    if (entry->cleanup) {
        (*entry->cleanup) (interpreter, entry);
    }

    /* Sometimes the caller doesn't care what the value was */
    if (where == NULL) {
        return NULL;
    }

    /* Snag the value */
    switch (type) {
    case STACK_ENTRY_MARK:
    case STACK_ENTRY_INT:
        *(Intval *)where   = UVal_int(entry->entry);
        break;
    case STACK_ENTRY_FLOAT:
        *(Floatval *)where = UVal_num(entry->entry);
        break;
    case STACK_ENTRY_ACTION:
    case STACK_ENTRY_PMC:
        *(PMC **)where     = UVal_pmc(entry->entry);
        break;
    case STACK_ENTRY_STRING:
        *(String **)where  = UVal_str(entry->entry);
        break;
    case STACK_ENTRY_POINTER:
    case STACK_ENTRY_DESTINATION:
        *(void **)where    = UVal_ptr(entry->entry);
        break;
    default:
        internal_exception(ERROR_BAD_STACK_TYPE,
                           "Wrong type on top of stack!\n");
        break;
    }

    return where;
}

/*

=item C<void *
pop_dest(Interp *interpreter)>

Pop off a destination entry and return a pointer to the contents.

=cut

*/

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

=item C<void *
stack_peek(Interp *interpreter, Stack_Chunk_t *stack_base,
           Stack_entry_type *type)>

Peek at stack and return pointer to entry and the type of the entry.

=cut

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
            return UVal_ptr(entry->entry);
        default:
            return (void *) UVal_pmc(entry->entry);
    }
}

/*

=item C<Stack_entry_type
get_entry_type(Interp *interpreter, Stack_Entry_t *entry)>

Returns the stack entry type of C<entry>.

=cut

*/

Stack_entry_type
get_entry_type(Interp *interpreter, Stack_Entry_t *entry)
{
    return entry->entry_type;
}

/*

=back

=head1 SEE ALSO

F<include/parrot/stacks.h>, F<include/parrot/enums.h>, and
F<src/stack_common.c>

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
