/*
Copyright (C) 2001-2008, The Perl Foundation.
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

#include "parrot/parrot.h"
#include "parrot/oplib/ops.h"
#include "inter_call.str"

/* HEADERIZER HFILE: include/parrot/inter_call.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void check_for_opt_flag(ARGMOD(call_state *st), int has_arg)
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*st);

static void check_named(PARROT_INTERP, ARGMOD(call_state *st))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*st);

static void clone_key_arg(PARROT_INTERP, ARGMOD(call_state *st))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*st);

static void commit_last_arg(PARROT_INTERP,
    int index,
    int cur,
    ARGMOD(opcode_t *n_regs_used),
    int seen_arrow,
    ARGIN(PMC * const *sigs),
    ARGMOD(opcode_t **indexes),
    ARGMOD(Parrot_Context *ctx),
    ARGIN_NULLOK(PMC *pmc),
    ARGIN(va_list *list))
        __attribute__nonnull__(1)
        __attribute__nonnull__(4)
        __attribute__nonnull__(6)
        __attribute__nonnull__(7)
        __attribute__nonnull__(8)
        __attribute__nonnull__(10)
        FUNC_MODIFIES(*n_regs_used)
        FUNC_MODIFIES(*indexes)
        FUNC_MODIFIES(*ctx);

static void commit_last_arg_sig_object(PARROT_INTERP,
    int index,
    int cur,
    ARGMOD(opcode_t *n_regs_used),
    int seen_arrow,
    ARGIN(PMC * const *sigs),
    ARGMOD(opcode_t **indexes),
    ARGMOD(Parrot_Context *ctx),
    ARGIN(PMC *sig_obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(4)
        __attribute__nonnull__(6)
        __attribute__nonnull__(7)
        __attribute__nonnull__(8)
        __attribute__nonnull__(9)
        FUNC_MODIFIES(*n_regs_used)
        FUNC_MODIFIES(*indexes)
        FUNC_MODIFIES(*ctx);

static void convert_arg_from_int(PARROT_INTERP, ARGMOD(call_state *st))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*st);

static void convert_arg_from_num(PARROT_INTERP, ARGMOD(call_state *st))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*st);

static void convert_arg_from_pmc(PARROT_INTERP, ARGMOD(call_state *st))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*st);

static void convert_arg_from_str(PARROT_INTERP, ARGMOD(call_state *st))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*st);

PARROT_CANNOT_RETURN_NULL
static Parrot_Context * count_signature_elements(PARROT_INTERP,
    ARGIN(const char *signature),
    ARGMOD(PMC *args_sig),
    ARGMOD(PMC *results_sig),
    int flag)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*args_sig)
        FUNC_MODIFIES(*results_sig);

static int fetch_arg_op(PARROT_INTERP, ARGMOD(call_state *st))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*st);

static int fetch_arg_sig(PARROT_INTERP, ARGMOD(call_state *st))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*st);

static void init_call_stats(ARGMOD(call_state *st))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*st);

static void init_first_dest_named(PARROT_INTERP, ARGMOD(call_state *st))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*st);

static int locate_named_named(PARROT_INTERP, ARGMOD(call_state *st))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*st);

static void next_arg_sig(ARGMOD(call_state_item *sti))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*sti);

static void null_val(int sig, ARGMOD(call_state *st))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*st);

PARROT_CAN_RETURN_NULL
static const char * set_context_sig_params(PARROT_INTERP,
    ARGIN(const char *signature),
    ARGMOD(INTVAL *n_regs_used),
    ARGMOD(PMC **sigs),
    ARGMOD(opcode_t **indexes),
    ARGMOD(Parrot_Context *ctx),
    ARGMOD(PMC *sig_obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        __attribute__nonnull__(6)
        __attribute__nonnull__(7)
        FUNC_MODIFIES(*n_regs_used)
        FUNC_MODIFIES(*sigs)
        FUNC_MODIFIES(*indexes)
        FUNC_MODIFIES(*ctx)
        FUNC_MODIFIES(*sig_obj);

static void set_context_sig_returns(PARROT_INTERP,
    ARGMOD(Parrot_Context *ctx),
    ARGMOD(opcode_t **indexes),
    ARGIN_NULLOK(const char *ret_x),
    ARGMOD(PMC *result_list))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*ctx)
        FUNC_MODIFIES(*indexes)
        FUNC_MODIFIES(*result_list);

static void set_context_sig_returns_varargs(PARROT_INTERP,
    ARGMOD(Parrot_Context *ctx),
    ARGMOD(opcode_t **indexes),
    ARGIN(const char *ret_x),
    ARGMOD(va_list returns))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*ctx)
        FUNC_MODIFIES(*indexes)
        FUNC_MODIFIES(returns);

static int set_retval_util(PARROT_INTERP,
    ARGIN(const char *sig),
    ARGIN(Parrot_Context *ctx),
    ARGMOD(call_state *st))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*st);

static void start_flatten(PARROT_INTERP,
    ARGMOD(call_state *st),
    ARGIN(PMC *p_arg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*st);

static void store_arg(ARGIN(const call_state *st), INTVAL idx)
        __attribute__nonnull__(1);

static void too_few(PARROT_INTERP,
    ARGIN(const call_state *st),
    ARGIN(const char *action))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void too_many(PARROT_INTERP,
    ARGIN(const call_state *st),
    ARGIN(const char *action))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_check_for_opt_flag __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(st)
#define ASSERT_ARGS_check_named __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(st)
#define ASSERT_ARGS_clone_key_arg __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(st)
#define ASSERT_ARGS_commit_last_arg __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(n_regs_used) \
    || PARROT_ASSERT_ARG(sigs) \
    || PARROT_ASSERT_ARG(indexes) \
    || PARROT_ASSERT_ARG(ctx) \
    || PARROT_ASSERT_ARG(list)
#define ASSERT_ARGS_commit_last_arg_sig_object __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(n_regs_used) \
    || PARROT_ASSERT_ARG(sigs) \
    || PARROT_ASSERT_ARG(indexes) \
    || PARROT_ASSERT_ARG(ctx) \
    || PARROT_ASSERT_ARG(sig_obj)
#define ASSERT_ARGS_convert_arg_from_int __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(st)
#define ASSERT_ARGS_convert_arg_from_num __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(st)
#define ASSERT_ARGS_convert_arg_from_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(st)
#define ASSERT_ARGS_convert_arg_from_str __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(st)
#define ASSERT_ARGS_count_signature_elements __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(signature) \
    || PARROT_ASSERT_ARG(args_sig) \
    || PARROT_ASSERT_ARG(results_sig)
#define ASSERT_ARGS_fetch_arg_op __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(st)
#define ASSERT_ARGS_fetch_arg_sig __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(st)
#define ASSERT_ARGS_init_call_stats __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(st)
#define ASSERT_ARGS_init_first_dest_named __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(st)
#define ASSERT_ARGS_locate_named_named __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(st)
#define ASSERT_ARGS_next_arg_sig __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(sti)
#define ASSERT_ARGS_null_val __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(st)
#define ASSERT_ARGS_set_context_sig_params __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(signature) \
    || PARROT_ASSERT_ARG(n_regs_used) \
    || PARROT_ASSERT_ARG(sigs) \
    || PARROT_ASSERT_ARG(indexes) \
    || PARROT_ASSERT_ARG(ctx) \
    || PARROT_ASSERT_ARG(sig_obj)
#define ASSERT_ARGS_set_context_sig_returns __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx) \
    || PARROT_ASSERT_ARG(indexes) \
    || PARROT_ASSERT_ARG(result_list)
#define ASSERT_ARGS_set_context_sig_returns_varargs \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx) \
    || PARROT_ASSERT_ARG(indexes) \
    || PARROT_ASSERT_ARG(ret_x) \
    || PARROT_ASSERT_ARG(returns)
#define ASSERT_ARGS_set_retval_util __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sig) \
    || PARROT_ASSERT_ARG(ctx) \
    || PARROT_ASSERT_ARG(st)
#define ASSERT_ARGS_start_flatten __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(st) \
    || PARROT_ASSERT_ARG(p_arg)
#define ASSERT_ARGS_store_arg __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(st)
#define ASSERT_ARGS_too_few __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(st) \
    || PARROT_ASSERT_ARG(action)
#define ASSERT_ARGS_too_many __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(st) \
    || PARROT_ASSERT_ARG(action)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/* Make sure we don't conflict with any other MAX() macros defined elsewhere */
#define PARROT_MAX(a, b) (((a)) > (b) ? (a) : (b))

#define SAVE_OFF_REGS(orig, next, save) \
        (save).bp = (orig).bp;\
        (save).bp_ps = (orig).bp_ps;\
        (orig).bp = (next).bp;\
        (orig).bp_ps = (next).bp_ps;

#define RESTORE_REGS(orig, save) \
        (orig).bp = (save).bp;\
        (orig).bp_ps = (save).bp_ps;


/*

=item C<void Parrot_init_arg_nci>

Initializes the argument passing state C<call_state> for the given NCI
signature.

=cut

*/

