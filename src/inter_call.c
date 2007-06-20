/*
Copyright (C) 2001-2007, The Perl Foundation.
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

/* HEADER: include/parrot/inter_call.h */

/* Make sure we don't conflict with any other MAX() macros defined elsewhere */
#define PARROT_MAX(a,b) (((a)) > (b) ? (a) : (b))

#define SAVE_OFF_REGS(orig, next, save) \
        save.bp = orig.bp;\
        save.bp_ps = orig.bp_ps;\
        orig.bp = next.bp;\
        orig.bp_ps = next.bp_ps;

#define RESTORE_REGS(orig, save) \
        orig.bp = save.bp;\
        orig.bp_ps = save.bp_ps;


static void next_arg_sig(call_state_item *st /*NN*/)
    __attribute__nonnull__(1);
static void check_for_opt_flag(call_state *st /*NN*/, int has_arg)
    __attribute__nonnull__(1);

/*

FUNCDOC: Parrot_init_arg_nci

Initialize the argument passing state C<call_state> for the given NCI signature.

FUNCDOC: Parrot_init_ret_nci

Initialize the return value passing state C<call_state> for the given NCI signature.

*/

PARROT_API
int
Parrot_init_arg_nci(Interp *interp /*NN*/, call_state *st /*NN*/, const char *sig /*NN*/)
{
    if (PMC_IS_NULL(interp->args_signature))
        Parrot_init_arg_op(interp, CONTEXT(interp->ctx), interp->current_args, &st->src);
    else
        Parrot_init_arg_indexes_and_sig_pmc(interp, CONTEXT(interp->ctx),
            interp->current_args, interp->args_signature, &st->src);
    Parrot_init_arg_sig(interp, CONTEXT(interp->ctx), sig, NULL, &st->dest);
    return 1;
}

PARROT_API
int
Parrot_init_ret_nci(Interp *interp /*NN*/, call_state *st /*NN*/, const char *sig /*NN*/)
{
    Parrot_Context *ctx                 = CONTEXT(interp->ctx);
    PMC            * const current_cont = ctx->current_cont;
    /*
     * if this NCI call was a taicall, return results to caller's get_results
     * this also means that we pass the caller's register base pointer
     */
    if (SUB_FLAG_TAILCALL_ISSET(current_cont))
        ctx = PMC_cont(current_cont)->to_ctx;

    /* TODO simplify all */
    Parrot_init_arg_sig(interp, CONTEXT(interp->ctx), sig, NULL, &st->src);
    Parrot_init_arg_op(interp, ctx, ctx->current_results, &st->dest);
    return 1;
}

/*

FUNCDOC: Parrot_init_arg_indexes_and_sig_pmc

Initialize argument transfer with given context registers, register indexes, and
a signature pmc.

FUNCDOC: Parrot_init_arg_sig

Initialize argument transfer with given code segment (holding the
const_table), registers, function signature, and arguments.

FUNCDOC: Parrot_init_arg_op

Initialize argument transfer with given context registers, and opcode
location of a get_ or set_ argument opcode.

All functions can be used for either source or destination, by passing
either C<&st.src> or C<&st.dest> of a C<call_state> structure.

These functions return 0, if no arguments are present, or 1 on success.

*/

PARROT_API
int
Parrot_init_arg_indexes_and_sig_pmc(Interp *interp, parrot_context_t *ctx /*NN*/,
        opcode_t *indexes /*NN*/, PMC* sig_pmc /*NN*/, call_state_item *st /*NN*/)
{
    UNUSED(interp);

    if (!sig_pmc && indexes) {
        ++indexes;
        sig_pmc = ctx->constants[*indexes]->u.key;
        ASSERT_SIG_PMC(sig_pmc);
        ++indexes;
    }

    st->used = 1;
    st->i = 0;
    st->n = 0;
    st->mode = CALL_STATE_OP;
    st->ctx = ctx;
    st->sig = 0;

    if (indexes) {
        ASSERT_SIG_PMC(sig_pmc);
        st->u.op.signature = sig_pmc;
        st->u.op.pc = indexes;
        st->n = SIG_ELEMS(sig_pmc);
        /* initialize st->sig */
        if (st->n)
            next_arg_sig(st);

    }
    return st->n > 0;
}

PARROT_API
int
Parrot_init_arg_op(Interp *interp, parrot_context_t *ctx /*NN*/, opcode_t *pc /*NULLOK*/,
    call_state_item *st /*NN*/)
{
    PMC *sig_pmc = PMCNULL;

    if (pc) {
        ++pc;
        sig_pmc = ctx->constants[*pc]->u.key;
        ASSERT_SIG_PMC(sig_pmc);
        ++pc;
    }
    return Parrot_init_arg_indexes_and_sig_pmc(interp, ctx, pc, sig_pmc, st);
}

PARROT_API
int
Parrot_init_arg_sig(Interp *interp, parrot_context_t *ctx, const char *sig /*NN*/,
    void *ap, call_state_item *st /*NN*/)
{
    UNUSED(interp);

    st->used = 1;
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
          next_arg_sig(st);
    }
    return st->n > 0;
}

/* mark the source state as flattening with the passed
 * PMC being flattened, and fetch the first arg from the flattened set.
 */
