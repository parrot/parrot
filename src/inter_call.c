/*
Copyright (C) 2001-2003, The Perl Foundation.
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

=item C<int Parrot_init_arg_nci(Interp *, 
                                struct call_state *st, const char *sig)>

Initialize the argument passing state C<call_state> for the given NCI signature.

=item C<int Parrot_init_ret_nci(Interp *, 
                                struct call_state *st, const char *sig)>

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

    st->i = 0;
    st->n = 0;
    st->mode = CALL_STATE_OP;
    st->ctx = ctx;
    st->sig = 0;
    if (pc) {
        ++pc;
        sig_pmc = ctx->constants[*pc]->u.key;
        ASSERT_SIG_PMC(sig_pmc);
        st->u.op.signature = sig_pmc;
        st->u.op.pc = pc + 1;
        st->n = SIG_ELEMS(sig_pmc);
        if (st->n)
            st->sig = SIG_ITEM(sig_pmc, 0);
    }
    return st->n > 0;
}

int
Parrot_init_arg_sig(Interp *interpreter, parrot_context_t *ctx,
        const char *sig, void *ap, struct call_state_1 *st)

{
    st->i = 0;
    st->n = 0;
    st->mode = CALL_STATE_SIG;
    st->ctx = ctx;
    st->sig = 0;
    if (*sig) {
        st->u.sig.sig = sig;
        if (ap)
            st->u.sig.ap = ap;
        else
            st->u.sig.ap = NULL;
        st->n = strlen(sig);
        if (st->n) {
            switch (sig[0]) {
                case 'I':
                    st->sig = PARROT_ARG_INTVAL; break;
                case 'N':
                    st->sig = PARROT_ARG_FLOATVAL; break;
                case 'S':
                    st->sig = PARROT_ARG_STRING; break;
                case 'O':
                case 'P':
                    st->sig = PARROT_ARG_PMC; break;
                case '@':
                    st->sig = PARROT_ARG_PMC | PARROT_ARG_SLURPY_ARRAY; break;
                case 'F':
                    st->sig = PARROT_ARG_PMC | PARROT_ARG_FLATTEN; break;
            }
        }
    }
    return st->n > 0;
}

/* mark the source state as flattening with the passed
 * PMC being flattened, and fetch the first arg from the flattened
 * set.
 */
static void
make_flattened(Interp *interpreter, struct call_state *st, PMC *p_arg)
{
    st->src.mode |= CALL_STATE_FLATTEN;
    st->src.slurp = p_arg;
    st->src.slurp_i = 0;
    st->src.slurp_n = VTABLE_elements(interpreter, p_arg);
    /* the -1 is because the :flat PMC itself doesn't count. */
    st->n_actual_args += st->src.slurp_n-1;
    Parrot_fetch_arg(interpreter, st);
}

static void
fetch_arg_int_op(Interp *interpreter, struct call_state *st)
{
    INTVAL idx;

    idx = st->src.u.op.pc[st->src.i];
    if (!(st->src.sig & PARROT_ARG_CONSTANT)) {
        idx = CTX_REG_INT(st->src.ctx, idx);
    }
    UVal_int(st->val) = idx;
    st->src.mode |= CALL_STATE_NEXT_ARG;
}

static void
fetch_arg_str_op(Interp *interpreter, struct call_state *st)
{
    INTVAL idx;
    STRING *s_arg;

    idx = st->src.u.op.pc[st->src.i];
    if ((st->src.sig & PARROT_ARG_CONSTANT)) {
        s_arg = st->src.ctx->constants[idx]->u.string;
    }
    else {
        s_arg = CTX_REG_STR(st->src.ctx, idx);
    }
    UVal_str(st->val) = s_arg;
    st->src.mode |= CALL_STATE_NEXT_ARG;
}

static void
fetch_arg_num_op(Interp *interpreter, struct call_state *st)
{
    INTVAL idx;
    FLOATVAL f_arg;

    idx = st->src.u.op.pc[st->src.i];
    if ((st->src.sig & PARROT_ARG_CONSTANT)) {
        f_arg = st->src.ctx->constants[idx]->u.number;
    }
    else {
        f_arg = CTX_REG_NUM(st->src.ctx, idx);
    }
    UVal_num(st->val) = f_arg;
    st->src.mode |= CALL_STATE_NEXT_ARG;
}

