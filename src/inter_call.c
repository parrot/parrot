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



static int next_arg(Interp *, struct call_state_item *st);
static void next_arg_sig(Interp *interp, struct call_state_item *st);
static int set_retval_util(Parrot_Interp interp, const char *sig, parrot_context_t *ctx,
        struct call_state *st);

/*

=item C<int Parrot_init_arg_nci(Interp *, struct call_state *st, const char *sig)>

Initialize the argument passing state C<call_state> for the given NCI signature.

=item C<int Parrot_init_ret_nci(Interp *, struct call_state *st, const char *sig)>

Initialize the return value passing state C<call_state> for the given NCI signature.

=cut

*/

int
Parrot_init_arg_nci(Interp *interp, struct call_state *st, const char *sig)
{
    Parrot_init_arg_op(interp, CONTEXT(interp->ctx), interp->current_args, &st->src);
    Parrot_init_arg_sig(interp, CONTEXT(interp->ctx), sig, NULL, &st->dest);
    return 1;
}

int
Parrot_init_ret_nci(Interp *interp, struct call_state *st, const char *sig)
{
    struct Parrot_Context *ctx = CONTEXT(interp->ctx);
    PMC *current_cont = ctx->current_cont;
    /*
     * if this NCI call was a taicall, return results to caller's get_results
     * this also means that we pass the caller's register base pointer
     */
    if (SUB_FLAG_TAILCALL_ISSET(current_cont)) {
        ctx = PMC_cont(current_cont)->to_ctx;
    }

    /* TODO simplify all */
    Parrot_init_arg_sig(interp, CONTEXT(interp->ctx), sig, NULL, &st->src);
    Parrot_init_arg_op(interp, ctx, ctx->current_results, &st->dest);
    return 1;
}

/*

=item C<int Parrot_init_arg_sig(Interp *, parrot_context_t *ctx,
        const char *sig, void *ap, struct call_state_item *st)>

Initialize argument transfer with given code segment (holding the
const_table), registers, function signature, and arguments.

=item C<int Parrot_init_arg_op(Interp *, parrot_context_t *ctx,
        opcode_t *pc, struct call_state_item *st)>

Initialize argument transfer with given context registers, and opcode
location of a get_ or set_ argument opcode.

Both functions can be used for either source or destination, by passing
either C<&st.src> or C<&st.dest> of a C<call_state> structure.

These functions return 0, if no arguments are present, or 1 on success.

=cut

*/

int
Parrot_init_arg_op(Interp *interp, parrot_context_t *ctx,
        opcode_t *pc, struct call_state_item *st)
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
        /* initialize st->sig */
        if (st->n)
            next_arg_sig(interp, st);

    }
    return st->n > 0;
}

int
Parrot_init_arg_sig(Interp *interp, parrot_context_t *ctx,
        const char *sig, void *ap, struct call_state_item *st)
{
    st->i = 0;
    st->n = 0;
    st->mode = CALL_STATE_SIG;
    st->ctx = ctx;
    st->sig = 0;

    if (*sig) {
        st->u.sig.sig = sig;
        st->u.sig.ap = ap;
        st->n = strlen(sig);
        /* initialize st->sig */
        if (st->n)
          next_arg_sig(interp, st);
    }
    return st->n > 0;
}

/* mark the source state as flattening with the passed
 * PMC being flattened, and fetch the first arg from the flattened set.
 */
static void
make_flattened(Interp *interp, struct call_state *st, PMC *p_arg)
{
    if (PARROT_ARG_NAME_ISSET(st->src.sig)) {
        /* src ought to be an hash */
        if (!VTABLE_does(interp, p_arg, CONST_STRING(interp, "hash"))) {
            real_exception(interp, NULL, E_ValueError, "argument doesn't hash");
        }

        /* create key needed to iterate the hash */
        st->key = pmc_new(interp, enum_class_Key);
        PMC_int_val(st->key) = 0;
        PMC_data(st->key)    = (void*)INITBucketIndex;
    }
    else {
        /* src ought to be an array */
        if (!VTABLE_does(interp, p_arg, CONST_STRING(interp, "array"))) {
            real_exception(interp, NULL, E_ValueError, "argument doesn't array");
        }
    }

    st->src.mode |= CALL_STATE_FLATTEN;
    st->src.slurp = p_arg;
    st->src.slurp_i = 0;
    st->src.slurp_n = VTABLE_elements(interp, p_arg);
    /* the -1 is because the :flat PMC itself doesn't count. */
    st->n_actual_args += st->src.slurp_n - 1;
    Parrot_fetch_arg(interp, st);
}


