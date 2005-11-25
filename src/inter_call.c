/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/inter_call.c - Parrot Interpreter - Argument passing code

=head1 DESCRIPTION

Functions in this file handle argument/return value passing to and from
subroutines.

=head2 Functions

=over 4

=cut

*/


#include <assert.h>
#include "parrot/parrot.h"
#include "parrot/oplib/ops.h"
#include "inter_call.str"


static int next_arg(Interp *, struct call_state_1 *st);

/*

=item C<int Parrot_init_arg_nci(Interp *, struct call_state *st, const char *sig)>

Initialize the argument passing state C<call_state> for the given NCI signature.

=item C<int Parrot_init_ret_nci(Interp *, struct call_state *st, const char *sig)>

Initialize the return value passing state C<call_state> for the given
NCI signature.

=cut

*/

int
Parrot_init_arg_nci(Interp *interpreter, struct call_state *st,
        const char *sig)
{
    Parrot_init_arg_op(interpreter, CONTEXT(interpreter->ctx),
            interpreter->current_args, &st->src);
    Parrot_init_arg_sig(interpreter, CONTEXT(interpreter->ctx),
            sig, NULL, &st->dest);
    return 1;
}

int
Parrot_init_ret_nci(Interp *interpreter, struct call_state *st,
        const char *sig)
{
    PMC *current_cont;
    struct Parrot_Context *ctx;
    /*
     * if this NCI call was a taicall, return results to caller's get_results
     * this also means that we pass the caller's register base pointer
     */
    current_cont = CONTEXT(interpreter->ctx)->current_cont;
    if ((PObj_get_FLAGS(current_cont) & SUB_FLAG_TAILCALL)) {
        ctx = PMC_cont(current_cont)->to_ctx;
    }
    else {
        ctx = CONTEXT(interpreter->ctx);
    }
    /* TODO simplify all */
    Parrot_init_arg_sig(interpreter, CONTEXT(interpreter->ctx),
            sig, NULL, &st->src);
    Parrot_init_arg_op(interpreter, ctx,
            ctx->current_results, &st->dest);
    next_arg(interpreter, &st->src);
    next_arg(interpreter, &st->dest);
    return 1;
}

/*

=item C<int Parrot_init_arg_sig(Interp *, parrot_context_t *ctx,
        const char *sig, void *ap, struct call_state_1 *st)>

Initialize argument transfer with given code segment (holding the
const_table), registers, function signature, and arguments.

=item C<int Parrot_init_arg_op(Interp *, parrot_context_t *ctx,
        opcode_t *pc, struct call_state_1 *st)>

Initialize argument transfer with given context registers, and opcode
location of a get_ or set_ argument opcode.

Both functions can be used for either source or destination, by passing
either C<&st.src> or C<&st.dest> of a C<call_state> structure.

These functions return 0, if no arguments are present, or 1 on success.

=cut

*/

int
Parrot_init_arg_op(Interp *interpreter, parrot_context_t *ctx,
        opcode_t *pc, struct call_state_1 *st)
{
    PMC *sig_pmc;

    st->i = -1;
    st->n = 0;
    st->mode = CALL_STATE_OP | CALL_STATE_NEXT_ARG;
    st->ctx = ctx;
    if (pc) {
        ++pc;
        sig_pmc = ctx->constants[*pc]->u.key;
        assert(PObj_is_PMC_TEST(sig_pmc));
        assert(sig_pmc->vtable->base_type == enum_class_FixedIntegerArray);
        st->u.op.signature = sig_pmc;
        st->u.op.pc = pc;
        st->n = VTABLE_elements(interpreter, sig_pmc);
    }
    return st->n > 0;
}

int
Parrot_init_arg_sig(Interp *interpreter, parrot_context_t *ctx,
        const char *sig, void *ap, struct call_state_1 *st)

{
    st->i = -1;
    st->n = 0;
    st->mode = CALL_STATE_SIG | CALL_STATE_NEXT_ARG;
    st->ctx = ctx;
    if (*sig) {
        st->u.sig.sig = sig - 1;
        if (ap)
            st->u.sig.ap = ap;
        else
            st->u.sig.ap = NULL;
        st->n = strlen(sig);
    }
    return st->n > 0;
}

