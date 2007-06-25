/*
Copyright (C) 2001-2007, The Perl Foundation.
$Id$

=head1 NAME

src/sub.c - Subroutines

=head1 DESCRIPTION

Subroutines, continuations, co-routines and other fun stuff...

=head2 Functions

*/

#include "parrot/parrot.h"
#include "parrot/oplib/ops.h"

/* HEADERIZER TARGET: include/parrot/sub.h */

/*

FUNCDOC: mark_context

Marks the context C<*ctx>.

*/

void
mark_context(Interp *interp /*NN*/, parrot_context_t* ctx /*NN*/)
{
    PObj *obj;
    int i;

    mark_stack(interp, ctx->user_stack);
    mark_register_stack(interp, ctx->reg_stack);
    obj = (PObj*)ctx->current_sub;
    if (obj)
        pobject_lives(interp, obj);
    obj = (PObj*)ctx->current_object;
    if (obj)
        pobject_lives(interp, obj);
    /* the current continuation in the interpreter has
     * to be marked too in the call sequence currently
     * as e.g. a MMD search could need resources
     * and GC the continuation
     */
    obj = (PObj*)interp->current_cont;
    if (obj && obj != (PObj*)NEED_CONTINUATION)
        pobject_lives(interp, obj);
    obj = (PObj*)ctx->current_cont;
    if (obj && !PObj_live_TEST(obj))
        pobject_lives(interp, obj);
    obj = (PObj*)ctx->current_namespace;
    if (obj)
        pobject_lives(interp, obj);
    obj = (PObj*)ctx->lex_pad;
    if (obj)
        pobject_lives(interp, obj);
    for (i = 0; i < ctx->n_regs_used[REGNO_PMC]; ++i) {
        obj = (PObj*) CTX_REG_PMC(ctx, i);
        if (obj)
            pobject_lives(interp, obj);
    }
    for (i = 0; i < ctx->n_regs_used[REGNO_STR]; ++i) {
        obj = (PObj*) CTX_REG_STR(ctx, i);
        if (obj)
            pobject_lives(interp, obj);
    }
}

/*

FUNCDOC: new_sub

Returns a new C<Parrot_sub>.

*/

Parrot_sub *
new_sub(Interp *interp /*NN*/)
{
    /* Using system memory until I figure out GC issues */
    Parrot_sub * const newsub = mem_allocate_zeroed_typed(Parrot_sub);
    newsub->seg               = interp->code;
    return newsub;
}

/*

FUNCDOC: new_closure

Returns a new C<Parrot_sub> with its own sctatchpad.

XXX: Need to document semantics in detail.

*/

Parrot_sub *
new_closure(Interp *interp /*NN*/)
{
    Parrot_sub * const newsub = new_sub(interp);
    return newsub;
}

/*

FUNCDOC: new_continuation

Returns a new C<Parrot_cont> to the context of C<to> with its own copy of the
current interpreter context.  If C<to> is C<NULL>, then the C<to_ctx> is set
to the current context.

*/

Parrot_cont *
new_continuation(Interp *interp /*NN*/, Parrot_cont *to /*NULLOK*/)
{
    Parrot_cont    * const cc     = mem_allocate_typed(Parrot_cont);
    Parrot_Context * const to_ctx = to ? to->to_ctx : CONTEXT(interp->ctx);

    cc->to_ctx = to_ctx;
    cc->from_ctx = CONTEXT(interp->ctx);
    cc->dynamic_state = NULL;
    cc->runloop_id = 0;
    CONTEXT(interp->ctx)->ref_count++;
    if (to) {
        cc->seg = to->seg;
        cc->address = to->address;
    }
    else {
        cc->seg = interp->code;
        cc->address = NULL;
    }
    cc->current_results = to_ctx->current_results;
    return cc;
}

/*

FUNCDOC: new_ret_continuation

Returns a new C<Parrot_cont> pointing to the current context.

*/

Parrot_cont *
new_ret_continuation(Interp *interp /*NN*/)
{
    Parrot_cont * const cc = mem_allocate_typed(Parrot_cont);

    cc->to_ctx = CONTEXT(interp->ctx);
    cc->from_ctx = NULL;    /* filled in during a call */
    cc->dynamic_state = NULL;
    cc->runloop_id = 0;
    cc->seg = interp->code;
    cc->current_results = NULL;
    cc->address = NULL;
    return cc;
}

