/*
Copyright: 2006 The Perl Foundation.  All Rights Reserved.
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
#include "parrot/jit.h"

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
pic_test_func(Interp *interpreter, INTVAL *sig_bits, void **args)
{
    opcode_t *pc;
    INTVAL *result, i, j;

    result = (INTVAL*) args[0];
    i = (INTVAL) args[1];
    j = (INTVAL) args[2];
    *result = i + j;
    pc = args[3];
    return pc;
}
#endif

static int
jit_can_compile_sub(Interp *interpreter, PMC *sub)
{
    const jit_arch_info *info;
    const jit_arch_regs *regs;
    INTVAL *n_regs_used;
          
    info = Parrot_jit_init(interpreter);

    regs = info->regs + JIT_CODE_SUB_REGS_ONLY;
    n_regs_used = PMC_sub(sub)->n_regs_used;

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
args_match_params(Interp *interpreter, PMC *sig_args,
        struct PackFile_ByteCode *seg, opcode_t *start)
{
    PMC *sig_params;
    int n, type;
    
    if (*start != PARROT_OP_get_params_pc)
        return 0;
    sig_params = seg->const_table->constants[start[1]]->u.key;
    /* verify that we actually can pass arguments */
    ASSERT_SIG_PMC(sig_params);

    n = parrot_pic_check_sig(interpreter, sig_args, sig_params, &type);
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
returns_match_results(Interp *interpreter, PMC *sig_ret, PMC *sig_result)
{
    int n, type;
    
    n = parrot_pic_check_sig(interpreter, sig_ret, sig_result, &type);
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
call_is_safe(Interp *interpreter, PMC *sub, opcode_t **set_args)
{
    opcode_t *pc;
    PMC *sig_args, *called, *sig_results;

    pc = *set_args;
    sig_args = PMC_sub(sub)->seg->const_table->constants[pc[1]]->u.key;
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
ops_jittable(Interp *interpreter, PMC *sub, PMC *sig_results, 
        struct PackFile_ByteCode *seg,
        opcode_t *pc, opcode_t *end, int *flags)
{
    op_info_t *op_info;
    int i, n, op;
    PMC *sig_ret;

    while (pc < end) {
        op = *pc;
        /*
         * some special opcodes, which are handled, but not marked
         * as JITtable
         */
        op_info = interpreter->op_info_table + op;
        n = op_info->op_count;

        switch (op) {
            case PARROT_OP_returncc:
            case PARROT_OP_get_params_pc:
                goto op_is_ok;
                break;
            case PARROT_OP_set_returns_pc:
                sig_ret = seg->const_table->constants[pc[1]]->u.key;
                if (!returns_match_results(interpreter, sig_ret, sig_results))
                    return 0;
                goto op_is_ok;
                break;
            case PARROT_OP_set_args_pc:
                /* verify call, return address after the call */
                if (!call_is_safe(interpreter, sub, &pc))
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
            opcode_t arg = pc[i];
            int type;

            type = op_info->types[i - 1];
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
        ADD_OP_VAR_PART(interpreter, seg, pc, n);
        pc += n;
    }
    return 1;
}

int
parrot_pic_is_safe_to_jit(Interp *interpreter, PMC *sub,
	PMC *sig_args, PMC *sig_results, int *flags)
{
    STRING *name;

    opcode_t *base, *start, *end;

    *flags = 0;
    /* simplify debugging */
    name = VTABLE_get_string(interpreter, sub);

    /*
     * 0) if runcore setting doesn't contain JIT
     *    forget it
     */
    if (!(interpreter->run_core & PARROT_JIT_CORE))
        return 0;

    /* 1) if the JIT system can't JIT_CODE_SUB_REGS_ONLY
     *    or the sub is using too many registers
     */ 
    if (!jit_can_compile_sub(interpreter, sub))
        return 0;
    /*
     * 2) check if get_params is matching set_args
     */

    base = PMC_sub(sub)->seg->base.data;
    start = base + PMC_sub(sub)->start_offs;
    end   = base + PMC_sub(sub)->end_offs;

    if (!args_match_params(interpreter, sig_args, PMC_sub(sub)->seg, start))
        return 0;

    /*
     * 3) verify if all opcodes are JITtable, also check set_returns
     *   if it's reached
     */
    if (!ops_jittable(interpreter, sub, sig_results, 
                PMC_sub(sub)->seg, start, end, flags))
        return 0;

    return 1;
}

funcptr_t 
parrot_pic_JIT_sub(Interp *interpreter, PMC *sub, int flags) {
#if PIC_TEST
    UNUSED(interpreter);
    UNUSED(sub);
    return (funcptr_t) pic_test_func;
#else
    /*
     * create JIT code - just a test
     */
    Parrot_jit_info_t *jit_info;
    opcode_t *base, *start, *end;

    base = PMC_sub(sub)->seg->base.data;
    start = base + PMC_sub(sub)->start_offs;
    end   = base + PMC_sub(sub)->end_offs;
    /* TODO pass Sub */

    jit_info = parrot_build_asm(interpreter, start, end, NULL,
            JIT_CODE_SUB_REGS_ONLY | flags);
    if (!jit_info)
        return NULLfunc;
    return (funcptr_t) jit_info->arena.start;
#endif
}

#else   /* HAS_JIT */

int
parrot_pic_is_safe_to_jit(Interp *interpreter, PMC *sub,
	PMC *sig_args, PMC *sig_results, int *flags)
{
    return 0;
}

funcptr_t 
parrot_pic_JIT_sub(Interp *interpreter, PMC *sub, int flags) {
    UNUSED(interpreter);
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
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