static int
fetch_arg_int_op(Interp *interpreter, struct call_state *st)
{
    INTVAL idx;

    idx = *st->src.u.op.pc;
    if (!(st->src.sig & PARROT_ARG_CONSTANT)) {
        idx = CTX_REG_INT(st->src.ctx, idx);
    }
    UVal_int(st->val) = idx;
    st->src.mode |= CALL_STATE_NEXT_ARG;
    return 1;
}

static int
fetch_arg_str_op(Interp *interpreter, struct call_state *st)
{
    INTVAL idx;
    STRING *s_arg;

    idx = *st->src.u.op.pc;
    if ((st->src.sig & PARROT_ARG_CONSTANT)) {
        s_arg = st->src.ctx->constants[idx]->u.string;
    }
    else {
        s_arg = CTX_REG_STR(st->src.ctx, idx);
    }
    UVal_str(st->val) = s_arg;
    st->src.mode |= CALL_STATE_NEXT_ARG;
    return 1;
}

static int
fetch_arg_num_op(Interp *interpreter, struct call_state *st)
{
    INTVAL idx;
    FLOATVAL f_arg;

    idx = *st->src.u.op.pc;
    if ((st->src.sig & PARROT_ARG_CONSTANT)) {
        f_arg = st->src.ctx->constants[idx]->u.number;
    }
    else {
        f_arg = CTX_REG_NUM(st->src.ctx, idx);
    }
    UVal_num(st->val) = f_arg;
    st->src.mode |= CALL_STATE_NEXT_ARG;
    return 1;
}

static int
fetch_arg_pmc_op(Interp *interpreter, struct call_state *st)
{
    INTVAL idx;
    PMC *p_arg;
    STRING *_array;

    idx = *st->src.u.op.pc;
    if ((st->src.sig & PARROT_ARG_CONSTANT)) {
        p_arg = st->src.ctx->constants[idx]->u.key;
    }
    else {
        p_arg = CTX_REG_PMC(st->src.ctx, idx);
    }
    if (st->src.sig & PARROT_ARG_FLATTEN) {
        _array = CONST_STRING(interpreter, "array");
        if (!VTABLE_does(interpreter, p_arg, _array)) {
            /* src ought to be an array */
            real_exception(interpreter, NULL, E_ValueError,
                    "argument doesn't array");
        }
flatten:
        st->src.mode |= CALL_STATE_FLATTEN;
        st->src.slurp = p_arg;
        st->src.slurp_i = 0;
        st->src.slurp_n = VTABLE_elements(interpreter, p_arg);
        return Parrot_fetch_arg(interpreter, st);
    }

    if ((st->dest.sig & PARROT_ARG_SLURPY_ARRAY) &&
            (st->src.sig & PARROT_ARG_MAYBE_FLATTEN)) {
        _array = CONST_STRING(interpreter, "array");
        if (VTABLE_does(interpreter, p_arg, _array))
            goto flatten;
    }
    UVal_pmc(st->val) = p_arg;
    st->src.mode |= CALL_STATE_NEXT_ARG;
    return 1;
}

static int
fetch_arg_int_sig(Interp *interpreter, struct call_state *st)
{
    va_list *ap = (va_list*)(st->src.u.sig.ap);
    UVal_int(st->val) = va_arg(*ap, INTVAL);
    st->src.mode |= CALL_STATE_NEXT_ARG;
    return 1;
}

static int
fetch_arg_num_sig(Interp *interpreter, struct call_state *st)
{
    va_list *ap = (va_list*)(st->src.u.sig.ap);
    UVal_num(st->val) = va_arg(*ap, FLOATVAL);
    st->src.mode |= CALL_STATE_NEXT_ARG;
    return 1;
}

static int
fetch_arg_str_sig(Interp *interpreter, struct call_state *st)
{
    va_list *ap = (va_list*)(st->src.u.sig.ap);
    UVal_str(st->val) = va_arg(*ap, STRING*);
    st->src.mode |= CALL_STATE_NEXT_ARG;
    return 1;
}

