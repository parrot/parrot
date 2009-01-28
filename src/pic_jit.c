/*
Copyright (C) 2006-2007, The Perl Foundation.
$Id$

=head1 NAME

src/pic_jit.c - Polymorphic Inline Cache to JIT compilation

=head1 DESCRIPTION

Some statically known and simple subroutines are replaced by
their JITted variants, if

  - JIT is supported and can JIT subroutines
  - arguments passing is simple
  - the code is fully JITtable
  - and more such checks

TODO:

  - save jit_info in sub
  - check for multiple calls to the same sub
    either reuse code or create new
  - handle void calls/returns

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/oplib/ops.h"

/* HEADERIZER HFILE: include/parrot/pic.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
static int args_match_params(PARROT_INTERP,
    ARGIN(PMC *sig_args),
    ARGIN(const PackFile_ByteCode *seg),
    ARGIN(const opcode_t *start))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

PARROT_WARN_UNUSED_RESULT
static int call_is_safe(PARROT_INTERP,
    ARGIN(PMC *sub),
    ARGMOD(opcode_t **set_args))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*set_args);

PARROT_WARN_UNUSED_RESULT
static int jit_can_compile_sub(PARROT_INTERP, ARGIN(PMC *sub))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
static int ops_jittable(PARROT_INTERP,
    ARGIN(PMC *sub),
    ARGIN(PMC *sig_results),
    ARGIN(const PackFile_ByteCode *seg),
    ARGIN(opcode_t *pc),
    ARGIN(const opcode_t *end),
    ARGOUT(int *flags))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        __attribute__nonnull__(6)
        __attribute__nonnull__(7)
        FUNC_MODIFIES(*flags);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static opcode_t * pic_test_func(PARROT_INTERP,
    SHIM(INTVAL *sig_bits),
    ARGOUT(void **args))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*args);

PARROT_WARN_UNUSED_RESULT
static int returns_match_results(PARROT_INTERP,
    ARGIN(PMC *sig_ret),
    ARGIN(PMC *sig_result))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_args_match_params __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sig_args) \
    || PARROT_ASSERT_ARG(seg) \
    || PARROT_ASSERT_ARG(start)
#define ASSERT_ARGS_call_is_safe __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sub) \
    || PARROT_ASSERT_ARG(set_args)
#define ASSERT_ARGS_jit_can_compile_sub __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sub)
#define ASSERT_ARGS_ops_jittable __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sub) \
    || PARROT_ASSERT_ARG(sig_results) \
    || PARROT_ASSERT_ARG(seg) \
    || PARROT_ASSERT_ARG(pc) \
    || PARROT_ASSERT_ARG(end) \
    || PARROT_ASSERT_ARG(flags)
#define ASSERT_ARGS_pic_test_func __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(args)
#define ASSERT_ARGS_returns_match_results __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sig_ret) \
    || PARROT_ASSERT_ARG(sig_result)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


#ifdef HAVE_COMPUTED_GOTO
#  include "parrot/oplib/core_ops_cgp.h"
#endif

#ifdef HAS_JIT
#  include "parrot/exec.h"
#  include "jit.h"

extern const jit_arch_info *
Parrot_jit_init(PARROT_INTERP);


#  ifdef PIC_TEST
/*
 * just for testing the whole scheme ...


.sub main :main
    .local int i
    i = 32
    i = __pic_test(i, 10)
    print i
    print "\n"
.end
.sub __pic_test
    .param int i
    .param int j
    $I0 = i + j
    .return ($I0)
.end
... prints 42, if PIC_TEST is 1, because the C function is called
    with -C and -S runcores.
*/

/*

=item C<static opcode_t * pic_test_func>

Determines whether the given subroutine C<sub> can be JIT'd. Counts the
number of registers used by the sub, and returns C<0> if more registers
are used then JIT supports. Returns 1 if it does not use too many registers.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static opcode_t *
pic_test_func(PARROT_INTERP, SHIM(INTVAL *sig_bits), ARGOUT(void **args))
{
    ASSERT_ARGS(pic_test_func)
    INTVAL * const result = (INTVAL*) args[0];
    INTVAL   const i      = (INTVAL) args[1];
    INTVAL   const j      = (INTVAL) args[2];

    *result = i + j;

    return args[3];
}
#  endif

/*

=item C<static int jit_can_compile_sub>

Determines whether the given subroutine C<sub> can be JIT'd. Counts the
number of registers used by the sub, and returns C<0> if more registers
are used then JIT supports. Returns 1 if it does not use too many registers.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
jit_can_compile_sub(PARROT_INTERP, ARGIN(PMC *sub))
{
    ASSERT_ARGS(jit_can_compile_sub)
    const jit_arch_info * const info = Parrot_jit_init(interp);
    const jit_arch_regs * const regs = info->regs + JIT_CODE_SUB_REGS_ONLY;
    INTVAL * const n_regs_used       = PMC_sub(sub)->n_regs_used;

    /* if the sub is using more regs than the arch has
     * we don't JIT it at all
     */
    if (n_regs_used[REGNO_INT] > regs->n_mapped_I)
        return 0;

    if (n_regs_used[REGNO_NUM] > regs->n_mapped_F)
        return 0;

    /* if the Sub is using S regs, we can't JIT it yet */
    if (n_regs_used[REGNO_STR])
        return 0;

    /* if the Sub is using more than 1 P reg, we can't JIT it yet
     * the P reg could be a (recursive) call to a sub
     */
    if (n_regs_used[REGNO_PMC] > 1)
        return 0;

    return 1;
}