PARROT_EXPORT
void
Parrot_init_arg_nci(PARROT_INTERP, ARGOUT(call_state *st),
    ARGIN(const char *sig))
{
    ASSERT_ARGS(Parrot_init_arg_nci)
    init_call_stats(st);

    if (PMC_IS_NULL(interp->args_signature))
        Parrot_init_arg_op(interp, CONTEXT(interp), interp->current_args,
                           &st->src);
    else
        Parrot_init_arg_indexes_and_sig_pmc(interp, CONTEXT(interp),
            interp->current_args, interp->args_signature, &st->src);

    Parrot_init_arg_sig(interp, CONTEXT(interp), sig, NULL, &st->dest);
}


/*

=item C<void Parrot_init_ret_nci>

Initializes the return value, passing state C<call_state> for the given NCI
signature.

=cut

*/

PARROT_EXPORT
void
Parrot_init_ret_nci(PARROT_INTERP, ARGOUT(call_state *st), ARGIN(const char *sig))
{
    ASSERT_ARGS(Parrot_init_ret_nci)
    Parrot_Context *ctx                 = CONTEXT(interp);
    PMC            * const current_cont = ctx->current_cont;

    /* if this NCI call was a taicall, return results to caller's get_results
     * this also means that we pass the caller's register base pointer */
    if (SUB_FLAG_TAILCALL_ISSET(current_cont))
        ctx = PMC_cont(current_cont)->to_ctx;

    /* TODO simplify all */
    Parrot_init_arg_sig(interp, CONTEXT(interp), sig, NULL, &st->src);

    /* Non-constant signatures are stored in ctx->results_signature instead of
     * in the constants table. */
    if (ctx->results_signature)
        Parrot_init_arg_indexes_and_sig_pmc(interp, ctx,
                ctx->current_results, ctx->results_signature, &st->dest);
    else
        Parrot_init_arg_op(interp, ctx, ctx->current_results, &st->dest);

}


/*

=item C<int Parrot_init_arg_indexes_and_sig_pmc>

Initializes argument transfer with given context registers, register indexes,
and a signature PMC.

All C<Parrot_init_arg*> functions can be used for either source or destination,
by passing either C<&st.src> or C<&st.dest> of a C<call_state> structure.

These functions return 0 if no arguments are present, or 1 on success.

=cut

*/

PARROT_EXPORT
int
Parrot_init_arg_indexes_and_sig_pmc(SHIM_INTERP, ARGIN(Parrot_Context *ctx),
        ARGIN_NULLOK(opcode_t *indexes), ARGIN_NULLOK(PMC *sig_pmc),
        ARGMOD(call_state_item *sti))
{
    ASSERT_ARGS(Parrot_init_arg_indexes_and_sig_pmc)
    if (!sig_pmc && indexes) {
        ++indexes;
        sig_pmc = ctx->constants[*indexes]->u.key;
        ASSERT_SIG_PMC(sig_pmc);
        ++indexes;
    }

    sti->used  = 1;
    sti->i     = 0;
    sti->n     = 0;
    sti->mode  = CALL_STATE_OP;
    sti->ctx   = ctx;
    sti->sig   = 0;
    sti->slurp = NULL;

    if (indexes) {
        ASSERT_SIG_PMC(sig_pmc);
        sti->u.op.signature = sig_pmc;
        sti->u.op.pc        = indexes;
        sti->n              = SIG_ELEMS(sig_pmc);

        /* initialize sti->sig */
        if (sti->n)
            next_arg_sig(sti);
    }

    return sti->n > 0;
}


/*

=item C<int Parrot_init_arg_op>

Initializes argument transfer with given context registers and opcode location
of a C<get_*> or C<set_*> argument opcode.

=cut

*/

PARROT_EXPORT
int
Parrot_init_arg_op(PARROT_INTERP, ARGIN(Parrot_Context *ctx),
    ARGIN_NULLOK(opcode_t *pc), ARGIN(call_state_item *sti))
{
    ASSERT_ARGS(Parrot_init_arg_op)
    PMC *sig_pmc = PMCNULL;

    if (pc) {
        ++pc;
        sig_pmc = ctx->constants[*pc]->u.key;
        ASSERT_SIG_PMC(sig_pmc);
        ++pc;
    }

    return Parrot_init_arg_indexes_and_sig_pmc(interp, ctx, pc, sig_pmc, sti);
}


/*

=item C<int Parrot_init_arg_sig>

Initializes argument transfer with given code segment (holding the
const_table), registers, function signature, and arguments.

=cut

*/

PARROT_EXPORT
int
Parrot_init_arg_sig(SHIM_INTERP, ARGIN(Parrot_Context *ctx),
    ARGIN(const char *sig), ARGIN_NULLOK(void *ap),
    ARGMOD(call_state_item *sti))
{
    ASSERT_ARGS(Parrot_init_arg_sig)
    sti->used = 1;
    sti->i    = 0;
    sti->n    = 0;
    sti->mode = CALL_STATE_SIG;
    sti->ctx  = ctx;
    sti->sig  = 0;

    if (*sig) {
        sti->u.sig.sig = sig;
        sti->u.sig.ap  = ap;
        sti->n         = strlen(sig);

        /* initialize st->sig */
        if (sti->n)
            next_arg_sig(sti);
    }

    return sti->n > 0;
}


/*

=item C<static void start_flatten>

Marks the source state as flattening with the passed PMC being flattened and
fetches the first arg from the flattened set.

=cut

*/

static void
start_flatten(PARROT_INTERP, ARGMOD(call_state *st), ARGIN(PMC *p_arg))
{
    ASSERT_ARGS(start_flatten)
    if (PARROT_ARG_NAME_ISSET(st->src.sig)) {

        /* src ought to be an hash */
        if (!VTABLE_does(interp, p_arg, CONST_STRING(interp, "hash")))
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "argument doesn't hash");

        /* create key needed to iterate the hash */
        st->key              = pmc_new(interp, enum_class_Key);
        key_set_integer(interp, st->key, 0);
        PMC_data(st->key)    = (void *)INITBucketIndex;
    }
    else {
        /* src ought to be an array */
        if (!VTABLE_does(interp, p_arg, CONST_STRING(interp, "array")))
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                    "argument doesn't array");
    }

    st->src.mode   |= CALL_STATE_FLATTEN;
    st->src.slurp   = p_arg;
    st->src.slurp_i = 0;
    st->src.slurp_n = VTABLE_elements(interp, p_arg);

    /* the -1 is because the :flat PMC itself doesn't count. */
    st->n_actual_args += st->src.slurp_n - 1;
}


/*

=item C<static void next_arg_sig>

Moves the call state to the next argument in the signature, calculating which
type of argument/parameter to get next.  The index gets increased elsewhere.

=cut

*/

static void
next_arg_sig(ARGMOD(call_state_item *sti))
{
    ASSERT_ARGS(next_arg_sig)
    switch (sti->mode & CALL_S_D_MASK) {
        case CALL_STATE_OP:
            sti->sig = SIG_ITEM(sti->u.op.signature, sti->i);
            break;
        case CALL_STATE_SIG:
            switch (sti->u.sig.sig[sti->i]) {
                case 'I':
                    sti->sig = PARROT_ARG_INTVAL; break;
                case 'N':
                    sti->sig = PARROT_ARG_FLOATVAL; break;
                case 'S':
                    sti->sig = PARROT_ARG_STRING; break;
                case 'O':
                case 'P':
                    sti->sig = PARROT_ARG_PMC; break;
                case '@':
                    sti->sig = PARROT_ARG_PMC | PARROT_ARG_SLURPY_ARRAY; break;
                case 'F':
                    sti->sig = PARROT_ARG_PMC | PARROT_ARG_FLATTEN; break;
                default:
                    break;
            }
            break;
        default:
            break;
    }
}


/*

=item C<static int fetch_arg_sig>

Fetches the next argument from the signature in the given call state.

=cut

*/

static int
fetch_arg_sig(PARROT_INTERP, ARGMOD(call_state *st))
{
    ASSERT_ARGS(fetch_arg_sig)
    va_list * const ap = (va_list *)(st->src.u.sig.ap);

    switch (st->src.sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_INTVAL:
            UVal_int(st->val) = va_arg(*ap, INTVAL);
            break;
        case PARROT_ARG_STRING:
            UVal_str(st->val) = va_arg(*ap, STRING *);
            break;
        case PARROT_ARG_FLOATVAL:
            UVal_num(st->val) = va_arg(*ap, FLOATVAL);
            break;
        case PARROT_ARG_PMC:
            if (st->src.u.sig.sig[st->src.i] == 'O')
                UVal_pmc(st->val) = CONTEXT(interp)->current_object;
            else {
                UVal_pmc(st->val) = va_arg(*ap, PMC *);
            }

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

                return retval;
            }
            break;
        default:
            break;
    }

    st->src.i++;
    return 1;
}


/*

=item C<static int fetch_arg_op>

Fetches an argument from the appropriate context.

=cut

*/

