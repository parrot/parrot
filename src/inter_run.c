/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/inter_run.c - Parrot Interpreter - Run Ops and Methods

=head1 DESCRIPTION

Various functions that call the run loop.

=head2 Functions

=over 4

=cut

*/


#include <assert.h>
#include "parrot/parrot.h"

/*

=item C<void
runops(Interp *interpreter, size_t offset)>

Run parrot ops. Set exception handler and/or resume after exception.

=cut

*/

#define STACKED_EXCEPTIONS 1

void
runops(Interp *interpreter, size_t offs)
{
    volatile size_t offset = offs;

    interpreter->ctx.runloop_level++;
    /*
     * STACKED_EXCEPTIONS are necessary to catch exceptions in reentered
     * run loops, e.g. if a delegate methods throws an exception
     */
#if ! STACKED_EXCEPTIONS
    if (!interpreter->exceptions)
#endif
    {
        new_internal_exception(interpreter);
        interpreter->exceptions->runloop_level =
            interpreter->ctx.runloop_level;
        if (setjmp(interpreter->exceptions->destination)) {
            /* an exception was thrown */
            offset = handle_exception(interpreter);
        }
    }
    if (interpreter->profile &&
            Interp_flags_TEST(interpreter, PARROT_PROFILE_FLAG)) {
        RunProfile *profile = interpreter->profile;
        if (profile->cur_op == PARROT_PROF_EXCEPTION) {
            profile->data[PARROT_PROF_EXCEPTION].time +=
                Parrot_floatval_time() - profile->starttime;
        }
    }
    runops_int(interpreter, offset);
    /*
     * pop off exception and put it onto the free list
     * s. above
     */
    if (STACKED_EXCEPTIONS) {
        Parrot_exception *e = interpreter->exceptions;
        interpreter->exceptions = e->prev;
        e->prev = interpreter->exc_free_list;
        interpreter->exc_free_list = e;
    }
    interpreter->ctx.runloop_level--;
    /*
     * not yet - this needs classifying of exceptions and handlers
     * so that only an exit handler does catch this exception
     */
#if 0
    do_exception(interpreter, EXCEPT_exit, 0);
#endif
}

/*

=item C<void
Parrot_runops_fromc(Parrot_Interp interpreter, PMC *sub)>

Runs the Parrot ops, called from C code. The function arguments are
already setup according to Parrot calling conventions, the C<sub> argument
is an invocable C<Sub> PMC.

=cut

*/

void
Parrot_runops_fromc(Parrot_Interp interpreter, PMC *sub)
{
    PMC *ret_c, *p1;
    opcode_t offset, *dest;

    /* we need one return continuation with a NULL offset */
    p1 = REG_PMC(1);
    REG_PMC(1) = ret_c = new_ret_continuation_pmc(interpreter, NULL);
#if GC_VERBOSE
    PObj_report_SET(ret_c);     /* s. also dod.c */
#endif
    /* invoke the sub, which places the context of the sub in the
     * interpreter, and switches code segments if needed
     * Passing a dummy true destination copies registers
     */
    dest = VTABLE_invoke(interpreter, sub, (void*) 1);
    if (dest) {
        offset = dest - interpreter->code->byte_code;
        runops(interpreter, offset);
    }
    REG_PMC(1) = p1;
}

/*

=item C<void *
Parrot_run_meth_fromc(Parrot_Interp, PMC *sub, PMC *obj, STRING *meth)>

Run a method sub from C. The function arguments are
already setup according to Parrot calling conventions, the C<sub> argument
is an invocable C<Sub> PMC.

If registers a PMC return values, it is returned.

=cut

*/