static void
fetch_arg_pmc_op(Interp *interpreter, struct call_state *st)
{
    INTVAL idx;
    PMC *p_arg;
    STRING *_array, *_hash;

    idx = st->src.u.op.pc[st->src.i];
    if ((st->src.sig & PARROT_ARG_CONSTANT)) {
        p_arg = st->src.ctx->constants[idx]->u.key;
    }
    else {
        p_arg = CTX_REG_PMC(st->src.ctx, idx);
    }
    if (st->src.sig & PARROT_ARG_FLATTEN) {
        if (st->src.sig & PARROT_ARG_NAME) {
            _hash = CONST_STRING(interpreter, "hash");
            if (!VTABLE_does(interpreter, p_arg, _hash)) {
                /* src ought to be an hash */
                real_exception(interpreter, NULL, E_ValueError,
                        "argument doesn't hash");
            }
            st->src.mode |= CALL_STATE_FLATTEN;
            /* need a key to iterate the hash */
            st->key = pmc_new(interpreter, enum_class_Key);
            PMC_int_val(st->key) = 0;
            PMC_data(st->key)    = (void*)INITBucketIndex;
        }
        else {
            _array = CONST_STRING(interpreter, "array");
            if (!VTABLE_does(interpreter, p_arg, _array)) {
                /* src ought to be an array */
                real_exception(interpreter, NULL, E_ValueError,
                        "argument doesn't array");
            }
        }
flatten:
        make_flattened(interpreter, st, p_arg);
        return;
    }

    if ((st->dest.sig & PARROT_ARG_SLURPY_ARRAY) &&
            (st->src.sig & PARROT_ARG_MAYBE_FLATTEN)) {
        _array = CONST_STRING(interpreter, "array");
        if (VTABLE_does(interpreter, p_arg, _array))
            goto flatten;
    }
    UVal_pmc(st->val) = p_arg;
    st->src.mode |= CALL_STATE_NEXT_ARG;
}

static void
fetch_arg_int_sig(Interp *interpreter, struct call_state *st)
{
    va_list *ap = (va_list*)(st->src.u.sig.ap);
    UVal_int(st->val) = va_arg(*ap, INTVAL);
    st->src.mode |= CALL_STATE_NEXT_ARG;
}

static void
fetch_arg_num_sig(Interp *interpreter, struct call_state *st)
{
    va_list *ap = (va_list*)(st->src.u.sig.ap);
    UVal_num(st->val) = va_arg(*ap, FLOATVAL);
    st->src.mode |= CALL_STATE_NEXT_ARG;
}

static void
fetch_arg_str_sig(Interp *interpreter, struct call_state *st)
{
    va_list *ap = (va_list*)(st->src.u.sig.ap);
    UVal_str(st->val) = va_arg(*ap, STRING*);
    st->src.mode |= CALL_STATE_NEXT_ARG;
}

static void
fetch_arg_pmc_sig(Interp *interpreter, struct call_state *st)
{
    if (st->src.u.sig.sig[st->src.i] == 'O')
        UVal_pmc(st->val) = CONTEXT(interpreter->ctx)->current_object;
    else {
        va_list *ap = (va_list*)(st->src.u.sig.ap);
        UVal_pmc(st->val) = va_arg(*ap, PMC*);
    }
    if (st->src.sig & PARROT_ARG_FLATTEN) {
        make_flattened(interpreter, st, UVal_pmc(st->val));
    } else {
        st->src.mode |= CALL_STATE_NEXT_ARG;
    }
}

static int
next_arg(Interp *interpreter, struct call_state_1 *st)
{
    st->i++;
    if (st->i >= st->n) {
        st->sig = 0;
        return 0;
    }
    st->mode &= ~CALL_STATE_NEXT_ARG;
    switch (st->mode & CALL_S_D_MASK) {
        case CALL_STATE_OP:
            st->sig = SIG_ITEM(st->u.op.signature, st->i);
            break;
        case CALL_STATE_SIG:
            switch (st->u.sig.sig[st->i]) {
                case 'I':
                    st->sig = PARROT_ARG_INTVAL; break;
                case 'N':
                    st->sig = PARROT_ARG_FLOATVAL; break;
                case 'S':
                    st->sig = PARROT_ARG_STRING; break;
                case 'O':
                case 'P':
                    st->sig = PARROT_ARG_PMC; break;
                case '@':
                    st->sig = PARROT_ARG_PMC | PARROT_ARG_SLURPY_ARRAY; break;
                case 'F':
                    st->sig = PARROT_ARG_PMC | PARROT_ARG_FLATTEN; break;
            }
            break;
    }
    return 1;
}