/*

=item C<static int args_match_params>

Returns C<1> if the passed arguments match the subroutine's parameter list.
Returns C<0> otherwise.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
args_match_params(PARROT_INTERP, ARGIN(PMC *sig_args), ARGIN(const PackFile_ByteCode *seg),
    ARGIN(const opcode_t *start))
{
    ASSERT_ARGS(args_match_params)
    PMC *sig_params;
    int  n, type;

    if (*start != PARROT_OP_get_params_pc)
        return 0;

    sig_params = seg->const_table->constants[start[1]]->u.key;

    /* verify that we actually can pass arguments */
    ASSERT_SIG_PMC(sig_params);

    n = parrot_pic_check_sig(interp, sig_args, sig_params, &type);

    /* arg count mismatch */
    if (n == -1)
        return 0;

    /* no args - this would be safe, if the JIT code could already
    * deal with no args
    * TODO
    */
    if (!n)
        return 0;

    switch (type & ~PARROT_ARG_CONSTANT) {
        case PARROT_ARG_INTVAL:
        case PARROT_ARG_FLOATVAL:
            return 1;
        default:
            return 0;
    }
}

/*

=item C<static int returns_match_results>

Returns 1 if the return values match the returned results. Returns C<0>
otherwise.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
returns_match_results(PARROT_INTERP, ARGIN(PMC *sig_ret), ARGIN(PMC *sig_result))
{
    ASSERT_ARGS(returns_match_results)
    int type;
    const int n = parrot_pic_check_sig(interp, sig_ret, sig_result, &type);

    /* arg count mismatch */
    if (n == -1)
        return 0;

    /* no args - this would be safe, if the JIT code could already
     * deal with no args
     * TODO
     */
    if (!n)
        return 0;

    switch (type & ~PARROT_ARG_CONSTANT) {
        case PARROT_ARG_INTVAL:
        case PARROT_ARG_FLOATVAL:
            return 1;
        default:
            return 0;
    }
}

/*

=item C<static int call_is_safe>

Returns C<1> if the passed arguments match the subroutine's parameter list.
Returns C<0> otherwise.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
call_is_safe(PARROT_INTERP, ARGIN(PMC *sub), ARGMOD(opcode_t **set_args))
{
    ASSERT_ARGS(call_is_safe)
    PMC *called, *sig_results;

    opcode_t * pc        = *set_args;
    PMC * const sig_args =
        PMC_sub(sub)->seg->const_table->constants[pc[1]]->u.key;

    /* ignore the signature for now */
    pc += 2 + VTABLE_elements(interp, sig_args);

    if (*pc != PARROT_OP_set_p_pc)
       return 0;

    called = PMC_sub(sub)->seg->const_table->constants[pc[2]]->u.key;

    /* we can JIT just recursive subs for now */
    if (called != sub)
        return 0;

    pc += 3;

    if (*pc != PARROT_OP_get_results_pc)
        return 0;

    sig_results  = PMC_sub(sub)->seg->const_table->constants[pc[1]]->u.key;
    pc          += 2 + VTABLE_elements(interp, sig_results);

    if (*pc != PARROT_OP_invokecc_p)
        return 0;

    pc        += 2;
    *set_args  = pc;

    return 1;
}