/*

FUNCDOC: new_coroutine

Returns a new C<Parrot_coro>.

XXX: Need to document semantics in detail.

*/

Parrot_coro *
new_coroutine(Interp *interp /*NN*/)
{
    Parrot_coro * const co = mem_allocate_zeroed_typed(Parrot_coro);

    co->seg = interp->code;
    co->ctx = NULL;
    co->dynamic_state = NULL;
    return co;
}

/*

FUNCDOC: new_ret_continuation_pmc

Returns a new C<RetContinuation> PMC. Uses one from the cache,
if possible; otherwise, creates a new one.

*/

PARROT_API
PMC *
new_ret_continuation_pmc(Interp *interp /*NN*/, opcode_t *address)
{
    PMC* const continuation = pmc_new(interp, enum_class_RetContinuation);
    VTABLE_set_pointer(interp, continuation, address);
    return continuation;
}

/*

FUNCDOC: invalidate_retc_context

Make true Continuation from all RetContinuations up the call chain.

*/

void
invalidate_retc_context(Interp *interp /*NN*/, PMC *cont /*NN*/)
{
    Parrot_Context *ctx = PMC_cont(cont)->from_ctx;

    Parrot_set_context_threshold(interp, ctx);
    while (1) {
        /*
         * We  stop if we encounter a true continuation, because
         * if one were created, everything up the chain would have been
         * invalidated earlier.
         */
        if (cont->vtable != interp->vtables[enum_class_RetContinuation])
            break;
        cont->vtable = interp->vtables[enum_class_Continuation];
        ctx->ref_count++;
        cont = ctx->current_cont;
        ctx = PMC_cont(cont)->from_ctx;
    }

}

/* XXX use method lookup - create interface
 *                         see also pbc.c
 */
extern PMC* Parrot_NameSpace_nci_get_name(Interp *interp, PMC* pmc);

/*

FUNCDOC: Parrot_full_sub_name

Return namespace, name, and location of subroutine.

*/

PARROT_API
STRING*
Parrot_full_sub_name(Interp *interp /*NN*/, PMC* sub /*NULLOK*/)
{
    Parrot_sub * s;
    STRING *res;

    if (!sub || !VTABLE_defined(interp, sub))
        return NULL;

    s = PMC_sub(sub);
    if (PMC_IS_NULL(s->namespace_stash)) {
        return s->name;
    }
    else {
        PMC *ns_array;
        STRING *j;

        Parrot_block_DOD(interp);
        ns_array = Parrot_NameSpace_nci_get_name(interp, s->namespace_stash);
        if (s->name) {
            VTABLE_push_string(interp, ns_array, s->name);
        }
        j = const_string(interp, ";");

        res = string_join(interp, j, ns_array);
        Parrot_unblock_DOD(interp);
        return res;
    }
    return NULL;
}

PARROT_API
int
Parrot_Context_get_info(Interp *interp /*NN*/, parrot_context_t *ctx /*NN*/,
                    Parrot_Context_info *info /*NN*/)
{
    Parrot_sub *sub;
    DECL_CONST_CAST;

    /* set file/line/pc defaults */
    info->file     = (char *) const_cast("(unknown file)");
    info->line     = -1;
    info->pc       = -1;
    info->nsname   = NULL;
    info->subname  = NULL;
    info->fullname = NULL;

    /* is the current sub of the specified context valid? */
    if (PMC_IS_NULL(ctx->current_sub)) {
        info->subname  = string_from_cstring(interp, "???", 3);
        info->nsname   = info->subname;
        info->fullname = string_from_cstring(interp, "??? :: ???", 10);
        info->pc       = -1;
        return 0;
    }

    /* fetch Parrot_sub of the current sub in the given context */
    if (!VTABLE_isa(interp, ctx->current_sub,
                    const_string(interp, "Sub")))
        return 1;

    sub = PMC_sub(ctx->current_sub);
    /* set the sub name */
    info->subname = sub->name;

    /* set the namespace name and fullname of the sub */
    if (PMC_IS_NULL(sub->namespace_name)) {
        info->nsname = string_from_literal(interp, "");
        info->fullname = info->subname;
    }
    else {
        info->nsname = VTABLE_get_string(interp, sub->namespace_name);
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
                info->file = string_to_cstring(interp,
                Parrot_debug_pc_to_filename(interp, debug, i));
                break;
            }
            ADD_OP_VAR_PART(interp, sub->seg, pc, var_args);
            n += op_info->op_count + var_args;
            pc += op_info->op_count + var_args;
        }
    }
    return 1;
}