static int
fetch_arg_pmc_sig(Interp *interpreter, struct call_state *st)
{
    if (*st->src.u.sig.sig == 'O')
        UVal_pmc(st->val) = CONTEXT(interpreter->ctx)->current_object;
    else {
        va_list *ap = (va_list*)(st->src.u.sig.ap);
        UVal_pmc(st->val) = va_arg(*ap, PMC*);
    }
    st->src.mode |= CALL_STATE_NEXT_ARG;
    return 1;
}

static int
next_arg(Interp *interpreter, struct call_state_1 *st)
{
    st->i++;
    if (st->i >= st->n)
        return 0;
    st->mode &= ~CALL_STATE_NEXT_ARG;
    switch (st->mode & CALL_STATE_MASK) {
        case CALL_STATE_OP:
            st->u.op.pc++;
            st->sig = VTABLE_get_integer_keyed_int(interpreter,
                    st->u.op.signature, st->i);
            break;
        case CALL_STATE_SIG:
            switch (*++st->u.sig.sig) {
                case 'I':
                    st->sig = PARROT_ARG_INTVAL; break;
                case 'N':
                    st->sig = PARROT_ARG_FLOATVAL; break;
                case 'S':
                    st->sig = PARROT_ARG_STRING; break;
                case 'O':
                case 'P':
                    st->sig = PARROT_ARG_PMC; break;
            }
            break;
    }
    return 1;
}

static int
fetch_arg(Interp *interpreter, struct call_state *st)
{
    switch (st->src.mode & CALL_STATE_MASK) {
        case CALL_STATE_OP:
            switch (st->src.sig & PARROT_ARG_TYPE_MASK) {
                case PARROT_ARG_INTVAL:
                    return fetch_arg_int_op(interpreter, st);
                case PARROT_ARG_STRING:
                    return fetch_arg_str_op(interpreter, st);
                case PARROT_ARG_FLOATVAL:
                    return fetch_arg_num_op(interpreter, st);
                case PARROT_ARG_PMC:
                    return fetch_arg_pmc_op(interpreter, st);
            }
            break;
        case CALL_STATE_SIG:
            switch (st->src.sig) {
                case PARROT_ARG_INTVAL:
                    return fetch_arg_int_sig(interpreter, st);
                case PARROT_ARG_STRING:
                    return fetch_arg_str_sig(interpreter, st);
                case PARROT_ARG_FLOATVAL:
                    return fetch_arg_num_sig(interpreter, st);
                case PARROT_ARG_PMC:
                    return fetch_arg_pmc_sig(interpreter, st);
            }
            break;
    }
    return 0;
}

int
Parrot_fetch_arg(Interp *interpreter, struct call_state *st)
{
    if (st->dest.mode & CALL_STATE_NEXT_ARG) {
        next_arg(interpreter, &st->dest);
    }
    if (st->src.mode & CALL_STATE_NEXT_ARG) {
        if (!next_arg(interpreter, &st->src))
            return 0;
    }
    if (st->src.mode & CALL_STATE_FLATTEN) {
        if (st->src.slurp_i < st->src.slurp_n) {
            PMC *elem = VTABLE_get_pmc_keyed_int(interpreter, st->src.slurp,
                    st->src.slurp_i++);
            st->src.sig = PARROT_ARG_PMC;
            UVal_pmc(st->val) = elem;
            return 1;
        }
        /* done with flattening */
        st->src.mode &= ~CALL_STATE_FLATTEN;
        st->src.mode |= CALL_STATE_NEXT_ARG;
        /* advance src - get next arg */
        return Parrot_fetch_arg(interpreter, st);
    }
    return fetch_arg(interpreter, st);
}


int
Parrot_fetch_arg_nci(Interp *interpreter, struct call_state *st)
{
    Parrot_fetch_arg(interpreter, st);
    Parrot_convert_arg(interpreter, st);
    st->dest.mode |= CALL_STATE_NEXT_ARG;
    return 1;
}

