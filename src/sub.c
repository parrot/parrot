/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/sub.c - Subroutines

=head1 DESCRIPTION

Sub-routines, continuations, co-routines and other fun stuff...

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/method_util.h"

/*

=item C<void
save_context(struct Parrot_Interp *interp, struct Parrot_Context *ctx)>

Save the current "context" of interpreter.

=cut

*/

void
save_context(struct Parrot_Interp *interp, struct Parrot_Context *ctx)
{
    memcpy(ctx, &interp->ctx, sizeof(*ctx));
}

/*

=item C<void
cow_copy_context(struct Parrot_Interp *interp,
        struct Parrot_Context *dest, struct Parrot_Context *src)>

Save src context and mark it copy-on-write. We mark
the pads and stacks, not the actual context struct. This is used for
continuations. Stacks are COW marked to delay stack copying until
continuation is activated.

=cut

*/

void
cow_copy_context(struct Parrot_Interp *interp,
        struct Parrot_Context *dest, struct Parrot_Context *src)
{
    memcpy(dest, src, sizeof(*src));
    buffer_mark_COW(dest->warns);  /* XXX */
    buffer_mark_COW(dest->errors);
}

/*

=item C<void
restore_context(struct Parrot_Interp *interp, struct Parrot_Context *ctx)>

Set context of interpreter from a context buffer.

=cut

*/

void
restore_context(struct Parrot_Interp *interp, struct Parrot_Context *ctx)
{
    memcpy(&interp->ctx, ctx, sizeof(*ctx));
}

/*

=item C<void
mark_context(struct Parrot_Interp* interpreter, struct Parrot_Context* ctx)>

Marks the context C<*ctx>.

=cut

*/

void
mark_context(struct Parrot_Interp* interpreter, struct Parrot_Context* ctx)
{
    mark_stack(interpreter, ctx->pad_stack);
    mark_stack(interpreter, ctx->user_stack);
    mark_stack(interpreter, ctx->control_stack);
    mark_register_stack(interpreter, ctx->int_reg_stack);
    mark_register_stack(interpreter, ctx->num_reg_stack);
    mark_string_register_stack(interpreter, ctx->string_reg_stack);
    mark_pmc_register_stack(interpreter, ctx->pmc_reg_stack);
    pobject_lives(interpreter, ctx->warns);
    pobject_lives(interpreter, ctx->errors);
}

/*

=item C<static void coro_error(Stack_Entry_t *e)>

Coroutine error.

=cut

*/

static void coro_error(Stack_Entry_t *e)
{
    internal_exception(1, "Coroutine popped main stack");
}

/*

=item C<static void
prepend_stack( struct Stack_Chunk **interp_stack,
                struct Stack_Chunk **ctx_stack,
                struct Stack_Chunk *saved_stack,
                struct Stack_Chunk *saved_base)>

The final C<ctx_stack> = C<interp_stack> + C<saved_stack>, which
gets swapped with the C<interp_stack> during the prepend.

=cut

*/

static void
prepend_stack( struct Stack_Chunk **interp_stack,
                struct Stack_Chunk **ctx_stack,
                struct Stack_Chunk *saved_stack,
                struct Stack_Chunk *saved_base)
{
    size_t i;

    /*
     * the coroutines context gets the interpreter stack
     */
    *ctx_stack = *interp_stack;
    /*
     * new interpreter stack is the saved coroutine stack top
     * with the base pointing to the old top
     */
    saved_base->prev = *interp_stack;

    *interp_stack = saved_stack;
}

/*

=item C<static void
restore_stack( struct Stack_Chunk **interp_stack,
                struct Stack_Chunk **ctx_stack,
                struct Stack_Chunk **saved_stack,
                struct Stack_Chunk *saved_base)>

Swap C<**interp_stack> and C<**ctx_stack> and save the coroutine only
parts of the stack in C<**saved_stack>, so effectively undoing
C<prepend_stack()>.

=cut

*/