PARROT_API
STRING*
Parrot_Context_infostr(Interp *interp /*NN*/, parrot_context_t *ctx /*NN*/)
{
    Parrot_Context_info info;
    const char* const msg = (CONTEXT(interp->ctx) == ctx)
        ?  "current instr.:"
        : "called from Sub";
    STRING *res;

    Parrot_block_DOD(interp);
    if (Parrot_Context_get_info(interp, ctx, &info)) {
        char * const file = info.file;
        res        = Parrot_sprintf_c(interp,
            "%s '%Ss' pc %d (%s:%d)", msg,
            info.fullname, info.pc, file, info.line);

        /* free the non-constant string, but not the constant one */
        if (strncmp( "(unknown file)", file, 14 ) < 0 )
            string_cstring_free(file);
    }
    else
        res = NULL;

    Parrot_unblock_DOD(interp);
    return res;
}

/*

FUNCDOC: Parrot_find_pad

Locate the LexPad containing the given name. Return NULL on failure.

*/

PMC*
Parrot_find_pad(Interp *interp /*NN*/, STRING *lex_name, parrot_context_t *ctx /*NN*/)
{
    while (1) {
        PMC * const lex_pad = ctx->lex_pad;
        parrot_context_t * const outer = ctx->outer_ctx;

        if (!outer)
            return lex_pad;
        if (!PMC_IS_NULL(lex_pad)) {
            if (VTABLE_exists_keyed_str(interp, lex_pad, lex_name))
                return lex_pad;
        }
#if CTX_LEAK_DEBUG
        if (outer == ctx) {
            /* This is a bug; a context can never be its own :outer context.
             * Detecting it avoids an unbounded loop, which is difficult to
             * debug, though we'd rather not pay the cost of detection in a
             * production release.
             */
            real_exception(interp, NULL, INVALID_OPERATION,
                           "Bug:  Context %p :outer points back to itself.",
                           ctx);
        }
#endif
        ctx = outer;
    }
}

PARROT_API
PMC*
parrot_new_closure(Interp *interp /*NN*/, PMC *sub_pmc)
{
    PMC *cont;

    PMC * const clos_pmc    = VTABLE_clone(interp, sub_pmc);
    Parrot_sub * const sub  = PMC_sub(sub_pmc);
    Parrot_sub * const clos = PMC_sub(clos_pmc);
    /*
     * the given sub_pmc has to have an :outer(sub) that is
     * this subroutine
     */
    parrot_context_t * const ctx = CONTEXT(interp->ctx);
    if (PMC_IS_NULL(sub->outer_sub)) {
        real_exception(interp, NULL, INVALID_OPERATION,
                "'%Ss' isn't a closure (no :outer)", sub->name);
    }
    /* if (sub->outer_sub != ctx->current_sub) - fails if outer
     * is a closure too e.g. test 'closure 4'
     */
    if (0 == string_equal(interp,
                (PMC_sub(ctx->current_sub))->name,
                sub->name)) {
        real_exception(interp, NULL, INVALID_OPERATION,
                "'%Ss' isn't the :outer of '%Ss')",
                (PMC_sub(ctx->current_sub))->name,
                sub->name);
    }
    cont = ctx->current_cont;
    /* preserve this frame by converting the continuation */
    cont->vtable = interp->vtables[enum_class_Continuation];
    /* remember this (the :outer) ctx in the closure */
    clos->outer_ctx = ctx;
    /* the closure refs now this context too */
    ctx->ref_count++;
#if CTX_LEAK_DEBUG
    if (Interp_debug_TEST(interp, PARROT_CTX_DESTROY_DEBUG_FLAG)) {
        fprintf(stderr, "[alloc closure  %p, outer_ctx %p, ref_count=%d]\n",
                (void *)clos_pmc, (void *)ctx, (int) ctx->ref_count);
    }
#endif
    return clos_pmc;
}

/*

=head1 SEE ALSO

F<include/parrot/sub.h>.

=head1 HISTORY

Initial version by Melvin on 2002/06/6.

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