static int
convert_arg_from_int(Interp *interpreter, struct call_state *st)
{
    PMC *d;

    switch (st->dest.sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_FLOATVAL:
            UVal_num(st->val) = (FLOATVAL)UVal_int(st->val);
            return 1;
        case PARROT_ARG_STRING:
            UVal_str(st->val) =
                string_from_int(interpreter, UVal_int(st->val));
            return 1;
        case PARROT_ARG_PMC:
            d = pmc_new(interpreter,
                    Parrot_get_ctx_HLL_type(interpreter,
                        enum_class_Integer));
            VTABLE_set_integer_native(interpreter, d,
                    UVal_int(st->val));
            UVal_pmc(st->val) = d;
            return 1;
    }
    return 0;
}

static int
convert_arg_from_num(Interp *interpreter, struct call_state *st)
{
    PMC *d;

    switch (st->dest.sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_INTVAL:
            UVal_int(st->val) = (INTVAL)UVal_num(st->val);
            return 1;
        case PARROT_ARG_STRING:
            UVal_str(st->val) =
                string_from_num(interpreter, UVal_num(st->val));
            return 1;
        case PARROT_ARG_PMC:
            d = pmc_new(interpreter,
                    Parrot_get_ctx_HLL_type(interpreter,
                        enum_class_Float));
            VTABLE_set_number_native(interpreter, d, UVal_num(st->val));
            UVal_pmc(st->val) = d;
            return 1;
    }
    return 0;
}

static int
convert_arg_from_str(Interp *interpreter, struct call_state *st)
{
    PMC *d;

    switch (st->dest.sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_INTVAL:
            UVal_int(st->val) =
                string_to_int(interpreter, UVal_str(st->val));
            return 1;
        case PARROT_ARG_FLOATVAL:
            UVal_num(st->val) =
                string_to_num(interpreter, UVal_str(st->val));
            return 1;
        case PARROT_ARG_PMC:
            d = pmc_new(interpreter,
                    Parrot_get_ctx_HLL_type(interpreter,
                        enum_class_String));
            VTABLE_set_string_native(interpreter, d, UVal_str(st->val));
            UVal_pmc(st->val) = d;
            return 1;
    }
    return 0;
}

static int
convert_arg_from_pmc(Interp *interpreter, struct call_state *st)
{
    switch (st->dest.sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_INTVAL:
            UVal_int(st->val) = VTABLE_get_integer(interpreter,
                    UVal_pmc(st->val));
            return 1;
        case PARROT_ARG_FLOATVAL:
            UVal_num(st->val) = VTABLE_get_number(interpreter,
                    UVal_pmc(st->val));
            return 1;
        case PARROT_ARG_STRING:
            UVal_str(st->val) = VTABLE_get_string(interpreter,
                    UVal_pmc(st->val));
            return 1;
    }
    return 0;
}
/*
 * replace any src register by their values (done inside clone)
 * need a test for tailcalls too, but I think there is no syntax
 * to pass a key to a tailcalled function or method
 */
static void
clone_key_arg(Interp *interpreter, struct call_state *st)
{
    PMC *p_arg = UVal_pmc(st->val);

    if (p_arg->vtable->base_type == enum_class_Key) {
        PMC *key;
        INTVAL any_registers;

        for (any_registers = 0, key = p_arg; key; ) {
            if (PObj_get_FLAGS(key) & KEY_register_FLAG) {
                any_registers = 1;
                break;
            }
            key = key_next(interpreter, key);
        }

        if (any_registers) {
            parrot_context_t new_ctx;

            new_ctx.bp = interpreter->ctx.bp;
            new_ctx.bp_ps = interpreter->ctx.bp_ps;
            /* need old = src context
             * clone sets key values according to refered
             * register items
             */
            interpreter->ctx.bp = st->src.ctx->bp;
            interpreter->ctx.bp_ps = st->src.ctx->bp_ps;
            p_arg = VTABLE_clone(interpreter, p_arg);
            interpreter->ctx.bp = new_ctx.bp;
            interpreter->ctx.bp_ps = new_ctx.bp_ps;
            UVal_pmc(st->val) = p_arg;
        }
    }
}