/*

=item C<void *
Parrot_runops_fromc_args(Parrot_Interp interpreter, PMC *sub,
        const char *sig, ...)>

=item C<void *
Parrot_runops_fromc_args(Parrot_Interp interpreter, PMC *sub,
        const char *sig, ...)>

=item C<INTVAL
Parrot_runops_fromc_args_reti(Parrot_Interp interpreter, PMC *sub,
        const char *sig, ...)>

=item C<FLOATVAL
Parrot_runops_fromc_args_retf(Parrot_Interp interpreter, PMC *sub,
        const char *sig, ...)>

=item C<void *
Parrot_runops_fromc_arglist(Parrot_Interp interpreter, PMC *sub,
        const char *sig, va_list args)>

=item C<void *
Parrot_run_meth_fromc_args(Parrot_Interp interpreter, PMC *sub,
        PMC* obj, STRING* meth, const char *sig, ...)>

=item C<INTVAL
Parrot_run_meth_fromc_args_reti(Parrot_Interp interpreter, PMC *sub,
        PMC* obj, STRING* meth, const char *sig, ...)>

=item C<FLOATVAL
Parrot_run_meth_fromc_args_retf(Parrot_Interp interpreter, PMC *sub,
        PMC* obj, STRING* meth, const char *sig, ...)>

Run parrot ops, called from C code, function arguments are passed as
C<va_args> according to signature the C<sub> argument is an invocable
C<Sub> PMC.

Signatures are similar to NCI:

    v ... void return
    I ... INTVAL (not Interpreter)
    N ... NUMVAL
    S ... STRING*
    P ... PMC*

=cut

*/

static struct parrot_regs_t *
runops_args(Parrot_Interp interpreter, PMC *sub, PMC *obj,
        STRING *meth, const char* sig, va_list ap)
{
    opcode_t offset, *dest;
    struct parrot_regs_t *bp;
    int next[4], count[4];
    int i;
    PMC *ret_c;
    const char *p;
    PMC *p3 = PMCNULL;
    int clear_p3, need_p3, max;

    for (i = 0; i < 4; i++) {
        next[i] = 5;
        count[i] = 0;
    }

    ret_c = new_ret_continuation_pmc(interpreter, NULL);
    dest = VTABLE_invoke(interpreter, sub, NULL);
    interpreter->ctx.current_sub = REG_PMC(0) = sub;
    interpreter->ctx.current_cont = REG_PMC(1) = ret_c;
    interpreter->ctx.current_object = REG_PMC(2) = obj;
    REG_STR(0) = meth;

    /*
     * count arguments, check for overflow
     */
    for (p = sig + 1; *p; ++p) {
        switch (*p) {
            case 'v': break;
            case 'I': ++count[0]; break;
            case 'S': ++count[1]; break;
            case 'P': ++count[2]; break;
            case 'N': ++count[3]; break;
        }
    }
    REG_INT(0) = 1;     /* kind of a prototyped call */
    clear_p3 = need_p3 = max = 0;
    for (i = 0; i < 4; ++i) {
        if (count[i] < 11)
            REG_INT(i+1) = count[i];     /* # of I params */
        else if (count[i] == 11) {
            REG_INT(i+1) = 11;
            clear_p3 |= 1;
        }
        else {
            REG_INT(i+1) = 11;
            need_p3 |= 1;
            if (count[i] > max)
                max = count[i];
        }
    }
    if (need_p3) {
        p3 = pmc_new(interpreter, enum_class_Array);
        VTABLE_set_integer_native(interpreter, p3, max - 11);
        REG_PMC(3) = p3;
    }
    else if (clear_p3)
        REG_PMC(3) = p3;

    for (i = 0; *++sig; ) {
        /*
         * handle overflow: if any next[] reaches 16 create
         * overflow array in P3 and pass additional args in the array
         */
        switch (*sig) {
            case 'v':       /* void func, no params */
                break;
            case 'I':       /* REG_INT */
                if (next[0] == 16)
                    VTABLE_set_integer_keyed_int(interpreter,
                            p3, i++, va_arg(ap, INTVAL));
                else
                    REG_INT(next[0]++) = va_arg(ap, INTVAL);
                break;
            case 'S':       /* REG_STR */
                if (next[1] == 16)
                    VTABLE_set_string_keyed_int(interpreter,
                            p3, i++, va_arg(ap, STRING*));
                else
                    REG_STR(next[1]++) = va_arg(ap, STRING*);
                break;
            case 'P':       /* REG_PMC */
                if (next[2] == 16)
                    VTABLE_set_pmc_keyed_int(interpreter,
                            p3, i++, va_arg(ap, PMC*));
                else
                    REG_PMC(next[2]++) = va_arg(ap, PMC*);
                break;
            case 'N':       /* REG_NUM */
                if (next[3] == 16)
                    VTABLE_set_number_keyed_int(interpreter,
                            p3, i++, va_arg(ap, FLOATVAL));
                else
                    REG_NUM(next[3]++) = va_arg(ap, FLOATVAL);
                break;
            default:
                internal_exception(1,
                        "unhandle signature '%c' in Parrot_runops_fromc_args",
                        *sig);
        }
    }

    bp = interpreter->ctx.bp;
    if (dest) {
        offset = dest - interpreter->code->byte_code;
        runops(interpreter, offset);
    }
    return bp;
}