static void
restore_stack( struct Stack_Chunk **interp_stack,
                struct Stack_Chunk **ctx_stack,
                struct Stack_Chunk **saved_stack,
                struct Stack_Chunk *saved_base)
{
    /*
     * swap stacks back
     */
    *saved_stack = *interp_stack;
    *interp_stack = *ctx_stack;
    /*
     * the coroutine stack ends here
     */
    saved_base->prev = saved_base;
}

/*

=item C<void
swap_context(struct Parrot_Interp *interp, struct PMC *sub)>

Swaps the context.

=cut

*/

void
swap_context(struct Parrot_Interp *interp, struct PMC *sub)
{
    struct Stack_Chunk * tmp_stack = NULL;
    Buffer * warns;
    struct Parrot_Coroutine* co = (struct Parrot_Coroutine *)PMC_sub(sub);
    struct Parrot_Context *ctx = &co->ctx;
    Stack_Chunk_t *reg_top;

    /*
     * Swap user stacks and warnings
     */

    tmp_stack = interp->ctx.user_stack;
    interp->ctx.user_stack = ctx->user_stack;
    ctx->user_stack = tmp_stack;

    warns = interp->ctx.warns;
    interp->ctx.warns = ctx->warns;
    ctx->warns = warns;

    warns = interp->ctx.errors;
    interp->ctx.errors = ctx->errors;
    ctx->errors = warns;

    /* swap register frame tops */
    reg_top = interp->ctx.int_reg_stack;
    interp->ctx.int_reg_stack = ctx->int_reg_stack;
    ctx->int_reg_stack = reg_top;
    reg_top = interp->ctx.num_reg_stack;
    interp->ctx.num_reg_stack = ctx->num_reg_stack;
    ctx->num_reg_stack = reg_top;
    reg_top = interp->ctx.string_reg_stack;
    interp->ctx.string_reg_stack = ctx->string_reg_stack;
    ctx->string_reg_stack = reg_top;
    reg_top = interp->ctx.pmc_reg_stack;
    interp->ctx.pmc_reg_stack = ctx->pmc_reg_stack;
    ctx->pmc_reg_stack = reg_top;

    /* if calling the coroutine */
    if (!(PObj_get_FLAGS(sub) & PObj_private0_FLAG)) {
        /*
         * construct stacks that have the interpreter stack
         * at bottom and the coroutine stack at top
         */
        prepend_stack(&interp->ctx.control_stack, &ctx->control_stack,
                co->co_control_stack, co->co_control_base);
        PObj_get_FLAGS(sub) |= PObj_private0_FLAG;
    }
    else {
        PObj_get_FLAGS(sub) &= ~PObj_private0_FLAG;
        restore_stack(&interp->ctx.control_stack, &ctx->control_stack,
                &co->co_control_stack, co->co_control_base);
    }
    /*
     * TODO FIXME swap the pad_stack or act like the control_stack
     */
#if 1
    tmp_stack = interp->ctx.pad_stack;
    interp->ctx.pad_stack = ctx->pad_stack;
    ctx->pad_stack = tmp_stack;
#endif
}

/*

=item C<struct Parrot_Sub *
new_sub(struct Parrot_Interp *interp, size_t size)>

Returns a new C<Parrot_Sub>.

=cut

*/

struct Parrot_Sub *
new_sub(struct Parrot_Interp *interp, size_t size)
{
    /* Using system memory until I figure out GC issues */
    struct Parrot_Sub *newsub =
        mem_sys_allocate_zeroed(size);
    newsub->ctx.warns = interp->ctx.warns;
    newsub->ctx.errors = interp->ctx.errors;
    buffer_mark_COW(interp->ctx.warns);
    buffer_mark_COW(interp->ctx.errors);
    newsub->seg = interp->code->cur_cs;
    return newsub;
}

