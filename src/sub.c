/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
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
#include "parrot/method_util.h"

/*

=item C<void
mark_context(Interp* interpreter, parrot_context_t* ctx)>

Marks the context C<*ctx>.

=cut

*/

void
mark_context(Interp* interpreter, parrot_context_t* ctxp)
{
    PObj *obj;
    parrot_context_t ctx = *ctxp;
    int i, n;
    struct parrot_regs_t *regs;

    mark_stack(interpreter, CONTEXT(ctx)->pad_stack);
    mark_stack(interpreter, CONTEXT(ctx)->user_stack);
    mark_stack(interpreter, CONTEXT(ctx)->control_stack);
    mark_register_stack(interpreter, CONTEXT(ctx)->int_reg_stack);
    mark_register_stack(interpreter, CONTEXT(ctx)->num_reg_stack);
    mark_string_register_stack(interpreter, CONTEXT(ctx)->string_reg_stack);
    mark_pmc_register_stack(interpreter, CONTEXT(ctx)->pmc_reg_stack);
    obj = (PObj*)CONTEXT(ctx)->current_sub;
    if (obj)
        pobject_lives(interpreter, obj);
    obj = (PObj*)CONTEXT(ctx)->current_object;
    if (obj)
        pobject_lives(interpreter, obj);
    /* the current continuation in the interpreter has
     * to be marked too in the call sequence currently
     * as e.g. a MMD search could need resources
     * and GC the continuation
     */
    obj = (PObj*)interpreter->current_cont;
    if (obj && obj != NEED_CONTINUATION)
        pobject_lives(interpreter, obj);
    obj = (PObj*)CONTEXT(ctx)->current_cont;
    if (obj && !PObj_live_TEST(obj))
        pobject_lives(interpreter, obj);
    obj = (PObj*)CONTEXT(ctx)->current_method;
    if (obj)
        pobject_lives(interpreter, obj);
    obj = (PObj*)CONTEXT(ctx)->current_package;
    if (obj)
        pobject_lives(interpreter, obj);
    regs = ctx.bp;
    for (i = 0; i < NUM_REGISTERS; ++i) {
        obj = (PObj*) BP_REG_PMC(regs, i);
        if (obj)
            pobject_lives(interpreter, obj);
        obj = (PObj*) BP_REG_STR(regs, i);
        if (obj)
            pobject_lives(interpreter, obj);
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
    newsub->seg = interp->code;
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
new_continuation(Interp *interp, struct Parrot_cont *to)>

Returns a new C<Parrot_cont> to the context of C<to> with its own copy of the
current interpreter context.

=cut

*/


struct Parrot_cont *
new_continuation(Interp *interp, struct Parrot_cont *to)
{
    struct Parrot_cont *cc = mem_sys_allocate(sizeof(struct Parrot_cont));
    parrot_context_t to_ctx = to ? to->to_ctx : interp->ctx;

    cc->to_ctx = to_ctx;
    cc->from_ctx = interp->ctx;
    CONTEXT(cc->from_ctx)->ref_count++;
    if (to) {
        cc->seg = to->seg;
        cc->address = to->address;
    }
    else {
        cc->seg = interp->code;
        cc->address = NULL;
    }
    cc->ctx_copy = mem_sys_allocate(sizeof(struct Parrot_Context));
    memcpy(cc->ctx_copy, CONTEXT(to_ctx), sizeof(struct Parrot_Context));
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
    struct Parrot_cont *cc = mem_sys_allocate(sizeof(struct Parrot_cont));
    cc->to_ctx = interp->ctx;
    cc->from_ctx.bp = NULL;      /* ret continuations should be created later
                                   in the subroutine if needed */
    cc->seg = interp->code;
    cc->ctx_copy = NULL;
    cc->address = NULL;
    return cc;
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
    struct Parrot_coro *co =
        mem_sys_allocate_zeroed(sizeof(struct Parrot_coro));

    co->seg = interp->code;
    co->ctx.bp = NULL;
    return co;
}

/*

=item C<PMC *
new_ret_continuation_pmc(Interp * interp, opcode_t * address)>

Returns a new C<RetContinuation> PMC. Uses one from the cache,
if possible; otherwise, creates a new one.

=cut

*/

PMC *
new_ret_continuation_pmc(Interp * interpreter, opcode_t * address)
{
    PMC* continuation;
    continuation = pmc_new(interpreter, enum_class_RetContinuation);
    VTABLE_set_pointer(interpreter, continuation, address);
    return continuation;
}

/*

=item C< void invalidate_retc_context(Interp *, PMC *cont)>

Make true Continuation from all RetContinuations up the call chain.

=cut

*/

void
invalidate_retc_context(Interp *interpreter, PMC *cont)
{
    parrot_context_t ctx = PMC_cont(cont)->from_ctx;

    Parrot_set_context_threshold(interpreter, &ctx);
    while (1) {
        /*
         * We  stop if we encounter a true continuation, because
         * if one were created, everything up the chain would have been
         * invalidated earlier.
         */
        if (cont->vtable != Parrot_base_vtables[enum_class_RetContinuation])
            break;
        cont->vtable = Parrot_base_vtables[enum_class_Continuation];
        CONTEXT(ctx)->ref_count++;
        cont = CONTEXT(ctx)->current_cont;
        ctx = PMC_cont(cont)->from_ctx;
    }

}

/*

=item C<Parrot_full_sub_name>

Print name and location of subroutine, This should finally use the label
name of the frozen C<Sub> PMC image for now locate the C<Sub> name in
the globals.

=cut

*/

STRING*
Parrot_full_sub_name(Interp* interpreter, PMC* sub)
{
    struct Parrot_sub * s;

    if (!sub || !VTABLE_defined(interpreter, sub))
        return NULL;
    s = PMC_sub(sub);
    if (PMC_IS_NULL(s->name_space)) {
        return s->name;
    } else {
        if (s->name) {
	    STRING* ns = VTABLE_get_string(interpreter, s->name_space);

    	    ns = string_concat(interpreter, ns,
		string_from_cstring(interpreter, " :: ", 4), 0);
	    return string_concat(interpreter, ns, s->name, 0);
        } else {
	    STRING* ns = string_from_cstring(interpreter, "??? :: ", 7);
	    return string_concat(interpreter, ns, s->name, 0);
	}
    }
    return NULL;
}

int
Parrot_Context_info(Interp *interpreter, parrot_context_t *ctxp,
	struct Parrot_Context_info *info)
{
    struct Parrot_sub *sub;
    parrot_context_t ctx = *ctxp;

    /* set file/line/pc defaults */
    info->file = "(unknown file)";
    info->line = -1;
    info->pc = -1;
    info->nsname = NULL;
    info->subname = NULL;
    info->fullname = NULL;

    /* is the current sub of the specified context valid? */
    if (PMC_IS_NULL(CONTEXT(ctx)->current_sub)) {
	info->subname = string_from_cstring(interpreter, "???", 3);
	info->nsname = info->subname;
	info->fullname = string_from_cstring(interpreter, "??? :: ???", 10);
	info->pc = -1;
	return 0;
    }

    /* make sure there is a sub (not always the case, e.g in pasm code) */
    if (CONTEXT(ctx)->current_sub->vtable->base_type == enum_class_Undef ||
	    PMC_sub(CONTEXT(ctx)->current_sub)->address == 0) {
	/* XXX: is this correct? (try with load_bytecode) */
	/* use the current interpreter's bytecode as start address */
	if (CONTEXT(ctx)->current_pc != NULL)
	    info->pc = CONTEXT(ctx)->current_pc - interpreter->code->base.data;
	return 1;
    }

    /* fetch struct Parrot_sub of the current sub in the given context */
    if (!VTABLE_isa(interpreter, CONTEXT(ctx)->current_sub,
                const_string(interpreter, "Sub")))
        return 1;

    sub = PMC_sub(CONTEXT(ctx)->current_sub);
    /* set the sub name */
    info->subname = sub->name;

    /* set the namespace name and fullname of the sub */
    if (PMC_IS_NULL(sub->name_space)) {
	info->nsname = string_from_cstring(interpreter, "", 0);
	info->fullname = info->subname;
    } else {
	info->nsname = VTABLE_get_string(interpreter, sub->name_space);
	info->fullname = string_concat(interpreter, info->nsname,
		string_from_cstring(interpreter, " :: ", 4), 0);
	info->fullname = string_concat(interpreter, info->fullname,
		info->subname, 1);
    }

    /* return here if there is no current pc */
    if (CONTEXT(ctx)->current_pc == NULL)
	return 1;

    /* calculate the current pc */
    info->pc = CONTEXT(ctx)->current_pc - sub->seg->base.data;

    /* determine the current source file/line */
    if (CONTEXT(interpreter->ctx)->current_pc) {
	size_t offs = info->pc;
	size_t i, n;
	/* XXX: interpreter->code->cur_cs is not correct, is it? */
	opcode_t *pc = interpreter->code->base.data;
	struct PackFile_Debug *debug = interpreter->code->debugs;

	/*assert(pc == sub->seg->base.data);*/
	/* set source file */
	info->file = debug->filename;
	for (i = n = 0; n < interpreter->code->base.size; i++) {
	    op_info_t *op_info = &interpreter->op_info_table[*pc];
            if (i >= debug->base.size)
                return 0;
	    if (n >= offs) {
		/* set source line */
		info->line = debug->base.data[i];
		break;
	    }
	    n += op_info->arg_count;
	    pc += op_info->arg_count;
	}
    }
    return 1;
}

STRING*
Parrot_Context_infostr(Interp *interpreter, parrot_context_t *ctx)
{
    struct Parrot_Context_info info;
    const char* msg = (&interpreter->ctx == ctx) ?
	"current instr.:":
	"called from Sub";

    if (Parrot_Context_info(interpreter, ctx, &info)) {
	return Parrot_sprintf_c(interpreter,
		"%s '%Ss' pc %d (%s:%d)\n", msg,
		info.fullname, info.pc, info.file, info.line);
    }
    return NULL;
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