static void
start_flatten(Interp *interp /*NN*/, call_state *st /*NN*/, PMC *p_arg)
{
    if (PARROT_ARG_NAME_ISSET(st->src.sig)) {
        /* src ought to be an hash */
        if (!VTABLE_does(interp, p_arg, CONST_STRING(interp, "hash"))) {
            real_exception(interp, NULL, E_ValueError, "argument doesn't hash");
        }

        /* create key needed to iterate the hash */
        st->key              = pmc_new(interp, enum_class_Key);
        PMC_int_val(st->key) = 0;
        PMC_data(st->key)    = (void*)INITBucketIndex;
        dod_register_pmc(interp, st->key);
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
}


static void
next_arg_sig(call_state_item *st /*NN*/)
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
fetch_arg_sig(Interp *interp /*NN*/, call_state *st /*NN*/)
{
    va_list *ap = (va_list*)(st->src.u.sig.ap);
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
                int retval;
                start_flatten(interp, st, UVal_pmc(st->val));

                /* if the :flat arg is empty, just go to the next arg */
                if (!st->src.slurp_n) {
                    st->src.mode &= ~CALL_STATE_FLATTEN;
                    st->src.i++;
                }

                st->src.used = 1;
                retval       = Parrot_fetch_arg(interp, st);

                if (!PMC_IS_NULL(st->key))
                    dod_unregister_pmc(interp, st->key);

                return retval;
            }
            break;
    }
    st->src.i++;
    return 1;
}


static int
fetch_arg_op(Interp *interp /*NN*/, call_state *st /*NN*/)
{
    const int constant = PARROT_ARG_CONSTANT_ISSET(st->src.sig);
    const INTVAL idx = st->src.u.op.pc[st->src.i];

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
                int retval;
                start_flatten(interp, st, UVal_pmc(st->val));

                /* if the :flat arg is empty, just go to the next arg */
                if (!st->src.slurp_n) {
                    st->src.mode &= ~CALL_STATE_FLATTEN;
                    st->src.i++;
                }

                st->src.used = 1;
                retval       = Parrot_fetch_arg(interp, st);

                if (!PMC_IS_NULL(st->key))
                    dod_unregister_pmc(interp, st->key);

                return retval;
            }
            break;
    }
    st->src.i++;
    return 1;
}

PARROT_API
int
Parrot_fetch_arg(Interp *interp /*NN*/, call_state *st /*NN*/)
{
    if (!st->src.used)
        return 1;
    if (st->src.i >= st->src.n)
        return 0;
    st->src.used = 0;

    next_arg_sig(&st->src);

    /* check if we're at a :flat argument */
    if (st->src.mode & CALL_STATE_FLATTEN) {
        PMC *elem;
        assert(st->src.slurp_i < st->src.slurp_n);
        if (!PMC_IS_NULL(st->key)) {
            st->src.slurp_i++;
            st->name = (STRING *)parrot_hash_get_idx(interp,
                            (Hash *)PMC_struct_val(st->src.slurp), st->key);
            assert(st->name);
            elem = VTABLE_get_pmc_keyed_str(interp, st->src.slurp, st->name);
        }
        else {
            elem = VTABLE_get_pmc_keyed_int(interp, st->src.slurp, st->src.slurp_i++);
        }
        st->src.sig = PARROT_ARG_PMC;
        UVal_pmc(st->val) = elem;

        /* done with flattening */
        if (st->src.slurp_i == st->src.slurp_n) {
            st->src.mode &= ~CALL_STATE_FLATTEN;
            if (!PMC_IS_NULL(st->key))
                dod_unregister_pmc(interp, st->key);
            st->key = PMCNULL;
            st->src.i++;
        }

        return 1;
    }

    /* If we're at a named arg, store the name and then get the next arg, which
     * is the actual value of the named arg. */
    if ((st->src.sig & PARROT_ARG_NAME) && !(st->src.sig & PARROT_ARG_FLATTEN)) {
        fetch_arg_op(interp, st);
        st->name = UVal_str(st->val);
        next_arg_sig(&st->src);
    }
    switch (st->src.mode & CALL_S_D_MASK) {
        case CALL_STATE_OP:
            return fetch_arg_op(interp, st);
        case CALL_STATE_SIG:
            return fetch_arg_sig(interp, st);
    }

    internal_exception(1, "invalid call state mode");
    return 0;
}


PARROT_API
int
Parrot_fetch_arg_nci(Interp *interp /*NN*/, call_state *st /*NN*/)
{
    next_arg_sig(&st->dest);
    if (st->dest.sig & PARROT_ARG_SLURPY_ARRAY) {
        PMC *slurped;
        assert((st->dest.sig & PARROT_ARG_TYPE_MASK) == PARROT_ARG_PMC);
        slurped = pmc_new(interp, enum_class_ResizablePMCArray);
        while (Parrot_fetch_arg(interp, st)) {
            st->src.used = 1;
            Parrot_convert_arg(interp, st);
            VTABLE_push_pmc(interp, slurped, UVal_pmc(st->val));
        }
        UVal_pmc(st->val) = slurped;
    }
    else {
        Parrot_fetch_arg(interp, st);
        st->src.used = 1;
        Parrot_convert_arg(interp, st);
    }
    st->dest.i++;
    return 1;
}