static int
fetch_arg_op(PARROT_INTERP, ARGMOD(call_state *st))
{
    ASSERT_ARGS(fetch_arg_op)
    const int    constant = PARROT_ARG_CONSTANT_ISSET(st->src.sig);
    const INTVAL idx      = st->src.u.op.pc[st->src.i];

    switch (PARROT_ARG_TYPE_MASK_MASK(st->src.sig)) {
        case PARROT_ARG_INTVAL:
            UVal_int(st->val) = constant ? idx : CTX_REG_INT(st->src.ctx, idx);
            break;
        case PARROT_ARG_STRING:
        {
            /* ensure that callees don't modify constant caller strings */
            if (constant)
                UVal_str(st->val) = Parrot_make_COW_reference(interp,
                                        st->src.ctx->constants[idx]->u.string);
            else
                UVal_str(st->val) = CTX_REG_STR(st->src.ctx, idx);

            break;
        }
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

                return retval;
            }
            break;
        default:
            break;
    }

    st->src.i++;
    return 1;
}


/*

=item C<int Parrot_fetch_arg>

Fetches an argument from the current call state object. Retrieves the
next argument in the parameter list, or the next argument in a flattened
array, if given. If the parameter is a named object, fetches both the
name and the value.

=cut

*/

PARROT_EXPORT
int
Parrot_fetch_arg(PARROT_INTERP, ARGMOD(call_state *st))
{
    ASSERT_ARGS(Parrot_fetch_arg)
    if (!st->src.used)
        return 1;

    if (st->src.i >= st->src.n)
        return 0;

    st->src.used = 0;

    next_arg_sig(&st->src);

    /* check if we're supposed to continue a :flat argument */
    if (st->src.mode & CALL_STATE_FLATTEN) {
        PARROT_ASSERT(st->src.slurp_i < st->src.slurp_n);
        if (!PMC_IS_NULL(st->key)) {
            st->src.slurp_i++;
            st->name = (STRING *)parrot_hash_get_idx(interp,
                            (Hash *)PMC_struct_val(st->src.slurp), st->key);
            PARROT_ASSERT(st->name);
            UVal_pmc(st->val) = VTABLE_get_pmc_keyed_str(interp,
                st->src.slurp, st->name);
        }
        else {
            UVal_pmc(st->val) = VTABLE_get_pmc_keyed_int(interp,
                st->src.slurp, st->src.slurp_i++);
        }

        st->src.sig       = PARROT_ARG_PMC;

        /* done with flattening */
        if (st->src.slurp_i == st->src.slurp_n) {
            st->src.mode &= ~CALL_STATE_FLATTEN;

            st->key = PMCNULL;
            st->src.i++;
        }

        return 1;
    }

    /* If we're at a named arg, store the name and then get the next arg, which
     * is the actual value of the named arg. */
    if ((st->src.sig & PARROT_ARG_NAME)
    && !(st->src.sig & PARROT_ARG_FLATTEN)) {
        fetch_arg_op(interp, st);
        st->name = UVal_str(st->val);
        next_arg_sig(&st->src);
    }

    switch (st->src.mode & CALL_S_D_MASK) {
        case CALL_STATE_OP:
            return fetch_arg_op(interp, st);
        case CALL_STATE_SIG:
            return fetch_arg_sig(interp, st);
        default:
            Parrot_ex_throw_from_c_args(interp, NULL, 1, "invalid call state mode");
    }
}


/*

=item C<int Parrot_fetch_arg_nci>

Fetches the next argument from the call state and converts it to the proper
data type for the call signature. If the next argument is a slurpy array,
all the remaining arguments are slurped together into a ResizablePMCArray
PMC which is then set as the PMC value of the call_state object.

=cut

*/

PARROT_EXPORT
int
Parrot_fetch_arg_nci(PARROT_INTERP, ARGMOD(call_state *st))
{
    ASSERT_ARGS(Parrot_fetch_arg_nci)
    next_arg_sig(&st->dest);

    if (st->dest.sig & PARROT_ARG_SLURPY_ARRAY) {
        PMC *slurped = pmc_new(interp,
                Parrot_get_ctx_HLL_type(interp, enum_class_ResizablePMCArray));

        PARROT_ASSERT((st->dest.sig & PARROT_ARG_TYPE_MASK) == PARROT_ARG_PMC);

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

/*

=item C<static void convert_arg_from_int>

Autoboxes an int into the expected container type.

=cut

*/

static void
convert_arg_from_int(PARROT_INTERP, ARGMOD(call_state *st))
{
    ASSERT_ARGS(convert_arg_from_int)
    switch (st->dest.sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_FLOATVAL:
            UVal_num(st->val) = (FLOATVAL)UVal_int(st->val);
            break;
        case PARROT_ARG_STRING:
            UVal_str(st->val) = string_from_int(interp, UVal_int(st->val));
            break;
        case PARROT_ARG_PMC:
            {
            PMC * const d = pmc_new(interp,
                Parrot_get_ctx_HLL_type(interp, enum_class_Integer));

            VTABLE_set_integer_native(interp, d, UVal_int(st->val));
            UVal_pmc(st->val) = d;
            }
            break;
        default:
            break;
    }
}

/*

=item C<static void convert_arg_from_num>

Autoboxes a num into the expected container type.

=cut

*/

static void
convert_arg_from_num(PARROT_INTERP, ARGMOD(call_state *st))
{
    ASSERT_ARGS(convert_arg_from_num)
    switch (st->dest.sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_INTVAL:
            UVal_int(st->val) = (INTVAL)UVal_num(st->val);
            break;
        case PARROT_ARG_STRING:
            UVal_str(st->val) = string_from_num(interp, UVal_num(st->val));
            break;
        case PARROT_ARG_PMC:
            {
            PMC * const d = pmc_new(interp,
                Parrot_get_ctx_HLL_type(interp, enum_class_Float));

            VTABLE_set_number_native(interp, d, UVal_num(st->val));
            UVal_pmc(st->val) = d;
            }
            break;
        default:
            break;
    }
}


/*

=item C<static void convert_arg_from_str>

Autoboxes a string primitive to the expected container type.

=cut

*/

static void
convert_arg_from_str(PARROT_INTERP, ARGMOD(call_state *st))
{
    ASSERT_ARGS(convert_arg_from_str)
    switch (st->dest.sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_INTVAL:
            UVal_int(st->val) = string_to_int(interp, UVal_str(st->val));
            break;
        case PARROT_ARG_FLOATVAL:
            UVal_num(st->val) = string_to_num(interp, UVal_str(st->val));
            break;
        case PARROT_ARG_PMC:
            {
            PMC * const d = pmc_new(interp,
                Parrot_get_ctx_HLL_type(interp, enum_class_String));

            VTABLE_set_string_native(interp, d, UVal_str(st->val));
            UVal_pmc(st->val) = d;
            }
            break;
        default:
            break;
    }
}

/*

=item C<static void convert_arg_from_pmc>

Unboxes a PMC to the expected primitive type.

=cut

*/

static void
convert_arg_from_pmc(PARROT_INTERP, ARGMOD(call_state *st))
{
    ASSERT_ARGS(convert_arg_from_pmc)
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
        default:
            break;
    }
}


/*

=item C<static void check_for_opt_flag>

Processes the next argument, if it has the optional flag set.
Otherwise moves on.

=cut

*/

static void
check_for_opt_flag(ARGMOD(call_state *st), int has_arg)
{
    ASSERT_ARGS(check_for_opt_flag)
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
    PARROT_ASSERT(idx >= 0);
    CTX_REG_INT(st->dest.ctx, idx) = has_arg;
}


/*

=item C<static void clone_key_arg>

Replaces any src registers by their values (done inside clone).  This needs a
test for tailcalls too, but I think there is no syntax to pass a key to a
tailcalled function or method.

=cut

*/

static void
clone_key_arg(PARROT_INTERP, ARGMOD(call_state *st))
{
    ASSERT_ARGS(clone_key_arg)
    PMC *key = UVal_pmc(st->val);

    if (!key)
        return;

    if (key->vtable->base_type != enum_class_Key)
        return;

    for (; key; key=key_next(interp, key)) {
        /* register keys have to be cloned */
        if (PObj_get_FLAGS(key) & KEY_register_FLAG) {
            Parrot_Context temp_ctx;

            /* clone sets key values according to refered register items */
            SAVE_OFF_REGS(interp->ctx, (*(st->src.ctx)), temp_ctx)
            UVal_pmc(st->val) = VTABLE_clone(interp, key);
            RESTORE_REGS(interp->ctx, temp_ctx)
            return;
        }
    }
}


/*

=item C<static void init_first_dest_named>

Initializes dest calling state for the first named arg.

=cut

*/

static void
init_first_dest_named(PARROT_INTERP, ARGMOD(call_state *st))
{
    ASSERT_ARGS(init_first_dest_named)
    int i, n_named;

    if (st->dest.mode & CALL_STATE_SIG)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "Can't call C function with named arguments");

    st->first_named = st->dest.i;
    n_named         = 0;

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
            st->dest.slurp = pmc_new(interp,
                Parrot_get_ctx_HLL_type(interp, enum_class_Hash));

            /* pass the slurpy hash */
            idx = st->dest.u.op.pc[i];
            CTX_REG_PMC(st->dest.ctx, idx) = st->dest.slurp;
        }
        /* must be the actual arg of a named arg, count it */
        else
            n_named++;
    }

    /* only 32/64 named args allowed;
     * uses UINTVAL as a bitfield to detect duplicates */
    if (n_named >= (int)(sizeof (UINTVAL) * 8))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "Too many named arguments");

    st->named_done = 0;
}


