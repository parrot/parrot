/*
Copyright (C) 2001-2009, Parrot Foundation.
$Id$

=head1 NAME

src/sub.c - Subroutines

=head1 DESCRIPTION

Subroutines, continuations, co-routines and other fun stuff...

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/oplib/ops.h"
#include "sub.str"
#include "pmc/pmc_sub.h"
#include "pmc/pmc_continuation.h"

/* HEADERIZER HFILE: include/parrot/sub.h */


/*

=item C<void mark_context_start(void)>

Indicate that a new round of context marking is about to take place.

=cut

*/

static int context_gc_mark = 0;

void
mark_context_start(void)
{
    ASSERT_ARGS(mark_context_start)
    if (++context_gc_mark == 0) context_gc_mark = 1;
}


/*

=item C<void mark_context(PARROT_INTERP, Parrot_Context* ctx)>

Marks the context C<*ctx>.

=cut

*/

void
mark_context(PARROT_INTERP, ARGMOD(Parrot_Context* ctx))
{
    ASSERT_ARGS(mark_context)
    PObj *obj;
    int   i;

    if (ctx->gc_mark == context_gc_mark)
        return;
    ctx->gc_mark = context_gc_mark;

    /* don't mark the context if it's actually dead */
    if (ctx->ref_count < 0) {
        /* report it, though */
        if (Interp_debug_TEST(interp, PARROT_CTX_DESTROY_DEBUG_FLAG)) {
            fprintf(stderr, "[attempt to mark dead context %p]\n",
                (void *)ctx);
        }
        return;
    }

    obj = (PObj *)ctx->current_sub;
    if (obj)
        pobject_lives(interp, obj);

    obj = (PObj *)ctx->current_object;
    if (obj)
        pobject_lives(interp, obj);

    obj = (PObj *)ctx->current_cont;
    if (obj && !PObj_live_TEST(obj))
        pobject_lives(interp, obj);

    if (ctx->caller_ctx)
        mark_context(interp, ctx->caller_ctx);

    if (ctx->outer_ctx)
        mark_context(interp, ctx->outer_ctx);

    obj = (PObj *)ctx->current_namespace;
    if (obj)
        pobject_lives(interp, obj);

    obj = (PObj *)ctx->lex_pad;
    if (obj)
        pobject_lives(interp, obj);

    obj = (PObj *)ctx->handlers;
    if (obj)
        pobject_lives(interp, obj);


    if (!ctx->n_regs_used)
        return;

    for (i = 0; i < ctx->n_regs_used[REGNO_PMC]; ++i) {
        obj = (PObj *)CTX_REG_PMC(ctx, i);
        if (obj)
            pobject_lives(interp, obj);
    }

    for (i = 0; i < ctx->n_regs_used[REGNO_STR]; ++i) {
        obj = (PObj *)CTX_REG_STR(ctx, i);
        if (obj) {
            /* work around a mysterious segfault-inducing problem we haven't
             * yet tracked down */
            PObj_flag_CLEAR(is_PMC, obj);
            PObj_is_string_SET(obj);
            pobject_lives(interp, obj);
        }
    }
}

/*

=item C<Parrot_sub * new_sub(PARROT_INTERP)>

Returns a new C<Parrot_sub>.

=cut

*/

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
Parrot_sub *
new_sub(PARROT_INTERP)
{
    ASSERT_ARGS(new_sub)
    /* Using system memory until I figure out GC issues */
    Parrot_sub * const newsub = mem_allocate_zeroed_typed(Parrot_sub);
    newsub->seg               = interp->code;
    return newsub;
}

/*

=item C<Parrot_sub * new_closure(PARROT_INTERP)>

Returns a new C<Parrot_sub> with its own scratchpad.

XXX: Need to document semantics in detail.

=cut

*/

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
Parrot_sub *
new_closure(PARROT_INTERP)
{
    ASSERT_ARGS(new_closure)
    Parrot_sub * const newsub = new_sub(interp);
    return newsub;
}