static void
next_arg_sig(Interp *interp, struct call_state_item *st)
{
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
}

static int
next_arg(Interp *interp, struct call_state_item *st)
{
    st->i++;
    if (st->i >= st->n) {
        st->sig = 0;
        return 0;
    }
    st->mode &= ~CALL_STATE_NEXT_ARG;
    next_arg_sig(interp, st);
    return 1;
}

static void
fetch_arg_sig(Interp *interp, struct call_state *st)
{
    va_list *ap;

    if (st->dest.mode & CALL_STATE_NEXT_ARG)
        next_arg(interp, &st->dest);

    if (!st->src.n)
        return;

    if (st->src.mode & CALL_STATE_NEXT_ARG) {
        if (!next_arg(interp, &st->src))
            return;
    }

    ap = (va_list*)(st->src.u.sig.ap);
    switch (st->src.sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_INTVAL:
            UVal_int(st->val) = va_arg(*ap, INTVAL);
            break;
        case PARROT_ARG_STRING:
            UVal_str(st->val) = va_arg(*ap, STRING*);
            break;
        case PARROT_ARG_FLOATVAL:
            UVal_num(st->val) = va_arg(*ap, FLOATVAL);
            break;
        case PARROT_ARG_PMC:
            if (st->src.u.sig.sig[st->src.i] == 'O')
                UVal_pmc(st->val) = CONTEXT(interp->ctx)->current_object;
            else
                UVal_pmc(st->val) = va_arg(*ap, PMC*);

            if (st->src.sig & PARROT_ARG_FLATTEN) {
                make_flattened(interp, st, UVal_pmc(st->val));
                return;
            }
            break;
    }
    st->src.mode |= CALL_STATE_NEXT_ARG;
}


static void
fetch_arg_op(Interp *interp, struct call_state *st)
{
    int constant = PARROT_ARG_CONSTANT_ISSET(st->src.sig);
    INTVAL idx = st->src.u.op.pc[st->src.i];

    switch (PARROT_ARG_TYPE_MASK_MASK(st->src.sig)) {
        case PARROT_ARG_INTVAL:
            UVal_int(st->val) = constant ? idx : CTX_REG_INT(st->src.ctx, idx);
            break;
        case PARROT_ARG_STRING:
            UVal_str(st->val) = constant ? st->src.ctx->constants[idx]->u.string
                : CTX_REG_STR(st->src.ctx, idx);
            break;
        case PARROT_ARG_FLOATVAL:
            UVal_num(st->val) = constant ? st->src.ctx->constants[idx]->u.number
                : CTX_REG_NUM(st->src.ctx, idx);
            break;
        case PARROT_ARG_PMC:
            UVal_pmc(st->val) = constant ? st->src.ctx->constants[idx]->u.key
                : CTX_REG_PMC(st->src.ctx, idx);

            if (st->src.sig & PARROT_ARG_FLATTEN) {
                make_flattened(interp, st, UVal_pmc(st->val));
                return;
            }
            break;
    }
    st->src.mode |= CALL_STATE_NEXT_ARG;
}