/*

=item C<static int locate_named_named>

Locates a destination argument name, returning 0 if not found.

=cut

*/

static int
locate_named_named(PARROT_INTERP, ARGMOD(call_state *st))
{
    ASSERT_ARGS(locate_named_named)
    int i;
    int n_named = -1;

    for (i = st->first_named; i < st->dest.n; ++i) {
        int idx;
        STRING *param;

        st->dest.sig = SIG_ITEM(st->dest.u.op.signature, i);
        if (!(st->dest.sig & PARROT_ARG_NAME))
            continue;

        if (st->dest.sig & PARROT_ARG_SLURPY_ARRAY)
            return 1;

        n_named++;
        idx   = st->dest.u.op.pc[i];
        param = PARROT_ARG_CONSTANT_ISSET(st->dest.sig)
                ? st->dest.ctx->constants[idx]->u.string
                : CTX_REG_STR(st->dest.ctx, idx);

        if (st->name == param || string_equal(interp, st->name, param) == 0) {
            ++i;
            st->dest.sig = SIG_ITEM(st->dest.u.op.signature, i);
            st->dest.i   = i;

            /* if bit is set we have a duplicate */
            if (st->named_done & (1 << n_named))
                Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_INVALID_OPERATION,
                    "duplicate named argument - '%Ss' not expected", param);

            st->named_done |= 1 << n_named;
            return 1;
        }
    }

    return 0;
}


/*

=item C<static void store_arg>

Stores the next argument in the destination register appropriately.

=cut

*/

static void
store_arg(ARGIN(const call_state *st), INTVAL idx)
{
    ASSERT_ARGS(store_arg)
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
        default:
            break;
    }
}


/*

=item C<int Parrot_store_arg>

Stores the next function argument into the appropriate destination register.
Calls C<store_arg> to do most of the work. Returns 0 if an attempt is made
to store more values then there are in the signature. Returns 1 otherwise.

=cut

*/

PARROT_EXPORT
int
Parrot_store_arg(SHIM_INTERP, ARGIN(const call_state *st))
{
    ASSERT_ARGS(Parrot_store_arg)
    INTVAL idx;
    if (st->dest.i >= st->dest.n)
        return 0;

    PARROT_ASSERT(st->dest.mode & CALL_STATE_OP);
    idx = st->dest.u.op.pc[st->dest.i];
    PARROT_ASSERT(idx >= 0);
    store_arg(st, idx);

    return 1;
}


/*

=item C<static void too_few>

Throws an exception if there are too few arguments passed.

=cut

*/

static void
too_few(PARROT_INTERP, ARGIN(const call_state *st), ARGIN(const char *action))
{
    ASSERT_ARGS(too_few)
    const int max_expected_args = st->params;
    const int min_expected_args = max_expected_args - st->optionals;

    if (st->n_actual_args < min_expected_args) {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "too few arguments passed (%d) - %s%d %s expected",
            st->n_actual_args,
            (min_expected_args < max_expected_args ? "at least " : ""),
            min_expected_args, action);
    }
}


/*

=item C<static void too_many>

Throws an exception if there are too many arguments passed.

=cut

*/

static void
too_many(PARROT_INTERP, ARGIN(const call_state *st), ARGIN(const char *action))
{
    ASSERT_ARGS(too_many)
    const int max_expected_args = st->params;
    const int min_expected_args = max_expected_args - st->optionals;

    if (st->n_actual_args > max_expected_args) {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "too many arguments passed (%d) - %s%d %s expected",
            st->n_actual_args,
            (min_expected_args < max_expected_args ? "at most " : ""),
            max_expected_args, action);
    }
}


/*

=item C<static void null_val>

Adds a null value to the appropriate register.

=cut

*/

static void
null_val(int sig, ARGMOD(call_state *st))
{
    ASSERT_ARGS(null_val)
    switch (sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_INTVAL:   UVal_int(st->val) = 0;       break;
        case PARROT_ARG_FLOATVAL: UVal_num(st->val) = 0.0;     break;
        case PARROT_ARG_STRING:   UVal_str(st->val) = NULL;    break;
        case PARROT_ARG_PMC:      UVal_pmc(st->val) = PMCNULL; break;
        default:
            break;
    }
}


/*

=item C<static void check_named>

Makes sure that all required named args are set and that all optional
args and flags are set to null and false if not present.

A named arg takes the form of

    STRING* name, [INPS] actual_arg,

or

    STRING* name, [INPS] actual_arg, int opt_arg_flag

=cut

*/

static void
check_named(PARROT_INTERP, ARGMOD(call_state *st))
{
    ASSERT_ARGS(check_named)
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

            /* move on to the actual arg */
            i++;

            /* verify that an actual arg exists */
            arg_sig = st->dest.sig = SIG_ITEM(st->dest.u.op.signature, i);
            PARROT_ASSERT(!(arg_sig & PARROT_ARG_NAME));

            /* if this named arg is already filled, continue */
            if (st->named_done & (1 << n_named)) {
                arg_sig = st->dest.sig = SIG_ITEM(st->dest.u.op.signature, i+1);

                /* skip associated opt flag arg as well */
                if (arg_sig & PARROT_ARG_OPT_FLAG)
                    i++;

                continue;
            }
            else if (arg_sig & PARROT_ARG_OPTIONAL) {
                INTVAL idx;
                null_val(arg_sig, st);
                idx = st->dest.u.op.pc[i];
                store_arg(st, idx);

                /* Don't walk off the end of the array */
                if (i+1 >= st->dest.n)
                    continue;
                arg_sig = st->dest.sig = SIG_ITEM(st->dest.u.op.signature, i+1);
                if (arg_sig & PARROT_ARG_OPT_FLAG) {
                    i++;
                    idx = st->dest.u.op.pc[i];
                    CTX_REG_INT(st->dest.ctx, idx) = 0;
                }
                continue;
            }
            else {
                const   INTVAL idx   = st->dest.u.op.pc[last_name_pos];
                STRING * const param = PARROT_ARG_CONSTANT_ISSET(sig)
                    ? st->dest.ctx->constants[idx]->u.string
                    : CTX_REG_STR(st->dest.ctx, idx);

                Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_INVALID_OPERATION,
                    "too few arguments passed"
                    " - missing required named arg '%Ss'", param);
            }
        }
        else
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "invalid arg type in named portion of args");
    }
}


/*

=item C<static void init_call_stats>

Sets the default values of the passed C<call_state>.

=cut

*/

static void
init_call_stats(ARGMOD(call_state *st))
{
    ASSERT_ARGS(init_call_stats)
    /* initial guess, adjusted for :flat args */
    st->n_actual_args = st->src.n;

    st->optionals     = 0;
    st->params        = st->dest.n;
    st->name          = NULL;
    st->key           = PMCNULL;
    st->first_named   = -1;
}


/*

=item C<void Parrot_process_args>

Gets args for the current function call and puts them into position.
First it gets the positional non-slurpy parameters, then the positional
slurpy parameters, and finally the named parameters.

=cut

*/