static void*
set_retval(Parrot_Interp interpreter, int sig_ret, struct parrot_regs_t *bp)
{
    void *retval;
    retval = NULL;
    /*
     * XXX should we trust the signature or the registers set
     *     by the subroutine or both if possible, i.e. extract
     *     e.g. an INTVAL from a returned PMC?
     */
    if (bp->int_reg.registers[3] == 1) {
        /*
         * pythons functions from pie-thon always return a PMC
         */
        switch (sig_ret) {
            case 'S':
                return VTABLE_get_string(interpreter, bp->pmc_reg.registers[5]);
            case 'P':
            case 0:
                return (void*) bp->pmc_reg.registers[5];
        }
    }
    switch (sig_ret) {
        case 0:
        case 'v': break;
        case 'S': retval = (void* ) bp->string_reg.registers[5]; break;
        case 'P': retval = (void* ) bp->pmc_reg.registers[5]; break;
        default:
            internal_exception(1,
                    "unhandle signature '%c' in set_retval", sig_ret);
    }
    return retval;
}

static INTVAL
set_retval_i(Parrot_Interp interpreter, int sig_ret, struct parrot_regs_t *bp)
{
    if (sig_ret == 'I') {
        if (bp->int_reg.registers[3] == 1)
            return VTABLE_get_integer(interpreter, bp->pmc_reg.registers[5]);
        /* else if (bp->int_reg.registers[1] == 1) */
            return bp->int_reg.registers[5];
    }
    Parrot_warn(interpreter, PARROT_WARNINGS_ALL_FLAG, "argument mismatch");
    return 0;
}

static FLOATVAL
set_retval_f(Parrot_Interp interpreter, int sig_ret, struct parrot_regs_t *bp)
{
    if (sig_ret == 'N') {
        if (bp->int_reg.registers[3] == 1)
            return VTABLE_get_number(interpreter, bp->pmc_reg.registers[5]);
        /* else if (bp->int_reg.registers[4] == 1) */
            return bp->num_reg.registers[5];
    }
    Parrot_warn(interpreter, PARROT_WARNINGS_ALL_FLAG, "argument mismatch");
    return 0;
}

void *
Parrot_run_meth_fromc(Parrot_Interp interpreter,
        PMC *sub, PMC *obj, STRING *meth)
{
    struct parrot_regs_t *bp;
    opcode_t offset, *dest;
    PMC *p1, *p2;
    STRING *s0;

    p1 = REG_PMC(1);
    p2 = REG_PMC(2);
    s0 = REG_STR(0);
    REG_PMC(2) = obj;
    REG_STR(0) = meth;
    REG_PMC(1) = new_ret_continuation_pmc(interpreter, NULL);
    dest = VTABLE_invoke(interpreter, sub, (void*)1);
    bp = interpreter->ctx.bp;
    if (dest) {
        offset = dest - interpreter->code->byte_code;
        runops(interpreter, offset);
    }
    REG_PMC(1) = p1;
    REG_PMC(2) = p2;
    REG_STR(0) = s0;
    return set_retval(interpreter, 0, bp);
}

void *
Parrot_runops_fromc_args(Parrot_Interp interpreter, PMC *sub,
        const char *sig, ...)
{
    va_list args;
    struct parrot_regs_t *bp;

    va_start(args, sig);
    bp = runops_args(interpreter, sub, PMCNULL, NULL, sig, args);
    va_end(args);
    return set_retval(interpreter, *sig, bp);
}


