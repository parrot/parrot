/*
Copyright (C) 2001-2009, Parrot Foundation.
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
#include "parrot/stacks.h"
#include "stacks.str"

/* HEADERIZER HFILE: include/parrot/stacks.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void run_cleanup_action(PARROT_INTERP, ARGIN(Stack_Entry_t *e))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_run_cleanup_action __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(e)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<void stack_system_init(PARROT_INTERP)>

Called from C<make_interpreter()> to initialize the interpreter's
register stacks.

=cut

*/

PARROT_EXPORT
void
stack_system_init(SHIM_INTERP)
{
    ASSERT_ARGS(stack_system_init)
}

/*

=item C<Stack_Chunk_t * cst_new_stack_chunk(PARROT_INTERP, const Stack_Chunk_t *chunk)>

Get a new chunk either from the freelist or allocate one.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Stack_Chunk_t *
cst_new_stack_chunk(PARROT_INTERP, ARGIN(const Stack_Chunk_t *chunk))
{
    ASSERT_ARGS(cst_new_stack_chunk)
    Small_Object_Pool * const pool = chunk->pool;
    Stack_Chunk_t * const new_chunk = (Stack_Chunk_t *)pool->get_free_object(interp, pool);

    PObj_bufstart(new_chunk) = NULL;
    PObj_buflen(new_chunk)   = 0;

    new_chunk->pool          = chunk->pool;
    new_chunk->name          = chunk->name;

    return new_chunk;
}

/*

=item C<Stack_Chunk_t * new_stack(PARROT_INTERP, const char *name)>

Create a new stack and name it. C<< stack->name >> is used for
debugging/error reporting.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
Stack_Chunk_t *
new_stack(PARROT_INTERP, ARGIN(const char *name))
{
    ASSERT_ARGS(new_stack)
    Small_Object_Pool * const pool = get_bufferlike_pool(interp, sizeof (Stack_Chunk_t));
    Stack_Chunk_t     * const chunk = (Stack_Chunk_t *)(pool->get_free_object)(interp, pool);

    chunk->prev = chunk;        /* mark the top of the stack */
    chunk->name = name;
    chunk->pool = pool;         /* cache the pool pointer, for ease */

    return chunk;
}


/*

=item C<void mark_stack(PARROT_INTERP, Stack_Chunk_t *chunk)>

Mark entries in a stack structure during GC.

=cut

*/

PARROT_EXPORT
void
mark_stack(PARROT_INTERP, ARGMOD(Stack_Chunk_t *chunk))
{
    ASSERT_ARGS(mark_stack)
    for (; ; chunk = chunk->prev) {
        Stack_Entry_t  *entry;

        pobject_lives(interp, (PObj *)chunk);

        if (chunk == chunk->prev)
            break;

        entry = STACK_DATAP(chunk);

        if (entry->entry_type == STACK_ENTRY_PMC && UVal_pmc(entry->entry))
            pobject_lives(interp, (PObj *)UVal_pmc(entry->entry));
    }
}

/*

=item C<void stack_destroy(Stack_Chunk_t *top)>

stack_destroy() doesn't need to do anything, since GC does it all.

=cut

*/

PARROT_EXPORT
void
stack_destroy(SHIM(Stack_Chunk_t *top))
{
    ASSERT_ARGS(stack_destroy)
    /* GC does it all */
}