/*

=item C<struct Parrot_Sub *
new_closure(struct Parrot_Interp *interp)>

Returns a new C<Parrot_Sub> with its own sctatchpad.

XXX: Need to document semantics in detail.

=cut

*/

struct Parrot_Sub *
new_closure(struct Parrot_Interp *interp)
{
    struct Parrot_Sub *newsub = new_sub(interp, sizeof(struct Parrot_Sub));
    PMC * pad = scratchpad_get_current(interp);
    newsub->ctx.pad_stack = new_stack(interp, "Pad");
    if (pad) {
        /* put the correct pad in place */
        stack_push(interp, &newsub->ctx.pad_stack, pad,
                STACK_ENTRY_PMC, STACK_CLEANUP_NULL);
    }
    return newsub;
}
/*

=item C<void mark_stack_reusable(Parrot_Interp, struct Parrot_Context *)>

Set continuation context stacks as recyclable.

=cut

*/
void
mark_stack_reusable(Parrot_Interp interpreter, struct Parrot_Context *ctx)
{
    PObj_get_FLAGS(ctx->int_reg_stack) |= PObj_private2_FLAG;
    PObj_get_FLAGS(ctx->num_reg_stack) |= PObj_private2_FLAG;
    PObj_get_FLAGS(ctx->pmc_reg_stack) |= PObj_private2_FLAG;
    PObj_get_FLAGS(ctx->string_reg_stack) |= PObj_private2_FLAG;
}
/*

=item C<struct Parrot_Sub *
new_continuation(struct Parrot_Interp *interp)>

Returns a new C<Parrot_Sub> with its own COW version of the current
context.

=cut

*/


struct Parrot_Sub *
new_continuation(struct Parrot_Interp *interp)
{
    struct Parrot_Sub *cc = new_sub(interp, sizeof(struct Parrot_Sub));
    cow_copy_context(interp, &cc->ctx, &interp->ctx);
    return cc;
}

/*

=item C<struct Parrot_Sub *
new_ret_continuation(struct Parrot_Interp *interp)>

Returns a new C<Parrot_Sub> with its own copy of the current context.

=cut

*/

struct Parrot_Sub *
new_ret_continuation(struct Parrot_Interp *interp)
{
    struct Parrot_Sub *cc =
        mem_sys_allocate_zeroed(sizeof(struct Parrot_Sub));
    cc->seg = interp->code->cur_cs;
    save_context(interp, &cc->ctx);
    return cc;
}

/*

=item C<struct Parrot_Sub *
new_coroutine(struct Parrot_Interp *interp)>

Returns a new C<Parrot_Coroutine>.

XXX: Need to document semantics in detail.

=cut

*/

struct Parrot_Sub *
new_coroutine(struct Parrot_Interp *interp)
{
    PMC * pad;
    struct Parrot_Context *ctx;
    struct Parrot_Coroutine *co =
        mem_sys_allocate_zeroed(sizeof(struct Parrot_Coroutine));

    co->seg = interp->code->cur_cs;
    ctx = &co->ctx;
    save_context(interp, ctx);

    /* we have separate register stacks */
    setup_register_stacks(interp, ctx);

    /* create new (pad ??) and control stacks,
     * when invoking the coroutine the real stacks are
     * constructed in swap_context
     * XXX decide what to do with pad
     */
    co->co_control_base = co->co_control_stack =
        new_stack(interp, "Coro_Control");

    /*
     * XXX probably in swap_context
     */
    pad = scratchpad_get_current(interp);
    if (pad) {
        stack_push(interp, &ctx->pad_stack, pad,
                   STACK_ENTRY_PMC, STACK_CLEANUP_NULL);
    }
    return (struct Parrot_Sub *)co;
}

/*

=item C<PMC *
new_ret_continuation_pmc(struct Parrot_Interp * interp, opcode_t * address)>

Returns a new C<RetContinuation> PMC.

=cut

*/