PARROT_EXPORT
void
Parrot_process_args(PARROT_INTERP, ARGMOD(call_state *st), arg_pass_t param_or_result)
{
    ASSERT_ARGS(Parrot_process_args)
    int n_named;
    int err_check = 1;
    call_state_item *src, *dest;

    const char * const action = (param_or_result == PARROT_PASS_RESULTS)
        ? "results" : "params";

    /* Check if we should be throwing errors. This can be configured separately
     * for parameters and return values. */
    if (param_or_result == PARROT_PASS_RESULTS) {
        if (!PARROT_ERRORS_test(interp, PARROT_ERRORS_RESULT_COUNT_FLAG))
            err_check = 0;
    }
    else if (!PARROT_ERRORS_test(interp, PARROT_ERRORS_PARAM_COUNT_FLAG))
            err_check = 0;

    init_call_stats(st);

    src  = &st->src;
    dest = &st->dest;

    /* 1st: Positional non-:slurpy */
    for (; dest->i < dest->n; dest->i++) {
        INTVAL idx;
        int has_arg;

        /* check if the next dest arg is :slurpy */
        next_arg_sig(dest);
        if (dest->sig & PARROT_ARG_SLURPY_ARRAY)
            break;

        /* Check if there is another argument. We need to store the value to
         * handle :opt_flag, which needs to know if there was a preceding
         * argument. */
        has_arg = Parrot_fetch_arg(interp, st);

        /* if the src arg is named, we're done here */
        if (st->name) {
            /* but first, take care of any :optional arguments */

            /*
             * Workaround for several argument passing problems
             * RT #54860 y otros
             * Save current value while setting the optional
             */
            UnionVal old_value;
            old_value = st->val;

            while (dest->sig & PARROT_ARG_OPTIONAL) {
                null_val(st->dest.sig, st);

                /* actually store the argument */
                idx = st->dest.u.op.pc[st->dest.i];
                PARROT_ASSERT(idx >= 0);
                store_arg(st, idx);

                check_for_opt_flag(st, 0);

                /* next dest arg */
                dest->i++;
                next_arg_sig(dest);
            }

            /* Restore value */
            st->val = old_value;

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
        PARROT_ASSERT(idx >= 0);
        store_arg(st, idx);

        /* if we're at an :optional argument, check for an :opt_flag */
        if (dest->sig & PARROT_ARG_OPTIONAL)
            check_for_opt_flag(st, has_arg);
    }

    /* 2nd: Positional :slurpy */
    if (dest->sig & PARROT_ARG_SLURPY_ARRAY && !(dest->sig & PARROT_ARG_NAME)) {
        PMC * const  array = pmc_new(interp,
                Parrot_get_ctx_HLL_type(interp, enum_class_ResizablePMCArray));
        const INTVAL idx   = st->dest.u.op.pc[dest->i];

        PARROT_ASSERT(idx >= 0);

        /* Must register this PMC or it may get collected when only the struct
         * references it. */
        CTX_REG_PMC(st->dest.ctx, idx) = array;

        while (Parrot_fetch_arg(interp, st)) {
            /* if the src arg is named, we're done here */
            if (st->name)
                break;

            src->used = 1;

            /* we have to convert to a PMC so we can put it in the PMC array */
            dest->sig |= PARROT_ARG_PMC;
            Parrot_convert_arg(interp, st);

            VTABLE_push_pmc(interp, array, UVal_pmc(st->val));
        }

        dest->i++;
    }

    /* is there another argument? if we're throwing errors, that's an error */
    if (err_check && Parrot_fetch_arg(interp, st)
    && !st->name  && !(dest->sig & PARROT_ARG_NAME))
        too_many(interp, st, action);

    /* are we at the end? */
    if (dest->i == dest->n)
        return;

    /* 3rd: :named */
    init_first_dest_named(interp, st);
    n_named = 0;

    while (Parrot_fetch_arg(interp, st)) {
        src->used = 1;

        if (!st->name)
            Parrot_ex_throw_from_c_args(interp, NULL, 0,
               "positional inside named args at position %i",
               st->src.i - n_named);

        if (!locate_named_named(interp, st))
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
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
            Parrot_store_arg(interp, st);

            /* if we're at an :optional argument, check for an :opt_flag */
            if (dest->sig & PARROT_ARG_OPTIONAL)
                check_for_opt_flag(st, 1);
        }

        /* otherwise this doesn't get reset and we can't catch positional args
         * inside of named args */
        st->name = NULL;
    }

    check_named(interp, st);
}


/*

=item C<void Parrot_convert_arg>

Converts a source argument to the expected destination type.

=cut

*/

PARROT_EXPORT
void
Parrot_convert_arg(PARROT_INTERP, ARGMOD(call_state *st))
{
    ASSERT_ARGS(Parrot_convert_arg)
    /* register key args have to be cloned */
    if ((st->src.sig & PARROT_ARG_TYPE_MASK) == PARROT_ARG_PMC)
        clone_key_arg(interp, st);

    /* if types are already equivalent, no need to convert */
    if (PARROT_ARG_TYPE(st->dest.sig) == PARROT_ARG_TYPE(st->src.sig))
        return;

    /* convert */
    switch (st->src.sig & PARROT_ARG_TYPE_MASK) {
        case PARROT_ARG_INTVAL:   convert_arg_from_int(interp, st); break;
        case PARROT_ARG_FLOATVAL: convert_arg_from_num(interp, st); break;
        case PARROT_ARG_STRING:   convert_arg_from_str(interp, st); break;
        case PARROT_ARG_PMC:      convert_arg_from_pmc(interp, st); break;
        default:
            break;
    }
}


/*

=item C<void parrot_pass_args>

Main argument passing routine.

Prelims: code segments aren't yet switched, so the current constants are still
that of the caller.  The destination context is already created and set,
C<src_ctx> point to the caller's context. C<dst_seg> has the constants of the
destination.

C<what> is either C<PARROT_OP_get_params_pc> or C<PARROT_OP_get_results_pc>.
With the former arguments are passed from the caller into a subroutine, the
latter handles return values and yields.

=cut

*/

PARROT_EXPORT
void
parrot_pass_args(PARROT_INTERP,
        ARGMOD(Parrot_Context *src_ctx), ARGMOD(Parrot_Context *dest_ctx),
        ARGMOD_NULLOK(opcode_t *src_indexes), ARGMOD_NULLOK(opcode_t *dest_indexes),
        arg_pass_t param_or_result)
{
    ASSERT_ARGS(parrot_pass_args)
    call_state st;
    PMC *src_signature, *dest_signature;

    if (param_or_result == PARROT_PASS_PARAMS) {
        src_signature            = interp->args_signature;
        dest_signature           = interp->params_signature;
        interp->args_signature   = NULL;
        interp->params_signature = NULL;
    }
    else /* (param_or_result == PARROT_PASS_RESULTS) */ {
        src_signature               = interp->returns_signature;
        dest_signature              = dest_ctx->results_signature;
        interp->returns_signature   = NULL;
        dest_ctx->results_signature = NULL;
    }

    Parrot_init_arg_indexes_and_sig_pmc(interp, src_ctx, src_indexes,
        src_signature, &st.src);

    Parrot_init_arg_indexes_and_sig_pmc(interp, dest_ctx, dest_indexes,
        dest_signature, &st.dest);

    Parrot_process_args(interp, &st, param_or_result);

    /* If we created a slurpy, we had to DOD register it so it did not get
     * collected during arg processing; we'll now unregister it. */
}


/*

=item C<opcode_t * parrot_pass_args_fromc>

Passes arguments from C code with given signature to a Parrot Sub.
Prerequisites are like above.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
opcode_t *
parrot_pass_args_fromc(PARROT_INTERP, ARGIN(const char *sig),
        ARGMOD(opcode_t *dest), ARGIN(Parrot_Context *old_ctxp), va_list ap)
{
    ASSERT_ARGS(parrot_pass_args_fromc)
    call_state st;

    Parrot_init_arg_op(interp, CONTEXT(interp), dest, &st.dest);
    Parrot_init_arg_sig(interp, old_ctxp, sig, PARROT_VA_TO_VAPTR(ap), &st.src);
    Parrot_process_args(interp, &st, PARROT_PASS_PARAMS);
    return dest + st.dest.n + 2;
}


/*

=item C<static int set_retval_util>

Adds the current return parameter to the current context, and fetches
the next return parameter from the call state object.

=cut

*/

static int
set_retval_util(PARROT_INTERP, ARGIN(const char *sig),
    ARGIN(Parrot_Context *ctx), ARGMOD(call_state *st))
{
    ASSERT_ARGS(set_retval_util)
    opcode_t * const src_pc = interp->current_returns;
    int              todo   = Parrot_init_arg_op(interp, ctx, src_pc, &st->src);

    interp->current_returns = NULL;

    if (todo) {
        todo = Parrot_init_arg_sig(interp, CONTEXT(interp), sig, NULL,
            &st->dest);

        if (todo) {
            Parrot_fetch_arg(interp, st);
            Parrot_convert_arg(interp, st);
            return 1;
        }
    }

    return 0;
}


/*

=item C<void * set_retval>

Handles void and pointer (PMC *, STRING *) return values.  Returns a PMC,
STRING, or NULL pointer as appropriate.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
void *
set_retval(PARROT_INTERP, int sig_ret, ARGIN(Parrot_Context *ctx))
{
    ASSERT_ARGS(set_retval)
    call_state st;

    if (!sig_ret || sig_ret == 'v')
        return NULL;

    switch (sig_ret) {
        case 'S':
            if (set_retval_util(interp, "S", ctx, &st))
                return UVal_str(st.val);
        case 'P':
            if (set_retval_util(interp, "P", ctx, &st)) {
                PMC *retval = UVal_pmc(st.val);
                return (void *)retval;
            }
        default:
            return NULL;
    }
}


/*

=item C<INTVAL set_retval_i>

Handles an INTVAL return value, returning its value if present and 0 otherwise.

=cut

*/

INTVAL
set_retval_i(PARROT_INTERP, int sig_ret, ARGIN(Parrot_Context *ctx))
{
    ASSERT_ARGS(set_retval_i)
    call_state st;

    if (sig_ret != 'I')
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "return signature not 'I'");

    if (set_retval_util(interp, "I", ctx, &st))
        return UVal_int(st.val);

    return 0;
}


/*

=item C<FLOATVAL set_retval_f>

Handles a FLOATVAL return value, returning its value if present and 0.0
otherwise.

=cut

*/

FLOATVAL
set_retval_f(PARROT_INTERP, int sig_ret, ARGIN(Parrot_Context *ctx))
{
    ASSERT_ARGS(set_retval_f)
    call_state st;

    if (sig_ret != 'N')
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "return signature not 'N'");

    if (set_retval_util(interp, "N", ctx, &st))
        return UVal_num(st.val);

    return 0.0;
}