/*

=item C<size_t stack_height(PARROT_INTERP, const Stack_Chunk_t *chunk)>

Returns the height of the stack. The maximum "depth" is height - 1.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
size_t
stack_height(SHIM_INTERP, ARGIN(const Stack_Chunk_t *chunk))
{
    ASSERT_ARGS(stack_height)
    size_t height = 0;

    for (; ; chunk = chunk->prev) {
        if (chunk == chunk->prev)
            break;
        ++height;
    }

    return height;
}


/*

=item C<Stack_Entry_t * stack_entry(PARROT_INTERP, Stack_Chunk_t *stack, INTVAL depth)>

If C<< depth >= 0 >>, return the entry at that depth from the top of the
stack, with 0 being the top entry. If C<depth < 0>, then return the
entry C<|depth|> entries from the bottom of the stack. Returns C<NULL>
if C<|depth| > number> of entries in stack.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
Stack_Entry_t *
stack_entry(SHIM_INTERP, ARGIN(Stack_Chunk_t *stack), INTVAL depth)
{
    ASSERT_ARGS(stack_entry)
    Stack_Chunk_t *chunk;
    size_t         offset = (size_t)depth;

    if (depth < 0)
        return NULL;

    /* Start at top */
    chunk = stack;

    while (offset) {
        if (chunk == chunk->prev)
            break;
        --offset;
        chunk = chunk->prev;
    }

    if (chunk == chunk->prev)
        return NULL;

    return STACK_DATAP(chunk);
}

/*

=item C<Stack_Entry_t* stack_prepare_push(PARROT_INTERP, Stack_Chunk_t **stack_p)>

Return a pointer, where new entries go for push.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Stack_Entry_t*
stack_prepare_push(PARROT_INTERP, ARGMOD(Stack_Chunk_t **stack_p))
{
    ASSERT_ARGS(stack_prepare_push)
    Stack_Chunk_t * const chunk     = *stack_p;
    Stack_Chunk_t * const new_chunk = cst_new_stack_chunk(interp, chunk);

    new_chunk->prev = chunk;
    *stack_p        = new_chunk;

    return STACK_DATAP(new_chunk);
}

/*

=item C<void stack_push(PARROT_INTERP, Stack_Chunk_t **stack_p,
void *thing, Stack_entry_type type, Stack_cleanup_method cleanup)>

Push something on the generic stack.

Note that the cleanup pointer, if non-C<NULL>, points to a routine
that'll be called when the entry is removed from the stack. This is
handy for those cases where you need some sort of activity to take place
when an entry is removed, such as when you push a lexical lock onto the
call stack, or localize (or tempify, or whatever we're calling it)
variable or something.

*/

PARROT_EXPORT
void
stack_push(PARROT_INTERP, ARGMOD(Stack_Chunk_t **stack_p),
           ARGIN(void *thing), Stack_entry_type type, NULLOK(Stack_cleanup_method cleanup))
{
    ASSERT_ARGS(stack_push)
    Stack_Entry_t * const entry = (Stack_Entry_t *)stack_prepare_push(interp, stack_p);

    /* Remember the type */
    entry->entry_type = type;

    /* Remember the cleanup function */
    entry->cleanup = cleanup;

    /* Store our thing */
    switch (type) {
        case STACK_ENTRY_MARK:
            UVal_int(entry->entry) = *(INTVAL *)thing;
            break;
        case STACK_ENTRY_DESTINATION:
            UVal_ptr(entry->entry) = thing;
            break;
        case STACK_ENTRY_ACTION:
        case STACK_ENTRY_PMC:
            UVal_pmc(entry->entry) = (PMC *)thing;
            break;
        default:
            Parrot_ex_throw_from_c_args(interp, NULL, ERROR_BAD_STACK_TYPE,
                "Invalid Stack_Entry_type!");
    }
}

/*

=item C<Stack_Entry_t* stack_prepare_pop(PARROT_INTERP, Stack_Chunk_t **stack_p)>

Return a pointer, where new entries are popped off.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Stack_Entry_t*
stack_prepare_pop(PARROT_INTERP, ARGMOD(Stack_Chunk_t **stack_p))
{
    ASSERT_ARGS(stack_prepare_pop)
    Stack_Chunk_t * const chunk = *stack_p;

    /* the first entry (initial top) refers to itself */
    if (chunk == chunk->prev)
        Parrot_ex_throw_from_c_args(interp, NULL, ERROR_STACK_EMPTY,
            "No entries on %s Stack!", chunk->name);

    *stack_p = chunk->prev;

    return STACK_DATAP(chunk);
}