void
add_to_retc_free_list(Parrot_Interp interpreter, PMC *sub)
{
    Caches *mc = interpreter->caches;
    struct Parrot_Sub *cc_self = PMC_sub(sub);
    /* is it created from new_ret_continuation_pmc() i.e.
     * from invokecc or callmethodcc
     */
    if (!(PObj_get_FLAGS(sub) & PObj_private2_FLAG) ||
            DISABLE_RETC_RECYCLING) {
        return;
    }
    /* fprintf(stderr, "** add %p free = %p\n", sub, mc->retc_free_list); */
    PMC_struct_val(sub) = mc->retc_free_list;
    mc->retc_free_list = sub;
    /* don't mark the continuation context */
    PObj_custom_mark_CLEAR(sub);
    PObj_on_free_list_SET(sub);
    mark_stack_reusable(interpreter, &cc_self->ctx);
}

PMC *
get_retc_from_free_list(Parrot_Interp interpreter)
{
    Caches *mc = interpreter->caches;
    PMC *retc;

    if (!mc->retc_free_list)
        return NULL;
    retc = mc->retc_free_list;
    mc->retc_free_list = PMC_struct_val(retc);
    PObj_custom_mark_SET(retc);
    PObj_on_free_list_CLEAR(retc);
    /* fprintf(stderr, "** get %p free = %p\n", retc, mc->retc_free_list ); */
    return retc;
}

PMC *
new_ret_continuation_pmc(struct Parrot_Interp * interp, opcode_t * address)
{
    PMC* continuation;

    continuation = get_retc_from_free_list(interp);
    if (continuation) {
        /* freshen context */
        struct Parrot_Sub *sub = PMC_sub(continuation);
        save_context(interp, &sub->ctx);
        sub->seg = interp->code->cur_cs;
    }
    else {
        continuation = pmc_new(interp, enum_class_RetContinuation);
        PObj_get_FLAGS(continuation) |= (
                PObj_private1_FLAG|PObj_private2_FLAG);
    }
    PMC_struct_val(continuation) = address;
    return continuation;
}

/*

=back

=head2 Scratchpad Functions

=over 4

=item C<static struct Parrot_Lexicals *
scratchpad_index(struct Parrot_Interp* interpreter, PMC* pad,
                 INTVAL scope_index)>

Uses C<scope_index> to find and return the appropriate scope.

=cut

*/

static struct Parrot_Lexicals *
scratchpad_index(struct Parrot_Interp* interpreter, PMC* pad,
                 INTVAL scope_index)
{
    /* if scope_index is negative we count out from current pad */
    scope_index = scope_index < 0 ?
        PMC_int_val(pad) + scope_index : scope_index;

    if (scope_index >= PMC_int_val(pad) || scope_index < 0) {
        internal_exception(-1, "Pad index out of range");
        return NULL;
    }

    return &(((struct Parrot_Lexicals *)PMC_data(pad))[scope_index]);
}

/*

=item C<PMC *
scratchpad_get_current(struct Parrot_Interp * interp)>

Returns a pointer to the current scratchpad.

=cut

*/

PMC *
scratchpad_get_current(struct Parrot_Interp * interp)
{
    return (PMC *)stack_peek(interp, interp->ctx.pad_stack, NULL);
}

/*

=item C<static INTVAL
lexicals_get_position(struct Parrot_Interp * interp,
                      struct Parrot_Lexicals *lex, STRING* name)>

Returns the position of the lexical variable corresponding to C<*name>.
If such a variable can not be found the length of the list is returned
(i.e. the position that this new lexical should be stored in).

=cut

*/

static INTVAL
lexicals_get_position(struct Parrot_Interp * interp,
                      struct Parrot_Lexicals *lex, STRING* name)
{
    STRING * cur;
    INTVAL pos;