static void
fetch_arg_sig(Interp *interpreter, struct call_state *st)
{
    if (st->dest.mode & CALL_STATE_NEXT_ARG) {
        next_arg(interpreter, &st->dest);
    }
    if (!st->src.n) {
        return;
    }
    if (st->src.mode & CALL_STATE_NEXT_ARG) {
        if (!next_arg(interpreter, &st->src))
            return;
    }
    switch (st->src.sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_INTVAL:
            fetch_arg_int_sig(interpreter, st);
            break;
        case PARROT_ARG_STRING:
            fetch_arg_str_sig(interpreter, st);
            break;
        case PARROT_ARG_FLOATVAL:
            fetch_arg_num_sig(interpreter, st);
            break;
        case PARROT_ARG_PMC:
            fetch_arg_pmc_sig(interpreter, st);
            break;
    }
}

static void
fetch_arg_op(Interp *interpreter, struct call_state *st)
{
    switch (st->src.sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_INTVAL:
            fetch_arg_int_op(interpreter, st);
            break;
        case PARROT_ARG_STRING:
            fetch_arg_str_op(interpreter, st);
            break;
        case PARROT_ARG_FLOATVAL:
            fetch_arg_num_op(interpreter, st);
            break;
        case PARROT_ARG_PMC:
            fetch_arg_pmc_op(interpreter, st);
            break;
    }
}


int
Parrot_fetch_arg(Interp *interpreter, struct call_state *st)
{
    if (st->dest.mode & CALL_STATE_NEXT_ARG) {
        if (!next_arg(interpreter, &st->dest))
            st->dest.mode |= CALL_STATE_x_END;
    }
    if (!st->src.n) {
        st->dest.mode |= CALL_STATE_END_x;
        return 0;
    }
    if (st->src.mode & CALL_STATE_NEXT_ARG) {
        if (!next_arg(interpreter, &st->src)) {
            st->dest.mode |= CALL_STATE_END_x;
            return 0;
        }
    }
    if (st->src.mode & CALL_STATE_FLATTEN) {
        if (st->src.slurp_i < st->src.slurp_n) {
            PMC *elem;
            if (st->key) {
                st->src.slurp_i++;
                st->name = parrot_hash_get_idx(interpreter, 
                        PMC_struct_val(st->src.slurp), st->key);
                assert(st->name);
                elem = VTABLE_get_pmc_keyed_str(interpreter, st->src.slurp,
                        st->name);
            }
            else {
                elem = VTABLE_get_pmc_keyed_int(interpreter, st->src.slurp,
                        st->src.slurp_i++);
            }
            st->src.sig = PARROT_ARG_PMC;
            UVal_pmc(st->val) = elem;
            return 1;
        }
        /* done with flattening */
        st->src.mode &= ~CALL_STATE_FLATTEN;
        st->src.mode |= CALL_STATE_NEXT_ARG;
        st->key = NULL;
        /* advance src - get next arg */
        return Parrot_fetch_arg(interpreter, st);
    }
    if ((st->src.sig & PARROT_ARG_NAME) && 
            !(st->src.sig & PARROT_ARG_FLATTEN)) {
        fetch_arg_op(interpreter, st);
        st->name = UVal_str(st->val);
        next_arg(interpreter, &st->src);
    }
    switch (st->src.mode & CALL_S_D_MASK) {
        case CALL_STATE_OP:
            fetch_arg_op(interpreter, st);
            break;
        case CALL_STATE_SIG:
            fetch_arg_sig(interpreter, st);
            break;
    }
    return 1;
}


int
Parrot_fetch_arg_nci(Interp *interpreter, struct call_state *st)
{
    Parrot_fetch_arg(interpreter, st);
    if (st->dest.sig & PARROT_ARG_SLURPY_ARRAY) {
        PMC *slurped;
        assert((st->dest.sig & PARROT_ARG_TYPE_MASK) == PARROT_ARG_PMC);
        slurped = pmc_new(interpreter, enum_class_ResizablePMCArray);
        while (!(st->dest.mode & CALL_STATE_END_x)) {
            Parrot_convert_arg(interpreter, st);
            st->dest.mode |= CALL_STATE_SLURP;
            VTABLE_push_pmc(interpreter, slurped, UVal_pmc(st->val));
            Parrot_fetch_arg(interpreter, st);
        }
        UVal_pmc(st->val) = slurped;
    } else {
        Parrot_convert_arg(interpreter, st);
        st->dest.mode |= CALL_STATE_NEXT_ARG;
    }
    return 1;
}