/*

=item C<void * stack_pop(PARROT_INTERP, Stack_Chunk_t **stack_p,
void *where, Stack_entry_type type)>

Pop off an entry and return a pointer to the contents.

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
void *
stack_pop(PARROT_INTERP, ARGMOD(Stack_Chunk_t **stack_p),
          ARGOUT_NULLOK(void *where), Stack_entry_type type)
{
    ASSERT_ARGS(stack_pop)
    Stack_Chunk_t     *cur_chunk   = *stack_p;
    Stack_Entry_t * const entry    =
        (Stack_Entry_t *)stack_prepare_pop(interp, stack_p);

    /* Types of 0 mean we don't care */
    if (type && entry->entry_type != type)
        Parrot_ex_throw_from_c_args(interp, NULL, ERROR_BAD_STACK_TYPE,
            "Wrong type on top of stack!\n");

    /* Cleanup routine? */
    if (entry->cleanup != STACK_CLEANUP_NULL)
        (*entry->cleanup) (interp, entry);

    /* Sometimes the caller cares what the value was */
    if (where) {
        /* Snag the value */
        switch (type) {
        case STACK_ENTRY_MARK:
            *(INTVAL *)where   = UVal_int(entry->entry);
            break;
        case STACK_ENTRY_DESTINATION:
            *(void **)where    = UVal_ptr(entry->entry);
            break;
        case STACK_ENTRY_ACTION:
        case STACK_ENTRY_PMC:
            *(PMC **)where     = UVal_pmc(entry->entry);
            break;
        default:
            Parrot_ex_throw_from_c_args(interp, NULL, ERROR_BAD_STACK_TYPE,
                "Wrong type on top of stack!\n");
        }
    }

    /* recycle this chunk to the free list if it's otherwise unreferenced */
    if (cur_chunk->refcount <= 0) {
        Small_Object_Pool * const pool = cur_chunk->pool;

        pool->gc_object(interp, pool, (PObj *)cur_chunk);
        pool->add_free_object(interp, pool, (PObj *)cur_chunk);
    }

    return where;
}

/*

=item C<void * pop_dest(PARROT_INTERP)>

Pop off a destination entry and return a pointer to the contents.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
void *
pop_dest(PARROT_INTERP)
{
    ASSERT_ARGS(pop_dest)
    /* We don't mind the extra call, so we do this: (previous comment
     * said we *do* mind, but I say let the compiler decide) */
    void *dest;
    (void)stack_pop(interp, &interp->dynamic_env,
                    &dest, STACK_ENTRY_DESTINATION);
    return dest;
}

/*

=item C<void * stack_peek(PARROT_INTERP, Stack_Chunk_t *stack_base,
Stack_entry_type *type)>

Peek at stack and return pointer to entry and the type of the entry.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
void *
stack_peek(PARROT_INTERP, ARGIN(Stack_Chunk_t *stack_base),
           ARGMOD_NULLOK(Stack_entry_type *type))
{
    ASSERT_ARGS(stack_peek)
    const Stack_Entry_t * const entry = stack_entry(interp, stack_base, 0);
    if (entry == NULL)
        return NULL;

    if (type != NULL)
        *type = entry->entry_type;

    if (entry->entry_type == STACK_ENTRY_DESTINATION)
        return UVal_ptr(entry->entry);

    return (void *) UVal_pmc(entry->entry);
}

/*

=item C<Stack_entry_type get_entry_type(const Stack_Entry_t *entry)>

Returns the stack entry type of C<entry>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
Stack_entry_type
get_entry_type(ARGIN(const Stack_Entry_t *entry))
{
    ASSERT_ARGS(get_entry_type)
    return entry->entry_type;
}

/*

=item C<void Parrot_dump_dynamic_environment(PARROT_INTERP, Stack_Chunk_t *dynamic_env)>

Print a representation of the dynamic stack to the standard error (using
C<Parrot_io_eprintf>).  This is used only temporarily for debugging.

=cut

*/

