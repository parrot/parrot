/*
Copyright (C) 2006, The Perl Foundation.
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
#include <assert.h>
#ifdef HAVE_COMPUTED_GOTO
#  include "parrot/oplib/core_ops_cgp.h"
#endif

#if HAS_JIT
#include "parrot/exec.h"
#include "jit.h"

#if PIC_TEST
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

static opcode_t *
pic_test_func(Interp *interp, INTVAL *sig_bits, void **args)
{
    INTVAL * const result = (INTVAL*) args[0];
    const INTVAL i = (INTVAL) args[1];
    const INTVAL j = (INTVAL) args[2];
    *result = i + j;
    return args[3];
}
#endif

static int
jit_can_compile_sub(Interp *interp, PMC *sub)
{
    const jit_arch_info * const info = Parrot_jit_init(interp);
    const jit_arch_regs * const regs = info->regs + JIT_CODE_SUB_REGS_ONLY;
    INTVAL * const n_regs_used = PMC_sub(sub)->n_regs_used;

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


static int
args_match_params(Interp *interp, PMC *sig_args,
        struct PackFile_ByteCode *seg, opcode_t *start)
{
    PMC *sig_params;
    int n, type;

    if (*start != PARROT_OP_get_params_pc)
        return 0;
    sig_params = seg->const_table->constants[start[1]]->u.key;
    /* verify that we actually can pass arguments */
    ASSERT_SIG_PMC(sig_params);

    n = parrot_pic_check_sig(interp, sig_args, sig_params, &type);
    if (n == -1) {
        /* arg count mismatch */
        return 0;
    }
    if (!n) {
        /* no args - this would be safe, if the JIT code could already
         * deal with no args
         * TODO
         */
        return 0;
    }
    type &= ~PARROT_ARG_CONSTANT;
    switch (type) {
        case PARROT_ARG_INTVAL:
        case PARROT_ARG_FLOATVAL:
            return 1;
    }
    return 0;
}

static int
returns_match_results(Interp *interp, PMC *sig_ret, PMC *sig_result)
{
    int type;

    const int n = parrot_pic_check_sig(interp, sig_ret, sig_result, &type);
    if (n == -1) {
        /* arg count mismatch */
        return 0;
    }
    if (!n) {
        /* no args - this would be safe, if the JIT code could already
         * deal with no args
         * TODO
         */
        return 0;
    }
    type &= ~PARROT_ARG_CONSTANT;
    switch (type) {
        case PARROT_ARG_INTVAL:
        case PARROT_ARG_FLOATVAL:
            return 1;
    }
    return 0;
}

static int
call_is_safe(Interp *interp, PMC *sub, opcode_t **set_args)
{
    PMC *called, *sig_results;

    opcode_t * pc = *set_args;
    PMC * const sig_args =
        PMC_sub(sub)->seg->const_table->constants[pc[1]]->u.key;

    /* ignore the signature for now */
    pc += 2 + SIG_ELEMS(sig_args);
    if (*pc != PARROT_OP_set_p_pc)
       return 0;
    called = PMC_sub(sub)->seg->const_table->constants[pc[2]]->u.key;
    if (called != sub) {
        /* we can JIT just recursive subs for now */
        return 0;
    }
    pc += 3;
    if (*pc != PARROT_OP_get_results_pc)
        return 0;
    sig_results = PMC_sub(sub)->seg->const_table->constants[pc[1]]->u.key;
    pc += 2 + SIG_ELEMS(sig_results);
    if (*pc != PARROT_OP_invokecc_p)
        return 0;
    pc += 2;
    *set_args = pc;
    return 1;
}

static int
ops_jittable(Interp *interp, PMC *sub, PMC *sig_results,
        struct PackFile_ByteCode *seg,
        opcode_t *pc, opcode_t *end, int *flags)
{
    while (pc < end) {
        /*
         * some special opcodes, which are handled, but not marked
         * as JITtable
         */
        const int op = *pc;
        op_info_t * const op_info = interp->op_info_table + op;
        int n = op_info->op_count;
        int i;

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
                if (op_jit[op].extcall != 0) {
                    /* non-jitted or JITted vtable */
                    return 0;
                }
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

int
parrot_pic_is_safe_to_jit(Interp *interp, PMC *sub,
        PMC *sig_args, PMC *sig_results, int *flags)
{

    opcode_t *base, *start, *end;
    STRING * const name = VTABLE_get_string(interp, sub);

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

    base = PMC_sub(sub)->seg->base.data;
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
}

funcptr_t
parrot_pic_JIT_sub(Interp *interp, PMC *sub, int flags)
{
#if PIC_TEST
    UNUSED(interp);
    UNUSED(sub);
    return (funcptr_t) pic_test_func;
#else
    /*
     * create JIT code - just a test
     */
    opcode_t * const base =  PMC_sub(sub)->seg->base.data;
    opcode_t * const start = base + PMC_sub(sub)->start_offs;
    opcode_t * const end   = base + PMC_sub(sub)->end_offs;
    /* TODO pass Sub */

    Parrot_jit_info_t * jit_info =
        parrot_build_asm(interp,
                         start, end, NULL,
                         JIT_CODE_SUB_REGS_ONLY | flags);
    if (!jit_info)
        return NULLfunc;
    return (funcptr_t) jit_info->arena.start;
#endif
}

#else   /* HAS_JIT */

int
parrot_pic_is_safe_to_jit(Interp *interp, PMC *sub,
        PMC *sig_args, PMC *sig_results, int *flags)
{
    return 0;
}

funcptr_t
parrot_pic_JIT_sub(Interp *interp, PMC *sub, int flags) {
    UNUSED(interp);
    UNUSED(sub);

    return NULLfunc;
}

#endif     /* HAS_JIT */


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