/*

=item C<STRING* set_retval_s>

Handles a STRING return value, returning its pointer if present and NULL
otherwise.

=cut

*/

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING*
set_retval_s(PARROT_INTERP, int sig_ret, ARGIN(Parrot_Context *ctx))
{
    ASSERT_ARGS(set_retval_s)
    call_state st;

    if (sig_ret != 'S')
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "return signature not 'S'");

    if (set_retval_util(interp, "S", ctx, &st))
        return UVal_str(st.val);

    return NULL;
}


/*

=item C<PMC* set_retval_p>

Handles a PMC return value, returning the PMC pointer if present and NULL
otherwise.

=cut

*/

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC*
set_retval_p(PARROT_INTERP, int sig_ret, ARGIN(Parrot_Context *ctx))
{
    ASSERT_ARGS(set_retval_p)
    call_state st;

    if (sig_ret != 'P')
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "return signature not 'P'");

    if (set_retval_util(interp, "P", ctx, &st))
        return UVal_pmc(st.val);

    return NULL;
}


/*

=item C<static void commit_last_arg>

Called by C<Parrot_PCCINVOKE> when it reaches the end of each arg in the arg
signature.  See C<Parrot_PCCINVOKE> for signature syntax.

=cut

*/

static void
commit_last_arg(PARROT_INTERP, int index, int cur,
    ARGMOD(opcode_t *n_regs_used), int seen_arrow, ARGIN(PMC * const *sigs),
    ARGMOD(opcode_t **indexes), ARGMOD(Parrot_Context *ctx),
    ARGIN_NULLOK(PMC *pmc), ARGIN(va_list *list))
{
    ASSERT_ARGS(commit_last_arg)
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
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "Parrot_PCCINVOKE: invalid reg type");
    }

    /* set the register offset into the index int[] */
    indexes[seen_arrow][index] = reg_offset;

    /* set the PARROT_ARG_FLAGS into the signature FIA */
    VTABLE_set_integer_keyed_int(interp, sigs[seen_arrow], index, cur);

    /* perform the arg accessor function, assigning the arg to its
     * corresponding register */
    if (!seen_arrow) {
        switch (cur & PARROT_ARG_TYPE_MASK) {
            case PARROT_ARG_INTVAL:
                CTX_REG_INT(ctx, reg_offset) = va_arg(*list, INTVAL);   break;
            case PARROT_ARG_FLOATVAL:
                CTX_REG_NUM(ctx, reg_offset) = va_arg(*list, FLOATVAL); break;
            case PARROT_ARG_STRING:
                CTX_REG_STR(ctx, reg_offset) = va_arg(*list, STRING *); break;
            case PARROT_ARG_PMC:
                CTX_REG_PMC(ctx, reg_offset) = va_arg(*list, PMC *);    break;
            default:
                Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_INVALID_OPERATION,
                    "Parrot_PCCINVOKE: invalid reg type");
        }
    }
}

/*

=item C<static Parrot_Context * count_signature_elements>

Counts the number of each type of register in a signature object. Returns
the total number of parameter arguments, the total number of result
arguments, and the number of each type needed for register allocation.
Adds the necessary registers to a new context and returns the context.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static Parrot_Context *
count_signature_elements(PARROT_INTERP, ARGIN(const char *signature),
    ARGMOD(PMC *args_sig), ARGMOD(PMC *results_sig), int flag)
{
    ASSERT_ARGS(count_signature_elements)
    const char  *x;
    unsigned int seen_arrow  = 0;

    /*Count of number of each type of arg and result, INSP->INSP */
    int          max_regs[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };

    /* variables from PCCINVOKE impl in PCCMETHOD.pm */
    /* args INSP, returns INSP */
    INTVAL n_regs_used[]     = { 0, 0, 0, 0, 0, 0, 0, 0 };

    /* # of args, # of results */
    int arg_ret_cnt[2]       = { 0, 0 };

    /* Increment these values if we are not calling from a CallSignature
       PMC */
    if (flag) {
        arg_ret_cnt[seen_arrow]++;
        max_regs[REGNO_PMC]++;
    }

    /* Loop through the signature string to count the number of each
       type of object required. We need to know so we can allocate
       an appropriate number of registers for it. */
    for (x = signature; *x != '\0'; x++) {
        switch (*x) {
            case '-':
                /* detect -> separator */
                seen_arrow = 1;
                ++x;
                if (*x != '>')
                    Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_INVALID_OPERATION,
                        "PCCINVOKE: invalid signature separator %c!",
                        *x);
                break;
            case 'I':
                arg_ret_cnt[seen_arrow]++;
                max_regs[seen_arrow * 4 + REGNO_INT]++;
                break;
            case 'N':
                arg_ret_cnt[seen_arrow]++;
                max_regs[seen_arrow * 4 + REGNO_NUM]++;
                break;
            case 'S':
                arg_ret_cnt[seen_arrow]++;
                max_regs[seen_arrow * 4 + REGNO_STR]++;
                break;
            case 'P':
                arg_ret_cnt[seen_arrow]++;
                {
                    /* Lookahead to see if PMC is marked as invocant */
                    if (*(++x) == 'i') {
                        max_regs[REGNO_PMC]++;
                    }
                    else {
                        x--; /* Undo lookahead */
                        max_regs[seen_arrow * 4 + REGNO_PMC]++;
                    }
                }
                break;
            case 'f':
            case 'n':
            case 's':
            case 'o':
            case 'p':
            /* case 'l': */ /* lookahead parameter */
            case 'i':
                break;
            default:
                Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_INVALID_OPERATION,
                    "Parrot_PCCINVOKE: invalid reg type %c!", *x);
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

    return Parrot_push_context(interp, n_regs_used);
}

/*

=item C<static void commit_last_arg_sig_object>

Called by Parrot_pcc_invoke_from_sig_object when it reaches the end of each
arg in the arg signature.  See C<Parrot_pcc_invoke_from_sig_object> for
signature syntax.

=cut

*/

static void
commit_last_arg_sig_object(PARROT_INTERP, int index, int cur,
    ARGMOD(opcode_t *n_regs_used), int seen_arrow, ARGIN(PMC * const *sigs),
    ARGMOD(opcode_t **indexes), ARGMOD(Parrot_Context *ctx),
    ARGIN(PMC *sig_obj))
{
    ASSERT_ARGS(commit_last_arg_sig_object)
    int reg_offset = 0;

    /* calculate arg's register offset */
    switch (cur & PARROT_ARG_TYPE_MASK) { /* calc reg offset */
        case PARROT_ARG_INTVAL:
            reg_offset = n_regs_used[seen_arrow * 4 + REGNO_INT]++; break;
        case PARROT_ARG_FLOATVAL:
            reg_offset = n_regs_used[seen_arrow * 4 + REGNO_NUM]++; break;
        case PARROT_ARG_STRING:
            reg_offset = n_regs_used[seen_arrow * 4 + REGNO_STR]++; break;
        case PARROT_ARG_PMC :
            if (cur & PARROT_ARG_INVOCANT) {
                if (seen_arrow == 0 && index == 0) {
                    n_regs_used[REGNO_PMC]++;
                    reg_offset = 0;
                }
                else {
                    Parrot_ex_throw_from_c_args(interp, NULL,
                            EXCEPTION_INVALID_OPERATION,
                            "Parrot_pcc_invoke: Only the first parameter can be an invocant %d, %d",
                            seen_arrow, index);
                }
            }
            else {
                reg_offset = n_regs_used[seen_arrow * 4 + REGNO_PMC]++;
            }
            break;
        default:
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "Parrot_PCCINVOKE: invalid reg type");
    }

    /* set the register offset into the index int[] */
    indexes[seen_arrow][index] = reg_offset;

    /* set the PARROT_ARG_FLAGS into the signature FIA */
    VTABLE_set_integer_keyed_int(interp, sigs[seen_arrow], index, cur);

    /* perform the arg accessor function, assigning the arg to its
     * corresponding register */
    if (!seen_arrow) {
        switch (cur & PARROT_ARG_TYPE_MASK) {
            case PARROT_ARG_INTVAL:
                CTX_REG_INT(ctx, reg_offset) = VTABLE_get_integer_keyed_int(interp, sig_obj, index);
                break;
            case PARROT_ARG_FLOATVAL:
                CTX_REG_NUM(ctx, reg_offset) = VTABLE_get_number_keyed_int(interp, sig_obj, index);
                break;
            case PARROT_ARG_STRING:
                CTX_REG_STR(ctx, reg_offset) = VTABLE_get_string_keyed_int(interp, sig_obj, index);
                break;
            case PARROT_ARG_PMC:
                CTX_REG_PMC(ctx, reg_offset) = VTABLE_get_pmc_keyed_int(interp, sig_obj, index);
                if (cur & PARROT_ARG_INVOCANT) {
                    interp->current_object = CTX_REG_PMC(ctx, reg_offset);
                }
                break;
            default:
                Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_INVALID_OPERATION,
                    "Parrot_pcc_invoke_from_sig_object: invalid reg type");
        }
    }
}

/*

=item C<static void set_context_sig_returns>

Sets the subroutine return arguments in the context C<ctx>. Takes a C string
for the return signature C<ret_x> and a list of return parameters C<result_list>.

=cut

*/