PARROT_EXPORT
void
Parrot_dump_dynamic_environment(PARROT_INTERP, ARGIN(Stack_Chunk_t *dynamic_env))
{
    ASSERT_ARGS(Parrot_dump_dynamic_environment)
    int height = (int) stack_height(interp, dynamic_env);

    while (dynamic_env->prev != dynamic_env) {
        const Stack_Entry_t * const e = stack_entry(interp, dynamic_env, 0);

        if (! e)
            Parrot_ex_throw_from_c_args(interp, NULL, 1, "Dynamic environment stack damaged");

        Parrot_io_eprintf(interp, "[%4d:  chunk %p entry %p "
                                 "type %d cleanup %p]\n",
                    height, dynamic_env, e,
                    e->entry_type, e->cleanup);
        if (e->entry_type == STACK_ENTRY_PMC
                || e->entry_type == STACK_ENTRY_ACTION) {
            PMC * const thing = UVal_pmc(e->entry);

            Parrot_io_eprintf(interp, "[        PMC %p type %d => %Ss]\n",
                        thing, thing->vtable->base_type,
                        VTABLE_get_string(interp, thing));
        }
        else if (e->entry_type == STACK_ENTRY_MARK) {
            Parrot_io_eprintf(interp, "[        mark %d]\n",
                        UVal_int(e->entry));
        }
        dynamic_env = dynamic_env->prev;
        height--;
    }
    Parrot_io_eprintf(interp, "[%4d:  chunk %p %s base]\n",
                height, dynamic_env, dynamic_env->name);
}


/*

=item C<static void run_cleanup_action(PARROT_INTERP, Stack_Entry_t *e)>

Runs the sub PMC from the Stack_Entry_t pointer with an INTVAL arg of 0.  Used
in C<Parrot_push_action>.

=cut

*/

static void
run_cleanup_action(PARROT_INTERP, ARGIN(Stack_Entry_t *e))
{
    ASSERT_ARGS(run_cleanup_action)
    /*
     * this is called during normal stack_pop of the control
     * stack - run the action subroutine with an INTVAL arg of 0
     */
    PMC * const sub = UVal_pmc(e->entry);
    Parrot_runops_fromc_args(interp, sub, "vI", 0);
}

/*

=item C<void Parrot_push_action(PARROT_INTERP, PMC *sub)>

Pushes an action handler onto the dynamic environment.

=cut

*/

PARROT_EXPORT
void
Parrot_push_action(PARROT_INTERP, ARGIN(PMC *sub))
{
    ASSERT_ARGS(Parrot_push_action)
    if (!VTABLE_isa(interp, sub, CONST_STRING(interp, "Sub")))
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
            "Tried to push a non Sub PMC action");

    stack_push(interp, &interp->dynamic_env, sub,
               STACK_ENTRY_ACTION, run_cleanup_action);
}

/*

=item C<void Parrot_push_mark(PARROT_INTERP, INTVAL mark)>

Push a cleanup mark onto the dynamic environment.

=cut

*/

PARROT_EXPORT
void
Parrot_push_mark(PARROT_INTERP, INTVAL mark)
{
    ASSERT_ARGS(Parrot_push_mark)
    stack_push(interp, &interp->dynamic_env, &mark,
               STACK_ENTRY_MARK, STACK_CLEANUP_NULL);
}

/*

=item C<void Parrot_pop_mark(PARROT_INTERP, INTVAL mark)>

Pop items off the dynamic environment up to the mark.

=cut

*/

PARROT_EXPORT
void
Parrot_pop_mark(PARROT_INTERP, INTVAL mark)
{
    ASSERT_ARGS(Parrot_pop_mark)
    do {
        const Stack_Entry_t * const e
            = stack_entry(interp, interp->dynamic_env, 0);
        if (!e)
            Parrot_ex_throw_from_c_args(interp, NULL, 1, "Mark %ld not found.",
                (long)mark);

        (void)stack_pop(interp, &interp->dynamic_env,
                        NULL, e->entry_type);
        if (e->entry_type == STACK_ENTRY_MARK) {
            if (UVal_int(e->entry) == mark)
                return;
        }
    } while (1);
}


/*

=back

=head1 SEE ALSO

F<include/parrot/stacks.h> and F<include/parrot/enums.h>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
