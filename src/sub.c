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
save_context(Interp *interp, struct Parrot_Context *ctx)>

Save the current "context" of interpreter.

=cut

*/

void
save_context(Interp *interp, struct Parrot_Context *ctx)
{
    memcpy(ctx, &interp->ctx, sizeof(*ctx));
}

/*

=item C<void
restore_context(Interp *interp, struct Parrot_Context *ctx)>

Set context of interpreter from a context buffer.

=cut

*/

void
restore_context(Interp *interp, struct Parrot_Context *ctx)
{
    memcpy(&interp->ctx, ctx, sizeof(*ctx));
}

/*

=item C<void
mark_context(Interp* interpreter, struct Parrot_Context* ctx)>

Marks the context C<*ctx>.

=cut

*/

void
mark_context(Interp* interpreter, struct Parrot_Context* ctx)
{
    mark_stack(interpreter, ctx->pad_stack);
    mark_stack(interpreter, ctx->user_stack);
    mark_stack(interpreter, ctx->control_stack);
    mark_register_stack(interpreter, ctx->int_reg_stack);
    mark_register_stack(interpreter, ctx->num_reg_stack);
    mark_string_register_stack(interpreter, ctx->string_reg_stack);
    mark_pmc_register_stack(interpreter, ctx->pmc_reg_stack);
    mark_reg_stack(interpreter, ctx->reg_stack);
}

/*

=item C<static void
prepend_stack( struct Stack_Chunk **interp_stack,
                struct Stack_Chunk **ctx_stack,
                struct Stack_Chunk *saved_stack,
                struct Stack_Chunk *saved_base)>

The final C<ctx_stack> = C<interp_stack> + C<saved_stack>.
C<interp_stack> and C<ctx_stack> are already swapped here.

=cut

*/

static void
prepend_stack( struct Stack_Chunk **interp_stack,
                struct Stack_Chunk **ctx_stack,
                struct Stack_Chunk *saved_stack,
                struct Stack_Chunk *saved_base)
{
    /*
     * new interpreter stack is the saved coroutine stack top
     * with the base pointing to the old top
     */
    saved_base->prev = *ctx_stack;

    *interp_stack = saved_stack;
}

/*

=item C<static void
restore_stack( struct Stack_Chunk **interp_stack,
                struct Stack_Chunk **ctx_stack,
                struct Stack_Chunk **saved_stack,
                struct Stack_Chunk *saved_base)>

Undo C<prepend_stack()>.
C<interp_stack> and C<ctx_stack> are already swapped here.

=cut

*/

static void
restore_stack( struct Stack_Chunk **interp_stack,
                struct Stack_Chunk **ctx_stack,
                struct Stack_Chunk **saved_stack,
                struct Stack_Chunk *saved_base)
{
    *saved_stack = *ctx_stack;
    /*
     * the coroutine stack ends here
     */
    saved_base->prev = saved_base;
}

/*

=item C<void
swap_context(Interp *interp, struct PMC *sub)>

Swaps the context.

=cut

*/

void
swap_context(Interp *interpreter, struct PMC *sub)
{
    struct Parrot_coro* co = PMC_coro(sub);
    struct Parrot_Context *ctx = &co->ctx;
    struct Parrot_Context temp;
    struct parrot_regs_t *reg_p;

    /*
     * Swap context structures
     */
    memcpy(&temp, &interpreter->ctx, sizeof(temp));
    memcpy(&interpreter->ctx, ctx,   sizeof(temp));
    memcpy(ctx, &temp,               sizeof(temp));

    /* if calling the coroutine */
    if (!(PObj_get_FLAGS(sub) & PObj_private0_FLAG)) {
        /*
         * first time set current sub, cont, object
         */
        if (!interpreter->ctx.current_sub) {
            copy_regs(interpreter, ctx->bp);
            ctx->current_sub = interpreter->ctx.current_sub = sub;
            interpreter->ctx.current_cont = ctx->bp->pmc_reg.registers[1];
            REG_PMC(0) = sub;
            REG_PMC(1) = interpreter->ctx.current_cont;
            /*
             * invalidate return continuations
             */
            invalidate_retc_context(interpreter, sub);
        }
        /*
         * construct stacks that have the interpreterreter stack
         * at bottom and the coroutine stack at top
         */
        prepend_stack(&interpreter->ctx.control_stack, &ctx->control_stack,
                co->co_control_stack, co->co_control_base);
        PObj_get_FLAGS(sub) |= PObj_private0_FLAG;
    }
    else {
        PObj_get_FLAGS(sub) &= ~PObj_private0_FLAG;
        restore_stack(&interpreter->ctx.control_stack, &ctx->control_stack,
                &co->co_control_stack, co->co_control_base);
        copy_regs(interpreter, ctx->bp);
    }
}