static void
convert_arg_from_int(Interp *interp /*NN*/, call_state *st /*NN*/)
{
    switch (st->dest.sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_FLOATVAL:
            UVal_num(st->val) = (FLOATVAL)UVal_int(st->val);
            break;
        case PARROT_ARG_STRING:
            UVal_str(st->val) = string_from_int(interp, UVal_int(st->val));
            break;
        case PARROT_ARG_PMC:
            {
            PMC * const d = pmc_new(interp, Parrot_get_ctx_HLL_type(interp, enum_class_Integer));
            VTABLE_set_integer_native(interp, d, UVal_int(st->val));
            UVal_pmc(st->val) = d;
            }
            break;
    }
}

static void
convert_arg_from_num(Interp *interp /*NN*/, call_state *st /*NN*/)
{
    switch (st->dest.sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_INTVAL:
            UVal_int(st->val) = (INTVAL)UVal_num(st->val);
            break;
        case PARROT_ARG_STRING:
            UVal_str(st->val) = string_from_num(interp, UVal_num(st->val));
            break;
        case PARROT_ARG_PMC:
            {
            PMC * const d = pmc_new(interp, Parrot_get_ctx_HLL_type(interp, enum_class_Float));
            VTABLE_set_number_native(interp, d, UVal_num(st->val));
            UVal_pmc(st->val) = d;
            }
            break;
    }
}

static void
convert_arg_from_str(Interp *interp /*NN*/, call_state *st /*NN*/)
{
    switch (st->dest.sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_INTVAL:
            UVal_int(st->val) = string_to_int(interp, UVal_str(st->val));
            break;
        case PARROT_ARG_FLOATVAL:
            UVal_num(st->val) = string_to_num(interp, UVal_str(st->val));
            break;
        case PARROT_ARG_PMC:
            {
            PMC * const d = pmc_new(interp, Parrot_get_ctx_HLL_type(interp, enum_class_String));
            VTABLE_set_string_native(interp, d, UVal_str(st->val));
            UVal_pmc(st->val) = d;
            }
            break;
    }
}

static void
convert_arg_from_pmc(Interp *interp /*NN*/, call_state *st /*NN*/)
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

static void
check_for_opt_flag(call_state *st /*NN*/, int has_arg)
{
    INTVAL idx;
    call_state_item * const dest = &st->dest;

    ++st->optionals;

    /* look at the next arg */
    dest->i++;
    if (dest->i >= dest->n)
        return;

    next_arg_sig(dest);
    /* if this isn't an :opt_flag argument, we need to reset things
     * and go to the next argument */
    if (!(st->dest.sig & PARROT_ARG_OPT_FLAG)) {
        dest->i--;
        return;
    }

    /* we're at an :opt_flag argument, so actually store something */
    idx = st->dest.u.op.pc[st->dest.i];
    --st->params;
    assert(idx >= 0);
    CTX_REG_INT(st->dest.ctx, idx) = has_arg;
}

/*
 * replace any src register by their values (done inside clone)
 * need a test for tailcalls too, but I think there is no syntax
 * to pass a key to a tailcalled function or method
 */
static void
clone_key_arg(Interp *interp /*NN*/, call_state *st /*NN*/)
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
init_first_dest_named(Interp *interp /*NN*/, call_state *st /*NN*/)
{
    int i, n_named;

    if (st->dest.mode & CALL_STATE_SIG)
        real_exception(interp, NULL, E_ValueError, "Can't call C function with named arguments");

    st->first_named = st->dest.i;
    n_named = 0;

    /* 1) if we were slurpying positional args, we are done, turn it off
     * 2) set destination named args bit */
    st->dest.slurp = NULL;

    /* 1) count named args, make sure there is less than 32/64
     * 2) create slurpy hash if needed */
    for (i = st->dest.i; i < st->dest.n; ++i) {
        const INTVAL sig = SIG_ITEM(st->dest.u.op.signature, i);

        /* skip the arg name, only count the actual args of the named args */
        if (!(sig & PARROT_ARG_NAME))
            continue;
        /* slurpy named args, create slurpy hash */
        else if (sig & PARROT_ARG_SLURPY_ARRAY) {
            int idx;

            /* Create PMC for slurpy mode and register it; we must do this
             * otherwise it may get collected. */
            st->dest.slurp = pmc_new(interp, Parrot_get_ctx_HLL_type(interp, enum_class_Hash));
            dod_register_pmc(interp, st->dest.slurp);

            /* pass the slurpy hash */
            idx = st->dest.u.op.pc[i];
            CTX_REG_PMC(st->dest.ctx, idx) = st->dest.slurp;
        }
        /* must be the actua arg of a named arg, count it */
        else
            n_named++;
    }

    /* only 32/64 named args allowed, an UINTVAL is used as a bitfield to detect duplicates */
    if (n_named >= (int)(sizeof (UINTVAL) * 8))
        real_exception(interp, NULL, E_ValueError, "Too many named arguments");
    st->named_done = 0;
}

/*
 * locate destination name, return 0 if not found
 */