static void
set_context_sig_returns(PARROT_INTERP,
    ARGMOD(Parrot_Context *ctx), ARGMOD(opcode_t **indexes),
    ARGIN_NULLOK(const char *ret_x), ARGMOD(PMC *result_list))
{
    ASSERT_ARGS(set_context_sig_returns)
    const char   *x;
    STRING       *empty_string = CONST_STRING(interp, "");
    unsigned int  index        = 0;
    unsigned int  seen_arrow   = 1;

    /* result_accessors perform the arg accessor function,
     * assigning the corresponding registers to the result variables */
    for (x = ret_x; x && *x; x++) {
        PMC *result_item = VTABLE_get_pmc_keyed_int(interp, result_list, index);
        if (isupper((unsigned char)*x)) {
            switch (*x) {
                case 'I':
                    {
                    VTABLE_set_integer_native(interp, result_item,
                            CTX_REG_INT(ctx, indexes[seen_arrow][index]));
                    }
                    break;
                case 'N':
                    {
                    VTABLE_set_number_native(interp, result_item,
                            CTX_REG_NUM(ctx, indexes[seen_arrow][index]));
                    }
                    break;
                case 'S':
                    {
                    VTABLE_set_string_native(interp, result_item,
                            CTX_REG_STR(ctx, indexes[seen_arrow][index]));
                    }
                    break;
                case 'P':
                    {
                    VTABLE_set_pmc(interp, result_item,
                            CTX_REG_PMC(ctx, indexes[seen_arrow][index]));
                    }
                    break;
                default:
                    Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_INVALID_OPERATION,
                        "Parrot_pcc_invoke_from_sig_object: invalid reg type %c!", *x);
            }

            /* invalidate the CPointer's pointers so that GC doesn't try to
             * mark stack values -- RT #59880*/
            VTABLE_set_string_keyed_str(interp, result_item,
                empty_string, empty_string);
        }
    }

    Parrot_pop_context(interp);
}

/*

=item C<static void set_context_sig_returns_varargs>

Sets the subroutine return arguments in the context C<ctx>. Takes a C string
for the return signature C<ret_x> and a varargs list of return parameters C<returns>.

To unify this function with C<set_context_sig_returns>, C<Parrot_PCCINVOKE>
needs to be changed to convert the va_list of input arguments into a signature
object, and the results list from that object needs to be passed to this
function instead of the va_list itself.

=cut

*/

static void
set_context_sig_returns_varargs(PARROT_INTERP, ARGMOD(Parrot_Context *ctx),
    ARGMOD(opcode_t **indexes), ARGIN(const char *ret_x), ARGMOD(va_list returns))
{
    ASSERT_ARGS(set_context_sig_returns_varargs)
    unsigned int index = 0;
    unsigned int seen_arrow = 1;
    const char *x;

    /* result_accessors perform the arg accessor function,
     * assigning the corresponding registers to the result variables */
    for (x = ret_x; x && *x; x++) {
        if (isupper((unsigned char)*x)) {
            switch (*x) {
                case 'I':
                    {
                    INTVAL * const tmpINTVAL = va_arg(returns, INTVAL*);
                    *tmpINTVAL = CTX_REG_INT(ctx, indexes[seen_arrow][index]);
                    }
                    break;
                case 'N':
                    {
                    FLOATVAL * const tmpFLOATVAL = va_arg(returns, FLOATVAL*);
                    *tmpFLOATVAL = CTX_REG_NUM(ctx, indexes[seen_arrow][index]);
                    }
                    break;
                case 'S':
                    {
                    STRING ** const tmpSTRING = va_arg(returns, STRING**);
                    *tmpSTRING = CTX_REG_STR(ctx, indexes[seen_arrow][index]);
                    }
                    break;
                case 'P':
                    {
                    PMC ** const tmpPMC = va_arg(returns, PMC**);
                    *tmpPMC = CTX_REG_PMC(ctx, indexes[seen_arrow][index]);
                    }
                    break;
                default:
                    Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_INVALID_OPERATION,
                        "Parrot_PCCINVOKE: invalid reg type %c!", *x);
            }
        }
    }
    Parrot_pop_context(interp);
}

/*

=item C<static const char * set_context_sig_params>

Sets the subroutine arguments in the C<ctx> context, according to the
signature string C<signature>. Currently this function is only called
from C<Parrot_pcc_invoke_from_sig_object>, but eventually when
things are unified enough it should be called from C<Parrot_PCCINVOKE>
as well. The only difference currently between the two implementations
are the calls to C<commit_last_arg_sig_object> and C<commit_last_arg>.

=cut

*/

PARROT_CAN_RETURN_NULL
static const char *
set_context_sig_params(PARROT_INTERP, ARGIN(const char *signature),
    ARGMOD(INTVAL *n_regs_used), ARGMOD(PMC **sigs),
    ARGMOD(opcode_t **indexes), ARGMOD(Parrot_Context *ctx),
    ARGMOD(PMC *sig_obj))
{
    ASSERT_ARGS(set_context_sig_params)
    /* second loop through signature to build all index and arg_flag
     * loop also assigns args(up to the ->) to registers */
    int index      = -1;
    int seen_arrow =  0;
    int cur        =  0;
    const char *ret_x = 0;
    const char *x;

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
                commit_last_arg_sig_object(interp, index, cur, n_regs_used,
                    seen_arrow, sigs, indexes, ctx, sig_obj);

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
        else if (isupper((unsigned char)*x)) {
            if (index >= 0)
                commit_last_arg_sig_object(interp, index, cur, n_regs_used, seen_arrow,
                    sigs, indexes, ctx, sig_obj);

            index++;

            switch (*x) {
                case 'I': cur = PARROT_ARG_INTVAL;   break;
                case 'N': cur = PARROT_ARG_FLOATVAL; break;
                case 'S': cur = PARROT_ARG_STRING;   break;
                case 'P': cur = PARROT_ARG_PMC;      break;
                default:
                  Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_INVALID_OPERATION,
                    "Parrot_pcc_invoke_from_sig_object: invalid reg type %c!", *x);
            }

        }
        /* parse arg adverbs */
        else if (islower((unsigned char)*x)) {
            switch (*x) {
                case 'n': cur |= PARROT_ARG_NAME;         break;
                case 'f': cur |= PARROT_ARG_FLATTEN;      break;
                case 's': cur |= PARROT_ARG_SLURPY_ARRAY; break;
                case 'o': cur |= PARROT_ARG_OPTIONAL;     break;
                case 'p': cur |= PARROT_ARG_OPT_FLAG;     break;
                case 'l': cur |= PARROT_ARG_LOOKAHEAD;    break;
                case 'i': cur |= PARROT_ARG_INVOCANT;     break;
                default:
                    Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_INVALID_OPERATION,
                        "Parrot_pcc_invoke_from_sig_object: invalid adverb type %c!", *x);
            }
        }
    }

    if (index >= 0)
        commit_last_arg_sig_object(interp, index, cur, n_regs_used, seen_arrow, sigs,
            indexes, ctx, sig_obj);

    interp->current_args   = indexes[0];
    interp->args_signature = sigs[0];
    ctx->current_results   = indexes[1];
    ctx->results_signature = sigs[1];
    return ret_x;
}

/*

=item C<void Parrot_pcc_invoke_sub_from_c_args>

Follows the same conventions as C<Parrot_PCCINVOKE>, but the subroutine object
to invoke is passed as an argument rather than looked up by name. The signature
string and call arguments are converted to a CallSignature PMC.

=cut

*/

PARROT_EXPORT
void
Parrot_pcc_invoke_sub_from_c_args(PARROT_INTERP, ARGIN(PMC *sub_obj),
        ARGIN(const char *sig), ...)
{
    ASSERT_ARGS(Parrot_pcc_invoke_sub_from_c_args)
    PMC *sig_obj;
    va_list args;
    va_start(args, sig);
    sig_obj = Parrot_build_sig_object_from_varargs(interp, PMCNULL, sig, args);
    va_end(args);

    Parrot_pcc_invoke_from_sig_object(interp, sub_obj, sig_obj);
}