/*

=item C<struct Parrot_sub *
new_sub(Interp *interp)>

Returns a new C<Parrot_sub>.

=cut

*/

struct Parrot_sub *
new_sub(Interp *interp)
{
    /* Using system memory until I figure out GC issues */
    struct Parrot_sub *newsub =
        mem_sys_allocate_zeroed(sizeof(struct Parrot_sub));
    newsub->seg = interp->code->cur_cs;
    return newsub;
}

/*

=item C<struct Parrot_sub *
new_closure(Interp *interp)>

Returns a new C<Parrot_sub> with its own sctatchpad.

XXX: Need to document semantics in detail.

=cut

*/

struct Parrot_sub *
new_closure(Interp *interp)
{
    struct Parrot_sub *newsub = new_sub(interp);
    PMC * pad = scratchpad_get_current(interp);
    newsub->pad_stack = new_stack(interp, "Pad");
    if (pad) {
        /* put the correct pad in place */
        stack_push(interp, &newsub->pad_stack, pad,
                STACK_ENTRY_PMC, STACK_CLEANUP_NULL);
    }
    return newsub;
}
/*

=item C<struct Parrot_cont *
new_continuation(Interp *interp)>

Returns a new C<Parrot_cont> with its own copy of the current
context.

=cut

*/


struct Parrot_cont *
new_continuation(Interp *interp)
{
    struct Parrot_cont *cc = mem_sys_allocate(sizeof(struct Parrot_cont));
    save_context(interp, &cc->ctx);
    cc->seg = interp->code->cur_cs;
    return cc;
}

/*

=item C<struct Parrot_cont *
new_ret_continuation(Interp *interp)>

Returns a new C<Parrot_cont> with its own copy of the current context.

=cut

*/

struct Parrot_cont *
new_ret_continuation(Interp *interp)
{
    return new_continuation(interp);
}

/*

=item C<struct Parrot_coro *
new_coroutine(Interp *interp)>

Returns a new C<Parrot_coro>.

XXX: Need to document semantics in detail.

=cut

*/

struct Parrot_coro *
new_coroutine(Interp *interp)
{
    PMC * pad;
    struct Parrot_Context *ctx;
    struct Parrot_coro *co =
        mem_sys_allocate_zeroed(sizeof(struct Parrot_coro));

    co->seg = interp->code->cur_cs;
    ctx = &co->ctx;
    save_context(interp, ctx);
    ctx->current_sub = NULL;

    /* we have separate register stacks
     * - or not, with our single item stack
     */
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
    return co;
}


/*
 * Return continuation PMCs are re-used.
 * In the cache they are chained together by this pointer:
 */
#if PMC_DATA_IN_EXT
#  define PREV_RETC(p) (PMC*)((p)->pmc_ext)
#else
#  define PREV_RETC(p) PMC_data(p)
#endif

/*

=item C<void mark_retc_cache(Interp *)>

Mark the objects in the return continuation cache being alive.

=item C<void
add_to_retc_cache(Interp *interpreter, PMC *pmc)>

Add the return continuation C<pmc> to the cache and turn off custom
marking, so that it's context isn't marked.

Note: the context structure in C<PMC_cont(pmc)> remains allocated.

*/
void
mark_retc_cache(Interp *interpreter)
{
    PMC *pmc = interpreter->caches->retc_cache;

    while (pmc) {
        pobject_lives(interpreter, (PObj*)pmc);
        pmc = PREV_RETC(pmc);
    }
}