/*

=item C<static int ops_jittable>

Returns 1 if the return values match the returned results. Returns C<0>
otherwise.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
ops_jittable(PARROT_INTERP, ARGIN(PMC *sub), ARGIN(PMC *sig_results),
        ARGIN(const PackFile_ByteCode *seg), ARGIN(opcode_t *pc),
        ARGIN(const opcode_t *end), ARGOUT(int *flags))
{
    ASSERT_ARGS(ops_jittable)
    while (pc < end) {
        /* special opcodes which are handled, but not marked as JITtable */
        int i;

        const int               op      = *pc;
        const op_info_t * const op_info = interp->op_info_table + op;
        int                     n       = op_info->op_count;

        switch (op) {
            case PARROT_OP_returncc:
            case PARROT_OP_get_params_pc:
                goto op_is_ok;
                break;
            case PARROT_OP_set_returns_pc:
                {
                PMC * const sig_ret = seg->const_table->constants[pc[1]]->u.key;
                if (!returns_match_results(interp, sig_ret, sig_results))
                    return 0;
                }
                goto op_is_ok;
                break;
            case PARROT_OP_set_args_pc:
                /* verify call, return address after the call */
                if (!call_is_safe(interp, sub, &pc))
                    return 0;
                *flags |= JIT_CODE_RECURSIVE;
                continue;
            default:
                /* non-jitted or JITted vtable */
                if (op_jit[op].extcall != 0)
                    return 0;
                break;
        }
        /*
         * there are some JITted opcodes like set_s_s, which we can't
         * handle (yet)
         */
        for (i = 1; i < n; i++) {
            const int type = op_info->types[i - 1];
            switch (type) {
                case PARROT_ARG_I:
                case PARROT_ARG_N:
                case PARROT_ARG_IC:
                case PARROT_ARG_NC:
                    break;
                default:
                    return 0;
            }
        }
op_is_ok:
        ADD_OP_VAR_PART(interp, seg, pc, n);
        pc += n;
    }
    return 1;
}

#endif     /* HAS_JIT */


/*

=item C<int parrot_pic_is_safe_to_jit>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
int
parrot_pic_is_safe_to_jit(PARROT_INTERP, ARGIN(PMC *sub), ARGIN(PMC *sig_args),
        ARGIN(PMC *sig_results), ARGOUT(int *flags))
{
    ASSERT_ARGS(parrot_pic_is_safe_to_jit)
#ifdef HAS_JIT
    opcode_t *base, *start, *end;

    *flags = 0;

    /*
     * 0) if runcore setting doesn't contain JIT
     *    forget it
     */
    if (!(interp->run_core & PARROT_JIT_CORE))
        return 0;

    /* 1) if the JIT system can't JIT_CODE_SUB_REGS_ONLY
     *    or the sub is using too many registers
     */
    if (!jit_can_compile_sub(interp, sub))
        return 0;

    /*
     * 2) check if get_params is matching set_args
     */

    base  = PMC_sub(sub)->seg->base.data;
    start = base + PMC_sub(sub)->start_offs;
    end   = base + PMC_sub(sub)->end_offs;

    if (!args_match_params(interp, sig_args, PMC_sub(sub)->seg, start))
        return 0;

    /*
     * 3) verify if all opcodes are JITtable, also check set_returns
     *   if it's reached
     */
    if (!ops_jittable(interp, sub, sig_results,
                PMC_sub(sub)->seg, start, end, flags))
        return 0;

    return 1;
#else
    UNUSED(interp);
    UNUSED(sub);
    UNUSED(sig_args);
    UNUSED(sig_results);
    UNUSED(flags);

    return 0;
#endif
}

/*

=item C<funcptr_t parrot_pic_JIT_sub>

RT#48260: Not yet documented!!!

=cut

*/

funcptr_t
parrot_pic_JIT_sub(PARROT_INTERP, ARGIN(PMC *sub), int flags)
{
    ASSERT_ARGS(parrot_pic_JIT_sub)
#ifdef HAS_JIT
#  ifdef PIC_TEST
    UNUSED(interp);
    UNUSED(sub);
    return (funcptr_t) pic_test_func;
#  else
    /*
     * create JIT code - just a test
     */
    opcode_t * const base  = PMC_sub(sub)->seg->base.data;
    opcode_t * const start = base + PMC_sub(sub)->start_offs;
    opcode_t * const end   = base + PMC_sub(sub)->end_offs;
    /* TODO pass Sub */

    Parrot_jit_info_t * jit_info = parrot_build_asm(interp,
                         start, end, NULL, JIT_CODE_SUB_REGS_ONLY | flags);

    if (!jit_info)
        return NULLfunc;

    return (funcptr_t) jit_info->arena.start;
#  endif
#else
    UNUSED(interp);
    UNUSED(sub);
    UNUSED(flags);

    return NULLfunc;
#endif
}


/*

=back

=head1 AUTHOR

Leopold Toetsch

=head1 SEE ALSO

F<src/pic.c>, F<src/jit.c>, F<ops/core_ops_cgp.c>,
F<include/parrot/pic.h>, F<ops/pic.ops>

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