static void
convert_arg_from_int(Interp *interpreter, struct call_state *st)
{
    PMC *d;

    switch (st->dest.sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_FLOATVAL:
            UVal_num(st->val) = (FLOATVAL)UVal_int(st->val);
            break;
        case PARROT_ARG_STRING:
            UVal_str(st->val) =
                string_from_int(interpreter, UVal_int(st->val));
            break;
        case PARROT_ARG_PMC:
            d = pmc_new(interpreter,
                    Parrot_get_ctx_HLL_type(interpreter,
                        enum_class_Integer));
            VTABLE_set_integer_native(interpreter, d,
                    UVal_int(st->val));
            UVal_pmc(st->val) = d;
            break;
    }
}

static void
convert_arg_from_num(Interp *interpreter, struct call_state *st)
{
    PMC *d;

    switch (st->dest.sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_INTVAL:
            UVal_int(st->val) = (INTVAL)UVal_num(st->val);
            break;
        case PARROT_ARG_STRING:
            UVal_str(st->val) =
                string_from_num(interpreter, UVal_num(st->val));
            break;
        case PARROT_ARG_PMC:
            d = pmc_new(interpreter,
                    Parrot_get_ctx_HLL_type(interpreter,
                        enum_class_Float));
            VTABLE_set_number_native(interpreter, d, UVal_num(st->val));
            UVal_pmc(st->val) = d;
            break;
    }
}

static void
convert_arg_from_str(Interp *interpreter, struct call_state *st)
{
    PMC *d;

    switch (st->dest.sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_INTVAL:
            UVal_int(st->val) =
                string_to_int(interpreter, UVal_str(st->val));
            break;
        case PARROT_ARG_FLOATVAL:
            UVal_num(st->val) =
                string_to_num(interpreter, UVal_str(st->val));
            break;
        case PARROT_ARG_PMC:
            d = pmc_new(interpreter,
                    Parrot_get_ctx_HLL_type(interpreter,
                        enum_class_String));
            VTABLE_set_string_native(interpreter, d, UVal_str(st->val));
            UVal_pmc(st->val) = d;
            break;
    }
}