void
add_to_retc_cache(Interp *interpreter, PMC *pmc)
{
    Caches *mc = interpreter->caches;

    if (mc->retc_cache)
        PREV_RETC(mc->retc_cache) = mc->retc_cache;
    mc->retc_cache = pmc;
    /* XXX expensive w. ARENA_DOD_FLAGS */
    PObj_custom_mark_CLEAR(pmc);
}

/*

=item C<PMC *
new_ret_continuation_pmc(Interp * interp, opcode_t * address)>

Returns a new C<RetContinuation> PMC if possible from the cache.

=cut

*/

PMC *
new_ret_continuation_pmc(Interp * interpreter, opcode_t * address)
{
    PMC* continuation;
    Caches *mc = interpreter->caches;

    if (mc->retc_cache) {
        continuation = mc->retc_cache;
        mc->retc_cache = PREV_RETC(mc->retc_cache);
        /* XXX expensive w. ARENA_DOD_FLAGS */
        PObj_custom_mark_SET(continuation);
        /* copy interpreter context into continuation */
        save_context(interpreter, &PMC_cont(continuation)->ctx);
    }
    else {
        continuation = pmc_new(interpreter, enum_class_RetContinuation);
    }
    VTABLE_set_pointer(interpreter, continuation, address);
    return continuation;
}
#undef PREV_RETC

/*

=item C<void copy_regs(Interp *, struct parrot_regs_t *caller_regs)>

Copy function arguments or return values from C<caller_regs> to interpreter.

=cut

*/

void
copy_regs(Interp *interpreter, struct parrot_regs_t *caller_regs)
{
    int i, n, proto, overflow;

    proto = caller_regs->int_reg.registers[0];
    overflow = 0;
    if (proto) {
        n = caller_regs->int_reg.registers[1];
        overflow = n == 11;
        for (i = 0; i < 5 + n; ++i)
            REG_INT(i) = caller_regs->int_reg.registers[i];
        n = caller_regs->int_reg.registers[2];
        overflow |= n == 11;
        for (i = 0; i < n; ++i)
            REG_STR(i + 5) = caller_regs->string_reg.registers[i + 5];
        n = caller_regs->int_reg.registers[3];
        overflow |= n == 11;
        for (i = 0; i < n; ++i)
            REG_PMC(i + 5) = caller_regs->pmc_reg.registers[i + 5];
        n = caller_regs->int_reg.registers[4];
        overflow |= n == 11;
        for (i = 0; i < n; ++i)
            REG_NUM(i + 5) = caller_regs->num_reg.registers[i + 5];
    }
    else {
        REG_INT(0) = 0;
        REG_INT(3) = n = caller_regs->int_reg.registers[3];
        overflow = n == 11;
        for (i = 0; i < n; ++i)
            REG_PMC(i + 5) = caller_regs->pmc_reg.registers[i + 5];
    }
    if (overflow)
        REG_PMC(3) = caller_regs->pmc_reg.registers[3];
}

/*

=item C< void invalidate_retc_context(Interp *, PMC* self)>

Make true Continuation from all RetContinuations up the call chain.

=cut

*/
void
invalidate_retc_context(Interp *interpreter, PMC* self)
{
    struct Parrot_cont * cc;
    PMC *cont;

    cont = interpreter->ctx.current_cont;
    while (!PMC_IS_NULL(cont) && PMC_struct_val(cont)) {
        /*
         * we could stop if we enocunter a true continuation, because
         * if one were created, everything up the chain would have been
         * invalidated earlier.
         * But as long as Continuation usage can be considered being rare,
         * the tests are probably more expensive then to stop early.
         */
        cont->vtable = Parrot_base_vtables[enum_class_Continuation];
        cc = PMC_cont(cont);
        cont = cc->ctx.current_cont;
    }

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