/*

=item C<void Parrot_PCCINVOKE>

C<pmc> is the invocant.

C<method_name> is the same C<method_name> used in the C<find_method>
VTABLE call

C<signature> is a C string describing the Parrot calling conventions for
Parrot_PCCINVOKE.  ... variable args contains the IN arguments followed
by the OUT results variables.  You must pass the address_of(&) the OUT
results, of course.

Signatures:
  uppercase letters repesent each arg and denote its types

  I INTVAL
  N FLOATVAL
  S STRING *
  P PMC *

  lowercase letters are adverb modifiers to the preceeding uppercase arg
  identifier

  f flatten
  n named
  s slurpy
  o optional
  p opt flag
  l lookahead parameter (next positional, or next named if no positionals)
  i invocant

  -> is the separator between args and results, similar to type theory
  notation.

  Named args require two arg slots. The first is the name, the second the arg.

Example signature:

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

PARROT_EXPORT
void
Parrot_PCCINVOKE(PARROT_INTERP, ARGIN(PMC* pmc), ARGMOD(STRING *method_name),
        ARGIN(const char *signature), ...)
{
    ASSERT_ARGS(Parrot_PCCINVOKE)
#define PCC_ARG_MAX 1024
    /* variables from PCCINVOKE impl in PCCMETHOD.pm */
    /* args INSP, returns INSP */
    INTVAL n_regs_used[] = { 0, 0, 0, 0, 0, 0, 0, 0 };

    /* Each of these is 8K. Do we want 16K on the stack? */
    opcode_t arg_indexes[PCC_ARG_MAX];
    opcode_t result_indexes[PCC_ARG_MAX];

    PMC * const args_sig    = pmc_new(interp, enum_class_FixedIntegerArray);
    PMC * const results_sig = pmc_new(interp, enum_class_FixedIntegerArray);
    PMC * const ret_cont    = new_ret_continuation_pmc(interp, NULL);

    Parrot_Context *ctx;              /* The newly created context */
    PMC              *pccinvoke_meth;

    opcode_t         *save_current_args;
    PMC              *save_args_signature;
    PMC              *save_current_object;

    /* temporary state vars for building PCC index and PCC signature arrays. */

    /* arg_indexes, result_indexes */
    opcode_t   *indexes[2];

    /* args_sig, results_sig */
    PMC        *sigs[2];

    int         seen_arrow = 0;

    const char *x;
    const char *ret_x = NULL;
    int         index = -1;
    int         cur   =  0;

    va_list list;
    va_start(list, signature);

    indexes[0] = arg_indexes;
    indexes[1] = result_indexes;
    sigs[0]    = args_sig;
    sigs[1]    = results_sig;

    /* account for passing invocant in-band */
    if (!pmc)
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
            "NULL PMC passed into Parrot_PCCINVOKE");

    ctx = count_signature_elements(interp, signature, args_sig, results_sig, 1);

    /* second loop through signature to build all index and arg_flag
     * loop also assigns args(up to the ->) to registers */

    /* account for passing invocant in-band */
    indexes[0][0] = 0;

    VTABLE_set_integer_keyed_int(interp, sigs[0], 0, PARROT_ARG_PMC);
    CTX_REG_PMC(ctx, 0) = pmc;

    n_regs_used[REGNO_PMC]++;
    index = 0;

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
        else if (isupper((unsigned char)*x)) {
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
                  Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_INVALID_OPERATION,
                    "Parrot_PCCINVOKE: invalid reg type %c!", *x);
            }

        }
        /* parse arg adverbs */
        else if (islower((unsigned char)*x)) {
            switch (*x) {
                case 'n': cur |= PARROT_ARG_NAME;         break;
                case 'f': cur |= PARROT_ARG_FLATTEN;      break;
                case 's': cur |= PARROT_ARG_SLURPY_ARRAY; break;
                case 'o': cur |= PARROT_ARG_OPTIONAL;     break;
                case 'p': cur |= PARROT_ARG_OPT_FLAG;     break;
                /* case 'l': cur |= PARROT_ARG_LOOKAHEAD;    break; */
                default:
                    Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_INVALID_OPERATION,
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
    PMC_cont(ret_cont)->from_ctx = Parrot_context_ref(interp, ctx);
    pccinvoke_meth               = VTABLE_find_method(interp, pmc, method_name);

    if (PMC_IS_NULL(pccinvoke_meth))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_METHOD_NOT_FOUND,
            "Method '%Ss' not found", method_name);
    else
        VTABLE_invoke(interp, pccinvoke_meth, NULL);

    set_context_sig_returns_varargs(interp, ctx, indexes, ret_x, list);
    PObj_live_CLEAR(args_sig);
    PObj_live_CLEAR(results_sig);
    interp->current_args   = save_current_args;
    interp->args_signature = save_args_signature;
    interp->current_object = save_current_object;
    va_end(list);
}

/*

=item C<void Parrot_pcc_invoke_method_from_c_args>

Makes a method call given the name of the method and the arguments as a
C variadic argument list. C<pmc> is the invocant, C<method_name> is the
string name of the method, C<signature> is a C string describing the
signature of the invocation, according to the Parrot calling
conventions.  The variadic argument list contains the input arguments
followed by the output results in the same order that they appear in the
function signature.

=cut

*/

PARROT_EXPORT
void
Parrot_pcc_invoke_method_from_c_args(PARROT_INTERP, ARGIN(PMC* pmc),
        ARGMOD(STRING *method_name),
        ARGIN(const char *signature), ...)
{
    PMC *sig_obj;
    PMC *sub_obj;
    va_list args;
    va_start(args, signature);
    sig_obj = Parrot_build_sig_object_from_varargs(interp, pmc, signature, args);
    va_end(args);

    /* Find the subroutine object as a named method on pmc */
    sub_obj = VTABLE_find_method(interp, pmc, method_name);
    if (PMC_IS_NULL(sub_obj))
         Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_METHOD_NOT_FOUND,
             "Method '%Ss' not found", method_name);

    /* Invoke the subroutine object with the given CallSignature object */
    Parrot_pcc_invoke_from_sig_object(interp, sub_obj, sig_obj);
    dod_unregister_pmc(interp, sig_obj);

}

/*

=item C<void Parrot_pcc_invoke_from_sig_object>

Follows the same conventions as C<Parrot_PCCINVOKE>, but the subroutine object
to invoke is passed as an argument rather than looked up by name, and the
signature string and call arguments are passed in a CallSignature PMC.

=cut

*/

PARROT_EXPORT
void
Parrot_pcc_invoke_from_sig_object(PARROT_INTERP, ARGIN(PMC *sub_obj),
        ARGIN(PMC *sig_obj))
{
    ASSERT_ARGS(Parrot_pcc_invoke_sub_from_sig_object)
#define PCC_ARG_MAX 1024
    /* variables from PCCINVOKE impl in PCCMETHOD.pm */
    /* args INSP, returns INSP */
    INTVAL n_regs_used[] = { 0, 0, 0, 0, 0, 0, 0, 0 };

    /* Each of these is 8K. Do we want 16K on the stack? */
    opcode_t arg_indexes[PCC_ARG_MAX];
    opcode_t result_indexes[PCC_ARG_MAX];

    /* create the signature string, and the various PMCs that are needed to
       store all the parameters and parameter counts. */
    char *signature         = string_to_cstring(interp, VTABLE_get_string(interp, sig_obj));
    PMC * const args_sig    = temporary_pmc_new(interp, enum_class_FixedIntegerArray);
    PMC * const results_sig = temporary_pmc_new(interp, enum_class_FixedIntegerArray);
    PMC * const ret_cont    = new_ret_continuation_pmc(interp, NULL);
    PMC * const result_list = VTABLE_get_attr_str(interp, sig_obj, CONST_STRING(interp, "returns"));

    Parrot_Context *ctx;
    opcode_t         *dest;
    opcode_t         *save_current_args;
    PMC              *save_args_signature;
    PMC              *save_current_object;

    /* temporary state vars for building PCC index and PCC signature arrays. */

    /* arg_indexes, result_indexes */
    opcode_t *indexes[2];

    /* args_sig, results_sig */
    PMC *sigs[2];

    const char *ret_x  = NULL;

    indexes[0] = arg_indexes;
    indexes[1] = result_indexes;
    sigs[0]    = args_sig;
    sigs[1]    = results_sig;

    /* Count the number of objects of each type that need to be allocated by
       the caller to perform this function call */
    ctx = count_signature_elements(interp, signature, args_sig, results_sig, 0);

    /* code from PCCINVOKE impl in PCCMETHOD.pm */
    /* Save the current values of the interpreter arguments so that additional
       child sub calls don't kill our call stack. */
    save_current_args      = interp->current_args;
    save_args_signature    = interp->args_signature;
    save_current_object    = interp->current_object;

    /* Set the function input parameters in the context structure, and return
     * the offset in the signature where the return params start. */
    ret_x = set_context_sig_params(interp, signature, n_regs_used,
                                   sigs, indexes, ctx, sig_obj);

    /* Set up the context object for the function invokation */
    interp->current_object       = PMCNULL;
    interp->current_cont         = NEED_CONTINUATION;
    ctx->current_cont            = ret_cont;
    PMC_cont(ret_cont)->from_ctx = Parrot_context_ref(interp, ctx);

    /* Invoke the function */
    dest = VTABLE_invoke(interp, sub_obj, NULL);

    /* PIR Subs need runops to run their opcodes. Methods and NCI subs
     * don't. */
    if (sub_obj->vtable->base_type == enum_class_Sub
            && PMC_IS_NULL(interp->current_object)) {
        const INTVAL old_core = interp->run_core;
        const opcode_t offset = dest - interp->code->base.data;

        /* can't re-enter the runloop from here with PIC cores: RT #60048 */
        if (interp->run_core == PARROT_CGP_CORE
        ||  interp->run_core == PARROT_SWITCH_CORE)
            interp->run_core = PARROT_SLOW_CORE;

        runops(interp, offset);
        interp->run_core = old_core;
    }

    /* Set the return values from the subroutine's context into the
       caller's context */
    set_context_sig_returns(interp, ctx, indexes, ret_x, result_list);

    temporary_pmc_free(interp, args_sig);
    temporary_pmc_free(interp, results_sig);

    interp->current_args   = save_current_args;
    interp->args_signature = save_args_signature;
    interp->current_object = save_current_object;
    string_cstring_free(signature);
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