    for (pos = 0; pos < list_length(interp, lex->names); pos++) {
        cur = *(STRING**)list_get(interp, lex->names, pos, enum_type_STRING);
        if (cur && string_compare(interp, cur, name) == 0) {
            break;
        }
    }

    return pos;
}

/*

=item C<static struct Parrot_Lexicals *
scratchpad_find(struct Parrot_Interp* interp, PMC* pad, STRING * name,
                INTVAL * position)>

Returns first lexical scope and position where C<*name> is found, or
C<NULL> if it can not be found.

=cut

*/

static struct Parrot_Lexicals *
scratchpad_find(struct Parrot_Interp* interp, PMC* pad, STRING * name,
                INTVAL * position)
{
    INTVAL i, pos = 0;
    struct Parrot_Lexicals * lex = NULL;

    for (i = PMC_int_val(pad) - 1; i >= 0; i--) {
        lex = &(((struct Parrot_Lexicals *)PMC_data(pad))[i]);
        pos = lexicals_get_position(interp, lex, name);
        if (pos == list_length(interp, lex->names))
            lex = NULL;
        else
            break;
    }

    *position = pos;
    return lex;
}

/*

=item C<PMC*
scratchpad_new(struct Parrot_Interp * interp, PMC * base, INTVAL depth)>

Creates and initializes a new C<Scratchpad> PMC.

=cut

*/

PMC*
scratchpad_new(struct Parrot_Interp * interp, PMC * base, INTVAL depth)
{
    PMC * pad_pmc;

    Parrot_block_DOD(interp);
    pad_pmc = pmc_new(interp, enum_class_Scratchpad);
    if (base && depth < 0) {
        depth = PMC_int_val(base) + depth + 1;
    }

    if ((depth < 0)
        || (base && depth > PMC_int_val(base))
        || (!base && depth != 0)) {
        Parrot_unblock_DOD(interp);
        internal_exception(-1, "-scratch_pad: too deep\n");
        return NULL;
    }

    /* XXX JPS: should we use a List * here instead? */
    PMC_data(pad_pmc) = mem_sys_allocate((depth + 1) *
                                     sizeof(struct Parrot_Lexicals));

    if (base) {
        /* XXX JPS: I guess this is copying the front, when it should
           be copying the end of the parent (base) */
        memcpy(PMC_data(pad_pmc), PMC_data(base), depth *
               sizeof(struct Parrot_Lexicals));
    }

    PMC_int_val(pad_pmc) = depth + 1;

    /* in case call to list_new triggers gc */
    ((struct Parrot_Lexicals *)PMC_data(pad_pmc))[depth].values = NULL;
    ((struct Parrot_Lexicals *)PMC_data(pad_pmc))[depth].names = NULL;

    ((struct Parrot_Lexicals *)PMC_data(pad_pmc))[depth].values =
        list_new(interp, enum_type_PMC);
    ((struct Parrot_Lexicals *)PMC_data(pad_pmc))[depth].names =
        list_new(interp, enum_type_STRING);

    Parrot_unblock_DOD(interp);

    return pad_pmc;
}

/*

=item C<void
scratchpad_store(struct Parrot_Interp * interp, PMC * pad,
                 STRING * name, INTVAL position, PMC* value)>

Routines for storing and reading lexicals in C<Scratchpad> PMCs. These
take both a name and a position, however in general only one of these
will be considered. This is to support both by name access and by
position (which is faster). If by position access is intended name
should be passed as C<NULL>.

=cut

*/

void
scratchpad_store(struct Parrot_Interp * interp, PMC * pad,
                 STRING * name, INTVAL position, PMC* value)
{
    struct Parrot_Lexicals * lex;

    if (name) {
        /* use name to find lex and position */
        lex = scratchpad_find(interp, pad, name, &position);
        if (!lex)
            internal_exception(-1, "Lexical '%s' not found",
                               (name == NULL) ? "???"
                               : string_to_cstring(interp, name));
    }
    else {
        /* assume current lexical pad */
        lex = scratchpad_index(interp, pad, -1);
    }

    list_assign(interp, lex->values, position, value, enum_type_PMC);
}