/*

=item C<Parrot_cont * new_continuation(PARROT_INTERP, const Parrot_cont *to)>

Returns a new C<Parrot_cont> to the context of C<to> with its own copy of the
current interpreter context.  If C<to> is C<NULL>, then the C<to_ctx> is set
to the current context.

=cut

*/

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
Parrot_cont *
new_continuation(PARROT_INTERP, ARGIN_NULLOK(const Parrot_cont *to))
{
    ASSERT_ARGS(new_continuation)
    Parrot_cont    * const cc     = mem_allocate_typed(Parrot_cont);
    Parrot_Context * const to_ctx = to ? to->to_ctx : CONTEXT(interp);

    cc->to_ctx        = to_ctx;
    cc->from_ctx      = Parrot_context_ref(interp, CONTEXT(interp));
    cc->dynamic_state = NULL;
    cc->runloop_id    = 0;
    if (to) {
        cc->seg       = to->seg;
        cc->address   = to->address;
    }
    else {
        cc->seg       = interp->code;
        cc->address   = NULL;
    }

    cc->current_results = to_ctx->current_results;
    return cc;
}

/*

=item C<Parrot_cont * new_ret_continuation(PARROT_INTERP)>

Returns a new C<Parrot_cont> pointing to the current context.

=cut

*/

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
Parrot_cont *
new_ret_continuation(PARROT_INTERP)
{
    ASSERT_ARGS(new_ret_continuation)
    Parrot_cont * const cc = mem_allocate_typed(Parrot_cont);

    cc->to_ctx          = CONTEXT(interp);
    cc->from_ctx        = CONTEXT(interp);    /* filled in during a call */
    cc->dynamic_state   = NULL;
    cc->runloop_id      = 0;
    cc->seg             = interp->code;
    cc->current_results = NULL;
    cc->address         = NULL;
    return cc;
}

/*

=item C<Parrot_coro * new_coroutine(PARROT_INTERP)>

Returns a new C<Parrot_coro>.

XXX: Need to document semantics in detail.

=cut

*/

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
Parrot_coro *
new_coroutine(PARROT_INTERP)
{
    ASSERT_ARGS(new_coroutine)
    Parrot_coro * const co = mem_allocate_zeroed_typed(Parrot_coro);

    co->seg                = interp->code;
    co->ctx                = NULL;
    co->dynamic_state      = NULL;

    return co;
}

/*

=item C<PMC * new_ret_continuation_pmc(PARROT_INTERP, opcode_t *address)>

Returns a new C<RetContinuation> PMC. Uses one from the cache,
if possible; otherwise, creates a new one.

=cut

*/

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
PMC *
new_ret_continuation_pmc(PARROT_INTERP, ARGIN_NULLOK(opcode_t *address))
{
    ASSERT_ARGS(new_ret_continuation_pmc)
    PMC* const continuation = pmc_new(interp, enum_class_RetContinuation);
    VTABLE_set_pointer(interp, continuation, address);
    return continuation;
}

/*

=item C<void invalidate_retc_context(PARROT_INTERP, PMC *cont)>

Make true Continuations from all RetContinuations up the call chain.

=cut

*/

void
invalidate_retc_context(PARROT_INTERP, ARGMOD(PMC *cont))
{
    ASSERT_ARGS(invalidate_retc_context)
    Parrot_Context *ctx = PMC_cont(cont)->from_ctx;
    cont = ctx->current_cont;

    Parrot_set_context_threshold(interp, ctx);
    while (1) {
        /*
         * We  stop if we encounter a true continuation, because
         * if one were created, everything up the chain would have been
         * invalidated earlier.
         */
        if (!cont || cont->vtable != interp->vtables[enum_class_RetContinuation])
            break;
        cont->vtable = interp->vtables[enum_class_Continuation];
        Parrot_context_ref(interp, ctx);
        ctx  = ctx->caller_ctx;
        cont = ctx->current_cont;
    }

}