static void
convert_arg_from_pmc(Interp *interpreter, struct call_state *st)
{
    switch (st->dest.sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_INTVAL:
            UVal_int(st->val) = VTABLE_get_integer(interpreter,
                    UVal_pmc(st->val));
            break;
        case PARROT_ARG_FLOATVAL:
            UVal_num(st->val) = VTABLE_get_number(interpreter,
                    UVal_pmc(st->val));
            break;
        case PARROT_ARG_STRING:
            UVal_str(st->val) = VTABLE_get_string(interpreter,
                    UVal_pmc(st->val));
            break;
    }
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

    if (p_arg && p_arg->vtable->base_type == enum_class_Key) {
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

static void
init_named(Interp *interpreter, struct call_state *st)
{
    int i, n_named, idx;
    INTVAL sig;
    
    if (st->dest.mode & CALL_STATE_SIG)
        real_exception(interpreter, NULL, E_ValueError,
                "Can't call C function with named arguments");
    st->first_named = st->dest.i;
    n_named = 0;
    /*
     * if we were slurpying, we are done
     */
    st->dest.mode &= ~CALL_STATE_SLURP;
    st->dest.mode |= CALL_STATE_x_NAMED;
    st->dest.slurp = NULL;
    for (i = st->dest.i; i < st->dest.n; ++i) {
        sig = SIG_ITEM(st->dest.u.op.signature, i);
        if (!(sig & PARROT_ARG_NAME))
            continue;
        if (sig & PARROT_ARG_SLURPY_ARRAY) {
            st->dest.slurp = pmc_new(interpreter,
                Parrot_get_ctx_HLL_type(interpreter,
                    enum_class_Hash));
            /* pass the slurpy hash */
            idx = st->dest.u.op.pc[i];
            CTX_REG_PMC(st->dest.ctx, idx) = st->dest.slurp;
        }
        else
            n_named++;
    }
    if (n_named >= (int)(sizeof(UINTVAL) * 8))
        real_exception(interpreter, NULL, E_ValueError,
                "Too many named arguments");
    st->named_done = 0;
}

/*
 * locate destination pos, return 0 if state changed
 */
static int
locate_pos_named(Interp *interpreter, struct call_state *st)
{
    int i, n_named;
    INTVAL sig;

    n_named = -1;
    st->dest.mode &= ~CALL_STATE_SLURP;
    st->dest.mode |= CALL_STATE_x_NAMED;
    for (i = st->first_named; i < st->dest.n; ++i) {
        sig = SIG_ITEM(st->dest.u.op.signature, i);
        if (!(sig & PARROT_ARG_NAME))
            continue;
        if (sig & PARROT_ARG_SLURPY_ARRAY)
            break;
        n_named++;
        if (st->named_done & (1 << n_named))
            continue;
        ++i;
        st->dest.sig = SIG_ITEM(st->dest.u.op.signature, i);
        st->dest.i = i;
        st->named_done |= 1 << n_named;
        return 1;
    }
    st->dest.mode |= CALL_STATE_x_END;
    return 0;
}

/*
 * locate destination name, return 0 if not found
 */
static int
locate_named_named(Interp *interpreter, struct call_state *st)
{
    int i, n_named, idx;
    INTVAL sig;
    STRING *param;

    n_named = -1;
    st->dest.mode &= ~CALL_STATE_SLURP;
    st->dest.mode &= ~CALL_STATE_OPT;
    for (i = st->first_named; i < st->dest.n; ++i) {
        sig = SIG_ITEM(st->dest.u.op.signature, i);
        if (!(sig & PARROT_ARG_NAME))
            continue;
        if (sig & PARROT_ARG_SLURPY_ARRAY) {
            st->dest.mode |= CALL_STATE_SLURP;
            return 1;
        }
        n_named++;
        idx = st->dest.u.op.pc[i];
        param = st->dest.ctx->constants[idx]->u.string;
        if (st->name == param ||
                0 == string_equal(interpreter, st->name, param)) {
            ++i;
            st->dest.sig = SIG_ITEM(st->dest.u.op.signature, i);
            st->dest.i = i;
            /* if bit is set we got duplicated */
            if (st->named_done & (1 << n_named))
                real_exception(interpreter, NULL, E_ValueError,
                        "duplicate named argument - '%Ss' not expected",
                        param);
            st->named_done |= 1 << n_named;
            return 1;
        }
    }
    st->dest.mode |= CALL_STATE_x_END;
    return 0;
}

static void 
store_arg(struct call_state *st, INTVAL idx) 
{

    switch (st->dest.sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_INTVAL:
            CTX_REG_INT(st->dest.ctx, idx) = UVal_int(st->val);
            break;
        case PARROT_ARG_FLOATVAL:
            CTX_REG_NUM(st->dest.ctx, idx) = UVal_num(st->val);
            break;
        case PARROT_ARG_STRING:
            CTX_REG_STR(st->dest.ctx, idx) = UVal_str(st->val);
            break;
        case PARROT_ARG_PMC:
            CTX_REG_PMC(st->dest.ctx, idx) =  UVal_pmc(st->val);
            break;
    }
}

static void
create_slurpy_ar(Interp *interpreter, struct call_state *st, INTVAL idx)
{
    st->dest.slurp = pmc_new(interpreter,
            Parrot_get_ctx_HLL_type(interpreter,
                enum_class_ResizablePMCArray));
    CTX_REG_PMC(st->dest.ctx, idx) = st->dest.slurp;
    st->dest.mode |= CALL_STATE_SLURP;
    st->dest.mode &= ~CALL_STATE_OPT;
}

static void 
too_few(Interp *interpreter, struct call_state *st, const char *action) 
{
    int max_expected_args = st->params;
    int min_expected_args = max_expected_args - st->optionals;

    /* arg checks. */
    if (st->n_actual_args < min_expected_args) {
        real_exception(interpreter, NULL, E_ValueError,
                "too few arguments passed (%d) - %s%d %s expected",
                st->n_actual_args,
                (min_expected_args < max_expected_args ? "at least " : ""),
                min_expected_args, action);
    }
}


static void 
too_many(Interp *interpreter, struct call_state *st, const char *action) 
{
    int max_expected_args = st->params;
    int min_expected_args = max_expected_args - st->optionals;
    if (st->n_actual_args > max_expected_args) {
        real_exception(interpreter, NULL, E_ValueError,
                "too many arguments passed (%d) - %s%d %s expected",
                st->n_actual_args,
                (min_expected_args < max_expected_args ? "at most " : ""),
                max_expected_args, action);
    }
}

static void 
null_val(int sig, struct call_state *st) 
{
    switch (sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_INTVAL:
            UVal_int(st->val) = 0; break;
        case PARROT_ARG_FLOATVAL:
            UVal_num(st->val) = 0.0; break;
        case PARROT_ARG_STRING:
            UVal_str(st->val) = NULL; break;
        case PARROT_ARG_PMC:
            UVal_pmc(st->val) = PMCNULL; break;
    }
}

static void 
check_named(Interp *interpreter, struct call_state *st, const char *action) 
{
    int i, n_named, idx, was_set, n_i;
    INTVAL sig;
    STRING *param;

    n_named = -1;
    was_set = n_i = 0;
    for (i = st->first_named; i < st->dest.n; ++i) {
        st->dest.sig = sig = SIG_ITEM(st->dest.u.op.signature, i);
        if ((sig & PARROT_ARG_NAME)) {
            if (sig & PARROT_ARG_SLURPY_ARRAY)
                break;
            was_set = 0;
            n_named++;
            n_i = i;
            if (st->named_done & (1 << n_named)) {
                was_set = 1;
            }
            continue;
        }
        if (was_set)
            continue;
        if (sig & PARROT_ARG_OPTIONAL) {
            null_val(sig, st);
            idx = st->dest.u.op.pc[i];
            store_arg(st, idx);
            continue;
        }
        if (sig & PARROT_ARG_OPT_FLAG) {
            idx = st->dest.u.op.pc[i];
            CTX_REG_INT(st->dest.ctx, idx) = 0;
            continue;
        }
        idx = st->dest.u.op.pc[n_i];
        param = st->dest.ctx->constants[idx]->u.string;
        real_exception(interpreter, NULL, E_ValueError,
                "too few arguments passed - missing required named arg '%Ss'",
                param);
    }
}

static void
process_args(Interp *interpreter, struct call_state *st, 
        const char *action, int err_check)
{
    int state, opt_flag;
    INTVAL idx;

    if (!st->src.n)
        st->dest.mode |= CALL_STATE_END_x;
    if (!st->dest.n)
        st->dest.mode |= CALL_STATE_x_END;
    do {
        Parrot_fetch_arg(interpreter, st);
        state = st->dest.mode & CALL_STATE_MASK;
        /*
         * finished if both are at end or src at end
         * and we are slurpying
         */
        if ((state & CALL_STATE_END_x) && 
                ((state & CALL_STATE_x_END) ||
                 (state & CALL_STATE_SLURP)))
            return;
        /*
         * handle state changes
         */
        if (!(state & CALL_STATE_NAMED_x)) {
            if (!(state & CALL_STATE_SLURP) &&
                    (st->dest.sig & 
                     (PARROT_ARG_SLURPY_ARRAY|PARROT_ARG_NAME)) == 
                    PARROT_ARG_SLURPY_ARRAY) {
                /* create array */
                idx = st->dest.u.op.pc[st->dest.i];
                assert(idx >= 0);
                create_slurpy_ar(interpreter, st, idx);
                state = CALL_STATE_POS_POS_SLURP;
            }
            /* positional src -> named src */
            if (st->name) {
                st->dest.mode |= CALL_STATE_NAMED_x;

                if (state == CALL_STATE_POS_POS_SLURP) {
                    /* stop slurpy array */
                    st->dest.slurp = NULL;
                    st->dest.mode &= ~CALL_STATE_SLURP;
                    /*
                     * work around bad interaction of _NEXT_ARG
                     * and flattening (which always advances to next)
                     * TODO rewrite all again, now that all pieces are
                     * together
                     */
                    if (st->src.mode & CALL_STATE_FLATTEN) {
                        if (!next_arg(interpreter, &st->dest)) {
                            st->dest.mode |= CALL_STATE_x_END;
                        }
                    }
                    else {
                        st->src.mode &= ~CALL_STATE_NEXT_ARG;
                        st->dest.mode |= CALL_STATE_NEXT_ARG;
                        continue;
                    }
                }
            }
        }
        if (!(state & CALL_STATE_x_NAMED) &&
                (st->dest.sig & PARROT_ARG_NAME)) {
            /* pos -> named dest */
            init_named(interpreter, st);
        }

        state = st->dest.mode & CALL_STATE_MASK;
        switch(state) {
            case CALL_STATE_NAMED_NAMED: 
            case CALL_STATE_NAMED_NAMED_OPT: 
                if (!locate_named_named(interpreter, st))
                    real_exception(interpreter, NULL, E_ValueError,
                            "too many named arguments - '%Ss' not expected",
                            st->name);
                if (st->dest.mode & CALL_STATE_SLURP)
                    state         |= CALL_STATE_SLURP;
                break;
            case CALL_STATE_POS_NAMED: 
                locate_pos_named(interpreter, st);
                break;
        }
        if (st->dest.sig & PARROT_ARG_OPTIONAL) {
            st->dest.mode |= CALL_STATE_OPT;
            state         |= CALL_STATE_OPT;
        }
        else if (state & CALL_STATE_SLURP) {
            st->dest.sig &= ~PARROT_ARG_TYPE_MASK;
            st->dest.sig |= PARROT_ARG_PMC;
        }

        switch(state) {
            case CALL_STATE_POS_POS: 
                st->dest.mode |= CALL_STATE_NEXT_ARG;
                /* fall through */
            case CALL_STATE_NAMED_NAMED: 
            case CALL_STATE_POS_NAMED: 
                Parrot_convert_arg(interpreter, st);
                idx = st->dest.u.op.pc[st->dest.i];
                assert(idx >= 0);
                store_arg(st, idx);
                break;
            case CALL_STATE_NAMED_NAMED_OPT: 
            case CALL_STATE_POS_POS_OPT: 
                ++st->optionals;
                Parrot_convert_arg(interpreter, st);
                opt_flag = 1;
store_opt:
                idx = st->dest.u.op.pc[st->dest.i];
                assert(idx >= 0);
                store_arg(st, idx);
                /* :opt_flag is truely optional */
                if (!next_arg(interpreter, &st->dest)) {
                    if (!(state & CALL_STATE_x_NAMED))
                        st->dest.mode |= CALL_STATE_x_END;
                    break;
                }
                if (!(st->dest.sig & PARROT_ARG_OPT_FLAG)) {
                    st->dest.i--;
                    if (!(state & CALL_STATE_x_NAMED))
                        st->dest.mode |= CALL_STATE_NEXT_ARG;
                    break;
                }
                --st->params;
                idx = st->dest.u.op.pc[st->dest.i];
                assert(idx >= 0);
                CTX_REG_INT(st->dest.ctx, idx) = opt_flag;
                if (!(state & CALL_STATE_x_NAMED))
                    st->dest.mode |= CALL_STATE_NEXT_ARG;
                break;
            case CALL_STATE_END_POS_OPT: 
                ++st->optionals;
                null_val(st->dest.sig, st);
                opt_flag = 0;
                goto store_opt;
            case CALL_STATE_END_NAMED_NAMED|CALL_STATE_OPT: 
            case CALL_STATE_END_NAMED_NAMED: 
            case CALL_STATE_END_POS_NAMED: 
                check_named(interpreter, st, action);
                return;
            case CALL_STATE_END_x: 
                if (err_check)
                    too_few(interpreter, st, action);
                return;
            case CALL_STATE_x_END|CALL_STATE_OPT: 
            case CALL_STATE_x_END: 
                if (err_check)
                    too_many(interpreter, st, action);
                return;
            case CALL_STATE_END_x|CALL_STATE_SLURP:
                /* this happens when flattening an empty array
                 * into a slurpy
                 */
                return;
            case CALL_STATE_POS_POS_SLURP: 
                Parrot_convert_arg(interpreter, st);
                VTABLE_push_pmc(interpreter, st->dest.slurp, 
                        UVal_pmc(st->val));
                break;
            case CALL_STATE_NAMED_POS: 
            case CALL_STATE_NAMED_POS_OPT: 
            case CALL_STATE_NAMED_POS_SLURP: 
                real_exception(interpreter, NULL, E_ValueError,
                        "too many named arguments");
                break;
            case CALL_STATE_NAMED_NAMED_SLURP: 
                Parrot_convert_arg(interpreter, st);
                VTABLE_set_pmc_keyed_str(interpreter, st->dest.slurp, 
                        st->name, UVal_pmc(st->val));
                break;

            default:
                real_exception(interpreter, NULL, 0,
                        "Unhandled process_args state 0x%x",
                        state);
        }
    } while (1);
}

void
Parrot_convert_arg(Interp *interpreter, struct call_state *st)
{
    if (st->src.i >= st->src.n) {
        return;
    }    
    if (st->dest.i >= st->dest.n) {
        return;
    }    
    if ((st->src.sig & PARROT_ARG_TYPE_MASK) == PARROT_ARG_PMC) {
        clone_key_arg(interpreter, st);
    }
    if ((st->dest.sig & PARROT_ARG_TYPE_MASK) ==
        (st->src.sig & PARROT_ARG_TYPE_MASK))
        return;
    switch (st->src.sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_INTVAL:
            convert_arg_from_int(interpreter, st);
            break;
        case PARROT_ARG_FLOATVAL:
            convert_arg_from_num(interpreter, st);
            break;
        case PARROT_ARG_STRING:
            convert_arg_from_str(interpreter, st);
            break;
        case PARROT_ARG_PMC:
            convert_arg_from_pmc(interpreter, st);
            break;

    }
}

int
Parrot_store_arg(Interp *interpreter, struct call_state *st)
{
    INTVAL idx;

    if (st->dest.i >= st->dest.n)
        return 0;
    assert(st->dest.mode & CALL_STATE_OP);
    idx = st->dest.u.op.pc[st->dest.i];
    assert(idx >= 0);
    switch (st->dest.sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_INTVAL:
            CTX_REG_INT(st->dest.ctx, idx) = UVal_int(st->val);
            break;
        case PARROT_ARG_FLOATVAL:
            CTX_REG_NUM(st->dest.ctx, idx) = UVal_num(st->val);
            break;
        case PARROT_ARG_STRING:
            CTX_REG_STR(st->dest.ctx, idx) = UVal_str(st->val);
            break;
        case PARROT_ARG_PMC:
            CTX_REG_PMC(st->dest.ctx, idx) =  UVal_pmc(st->val);
            break;
    }
    if (!(st->dest.mode & CALL_STATE_x_NAMED))
        st->dest.mode |= CALL_STATE_NEXT_ARG;
    return 1;
}

static void
init_call_stats(struct call_state *st)
{
    st->n_actual_args = st->src.n;  /* initial guess, adjusted for :flat args */
    st->optionals = 0; 
    st->params = st->dest.n; 
    st->name = NULL; 
    st->key = NULL; 
    st->first_named = -1; 
}

/*

=item C<opcode_t * parrot_pass_args(Interp *, 
                                    struct PackFile_ByteCode *dst_seg 
                                    parrot_context_t *src_ctx, int what)>

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


opcode_t *
parrot_pass_args(Interp *interpreter,  parrot_context_t *src_ctx,
        parrot_context_t *dest_ctx, int what)
{
    const char *action;
    struct call_state st;
    int err_check;
    opcode_t *src_pc, *dst_pc;

    st.dest.n = 0;      /* XXX */

    if (what == PARROT_OP_get_params_pc) {
        dst_pc = interpreter->current_params;
        src_pc = interpreter->current_args;
        /* the args and params are now 'used.' */
        interpreter->current_args = NULL;
        interpreter->current_params = NULL;
        action = "params";
    }
    else {
        dst_pc = dest_ctx->current_results;
        if (what == PARROT_OP_get_results_pc) {
            src_pc = interpreter->current_returns;
            interpreter->current_returns = NULL;
            action = "results";
        }
        else {
            assert(what == PARROT_OP_set_args_pc);
            src_pc = interpreter->current_args;
            action = "params";
        }
        interpreter->current_args = NULL;
    }
    if (!dst_pc) {
        /* XXX error checking */
        return NULL;
    }
    Parrot_init_arg_op(interpreter, dest_ctx, dst_pc, &st.dest);
    Parrot_init_arg_op(interpreter, src_ctx, src_pc, &st.src);
    init_call_stats(&st);
    err_check = 1;
    if (what == PARROT_OP_get_results_pc) {
        if (!PARROT_ERRORS_test(interpreter, PARROT_ERRORS_RESULT_COUNT_FLAG))
            err_check = 0;
    } else {
        if (!PARROT_ERRORS_test(interpreter, PARROT_ERRORS_PARAM_COUNT_FLAG))
            err_check = 0;
    }
    process_args(interpreter, &st, action, err_check);

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
    Parrot_init_arg_sig(interpreter,
            old_ctxp, sig, PARROT_VA_TO_VAPTR(ap), &st.src);

    init_call_stats(&st);
    process_args(interpreter, &st, "params", 1);

    return dest + st.dest.n + 2;
}

opcode_t *
parrot_pass_args_to_result(Interp *interpreter, const char *sig,
        opcode_t *dest, parrot_context_t * old_ctxp, va_list ap)
{
    struct call_state st;

    Parrot_init_arg_op(interpreter,
            CONTEXT(interpreter->ctx), dest, &st.dest);
    Parrot_init_arg_sig(interpreter,
            old_ctxp, sig, PARROT_VA_TO_VAPTR(ap), &st.src);

    init_call_stats(&st);
    process_args(interpreter, &st, "params", 1);
    return dest + st.dest.n + 2;
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

F<include/parrot/interpreter.h>, F<src/inter_run.c>, F<src/pmc/sub.pmc>.

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
