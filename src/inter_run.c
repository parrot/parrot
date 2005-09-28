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

    CONTEXT(interpreter->ctx)->runloop_level++;
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
            CONTEXT(interpreter->ctx)->runloop_level;
        if (setjmp(interpreter->exceptions->destination)) {
            /* an exception was thrown */
            offset = handle_exception(interpreter);
            /* update profile for exception execution time */
            if (interpreter->profile &&
                    Interp_flags_TEST(interpreter, PARROT_PROFILE_FLAG)) {
                RunProfile *profile = interpreter->profile;
                if (profile->cur_op == PARROT_PROF_EXCEPTION) {
                    profile->data[PARROT_PROF_EXCEPTION].time +=
                        Parrot_floatval_time() - profile->starttime;
                }
            }
        }
    }

    /*
     * XXX this is broken
     *  - the runloop_level has to be in the interpreter struct
     *  - the exception loop level must be part of the exception
     *    handler
     */
    if (1 || interpreter->exceptions->runloop_level ==
            CONTEXT(interpreter->ctx)->runloop_level) {
        /* if we are coming from an exception and it was thrown deeper
         * in a nested run loop, we just leave this loop
         */
        runops_int(interpreter, offset);
    }
    /*
     * pop off exception and put it onto the free list
     * s. above
     */
    if (STACKED_EXCEPTIONS) {
        free_internal_exception(interpreter);
    }
    CONTEXT(interpreter->ctx)->runloop_level--;
    /*
     * not yet - this needs classifying of exceptions and handlers
     * so that only an exit handler does catch this exception
     */
#if 0
    do_exception(interpreter, EXCEPT_exit, 0);
#endif
}

/*

=item C<struct parrot_regs_t *
Parrot_runops_fromc(Parrot_Interp interpreter, PMC *sub)>

Runs the Parrot ops, called from C code. The function arguments are
already setup according to Parrot calling conventions, the C<sub> argument
is an invocable C<Sub> PMC.

=cut

*/

struct parrot_regs_t *
Parrot_runops_fromc(Parrot_Interp interpreter, PMC *sub)
{
    PMC *ret_c;
    opcode_t offset, *dest;
    struct parrot_regs_t *bp;

    /* we need one return continuation with a NULL offset */
    interpreter->current_cont = ret_c =
        new_ret_continuation_pmc(interpreter, NULL);
#if GC_VERBOSE
    PObj_report_SET(ret_c);     /* s. also dod.c */
#endif
    /* invoke the sub, which places the context of the sub in the
     * interpreter, and switches code segments if needed
     * Passing a dummy true destination copies registers
     */
    dest = VTABLE_invoke(interpreter, sub, (void*) 1);
    if (!dest)
        internal_exception(1, "Subroutine returned a NULL address");
    bp = interpreter->ctx.bp;
    offset = dest - interpreter->code->base.data;
    runops(interpreter, offset);
    return bp;
}