int
Parrot_convert_arg(Interp *interpreter, struct call_state *st)
{
again:
    if (st->dest.sig & PARROT_ARG_OPTIONAL) {
        if (st->src.i < st->src.n)
            ++st->opt_so_far;
    }
    else if (st->dest.sig & PARROT_ARG_OPT_FLAG) {
        if ((st->dest.sig & PARROT_ARG_TYPE_MASK) != PARROT_ARG_INTVAL)
            real_exception(interpreter, NULL, E_ValueError,
                    ":opt_flag is not an int");
        if (st->opt_so_far > 1)
            real_exception(interpreter, NULL, E_ValueError,
                    ":opt_flag preceeded by more then one :optional");
        CTX_REG_INT(st->dest.ctx, *st->dest.u.op.pc) = st->opt_so_far;
        st->opt_so_far = 0;
        if (!next_arg(interpreter, &st->dest))
            return 0;
        goto again;
    }
    if (st->src.i >= st->src.n)
        return 0;
    if ((st->src.sig & PARROT_ARG_TYPE_MASK) == PARROT_ARG_PMC) {
        clone_key_arg(interpreter, st);
    }
    if ((st->dest.sig & PARROT_ARG_TYPE_MASK) ==
        (st->src.sig & PARROT_ARG_TYPE_MASK))
        return 0;
    switch (st->src.sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_INTVAL:
            return convert_arg_from_int(interpreter, st);
        case PARROT_ARG_FLOATVAL:
            return convert_arg_from_num(interpreter, st);
        case PARROT_ARG_STRING:
            return convert_arg_from_str(interpreter, st);
        case PARROT_ARG_PMC:
            return convert_arg_from_pmc(interpreter, st);

    }
    return 0;
}

int
Parrot_store_arg(Interp *interpreter, struct call_state *st)
{
    if (st->dest.i >= st->dest.n)
        return 0;
    if (st->dest.mode & CALL_STATE_FLATTEN) {
        if (st->src.i >= st->src.n)
            return 0;
        VTABLE_push_pmc(interpreter, st->dest.slurp, UVal_pmc(st->val));
        return 1;
    }
    if (st->dest.sig & PARROT_ARG_SLURPY_ARRAY) {
        /* create array */
        st->dest.slurp = pmc_new(interpreter,
                Parrot_get_ctx_HLL_type(interpreter,
                    enum_class_ResizablePMCArray));
        CTX_REG_PMC(st->dest.ctx, *st->dest.u.op.pc) = st->dest.slurp;
        st->dest.mode |= CALL_STATE_FLATTEN;
        return Parrot_store_arg(interpreter, st);
    }
    if (st->src.i >= st->src.n) {
        /* process possible optionals */
        st->dest.mode |= CALL_STATE_NEXT_ARG;
        return 1;
    }
    assert(st->dest.mode & CALL_STATE_OP);
    switch (st->dest.sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_INTVAL:
            CTX_REG_INT(st->dest.ctx, *st->dest.u.op.pc) = UVal_int(st->val);
            break;
        case PARROT_ARG_FLOATVAL:
            CTX_REG_NUM(st->dest.ctx, *st->dest.u.op.pc) = UVal_num(st->val);
            break;
        case PARROT_ARG_STRING:
            CTX_REG_STR(st->dest.ctx, *st->dest.u.op.pc) = UVal_str(st->val);
            break;
        case PARROT_ARG_PMC:
            CTX_REG_PMC(st->dest.ctx, *st->dest.u.op.pc) =  UVal_pmc(st->val);
            break;
    }
    st->dest.mode |= CALL_STATE_NEXT_ARG;
    return 1;
}

/*

=item C<opcode_t * parrot_pass_args(Interp *, struct PackFile_ByteCode *dst_seg parrot_context_t *src_ctx, int what)>

Main argument passing routine.

Prelims: code segments aren't yet switched, so that the current
constants are still that of the caller.  The destination context is
already created and set, C<src_ctx> point to the caller's
context. C<dst_seg> has the constants of the destination.

C<what> is either C<PARROT_OP_get_params_pc> or C<PARROT_OP_get_results_pc>.
With the former arguments are passed from the caller into a subroutine,
the latter handles return values and yields.

=cut

*/