INTVAL
Parrot_runops_fromc_args_reti(Parrot_Interp interpreter, PMC *sub,
        const char *sig, ...)
{
    va_list args;
    struct parrot_regs_t *bp;

    va_start(args, sig);
    bp = runops_args(interpreter, sub, PMCNULL, NULL, sig, args);
    va_end(args);
    return set_retval_i(interpreter, *sig, bp);
}

FLOATVAL
Parrot_runops_fromc_args_retf(Parrot_Interp interpreter, PMC *sub,
        const char *sig, ...)
{
    va_list args;
    struct parrot_regs_t *bp;

    va_start(args, sig);
    bp = runops_args(interpreter, sub, PMCNULL, NULL, sig, args);
    va_end(args);
    return set_retval_f(interpreter, *sig, bp);
}

void*
Parrot_run_meth_fromc_args(Parrot_Interp interpreter,
        PMC *sub, PMC *obj, STRING *meth, const char *sig, ...)
{
    va_list args;
    struct parrot_regs_t *bp;

    va_start(args, sig);
    bp = runops_args(interpreter, sub, obj, meth, sig, args);
    va_end(args);
    return set_retval(interpreter, *sig, bp);
}

INTVAL
Parrot_run_meth_fromc_args_reti(Parrot_Interp interpreter,
        PMC *sub, PMC *obj, STRING *meth, const char *sig, ...)
{
    va_list args;
    struct parrot_regs_t *bp;

    va_start(args, sig);
    bp = runops_args(interpreter, sub, obj, meth, sig, args);
    va_end(args);
    return set_retval_i(interpreter, *sig, bp);
}

FLOATVAL
Parrot_run_meth_fromc_args_retf(Parrot_Interp interpreter,
        PMC *sub, PMC *obj, STRING *meth, const char *sig, ...)
{
    va_list args;
    struct parrot_regs_t *bp;

    va_start(args, sig);
    bp = runops_args(interpreter, sub, obj, meth, sig, args);
    va_end(args);
    return set_retval_f(interpreter, *sig, bp);
}

void *
Parrot_runops_fromc_arglist(Parrot_Interp interpreter, PMC *sub,
        const char *sig, va_list args)
{
    struct parrot_regs_t *bp;

    bp = runops_args(interpreter, sub, PMCNULL, NULL, sig, args);
    return set_retval(interpreter, *sig, bp);
}

INTVAL
Parrot_runops_fromc_arglist_reti(Parrot_Interp interpreter, PMC *sub,
        const char *sig, va_list args)
{
    struct parrot_regs_t *bp;

    bp = runops_args(interpreter, sub, PMCNULL, NULL, sig, args);
    return set_retval_i(interpreter, *sig, bp);
}

FLOATVAL
Parrot_runops_fromc_arglist_retf(Parrot_Interp interpreter, PMC *sub,
        const char *sig, va_list args)
{
    struct parrot_regs_t *bp;

    bp = runops_args(interpreter, sub, PMCNULL, NULL, sig, args);
    return set_retval_f(interpreter, *sig, bp);
}

void*
Parrot_run_meth_fromc_arglist(Parrot_Interp interpreter,
        PMC *sub, PMC *obj, STRING *meth, const char *sig, va_list args)
{
    struct parrot_regs_t *bp;

    bp = runops_args(interpreter, sub, obj, meth, sig, args);
    return set_retval(interpreter, *sig, bp);
}

INTVAL
Parrot_run_meth_fromc_arglist_reti(Parrot_Interp interpreter,
        PMC *sub, PMC *obj, STRING *meth, const char *sig, va_list args)
{
    struct parrot_regs_t *bp;

    bp = runops_args(interpreter, sub, obj, meth, sig, args);
    return set_retval_i(interpreter, *sig, bp);
}

FLOATVAL
Parrot_run_meth_fromc_arglist_retf(Parrot_Interp interpreter,
        PMC *sub, PMC *obj, STRING *meth, const char *sig, va_list args)
{
    struct parrot_regs_t *bp;

    bp = runops_args(interpreter, sub, obj, meth, sig, args);
    return set_retval_f(interpreter, *sig, bp);
}

/*

=back

=head1 SEE ALSO

F<include/parrot/interpreter.h>, F<src/interpreter.c>.

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