/*

=item C<STRING* Parrot_full_sub_name(PARROT_INTERP, PMC* sub_pmc)>

Return namespace, name, and location of subroutine.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING*
Parrot_full_sub_name(PARROT_INTERP, ARGIN_NULLOK(PMC* sub_pmc))
{
    ASSERT_ARGS(Parrot_full_sub_name)
    if (sub_pmc && VTABLE_defined(interp, sub_pmc)) {
        Parrot_sub *sub;

        PMC_get_sub(interp, sub_pmc, sub);

        if (PMC_IS_NULL(sub->namespace_stash)) {
            return sub->name;
        }
        else {
            PMC    *ns_array;
            STRING *j = CONST_STRING(interp, ";");
            STRING *res;

            /*
             * When running with -t4, the invoke done in
             * Parrot_ns_get_name stomps on settings in interp; we
             * have to save these and restore them to avoid affecting
             * the running program.
             */
            PMC      * const saved_ccont       = interp->current_cont;
            opcode_t * const current_args      = interp->current_args;
            opcode_t * const current_params    = interp->current_params;
            opcode_t * const current_returns   = interp->current_returns;
            PMC      * const args_signature    = interp->args_signature;
            PMC      * const params_signature  = interp->params_signature;
            PMC      * const returns_signature = interp->returns_signature;

            Parrot_block_GC_mark(interp);

            ns_array = Parrot_ns_get_name(interp, sub->namespace_stash);

            /* Restore stuff that might have got overwritten */
            interp->current_cont      = saved_ccont;
            interp->current_args      = current_args;
            interp->current_params    = current_params;
            interp->current_returns   = current_returns;
            interp->args_signature    = args_signature;
            interp->params_signature  = params_signature;
            interp->returns_signature = returns_signature;

            if (sub->name)
                VTABLE_push_string(interp, ns_array, sub->name);

            res = Parrot_str_join(interp, j, ns_array);
            Parrot_unblock_GC_mark(interp);
            return res;
        }
    }
    return NULL;
}

/*

=item C<int Parrot_Context_get_info(PARROT_INTERP, const Parrot_Context *ctx,
Parrot_Context_info *info)>

Takes pointers to a context and its information table.
Populates the table and returns 0 or 1. XXX needs explanation
Used by Parrot_Context_infostr.

=cut

*/

PARROT_EXPORT
int
Parrot_Context_get_info(PARROT_INTERP, ARGIN(const Parrot_Context *ctx),
                    ARGOUT(Parrot_Context_info *info))
{
    ASSERT_ARGS(Parrot_Context_get_info)
    Parrot_sub *sub;
    DECL_CONST_CAST;

    /* set file/line/pc defaults */
    info->file     = CONST_STRING(interp, "(unknown file)");
    info->line     = -1;
    info->pc       = -1;
    info->nsname   = NULL;
    info->subname  = NULL;
    info->fullname = NULL;

    /* is the current sub of the specified context valid? */
    if (PMC_IS_NULL(ctx->current_sub)) {
        info->subname  = Parrot_str_new(interp, "???", 3);
        info->nsname   = info->subname;
        info->fullname = Parrot_str_new(interp, "??? :: ???", 10);
        info->pc       = -1;
        return 0;
    }

    /* fetch Parrot_sub of the current sub in the given context */
    if (!VTABLE_isa(interp, ctx->current_sub, CONST_STRING(interp, "Sub")))
        return 1;

    PMC_get_sub(interp, ctx->current_sub, sub);
    /* set the sub name */
    info->subname = sub->name;

    /* set the namespace name and fullname of the sub */
    if (PMC_IS_NULL(sub->namespace_name)) {
        info->nsname   = CONST_STRING(interp, "");
        info->fullname = info->subname;
    }
    else {
        info->nsname   = VTABLE_get_string(interp, sub->namespace_name);
        info->fullname = Parrot_full_sub_name(interp, ctx->current_sub);
    }

    /* return here if there is no current pc */
    if (ctx->current_pc == NULL)
        return 1;

    /* calculate the current pc */
    info->pc = ctx->current_pc - sub->seg->base.data;

    /* determine the current source file/line */
    if (ctx->current_pc) {
        const size_t offs = info->pc;
        size_t i, n;
        opcode_t *pc = sub->seg->base.data;
        PackFile_Debug * const debug = sub->seg->debugs;

        if (!debug)
            return 0;
        for (i = n = 0; n < sub->seg->base.size; i++) {
            op_info_t * const op_info = &interp->op_info_table[*pc];
            opcode_t var_args = 0;

            if (i >= debug->base.size)
                return 0;
            if (n >= offs) {
                /* set source line and file */
                info->line = debug->base.data[i];
                info->file = Parrot_debug_pc_to_filename(interp, debug, i);
                break;
            }
            ADD_OP_VAR_PART(interp, sub->seg, pc, var_args);
            n  += op_info->op_count + var_args;
            pc += op_info->op_count + var_args;
        }
    }
    return 1;
}