#ifdef PREMATURE_OPT

#undef VTABLE_elements
#define VTABLE_elements(i, ar) PMC_int_val(ar)
#undef VTABLE_get_integer_keyed_int
#define VTABLE_get_integer_keyed_int(i, ar, idx) ((INTVAL*)PMC_data(ar))[idx]

#endif

opcode_t *
parrot_pass_args(Interp *interpreter,  parrot_context_t *src_ctx,
        parrot_context_t *dest_ctx, int what)
{
    const char *action;
    struct call_state st;
    int todo;
    opcode_t *src_pc, *dst_pc;

    st.dest.n = 0;      /* XXX */

    if (what == PARROT_OP_get_params_pc) {
        dst_pc = interpreter->current_params;
        todo = Parrot_init_arg_op(interpreter, dest_ctx,
                 dst_pc, &st.dest);
        src_pc = interpreter->current_args;
        Parrot_init_arg_op(interpreter,
                src_ctx, src_pc, &st.src);
        interpreter->current_params = NULL;
        action = "params";
    }
    else {
        dst_pc = CONTEXT(interpreter->ctx)->current_results;
        if (!dst_pc)
            return NULL;
        src_pc = interpreter->current_returns;
        action = "results";
        if (!src_pc) {    /* no returns */
            /* continuation call with args
             *
             * we move current_args into context the first time
             * and use the context var for further get_params
             * so that we can clean current_args and make this
             * less ambiguous
             */
            src_pc = interpreter->current_args;
            if (!src_pc)
                return NULL;
            action = "params";
        }
        todo = Parrot_init_arg_op(interpreter, dest_ctx, dst_pc, &st.dest);
        Parrot_init_arg_op(interpreter, src_ctx, src_pc, &st.src);
    }
    st.opt_so_far = 0;  /* XXX */
    while (todo) {
        Parrot_fetch_arg(interpreter, &st);
        Parrot_convert_arg(interpreter, &st);
        todo = Parrot_store_arg(interpreter, &st);
    }


    /* never get more then the caller expects */
#if 0
    /*
     * check for arg count mismatch
     *
     * XXX not yet. PGE uses a lot of implicit :optionals
     */
    if (src_i != src_n) {
        /* ingore return value mismatch */
        real_exception(interpreter, NULL, E_ValueError,
                "too many arguments passed (%d) - %d %s expected",
                src_n, dst_n, action);
    }
    else if (dst_i != dst_n) {
        dst_sig = VTABLE_get_integer_keyed_int(interpreter,
                dst_signature, dst_i);
        if (!(dst_sig & (PARROT_ARG_OPTIONAL|PARROT_ARG_SLURPY_ARRAY))) {
            real_exception(interpreter, NULL, E_ValueError,
                    "too few arguments passed (%d) - %d %s expected",
                    src_n, dst_n, action);
        }
    }
#endif
    /* skip the get_params opcode - all done here */
    return dst_pc + st.dest.n + 2;
}