static struct parrot_regs_t *
runops_args(Parrot_Interp interpreter, PMC *sub, PMC *obj,
        STRING *meth, const char* sig, va_list ap)
{
    opcode_t offset, *dest;
    struct parrot_regs_t *bp;
    parrot_context_t old_ctx;
    int i;
    /*
     * FIXME argument count limited - check strlen of sig
     */
    char new_sig[10];
    const char *sig_p;

    old_ctx = interpreter->ctx;
    interpreter->current_cont  = new_ret_continuation_pmc(interpreter, NULL);
    interpreter->current_object = obj;
    dest = VTABLE_invoke(interpreter, sub, NULL);
    if (!dest)
        internal_exception(1, "Subroutine returned a NULL address");
    if (PMC_IS_NULL(obj)) {
        sig_p = sig + 1;
    }
    else if (sig[1] == 'O') {
        sig_p = sig + 1;
    }
    else  {
        size_t len = strlen(sig);
        if (len > 8)
            internal_exception(1, "too many arguments in runops_args");
        new_sig[0] = 'O';
        strcpy(new_sig + 1, sig + 1);
        sig_p = new_sig;
    }
    if (*sig_p) {
        dest = parrot_pass_args_fromc(interpreter, sig_p, dest,
                &old_ctx, ap);
    }

    bp = interpreter->ctx.bp;
    offset = dest - interpreter->code->base.data;
    runops(interpreter, offset);
    return bp;
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
C<va_args> according to the signature. The C<sub> argument is an
invocable C<Sub> PMC.

Signatures are similar to NCI:

    v ... void return
    I ... INTVAL (not Interpreter)
    N ... NUMVAL
    S ... STRING*
    P ... PMC*

=cut

*/

void *
Parrot_run_meth_fromc(Parrot_Interp interpreter,
        PMC *sub, PMC *obj, STRING *meth)
{
    struct parrot_regs_t *bp;
    opcode_t offset, *dest;

    interpreter->current_cont = new_ret_continuation_pmc(interpreter, NULL);
    interpreter->current_object = obj;
    dest = VTABLE_invoke(interpreter, sub, (void*)1);
    if (!dest)
        internal_exception(1, "Subroutine returned a NULL address");
    bp = interpreter->ctx.bp;
    offset = dest - interpreter->code->base.data;
    runops(interpreter, offset);
    return set_retval(interpreter, 0, PMC_sub(sub)->seg, bp);
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
    return set_retval(interpreter, *sig, PMC_sub(sub)->seg, bp);
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
    return set_retval_i(interpreter, *sig, PMC_sub(sub)->seg, bp);
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
    return set_retval_f(interpreter, *sig, PMC_sub(sub)->seg, bp);
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
    return set_retval(interpreter, *sig, PMC_sub(sub)->seg, bp);
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
    return set_retval_i(interpreter, *sig, PMC_sub(sub)->seg, bp);
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
    return set_retval_f(interpreter, *sig, PMC_sub(sub)->seg, bp);
}

void *
Parrot_runops_fromc_arglist(Parrot_Interp interpreter, PMC *sub,
        const char *sig, va_list args)
{
    struct parrot_regs_t *bp;

    bp = runops_args(interpreter, sub, PMCNULL, NULL, sig, args);
    return set_retval(interpreter, *sig, PMC_sub(sub)->seg, bp);
}

INTVAL
Parrot_runops_fromc_arglist_reti(Parrot_Interp interpreter, PMC *sub,
        const char *sig, va_list args)
{
    struct parrot_regs_t *bp;

    bp = runops_args(interpreter, sub, PMCNULL, NULL, sig, args);
    return set_retval_i(interpreter, *sig, PMC_sub(sub)->seg, bp);
}

FLOATVAL
Parrot_runops_fromc_arglist_retf(Parrot_Interp interpreter, PMC *sub,
        const char *sig, va_list args)
{
    struct parrot_regs_t *bp;

    bp = runops_args(interpreter, sub, PMCNULL, NULL, sig, args);
    return set_retval_f(interpreter, *sig, PMC_sub(sub)->seg, bp);
}

void*
Parrot_run_meth_fromc_arglist(Parrot_Interp interpreter,
        PMC *sub, PMC *obj, STRING *meth, const char *sig, va_list args)
{
    struct parrot_regs_t *bp;

    bp = runops_args(interpreter, sub, obj, meth, sig, args);
    return set_retval(interpreter, *sig, PMC_sub(sub)->seg, bp);
}

INTVAL
Parrot_run_meth_fromc_arglist_reti(Parrot_Interp interpreter,
        PMC *sub, PMC *obj, STRING *meth, const char *sig, va_list args)
{
    struct parrot_regs_t *bp;

    bp = runops_args(interpreter, sub, obj, meth, sig, args);
    return set_retval_i(interpreter, *sig, PMC_sub(sub)->seg, bp);
}

FLOATVAL
Parrot_run_meth_fromc_arglist_retf(Parrot_Interp interpreter,
        PMC *sub, PMC *obj, STRING *meth, const char *sig, va_list args)
{
    struct parrot_regs_t *bp;

    bp = runops_args(interpreter, sub, obj, meth, sig, args);
    return set_retval_f(interpreter, *sig, PMC_sub(sub)->seg, bp);
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