/*

=item C<STRING* Parrot_Context_infostr(PARROT_INTERP, const Parrot_Context *ctx)>

Formats context information for display.  Takes a context pointer and
returns a pointer to the text.  Used in debug.c and warnings.c

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING*
Parrot_Context_infostr(PARROT_INTERP, ARGIN(const Parrot_Context *ctx))
{
    ASSERT_ARGS(Parrot_Context_infostr)
    Parrot_Context_info info;
    STRING             *res = NULL;
    const char * const  msg = (CONTEXT(interp) == ctx)
        ? "current instr.:"
        : "called from Sub";

    Parrot_block_GC_mark(interp);
    if (Parrot_Context_get_info(interp, ctx, &info)) {
        DECL_CONST_CAST;

        res = Parrot_sprintf_c(interp,
            "%s '%Ss' pc %d (%Ss:%d)", msg,
            info.fullname, info.pc, info.file, info.line);
    }

    Parrot_unblock_GC_mark(interp);
    return res;
}

/*

=item C<PMC* Parrot_find_pad(PARROT_INTERP, STRING *lex_name, const Parrot_Context *ctx)>

Locate the LexPad containing the given name. Return NULL on failure.

=cut

*/

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC*
Parrot_find_pad(PARROT_INTERP, ARGIN(STRING *lex_name), ARGIN(const Parrot_Context *ctx))
{
    ASSERT_ARGS(Parrot_find_pad)
    while (1) {
        PMC                    * const lex_pad = ctx->lex_pad;
        const Parrot_Context   * const outer   = ctx->outer_ctx;

        if (!outer)
            return lex_pad;

        if (!PMC_IS_NULL(lex_pad))
            if (VTABLE_exists_keyed_str(interp, lex_pad, lex_name))
                return lex_pad;

#if CTX_LEAK_DEBUG
        if (outer == ctx) {
            /* This is a bug; a context can never be its own :outer context.
             * Detecting it avoids an unbounded loop, which is difficult to
             * debug, though we'd rather not pay the cost of detection in a
             * production release.
             */
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "Bug:  Context %p :outer points back to itself.", ctx);
        }
#endif
        ctx = outer;
    }
}


/*

=item C<void Parrot_capture_lex(PARROT_INTERP, PMC *sub_pmc)>

Capture the current lexical environment of a sub.

=cut

*/

void
Parrot_capture_lex(PARROT_INTERP, ARGMOD(PMC *sub_pmc))
{
    ASSERT_ARGS(Parrot_capture_lex)
    Parrot_Context * const ctx          = CONTEXT(interp);
    Parrot_sub            *current_sub, *outer_sub;
    Parrot_sub            *sub;
    Parrot_Context        *old;

    PMC_get_sub(interp, ctx->current_sub, current_sub);

    /* MultiSub gets special treatment */
    if (VTABLE_isa(interp, sub_pmc, CONST_STRING(interp, "MultiSub"))) {

        PMC * const iter = VTABLE_get_iter(interp, sub_pmc);

        while (VTABLE_get_bool(interp, iter)) {

            PMC        * const child_pmc = VTABLE_shift_pmc(interp, iter);
            Parrot_sub        *child_sub, *child_outer_sub;

            PMC_get_sub(interp, child_pmc, child_sub);

            if (!PMC_IS_NULL(child_sub->outer_sub)) {
                PMC_get_sub(interp, child_sub->outer_sub, child_outer_sub);
                if (Parrot_str_equal(interp, current_sub->subid,
                                      child_outer_sub->subid)) {
                    old = child_sub->outer_ctx;
                    child_sub->outer_ctx = Parrot_context_ref(interp, ctx);
                    if (old)
                        Parrot_free_context(interp, old, 1);
                }
            }
        }
        return;
    }

    /* the sub_pmc has to have an outer_sub that is the caller */
    PMC_get_sub(interp, sub_pmc, sub);
    if (PMC_IS_NULL(sub->outer_sub))
        return;

#if 0
    /* verify that the current sub is sub_pmc's :outer */
    PMC_get_sub(interp, sub->outer_sub, outer_sub);
    if (Parrot_str_not_equal(interp, current_sub->subid,
                         outer_sub->subid)) {
        Parrot_ex_throw_from_c_args(interp, NULL,
            EXCEPTION_INVALID_OPERATION, "'%Ss' isn't the :outer of '%Ss'",
            current_sub->name, sub->name);
        return;
    }
#endif

    /* set the sub's outer context to the current context */
    old = sub->outer_ctx;
    sub->outer_ctx = Parrot_context_ref(interp, ctx);
    if (old)
        Parrot_free_context(interp, old, 1);
}