int
Parrot_fetch_arg(Interp *interp, struct call_state *st)
{
    if (st->dest.mode & CALL_STATE_NEXT_ARG) {
        if (!next_arg(interp, &st->dest))
            st->dest.mode |= CALL_STATE_x_END;
    }
    if (!st->src.n) {
        st->dest.mode |= CALL_STATE_END_x;
        return 0;
    }
    if (st->src.mode & CALL_STATE_NEXT_ARG) {
        if (!next_arg(interp, &st->src)) {
            st->dest.mode |= CALL_STATE_END_x;
            return 0;
        }
    }
#if 0
    /* NOT YET
     * e.g.
     * $ make
     * ../../parrot pgc.pir  --output=PGE/builtins_gen.pir PGE/builtins.pg
     * positional inside named args
     * ...
     */

    if ((st->dest.mode & CALL_STATE_NAMED_x) && !(st->src.sig & PARROT_ARG_NAME))
        real_exception(interp, NULL, E_ValueError, "positional inside named args");
#endif

    if (st->src.mode & CALL_STATE_FLATTEN) {
        if (st->src.slurp_i < st->src.slurp_n) {
            PMC *elem;
            if (st->key) {
                st->src.slurp_i++;
                st->name = parrot_hash_get_idx(interp, PMC_struct_val(st->src.slurp), st->key);
                assert(st->name);
                elem = VTABLE_get_pmc_keyed_str(interp, st->src.slurp, st->name);
            }
            else {
                elem = VTABLE_get_pmc_keyed_int(interp, st->src.slurp, st->src.slurp_i++);
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
        return Parrot_fetch_arg(interp, st);
    }

    if ((st->src.sig & PARROT_ARG_NAME) && !(st->src.sig & PARROT_ARG_FLATTEN)) {
        fetch_arg_op(interp, st);
        st->name = UVal_str(st->val);
        next_arg(interp, &st->src);
    }
    switch (st->src.mode & CALL_S_D_MASK) {
        case CALL_STATE_OP:
            fetch_arg_op(interp, st);
            break;
        case CALL_STATE_SIG:
            fetch_arg_sig(interp, st);
            break;
    }
    return 1;
}


int
Parrot_fetch_arg_nci(Interp *interp, struct call_state *st)
{
    Parrot_fetch_arg(interp, st);
    if (st->dest.sig & PARROT_ARG_SLURPY_ARRAY) {
        PMC *slurped;
        assert((st->dest.sig & PARROT_ARG_TYPE_MASK) == PARROT_ARG_PMC);
        slurped = pmc_new(interp, enum_class_ResizablePMCArray);
        while (!(st->dest.mode & CALL_STATE_END_x)) {
            Parrot_convert_arg(interp, st);
            st->dest.mode |= CALL_STATE_SLURP;
            VTABLE_push_pmc(interp, slurped, UVal_pmc(st->val));
            Parrot_fetch_arg(interp, st);
        }
        UVal_pmc(st->val) = slurped;
    }
    else {
        Parrot_convert_arg(interp, st);
        st->dest.mode |= CALL_STATE_NEXT_ARG;
    }
    return 1;
}

static void
convert_arg_from_int(Interp *interp, struct call_state *st)
{
    PMC *d;

    switch (st->dest.sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_FLOATVAL:
            UVal_num(st->val) = (FLOATVAL)UVal_int(st->val);
            break;
        case PARROT_ARG_STRING:
            UVal_str(st->val) = string_from_int(interp, UVal_int(st->val));
            break;
        case PARROT_ARG_PMC:
            d = pmc_new(interp, Parrot_get_ctx_HLL_type(interp, enum_class_Integer));
            VTABLE_set_integer_native(interp, d, UVal_int(st->val));
            UVal_pmc(st->val) = d;
            break;
    }
}

static void
convert_arg_from_num(Interp *interp, struct call_state *st)
{
    PMC *d;

    switch (st->dest.sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_INTVAL:
            UVal_int(st->val) = (INTVAL)UVal_num(st->val);
            break;
        case PARROT_ARG_STRING:
            UVal_str(st->val) = string_from_num(interp, UVal_num(st->val));
            break;
        case PARROT_ARG_PMC:
            d = pmc_new(interp, Parrot_get_ctx_HLL_type(interp, enum_class_Float));
            VTABLE_set_number_native(interp, d, UVal_num(st->val));
            UVal_pmc(st->val) = d;
            break;
    }
}

static void
convert_arg_from_str(Interp *interp, struct call_state *st)
{
    PMC *d;

    switch (st->dest.sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_INTVAL:
            UVal_int(st->val) = string_to_int(interp, UVal_str(st->val));
            break;
        case PARROT_ARG_FLOATVAL:
            UVal_num(st->val) = string_to_num(interp, UVal_str(st->val));
            break;
        case PARROT_ARG_PMC:
            d = pmc_new(interp, Parrot_get_ctx_HLL_type(interp, enum_class_String));
            VTABLE_set_string_native(interp, d, UVal_str(st->val));
            UVal_pmc(st->val) = d;
            break;
    }
}

static void
convert_arg_from_pmc(Interp *interp, struct call_state *st)
{
    switch (st->dest.sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_INTVAL:
            UVal_int(st->val) = VTABLE_get_integer(interp, UVal_pmc(st->val));
            break;
        case PARROT_ARG_FLOATVAL:
            UVal_num(st->val) = VTABLE_get_number(interp, UVal_pmc(st->val));
            break;
        case PARROT_ARG_STRING:
            UVal_str(st->val) = VTABLE_get_string(interp, UVal_pmc(st->val));
            break;
    }
}

/*
 * replace any src register by their values (done inside clone)
 * need a test for tailcalls too, but I think there is no syntax
 * to pass a key to a tailcalled function or method
 */
static void
clone_key_arg(Interp *interp, struct call_state *st)
{
    PMC *key = UVal_pmc(st->val);

    if (key && key->vtable->base_type == enum_class_Key) {
        for (; key; key=key_next(interp, key)) {
            /* register keys have to be cloned */
            if (PObj_get_FLAGS(key) & KEY_register_FLAG) {
                parrot_context_t temp_ctx;

                /* clone sets key values according to refered register items */
                SAVE_OFF_REGS(interp->ctx, (*(st->src.ctx)), temp_ctx)
                UVal_pmc(st->val) = VTABLE_clone(interp, key);
                RESTORE_REGS(interp->ctx, temp_ctx)
                return;
            }
        }
    }
}

/*
 * initializes dest calling state for recption of first named arg.
 */
static void
init_named(Interp *interp, struct call_state *st)
{
    int i, n_named, idx;
    INTVAL sig;

    if (st->dest.mode & CALL_STATE_SIG)
        real_exception(interp, NULL, E_ValueError, "Can't call C function with named arguments");

    st->first_named = st->dest.i;
    n_named = 0;

    /* 1) if we were slurpying positional args, we are done, turn it off
     * 2) set destination named args bit */
    st->dest.mode &= ~CALL_STATE_SLURP;
    st->dest.slurp = NULL;
    st->dest.mode |= CALL_STATE_x_NAMED;

    for (i = st->dest.i; i < st->dest.n; ++i) {
        sig = SIG_ITEM(st->dest.u.op.signature, i);

        /* skip the actual arg, only count the names of the named args */
        if (!(sig & PARROT_ARG_NAME))
            continue;
        /* slurpy named args, create slurpy hash */
        else if (sig & PARROT_ARG_SLURPY_ARRAY) {
            st->dest.slurp = pmc_new(interp, Parrot_get_ctx_HLL_type(interp, enum_class_Hash));
            /* pass the slurpy hash */
            idx = st->dest.u.op.pc[i];
            CTX_REG_PMC(st->dest.ctx, idx) = st->dest.slurp;
        }
        /* must be the name of a named arg, count it */
        else
            n_named++;
    }

    if (n_named >= (int)(sizeof (UINTVAL) * 8))
        real_exception(interp, NULL, E_ValueError, "Too many named arguments");
    st->named_done = 0;
}

/*
 * locate destination pos, return 0 if state changed
 */
static int
locate_pos_named(Interp *interp, struct call_state *st)
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
locate_named_named(Interp *interp, struct call_state *st)
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
        if (st->name == param || 0 == string_equal(interp, st->name, param)) {
            ++i;
            st->dest.sig = SIG_ITEM(st->dest.u.op.signature, i);
            st->dest.i = i;
            /* if bit is set we got duplicated */
            if (st->named_done & (1 << n_named))
                real_exception(interp, NULL, E_ValueError,
                        "duplicate named argument - '%Ss' not expected", param);
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
            CTX_REG_PMC(st->dest.ctx, idx) = UVal_pmc(st->val);
            break;
    }
}

static int
store_current_arg(Interp *interp, struct call_state *st)
{
    INTVAL idx;
    if (st->dest.i >= st->dest.n)
        return 0;

    assert(st->dest.mode & CALL_STATE_OP);
    idx = st->dest.u.op.pc[st->dest.i];
    assert(idx >= 0);
    store_arg(st, idx);

    return 1;
}

int
Parrot_store_arg(Interp *interp, struct call_state *st)
{
    if (!store_current_arg(interp, st))
        return 0;
    if (!(st->dest.mode & CALL_STATE_x_NAMED))
        st->dest.mode |= CALL_STATE_NEXT_ARG;
    return 1;
}



static void
create_slurpy_array(Interp *interp, struct call_state *st, INTVAL idx)
{
    st->dest.slurp =
        pmc_new(interp, Parrot_get_ctx_HLL_type(interp, enum_class_ResizablePMCArray));
    CTX_REG_PMC(st->dest.ctx, idx) = st->dest.slurp;
    st->dest.mode |= CALL_STATE_SLURP;
    st->dest.mode &= ~CALL_STATE_OPT;
}

static void
too_few(Interp *interp, struct call_state *st, const char *action)
{
    int max_expected_args = st->params;
    int min_expected_args = max_expected_args - st->optionals;
    if (st->n_actual_args < min_expected_args) {
        real_exception(interp, NULL, E_ValueError,
                "too few arguments passed (%d) - %s%d %s expected",
                st->n_actual_args,
                (min_expected_args < max_expected_args ? "at least " : ""),
                min_expected_args, action);
    }
}

static void
too_many(Interp *interp, struct call_state *st, const char *action)
{
    int max_expected_args = st->params;
    int min_expected_args = max_expected_args - st->optionals;
    if (st->n_actual_args > max_expected_args) {
        real_exception(interp, NULL, E_ValueError,
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
check_named(Interp *interp, struct call_state *st, const char *action)
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
        real_exception(interp, NULL, E_ValueError,
                "too few arguments passed - missing required named arg '%Ss'", param);
    }
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

static void
process_args(Interp *interp, struct call_state *st, const char *action, int err_check)
{
    int state, opt_flag;
    INTVAL idx;

    if (!st->src.n)
        st->dest.mode |= CALL_STATE_END_x;
    if (!st->dest.n)
        st->dest.mode |= CALL_STATE_x_END;

    init_call_stats(st);

    do {
        Parrot_fetch_arg(interp, st);
        state = st->dest.mode & CALL_STATE_MASK;

        /*  finished if both are at end or src at end * and we are slurpying */
        if ((state & CALL_STATE_END_x) &&
                ((state & CALL_STATE_x_END) || (state & CALL_STATE_SLURP)))
            return;

        /*
         * handle state changes
         */
        if (!(state & CALL_STATE_NAMED_x)) {
            if (!(state & CALL_STATE_SLURP) &&
                    (st->dest.sig & (PARROT_ARG_SLURPY_ARRAY|PARROT_ARG_NAME)) == PARROT_ARG_SLURPY_ARRAY) {
                /* create dest slurp array */
                idx = st->dest.u.op.pc[st->dest.i];
                assert(idx >= 0);
                create_slurpy_array(interp, st, idx);
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
                        if (!next_arg(interp, &st->dest)) {
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

        /* first dest named arg, setup for recieving of named args */
        if (!(state & CALL_STATE_x_NAMED) && (st->dest.sig & PARROT_ARG_NAME)) {
            /* pos -> named dest */
            init_named(interp, st);
        }

        state = st->dest.mode & CALL_STATE_MASK;
        switch (state) {
            case CALL_STATE_NAMED_NAMED:
            case CALL_STATE_NAMED_NAMED_OPT:
                if (!locate_named_named(interp, st))
                    real_exception(interp, NULL, E_ValueError,
                            "too many named arguments - '%Ss' not expected", st->name);
                if (st->dest.mode & CALL_STATE_SLURP)
                    state |= CALL_STATE_SLURP;
                break;
            case CALL_STATE_POS_NAMED:
                locate_pos_named(interp, st);
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

        switch (state) {
            case CALL_STATE_POS_POS:
                st->dest.mode |= CALL_STATE_NEXT_ARG;
                Parrot_convert_arg(interp, st);
                store_current_arg(interp, st);
                break;

            case CALL_STATE_NAMED_NAMED:
            case CALL_STATE_POS_NAMED:
                Parrot_convert_arg(interp, st);
                store_current_arg(interp, st);
                break;

            case CALL_STATE_NAMED_NAMED_OPT:
            case CALL_STATE_POS_POS_OPT:
                opt_flag = 1;

              store_opt:
                ++st->optionals;
                Parrot_convert_arg(interp, st);
                store_current_arg(interp, st);

                /* :opt_flag is truely optional */
                if (!next_arg(interp, &st->dest)) {
                    /* do nothing */
                }
                else if (!(st->dest.sig & PARROT_ARG_OPT_FLAG)) {
                    st->dest.i--;
                }
                else
                {
                    int idx = st->dest.u.op.pc[st->dest.i];
                    --st->params;
                    assert(idx >= 0);
                    CTX_REG_INT(st->dest.ctx, idx) = opt_flag;
                }
                if (!(state & CALL_STATE_x_NAMED))
                    st->dest.mode |= CALL_STATE_NEXT_ARG;
                break;
            case CALL_STATE_END_POS_OPT:
                null_val(st->dest.sig, st);
                opt_flag = 0;
                goto store_opt;
            case CALL_STATE_POS_POS_SLURP:
                Parrot_convert_arg(interp, st);
                VTABLE_push_pmc(interp, st->dest.slurp, UVal_pmc(st->val));
                break;
            case CALL_STATE_NAMED_NAMED_SLURP:
                Parrot_convert_arg(interp, st);
                VTABLE_set_pmc_keyed_str(interp, st->dest.slurp, st->name, UVal_pmc(st->val));
                break;

            case CALL_STATE_END_NAMED_NAMED|CALL_STATE_OPT:
            case CALL_STATE_END_NAMED_NAMED:
            case CALL_STATE_END_POS_NAMED:
                check_named(interp, st, action);
                return;

            /* error conditions */
            case CALL_STATE_END_x:
                if (err_check)
                    too_few(interp, st, action);
                return;
            case CALL_STATE_x_END|CALL_STATE_OPT:
            case CALL_STATE_x_END:
                if (err_check)
                    too_many(interp, st, action);
                return;
            case CALL_STATE_END_x|CALL_STATE_SLURP:
                /* this happens when flattening an empty array into a slurpy */
                return;
            case CALL_STATE_NAMED_POS:
            case CALL_STATE_NAMED_POS_OPT:
            case CALL_STATE_NAMED_POS_SLURP:
                real_exception(interp, NULL, E_ValueError, "too many named arguments");
                break;
            case CALL_STATE_NAMED_x|CALL_STATE_x_NAMED|CALL_STATE_x_END:
                /* XXX: this state doesn't properly reflect what's going on */
                real_exception(interp, NULL, 0,
                        "positional inside named args at position %i", st->src.i-1);
                break;
            default:
                real_exception(interp, NULL, 0, "Unhandled process_args state 0x%x", state);
                break;
        }
    } while (1);
}

void
Parrot_convert_arg(Interp *interp, struct call_state *st)
{
#define END_OF_ARGS(x) (x.i >= x.n )
    /* if END OF SRC or DEST ARGS, no need to convert */
    if ((END_OF_ARGS(st->src) || END_OF_ARGS(st->dest)))
        return;

    /* register key args have to be cloned */
    if ((st->src.sig & PARROT_ARG_TYPE_MASK) == PARROT_ARG_PMC)
        clone_key_arg(interp, st);

    /* if types are already equivalent, no need to convert */
    if (PARROT_ARG_TYPE(st->dest.sig) == PARROT_ARG_TYPE(st->src.sig))
        return;

    /* convert */
    switch (st->src.sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_INTVAL:
            convert_arg_from_int(interp, st);
            break;
        case PARROT_ARG_FLOATVAL:
            convert_arg_from_num(interp, st);
            break;
        case PARROT_ARG_STRING:
            convert_arg_from_str(interp, st);
            break;
        case PARROT_ARG_PMC:
            convert_arg_from_pmc(interp, st);
            break;

    }
}


/*

=item C<opcode_t * parrot_pass_args(Interp *,
                    parrot_context_t *src_ctx, parrot_context_t *dest_ctx,
                    opcode_t *src_index, optcode_t *dest_index, const char *action)>


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

void
parrot_pass_args(Interp *interp, parrot_context_t *src_ctx, parrot_context_t *dest_ctx,
        opcode_t *src_indexes, opcode_t *dest_indexes, int mode)
{
    struct call_state st;
    int err_check = 1;
    const char *action = mode ? "results" : "params";
    st.dest.n = 0;      /* XXX */

    if (!dest_indexes)
        return;

    Parrot_init_arg_op(interp, dest_ctx, dest_indexes, &st.dest);
    Parrot_init_arg_op(interp, src_ctx, src_indexes, &st.src);

    if (mode == 1) {
        if (!PARROT_ERRORS_test(interp, PARROT_ERRORS_RESULT_COUNT_FLAG))
            err_check = 0;
    }
    else {
        if (!PARROT_ERRORS_test(interp, PARROT_ERRORS_PARAM_COUNT_FLAG))
            err_check = 0;
    }
    process_args(interp, &st, action, err_check);
}

/*

=item C<opcode_t *parrot_pass_args_fromc(Interp *, const char *sig,
INTVAL src_n, opcode_t *dest, parrot_context_t * ctxp, va_list ap)>

Pass arguments from C code with given signature to a Parrot Sub.
Prerequsits are like above.

=cut

*/
opcode_t *
parrot_pass_args_fromc(Interp *interp, const char *sig,
        opcode_t *dest, parrot_context_t * old_ctxp, va_list ap)
{
    if (dest[0] != PARROT_OP_get_params_pc) {
        /*
         * main is now started with runops_args_fromc too
         * PASM subs usually don't have get_params
         * XXX we could check, if we are running main
         */
        return dest;
        real_exception(interp, NULL, E_ValueError, "no get_params in sub");
    }

    return parrot_pass_args_to_result(interp, sig, dest, old_ctxp, ap);
}

opcode_t *
parrot_pass_args_to_result(Interp *interp, const char *sig,
        opcode_t *dest, parrot_context_t * old_ctxp, va_list ap)
{
    struct call_state st;

    Parrot_init_arg_op(interp, CONTEXT(interp->ctx), dest, &st.dest);
    Parrot_init_arg_sig(interp, old_ctxp, sig, PARROT_VA_TO_VAPTR(ap), &st.src);

    process_args(interp, &st, "params", 1);
    return dest + st.dest.n + 2;
}

int
set_retval_util(Parrot_Interp interp, const char *sig, parrot_context_t *ctx, struct call_state *st)
{
    opcode_t *src_pc = interp->current_returns;
    int todo = Parrot_init_arg_op(interp, ctx, src_pc, &st->src);

    interp->current_returns = NULL;

    if (todo) {
        todo = Parrot_init_arg_sig(interp, CONTEXT(interp->ctx), sig, NULL, &st->dest);
        if (todo) {
            Parrot_fetch_arg(interp, st);
            Parrot_convert_arg(interp, st);
            return 1;
        }
    }
    return 0;
}

/*
 * handle void, and pointer (PMC*, STRING*) return values
 */
void*
set_retval(Parrot_Interp interp, int sig_ret, parrot_context_t *ctx)
{
    struct call_state st;

    if (!sig_ret || sig_ret == 'v')
        return NULL;

    switch (sig_ret) {
        case 'S':
            if (set_retval_util(interp, "S", ctx, &st))
                return UVal_str(st.val);
        case 'P':
            if (set_retval_util(interp, "P", ctx, &st))
                return UVal_pmc(st.val);
    }
    return NULL;
}

/*
 * handle INTVAL return value
 */
INTVAL
set_retval_i(Parrot_Interp interp, int sig_ret, parrot_context_t *ctx)
{
    struct call_state st;

    if (sig_ret != 'I')
        real_exception(interp, NULL, E_ValueError, "return signature not 'I'");

    if (set_retval_util(interp, "I", ctx, &st))
        return UVal_int(st.val);

    return 0;
}

/*
 * handle FLOATVAL return value
 */
FLOATVAL
set_retval_f(Parrot_Interp interp, int sig_ret, parrot_context_t *ctx)
{
    struct call_state st;

    if (sig_ret != 'N')
        real_exception(interp, NULL, E_ValueError, "return signature not 'N'");

    if (set_retval_util(interp, "N", ctx, &st))
        return UVal_num(st.val);

    return 0.0;
}

/*
 * handle STRING return value
 */
STRING*
set_retval_s(Parrot_Interp interp, int sig_ret, parrot_context_t *ctx)
{
    struct call_state st;

    if (sig_ret != 'S')
        real_exception(interp, NULL, E_ValueError, "return signature not 'S'");

    if (set_retval_util(interp, "S", ctx, &st))
        return UVal_str(st.val);

    return NULL;
}

/*
 * handle PMC return value
 */
PMC*
set_retval_p(Parrot_Interp interp, int sig_ret, parrot_context_t *ctx)
{
    struct call_state st;

    if (sig_ret != 'P')
        real_exception(interp, NULL, E_ValueError, "return signature not 'P'");

    if (set_retval_util(interp, "P", ctx, &st))
        return UVal_pmc(st.val);

    return NULL;
}

/*

=back

=head1 SEE ALSO

F<include/parrot/interpreter.h>, F<src/inter_run.c>, F<src/pmc/sub.pmc>.

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