/*

=item C<void
scratchpad_store_index(struct Parrot_Interp * interp, PMC * pad,
                       INTVAL scope_index, STRING * name, INTVAL position,
                       PMC* value)>

Stores C<*value> with name C<*name> or index C<position> in the
scratchpad at C<scope_index>.

=cut

*/

void
scratchpad_store_index(struct Parrot_Interp * interp, PMC * pad,
                       INTVAL scope_index, STRING * name, INTVAL position,
                       PMC* value)
{
    struct Parrot_Lexicals * lex;

    lex = scratchpad_index(interp, pad, scope_index);

    if (name) {
        position = lexicals_get_position(interp, lex, name);
    }

    if (position == list_length(interp, lex->names)) {
        if (!name) {
            /* no name for new variable, give it a default name of "" */
            /* XXX JPS: is this the way to make an empty string? */
            name = string_make(interp, "        ", 9,"iso-8859-1",0);
        }
        list_assign(interp, lex->names, position, name, enum_type_STRING);
    }

    list_assign(interp, lex->values, position, value, enum_type_PMC);
}

/*

=item C<PMC *
scratchpad_get(struct Parrot_Interp * interp, PMC * pad, STRING * name,
               INTVAL position)>

Finds and returns the value for name C<*name> in scratchpad C<*pad>.

=cut

*/

PMC *
scratchpad_get(struct Parrot_Interp * interp, PMC * pad, STRING * name,
               INTVAL position)
{
    struct Parrot_Lexicals * lex = NULL;

    if (!pad)
        return NULL;
    if (name) lex = scratchpad_find(interp, pad, name, &position);
    else lex = scratchpad_index(interp, pad, -1);

    if (!lex)
        return NULL;

    return *(PMC **)list_get(interp, lex->values, position, enum_type_PMC);
}

/*

=item C<PMC *
scratchpad_get_index(struct Parrot_Interp * interp, PMC * pad,
                     INTVAL scope_index, STRING * name, INTVAL position)>

Finds and returns the value for name C<*name> in scratchpad C<*pad>.

=cut

*/

PMC *
scratchpad_get_index(struct Parrot_Interp * interp, PMC * pad,
                     INTVAL scope_index, STRING * name, INTVAL position)
{
    struct Parrot_Lexicals * lex;

    if (!pad)
        return NULL;
    lex = scratchpad_index(interp, pad, scope_index);

    if (name) {
        position = lexicals_get_position(interp, lex, name);
    }

    if (!lex || position < 0 || position >= list_length(interp, lex->values)) {
        return NULL;
    }

    return *(PMC **)list_get(interp, lex->values, position, enum_type_PMC);
}

/*

=item C<void
lexicals_mark(struct Parrot_Interp * interp, struct Parrot_Lexicals *lex)>

Calls C<list_mark()> on the lexical's names and values.

=cut

*/

void
lexicals_mark(struct Parrot_Interp * interp, struct Parrot_Lexicals *lex)
{
    if (lex->names)
        list_mark(interp, lex->names);
    if (lex->values)
        list_mark(interp, lex->values);
}

/*

=item C<void
scratchpad_delete(Parrot_Interp interp, PMC *pad, STRING *name)>

Deletes scratchpad C<*pad>.

=cut

*/

void
scratchpad_delete(Parrot_Interp interp, PMC *pad, STRING *name)
{
    INTVAL pos;
    struct Parrot_Lexicals *lex = scratchpad_find(interp, pad, name, &pos);
    if (lex)
        list_assign(interp, lex->names, pos, NULL, enum_type_STRING);
}

/*

=back

=head1 SEE ALSO

F<include/parrot/sub.h>.

=head1 HISTORY

Initial version by Melvin on 2002/06/6.

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