/*

=item C<opcode_t *parrot_pass_args_fromc(Interp *, const char *sig,
INTVAL src_n, opcode_t *dest, parrot_context_t * ctxp, va_list ap)>

Pass arguments from C code with given signature to a Parrot Sub.
Prerequsits are like above.

=cut

*/
opcode_t *
parrot_pass_args_fromc(Interp *interpreter, const char *sig,
        opcode_t *dest, parrot_context_t * old_ctxp, va_list ap)
{
    int todo;
    struct call_state st;

    if (dest[0] != PARROT_OP_get_params_pc) {
        /*
         * main is now started with runops_args_fromc too
         * PASM subs usually don't have get_params
         * XXX we could check, if we are running main
         */
        return dest;
        real_exception(interpreter, NULL, E_ValueError,
                "no get_params in sub");
    }

    Parrot_init_arg_op(interpreter,
            CONTEXT(interpreter->ctx), dest, &st.dest);
    todo = Parrot_init_arg_sig(interpreter,
            old_ctxp, sig, PARROT_VA_TO_VAPTR(ap), &st.src);
    st.opt_so_far = 0;  /* XXX */

    while (todo) {
        Parrot_fetch_arg(interpreter, &st);
        Parrot_convert_arg(interpreter, &st);
        todo = Parrot_store_arg(interpreter, &st);
    }
    /*
     * check for arg count mismatch
     */
    if (st.src.i < st.src.n) {
        real_exception(interpreter, NULL, E_ValueError,
                "too many arguments passed (%d) - %d params expected",
                st.src.n, st.dest.n);
    }
    else if (st.dest.i < st.dest.n) {
        if (!(st.dest.sig & (PARROT_ARG_OPTIONAL|PARROT_ARG_SLURPY_ARRAY))) {
            real_exception(interpreter, NULL, E_ValueError,
                    "too few arguments passed (%d) - %d params expected",
                    st.src.n, st.dest.n);
        }
    }

    dest += st.dest.n + 2;
    return dest;
}

/*
 * handle void, and pointer (PMC*, STRING*) return values
 */
void*
set_retval(Parrot_Interp interpreter, int sig_ret, parrot_context_t *ctx)
{
    opcode_t *src_pc;
    int todo;
    struct call_state st;
    char buf[2];
    const char *sig = buf;

    src_pc = interpreter->current_returns;
    interpreter->current_returns = NULL;
    if (!sig_ret || sig_ret == 'v')
        return NULL;

    todo = Parrot_init_arg_op(interpreter, ctx, src_pc, &st.src);
    if (todo) {
        buf[0] = sig_ret;
        buf[1] = 0;
        todo = Parrot_init_arg_sig(interpreter,
                CONTEXT(interpreter->ctx), sig, NULL, &st.dest);
    }
    if (todo) {
        Parrot_fetch_arg(interpreter, &st);
        Parrot_convert_arg(interpreter, &st);
        switch (sig_ret) {
            case 'S':  return UVal_str(st.val);
            case 'P':  return UVal_pmc(st.val);
        }
    }
    return NULL;
}
/*
 * handle INTVAL return value
 */
INTVAL
set_retval_i(Parrot_Interp interpreter, int sig_ret, parrot_context_t *ctx)
{
    opcode_t *src_pc;
    int todo;
    struct call_state st;
    const char *sig = "I";

    if (sig_ret != 'I') {
        real_exception(interpreter, NULL, E_ValueError,
                "return signature not 'I'");
    }
    src_pc = interpreter->current_returns;
    interpreter->current_returns = NULL;
    Parrot_init_arg_op(interpreter, ctx, src_pc, &st.src);
    todo = Parrot_init_arg_sig(interpreter,
            CONTEXT(interpreter->ctx), sig, NULL, &st.dest);
    if (todo) {
        Parrot_fetch_arg(interpreter, &st);
        Parrot_convert_arg(interpreter, &st);
        return UVal_int(st.val);
    }
    return 0;
}

/*
 * handle FLOATVAL return value
 */
FLOATVAL
set_retval_f(Parrot_Interp interpreter, int sig_ret, parrot_context_t *ctx)
{
    opcode_t *src_pc;
    int todo;
    struct call_state st;
    const char *sig = "N";

    if (sig_ret != 'N') {
        real_exception(interpreter, NULL, E_ValueError,
                "return signature not 'I'");
    }
    src_pc = interpreter->current_returns;
    interpreter->current_returns = NULL;
    Parrot_init_arg_op(interpreter, ctx, src_pc, &st.src);
    todo = Parrot_init_arg_sig(interpreter,
            CONTEXT(interpreter->ctx), sig, NULL, &st.dest);
    if (todo) {
        Parrot_fetch_arg(interpreter, &st);
        Parrot_convert_arg(interpreter, &st);
        return UVal_num(st.val);
    }
    return 0.0;
}
/*

=back

=head1 SEE ALSO

F<include/parrot/interpreter.h>, F<src/inter_run.c>, F<classes/sub.pmc>.

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