static int
locate_named_named(Interp *interp /*NN*/, call_state *st /*NN*/)
{
    int i, n_named, idx;
    STRING *param;

    n_named = -1;
    for (i = st->first_named; i < st->dest.n; ++i) {
        st->dest.sig = SIG_ITEM(st->dest.u.op.signature, i);
        if (!(st->dest.sig & PARROT_ARG_NAME))
            continue;
        if (st->dest.sig & PARROT_ARG_SLURPY_ARRAY)
            return 1;
        n_named++;
        idx = st->dest.u.op.pc[i];
        param = PARROT_ARG_CONSTANT_ISSET(st->dest.sig) ? st->dest.ctx->constants[idx]->u.string
                : CTX_REG_STR(st->dest.ctx, idx);
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
    return 0;
}


static void
store_arg(call_state *st /*NN*/, INTVAL idx)
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
store_current_arg(call_state *st /*NN*/)
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
Parrot_store_arg(Interp *interp, call_state *st /*NN*/)
{
    UNUSED(interp);

    return store_current_arg(st);
}

static void
too_few(Interp *interp, const call_state *st /*NN*/, const char *action /*NN*/)
{
    const int max_expected_args = st->params;
    const int min_expected_args = max_expected_args - st->optionals;

    if (st->n_actual_args < min_expected_args) {
        real_exception(interp, NULL, E_ValueError,
                "too few arguments passed (%d) - %s%d %s expected",
                st->n_actual_args,
                (min_expected_args < max_expected_args ? "at least " : ""),
                min_expected_args, action);
    }
}

static void
too_many(Interp *interp, const call_state *st /*NN*/, const char *action /*NN*/)
{
    const int max_expected_args = st->params;
    const int min_expected_args = max_expected_args - st->optionals;

    if (st->n_actual_args > max_expected_args) {
        real_exception(interp, NULL, E_ValueError,
                "too many arguments passed (%d) - %s%d %s expected",
                st->n_actual_args,
                (min_expected_args < max_expected_args ? "at most " : ""),
                max_expected_args, action);
    }
}

static void
null_val(int sig, call_state *st /*NN*/)
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

/* check_named makes sure that all required named args are set and that
 * all optional args and flags are set to null and false if not present.
 * a  named arg takes the form of
 * STRING* name, [INPS] actual_arg,
 * or
 * STRING* name, [INPS] actual_arg, int opt_arg_flag
 */
static void
check_named(Interp *interp /*NN*/, call_state *st /*NN*/, const char *action /*NN*/)
{
    int i;
    int n_named = -1;

    for (i = st->first_named; i < st->dest.n; ++i) {
        /* verify that a name exists */
        const INTVAL sig = st->dest.sig = SIG_ITEM(st->dest.u.op.signature, i);
        if (sig & PARROT_ARG_NAME) {
            INTVAL arg_sig;
            int last_name_pos;
            /* if slurpy then no errors, return */
            if (sig & PARROT_ARG_SLURPY_ARRAY)
                return;
            n_named++;
            last_name_pos = i;

            i++; /* move on to the actual arg */

            /* verify that an actual arg exists */
            arg_sig = st->dest.sig = SIG_ITEM(st->dest.u.op.signature, i);
            assert(!(arg_sig & PARROT_ARG_NAME));
            /* if this named arg is already filled, continue*/
            if (st->named_done & (1 << n_named)) {
                arg_sig = st->dest.sig = SIG_ITEM(st->dest.u.op.signature, i+1);
                if (arg_sig & PARROT_ARG_OPT_FLAG)
                    i++; /* skip associated opt flag arg as well */
                continue;
            }
            else if (arg_sig & PARROT_ARG_OPTIONAL) {
                INTVAL idx;
                null_val(arg_sig, st);
                idx = st->dest.u.op.pc[i];
                store_arg(st, idx);

                arg_sig = st->dest.sig = SIG_ITEM(st->dest.u.op.signature, i+1);
                if (arg_sig & PARROT_ARG_OPT_FLAG) {
                    i++;
                    idx = st->dest.u.op.pc[i];
                    CTX_REG_INT(st->dest.ctx, idx) = 0;
                }
                continue;
            }
            else {
                const INTVAL idx = st->dest.u.op.pc[last_name_pos];
                STRING * const param = PARROT_ARG_CONSTANT_ISSET(sig)
                    ? st->dest.ctx->constants[idx]->u.string
                    : CTX_REG_STR(st->dest.ctx, idx);
                real_exception(interp, NULL, E_ValueError,
                        "too few arguments passed - missing required named arg '%Ss'", param);
            }
        }
        else {
            real_exception(interp, NULL, E_ValueError,
                    "invalid arg type in named portion of args");
        }
    }
}

static void
init_call_stats(call_state *st /*NN*/)
{
    st->n_actual_args = st->src.n;  /* initial guess, adjusted for :flat args */
    st->optionals     = 0;
    st->params        = st->dest.n;
    st->name          = NULL;
    st->key           = PMCNULL;
    st->first_named   = -1;
}

PARROT_API
void
Parrot_process_args(Interp *interp /*NN*/, call_state *st /*NN*/, arg_pass_t param_or_result)
{
    int has_arg, n_named;
    int err_check = 1;
    call_state_item *src, *dest;

    const char * const action = (param_or_result == PARROT_PASS_RESULTS) ? "results" : "params";

    /* Check if we should be throwing errors. This can be configured separately
     * for parameters and return values. */
    if (param_or_result == PARROT_PASS_RESULTS) {
        if (!PARROT_ERRORS_test(interp, PARROT_ERRORS_RESULT_COUNT_FLAG))
            err_check = 0;
    }
    else {
        if (!PARROT_ERRORS_test(interp, PARROT_ERRORS_PARAM_COUNT_FLAG))
            err_check = 0;
    }

    init_call_stats(st);

    src  = &st->src;
    dest = &st->dest;

    /*
     * 1st: Positional non-:slurpy
     */
    for (; dest->i < dest->n; dest->i++) {
        INTVAL idx;

        /* check if the next dest arg is :slurpy */
        next_arg_sig(dest);
        if (dest->sig & PARROT_ARG_SLURPY_ARRAY)
            break;

        /* check if there is another argument. we need to store the value to
         * handle :opt_flag, which needs to know if there was a preceding
         * argument. */
        has_arg = Parrot_fetch_arg(interp, st);

        /* if the src arg is named, we're done here */
        if (st->name)
        {
            /* but first, take care of any :optional arguments */
            while (dest->sig & PARROT_ARG_OPTIONAL) {
                null_val(st->dest.sig, st);
                /* actually store the argument */
                idx = st->dest.u.op.pc[st->dest.i];
                assert(idx >= 0);
                store_arg(st, idx);
                /* check for :opt_flag */
                check_for_opt_flag(st, 0);
                /* next dest arg */
                dest->i++;
                next_arg_sig(dest);
            }
            break;
        }

        /* if the dest is a named argument, we need to fill it as a positional
         * since no named arguments have been given. so skip the name. */
        if (dest->sig & PARROT_ARG_NAME) {
            if (!has_arg)
                break;
            dest->i++;
            next_arg_sig(dest);
        }

        /* if there *is* an arg, convert it */
        if (has_arg) {
            src->used = 1;
            Parrot_convert_arg(interp, st);
        }
        /* if this is an optional argument, null it */
        else if (dest->sig & PARROT_ARG_OPTIONAL)
            null_val(st->dest.sig, st);
        /* there's no argument - throw an exception (if we're in to that) */
        else if (err_check)
            too_few(interp, st, action);
        /* otherwise, we're done */
        else
            return;
        /* actually store the argument */
        idx = st->dest.u.op.pc[st->dest.i];
        assert(idx >= 0);
        store_arg(st, idx);

        /* if we're at an :optional argument, we need to check for an :opt_flag */
        if (dest->sig & PARROT_ARG_OPTIONAL)
            check_for_opt_flag(st, has_arg);
    }


    /*
     * 2nd: Positional :slurpy
     */
    if (dest->sig & PARROT_ARG_SLURPY_ARRAY && !(dest->sig & PARROT_ARG_NAME)) {
        PMC * const array = pmc_new(interp, enum_class_ResizablePMCArray);

        const INTVAL idx = st->dest.u.op.pc[dest->i];
        assert(idx >= 0);
        /* Must register this PMC or it may get collected when only the struct
         * references it. */
        dod_register_pmc(interp, array);
        CTX_REG_PMC(st->dest.ctx, idx) = array;

        while (Parrot_fetch_arg(interp, st)) {
            /* if the src arg is named, we're done here */
            if (st->name)
                break;

            src->used = 1;

            /* we have to convert to a PMC to we can put it in the PMC array */
            dest->sig |= PARROT_ARG_PMC;
            Parrot_convert_arg(interp, st);

            VTABLE_push_pmc(interp, array, UVal_pmc(st->val));
        }

        dest->i++;
        dod_unregister_pmc(interp, array);
    }

    /* is there another argument? if we're thowing errors, that's an error */
    if (err_check && Parrot_fetch_arg(interp, st) && !st->name && !(dest->sig & PARROT_ARG_NAME))
        too_many(interp, st, action);

    /* are we at the end? */
    if (dest->i == dest->n)
        return;


    /*
     * 3rd: :named
     */
    init_first_dest_named(interp, st);
    n_named = 0;
    while (Parrot_fetch_arg(interp, st)) {
        src->used = 1;

        if (!st->name)
            real_exception(interp, NULL, 0,
                           "positional inside named args at position %i",
                           st->src.i - n_named);

        if (!locate_named_named(interp, st))
            real_exception(interp, NULL, E_ValueError,
                           "too many named arguments - '%Ss' not expected", st->name);

        n_named++;
        /* if the dest arg is :named :slurpy */
        if (dest->sig & PARROT_ARG_SLURPY_ARRAY) {
            /* Convert to a PMC to store in the hash */
            dest->sig |= PARROT_ARG_PMC;
            Parrot_convert_arg(interp, st);
            VTABLE_set_pmc_keyed_str(interp, dest->slurp, st->name, UVal_pmc(st->val));
        }
        else {
            Parrot_convert_arg(interp, st);
            store_current_arg(st);

            /* if we're at an :optional argument, we need to check for an :opt_flag */
            if (dest->sig & PARROT_ARG_OPTIONAL)
                check_for_opt_flag(st, 1);
        }

        /* otherwise this doesn't get reset and we can't catch positional args
         * inside of named args */
        st->name = NULL;
    }

    check_named(interp, st, action);
    /* we may or may not have registered this pmc */
    dod_unregister_pmc(interp, dest->slurp);
}

PARROT_API
void
Parrot_convert_arg(Interp *interp /*NN*/, call_state *st /*NN*/)
{
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
          opcode_t *src_index, optcode_t *dest_index, arg_pass_t param_or_result)>


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

PARROT_API
void
parrot_pass_args(Interp *interp /*NN*/, parrot_context_t *src_ctx /*NN*/, parrot_context_t *dest_ctx /*NN*/,
        opcode_t *src_indexes /*NN*/, opcode_t *dest_indexes /*NN*/, arg_pass_t param_or_result)
{
    call_state st;
    PMC* src_signature;
    PMC* dest_signature;

    if (param_or_result == PARROT_PASS_PARAMS) {
        src_signature = interp->args_signature;
        dest_signature = interp->params_signature;
        interp->args_signature = NULL;
        interp->params_signature = NULL;
    }
    else /* (param_or_result == PARROT_PASS_RESULTS) */ {
        src_signature = interp->returns_signature;
        dest_signature = dest_ctx->results_signature;
        interp->returns_signature = NULL;
        dest_ctx->results_signature = NULL;
    }

    Parrot_init_arg_indexes_and_sig_pmc(interp, src_ctx, src_indexes, src_signature, &st.src);
    Parrot_init_arg_indexes_and_sig_pmc(interp, dest_ctx, dest_indexes, dest_signature, &st.dest);
    Parrot_process_args(interp, &st, param_or_result);

    /* If we created a slurpy, we had to DOD register it so it did not get
     * collected during arg processing; we'll now unregister it. */
    dod_unregister_pmc(interp, st.dest.slurp);
}

/*

=item C<opcode_t *parrot_pass_args_fromc(Interp *, const char *sig,
INTVAL src_n, opcode_t *dest, parrot_context_t * ctxp, va_list ap)>

Pass arguments from C code with given signature to a Parrot Sub.
Prerequsits are like above.

=cut

*/

opcode_t *
parrot_pass_args_fromc(Interp *interp /*NN*/, const char *sig,
        opcode_t *dest, parrot_context_t *old_ctxp, va_list ap)
{
    call_state st;

    Parrot_init_arg_op(interp, CONTEXT(interp->ctx), dest, &st.dest);
    Parrot_init_arg_sig(interp, old_ctxp, sig, PARROT_VA_TO_VAPTR(ap), &st.src);
    Parrot_process_args(interp, &st, PARROT_PASS_PARAMS);
    return dest + st.dest.n + 2;
}

static int
set_retval_util(Interp *interp /*NN*/, const char *sig, parrot_context_t *ctx /*NN*/,
        call_state *st /*NN*/)
{
    opcode_t * const src_pc = interp->current_returns;
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
set_retval(Interp *interp /*NN*/, int sig_ret, parrot_context_t *ctx /*NN*/)
{
    call_state st;

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
set_retval_i(Interp *interp /*NN*/, int sig_ret, parrot_context_t *ctx /*NN*/)
{
    call_state st;

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
set_retval_f(Interp *interp /*NN*/, int sig_ret, parrot_context_t *ctx /*NN*/)
{
    call_state st;

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
set_retval_s(Interp *interp /*NN*/, int sig_ret, parrot_context_t *ctx /*NN*/)
{
    call_state st;

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
set_retval_p(Interp *interp /*NN*/, int sig_ret, parrot_context_t *ctx /*NN*/)
{
    call_state st;

    if (sig_ret != 'P')
        real_exception(interp, NULL, E_ValueError, "return signature not 'P'");

    if (set_retval_util(interp, "P", ctx, &st))
        return UVal_pmc(st.val);

    return NULL;
}

/*
 * commit_last_arg is called by Parrot_PCCINVOKE when it reaches the end of each arg
 * in the arg signature.  see Parrot_PCCINVOKE for signature syntax.
 */
static void
commit_last_arg(Interp *interp, int index, int cur, opcode_t *n_regs_used, int seen_arrow,
        PMC **sigs, opcode_t **indexes, parrot_context_t *ctx, PMC *pmc, va_list *list)
{
    int reg_offset = 0;

    /* invocant already commited, just return */
    if (seen_arrow == 0 && index == 0 && pmc)
        return;

    /* calculate arg's register offset */
    switch (cur & PARROT_ARG_TYPE_MASK) { /* calc reg offset */
        case PARROT_ARG_INTVAL:
            reg_offset = n_regs_used[seen_arrow * 4 + REGNO_INT]++; break;
        case PARROT_ARG_FLOATVAL:
            reg_offset = n_regs_used[seen_arrow * 4 + REGNO_NUM]++; break;
        case PARROT_ARG_STRING:
            reg_offset = n_regs_used[seen_arrow * 4 + REGNO_STR]++; break;
        case PARROT_ARG_PMC :
            reg_offset = n_regs_used[seen_arrow * 4 + REGNO_PMC]++; break;
        default:
                  real_exception(interp, NULL, E_IndexError,
                          "Parrot_PCCINVOKE: invalid reg type");
    }

    /* set the register offset into the index int[] */
    indexes[seen_arrow][index] = reg_offset;
    /* set the PARROT_ARG_FLAGS into the signature FIA */
    VTABLE_set_integer_keyed_int(interp, sigs[seen_arrow], index, cur);

    /* perform the arg accessor function, assigning the arg to its corresponding register */
    if (!seen_arrow) {
        switch (cur & PARROT_ARG_TYPE_MASK) {
            case PARROT_ARG_INTVAL:
                CTX_REG_INT(ctx, reg_offset) = va_arg(*list, INTVAL); break;
            case PARROT_ARG_FLOATVAL:
                CTX_REG_NUM(ctx, reg_offset) = va_arg(*list, FLOATVAL); break;
            case PARROT_ARG_STRING:
                CTX_REG_STR(ctx, reg_offset) = va_arg(*list, STRING*); break;
            case PARROT_ARG_PMC:
                CTX_REG_PMC(ctx, reg_offset) = va_arg(*list, PMC*); break;
            default:
                real_exception(interp, NULL, E_IndexError,
                    "Parrot_PCCINVOKE: invalid reg type");
        }
    }
}

/*

=item C<void
Parrot_PCCINVOKE(Interp* interp, PMC* pmc, STRING *method_name, const char *signature, ... )>

pmc is the invocant.
method_name is the method_name used in the find_method VTABLE call
signature is a DSL describing parrot calling convention for Parrot_PCCINVOKE.
... variable args contains the IN arguments followed by the OUT results variables.
    you must pass the address_of(&) the OUT results of course.

Signatures:
  uppercase letters repesent each arg and denote its types
  I INTVAL
  N FLOATVAL
  S STRING*
  P PMC*

  lowercase letters are adverb modifiers to the preceeding uppercase arg identifier
  f flatten
  n named
  s slurpy

  -> is the separator between args and results, similar to type theory notation.

  Named args require two arg slots, the first is the name, the second is the arg

Example signature
  "SnIPf->INPs"
  The args to the method invocation are
    a named INTVAL:  SnI
    a flattened PMC:  Pf
  The results of the method invocation are
    a INTVAL: I
    a FLOATVAL: N
    a slurpy PMC: Ps

invokes a PMC method
=cut

*/

PARROT_API
void
Parrot_PCCINVOKE(Interp* interp, PMC* pmc, STRING *method_name, const char *signature, ...)
{
#define PCC_ARG_MAX 1024
    /* variables from PCCINVOKE impl in PCCMETHOD.pm */
    /* args INSP, returns INSP */
    INTVAL n_regs_used[] = { 0, 0, 0, 0, 0, 0, 0, 0 };

    opcode_t arg_indexes[PCC_ARG_MAX];
    opcode_t result_indexes[PCC_ARG_MAX];

    PMC* args_sig    = pmc_new(interp, enum_class_FixedIntegerArray);
    PMC* results_sig = pmc_new(interp, enum_class_FixedIntegerArray);
    PMC* ret_cont    = new_ret_continuation_pmc(interp, NULL);

    parrot_context_t *ctx;
    PMC              *pccinvoke_meth;

    opcode_t         *save_current_args;
    PMC              *save_args_signature;
    PMC              *save_current_object;

    /* temporary state vars for building PCC index and PCC signature arrays. */

    /* arg_indexes, result_indexes */
    opcode_t *indexes[2];

    /* args_sig, results_sig */
    PMC *sigs[2];

    /* # of arg args, # of result args */
    int arg_ret_cnt[2] = { 0, 0 };

    /* INSP args, INSP results */
    int         max_regs[8]    = { 0, 0, 0, 0, 0, 0, 0, 0 };
    int         seen_arrow     = 0;

    const char *x;
    const char *ret_x  = NULL;
    int         index = -1;
    int         cur   =  0;

    va_list list;
    va_start(list, signature);

    indexes[0] = arg_indexes;
    indexes[1] = result_indexes;
    sigs[0]    = args_sig;
    sigs[1]    = results_sig;

    /* account for passing invocant in-band */
    if (pmc) {
        arg_ret_cnt[seen_arrow]++;
        max_regs[REGNO_PMC]++;
    }

    /* first loop through signature to get sizing info */
    for (x = signature; *x != '\0'; x++) {
        /* detect -> separator */
        if (*x == '-') {
            seen_arrow = 1 ;
        }
        else if (isupper(*x)) {
             /* calculate needed length of arg and result sig FIAs */
            arg_ret_cnt[seen_arrow]++;

            /* calculate max reg types (INSP) needed in context */
            switch (*x) {
                case 'I': max_regs[seen_arrow * 4 + REGNO_INT]++; break;
                case 'N': max_regs[seen_arrow * 4 + REGNO_NUM]++; break;
                case 'S': max_regs[seen_arrow * 4 + REGNO_STR]++; break;
                case 'P': max_regs[seen_arrow * 4 + REGNO_PMC]++; break;
                default:
                          real_exception(interp, NULL, E_IndexError,
                                  "Parrot_PCCINVOKE: invalid reg type %c!", *x);
            }

        }
    }

    /* calculate max reg types needed for both args and results */
    n_regs_used[0] = PARROT_MAX(max_regs[0], max_regs[4]);
    n_regs_used[1] = PARROT_MAX(max_regs[1], max_regs[5]);
    n_regs_used[2] = PARROT_MAX(max_regs[2], max_regs[6]);
    n_regs_used[3] = PARROT_MAX(max_regs[3], max_regs[7]);

    /* initialize arg and return sig FIAs with collected info */
    if (arg_ret_cnt[0] > 0)
        VTABLE_set_integer_native(interp, args_sig, arg_ret_cnt[0]);

    if (arg_ret_cnt[1] > 0)
        VTABLE_set_integer_native(interp, results_sig, arg_ret_cnt[1]);

    ctx = Parrot_push_context(interp, n_regs_used);

    /* reset n_regs_used for reuse reused during arg index allocation step */
    n_regs_used[0] = 0;
    n_regs_used[1] = 0;
    n_regs_used[2] = 0;
    n_regs_used[3] = 0;

    /* second loop through signature to build all index and arg_flag
     * loop also assigns args(up to the ->) to registers */
    index      = -1;
    seen_arrow =  0;

    /* account for passing invocant in-band */
    if (pmc) {
        indexes[0][0] = 0;

        VTABLE_set_integer_keyed_int(interp, sigs[0], 0, PARROT_ARG_PMC);
        CTX_REG_PMC(ctx, 0) = pmc;

        n_regs_used[seen_arrow * 4 + REGNO_PMC]++;
        index = 0;
    }

    for (x = signature; *x != '\0'; x++) {
        /* detect -> separator */
        if (*x == '-') {

            /* skip '>' */
            x++;

            /* allows us to jump directly to the result signature portion
             * during results assignment */
            ret_x = x;

            /* save off pointer to results */
            ret_x++;

            if (index >= 0)
                commit_last_arg(interp, index, cur, n_regs_used, seen_arrow,
                    sigs, indexes, ctx, pmc, &list);

            /* reset parsing state so we can now handle results */
            seen_arrow =  1;
            index      = -1;

            /* reset n_regs_used for reuse during result index allocation */
            n_regs_used[0] = 0;
            n_regs_used[1] = 0;
            n_regs_used[2] = 0;
            n_regs_used[3] = 0;
        }
        /* parse arg type */
        else if (isupper(*x)) {
            if (index >= 0)
                commit_last_arg(interp, index, cur, n_regs_used, seen_arrow,
                    sigs, indexes, ctx, pmc, &list);

            index++;

            switch (*x) {
                case 'I': cur = PARROT_ARG_INTVAL;   break;
                case 'N': cur = PARROT_ARG_FLOATVAL; break;
                case 'S': cur = PARROT_ARG_STRING;   break;
                case 'P': cur = PARROT_ARG_PMC;      break;
                default:
                          real_exception(interp, NULL, E_IndexError,
                                  "Parrot_PCCINVOKE: invalid reg type %c!", *x);
            }

        }
        /* parse arg adverbs */
        else if (islower(*x)) {
            switch (*x) {
                case 'n': cur |= PARROT_ARG_NAME;         break;
                case 'f': cur |= PARROT_ARG_FLATTEN;      break;
                case 's': cur |= PARROT_ARG_SLURPY_ARRAY; break;
                case 'o': cur |= PARROT_ARG_OPTIONAL;     break;
                case 'p': cur |= PARROT_ARG_OPT_FLAG;     break;
                default:
                          real_exception(interp, NULL, E_IndexError,
                            "Parrot_PCCINVOKE: invalid adverb type %c!", *x);
            }
        }
    }

    if (index >= 0)
        commit_last_arg(interp, index, cur, n_regs_used, seen_arrow, sigs,
            indexes, ctx, pmc, &list);

    /* code from PCCINVOKE impl in PCCMETHOD.pm */
    save_current_args      = interp->current_args;
    save_args_signature    = interp->args_signature;
    save_current_object    = interp->current_object;

    interp->current_args   = arg_indexes;
    interp->args_signature = args_sig;
    ctx->current_results   = result_indexes;
    ctx->results_signature = results_sig;

    /* arg_accessors assigned in loop above */

    interp->current_object       = pmc;
    interp->current_cont         = NEED_CONTINUATION;
    ctx->current_cont            = ret_cont;
    PMC_cont(ret_cont)->from_ctx = ctx;
    ctx->ref_count++;
    pccinvoke_meth               = VTABLE_find_method(interp, pmc, method_name);

    if (PMC_IS_NULL(pccinvoke_meth))
        real_exception(interp, NULL, METH_NOT_FOUND, "Method '%Ss' not found",
            method_name);
    else
        VTABLE_invoke(interp, pccinvoke_meth, NULL);

    /* result_accessors perform the arg accessor function,
     * assigning the corresponding registers to the result variables */
    index      = 0;
    seen_arrow = 1;

    for (x=ret_x; *x != '\0'; x++) {
        if (isupper(*x)) {
            INTVAL    *tmpINTVAL;
            FLOATVAL  *tmpFLOATVAL;
            STRING   **tmpSTRING;
            PMC      **tmpPMC;

            switch (*x) {
                case 'I':
                    tmpINTVAL  = va_arg(list, INTVAL*);
                    *tmpINTVAL = CTX_REG_INT(ctx, indexes[seen_arrow][index]);
                    break;
                case 'N':
                    tmpFLOATVAL  = va_arg(list, FLOATVAL*);
                    *tmpFLOATVAL = CTX_REG_NUM(ctx, indexes[seen_arrow][index]);
                    break;
                case 'S':
                    tmpSTRING  = va_arg(list, STRING**);
                    *tmpSTRING = CTX_REG_STR(ctx, indexes[seen_arrow][index]);
                    break;
                case 'P':
                    tmpPMC  = va_arg(list, PMC**);
                    *tmpPMC = CTX_REG_PMC(ctx, indexes[seen_arrow][index]);
                    break;
                default:
                          real_exception(interp, NULL, E_IndexError,
                                  "Parrot_PCCINVOKE: invalid reg type %c!", *x);
            }
        }
    }

    PObj_live_CLEAR(args_sig);
    PObj_live_CLEAR(results_sig);

    Parrot_pop_context(interp);

    interp->current_args   = save_current_args;
    interp->args_signature = save_args_signature;
    interp->current_object = save_current_object;
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