/*

=item C<PMC* parrot_new_closure(PARROT_INTERP, PMC *sub_pmc)>

Used where? XXX

Creates a new closure, saving the context information.  Takes a pointer
to a subroutine.

Returns a pointer to the closure, (or throws exceptions if invalid).

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC*
parrot_new_closure(PARROT_INTERP, ARGIN(PMC *sub_pmc))
{
    ASSERT_ARGS(parrot_new_closure)
    PMC        * const clos_pmc = VTABLE_clone(interp, sub_pmc);
    Parrot_capture_lex(interp, clos_pmc);
    return clos_pmc;
}


/*

=item C<void Parrot_continuation_check(PARROT_INTERP, const PMC *pmc,
const Parrot_cont *cc)>

Verifies that the provided continuation is sane.

=cut

*/

void
Parrot_continuation_check(PARROT_INTERP, ARGIN(const PMC *pmc),
    ARGIN(const Parrot_cont *cc))
{
    ASSERT_ARGS(Parrot_continuation_check)
    Parrot_Context *to_ctx       = cc->to_ctx;
    Parrot_Context *from_ctx     = CONTEXT(interp);

#if CTX_LEAK_DEBUG
    if (Interp_debug_TEST(interp, PARROT_CTX_DESTROY_DEBUG_FLAG))
        fprintf(stderr,
                "[invoke cont    %p, to_ctx %p, from_ctx %p (refs %d)]\n",
                (const void *)pmc, (void *)to_ctx, (void *)from_ctx, (int)from_ctx->ref_count);
#endif
    if (!to_ctx)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                       "Continuation invoked after deactivation.");
}


/*

=item C<void Parrot_continuation_rewind_environment(PARROT_INTERP, PMC *pmc,
Parrot_cont *cc)>

Restores the appropriate context for the continuation.

=cut

*/

void
Parrot_continuation_rewind_environment(PARROT_INTERP, SHIM(PMC *pmc),
        ARGIN(Parrot_cont *cc))
{
    ASSERT_ARGS(Parrot_continuation_rewind_environment)
    Parrot_Context * const to_ctx = cc->to_ctx;

    /* debug print before context is switched */
    if (Interp_trace_TEST(interp, PARROT_TRACE_SUB_CALL_FLAG)) {
        PMC * const sub = to_ctx->current_sub;

        Parrot_io_eprintf(interp, "# Back in sub '%Ss', env %p\n",
                    Parrot_full_sub_name(interp, sub),
                    interp->dynamic_env);
    }

    /* set context */
    CONTEXT(interp)      = to_ctx;
    interp->ctx.bp       = to_ctx->bp;
    interp->ctx.bp_ps    = to_ctx->bp_ps;
}


/*

=item C<Parrot_sub * Parrot_get_sub_pmc_from_subclass(PARROT_INTERP, PMC *subclass)>

Gets a Parrot_sub structure from something that isn't a Sub PMC, but rather a
subclass.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
Parrot_sub *
Parrot_get_sub_pmc_from_subclass(PARROT_INTERP, ARGIN(PMC *subclass)) {
    ASSERT_ARGS(Parrot_get_sub_pmc_from_subclass)
    PMC        *key, *sub_pmc;
    Parrot_sub *sub;

    /* Ensure we really do have a subclass of sub. */
    if (VTABLE_isa(interp, subclass, CONST_STRING(interp, "Sub"))) {
        /* If it's actually a PMC still, probably does the same structure
         * underneath. */
        if (!PObj_is_object_TEST(subclass)) {
            GETATTR_Sub_sub(interp, subclass, sub);
            return sub;
        }

        /* Get the Sub PMC itself. */
        key = pmc_new(interp, enum_class_String);
        VTABLE_set_string_native(interp, key, CONST_STRING(interp, "Sub"));
        sub_pmc = VTABLE_get_attr_keyed(interp, subclass, key, CONST_STRING(interp, "proxy"));
        if (sub_pmc->vtable->base_type == enum_class_Sub) {
            GETATTR_Sub_sub(interp, sub_pmc, sub);
            return sub;
        }
    }
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "Attempting to do sub operation on non-Sub.");
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
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
