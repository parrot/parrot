/*
Copyright (C) 2001-2003, The Perl Foundation.
$Id$

=head1 NAME

src/inter_run.c - Parrot Interpreter - Run Ops and Methods

=head1 DESCRIPTION

Various functions that call the run loop.

=head2 Functions

*/


#include <assert.h>
#include "parrot/parrot.h"
#include "parrot/oplib/ops.h"

/* HEADERIZER TARGET: include/parrot/interpreter.h */

/* HEADERIZER BEGIN: static */

static parrot_context_t * runops_args(
    Parrot_Interp interp,
    PMC *sub,
    PMC *obj,
    STRING *meth,
    const char* sig,
    va_list ap );

/* HEADERIZER END: static */

#define STACKED_EXCEPTIONS 1
/* #define RUNLOOP_TRACE 1 */

static int
runloop_id_counter = 0;          /* for synthesizing runloop ids. */

/*

FUNCDOC: runops

Run parrot ops. Set exception handler and/or resume after exception.

*/

void
runops(Interp *interp /*NN*/, size_t offs)
{
    volatile size_t offset = offs;
    const int old_runloop_id    = interp->current_runloop_id;
    const int our_runloop_level = ++interp->current_runloop_level;
    const int our_runloop_id    = ++runloop_id_counter;

    /* It is OK if the runloop ID overflows; we only ever test it for equality,
       so the chance of collision is slight. */
    interp->current_runloop_id = our_runloop_id;
#ifdef RUNLOOP_TRACE
    fprintf(stderr, "[entering loop %d, level %d]\n",
            interp->current_runloop_id, our_runloop_level);
#endif
    /*
     * STACKED_EXCEPTIONS are necessary to catch exceptions in reentered
     * run loops, e.g. if a delegate methods throws an exception
     */
#if ! STACKED_EXCEPTIONS
    if (!interp->exceptions)
#endif
    {
        new_internal_exception(interp);
        if (setjmp(interp->exceptions->destination)) {
            /* an exception was thrown */
            interp->current_runloop_level = our_runloop_level;
            interp->current_runloop_id = our_runloop_id;
#ifdef RUNLOOP_TRACE
            fprintf(stderr, "[exception; back to loop %d, level %d]\n",
                    our_runloop_id, our_runloop_level);
#endif
            offset = handle_exception(interp);
            /* update profile for exception execution time */
            if (interp->profile &&
                    Interp_flags_TEST(interp, PARROT_PROFILE_FLAG)) {
                RunProfile *profile = interp->profile;
                if (profile->cur_op == PARROT_PROF_EXCEPTION) {
                    profile->data[PARROT_PROF_EXCEPTION].time +=
                        Parrot_floatval_time() - profile->starttime;
                }
            }
        }
    }

    runops_int(interp, offset);

    /*
     * pop off exception and put it onto the free list
     * s. above
     */
    if (STACKED_EXCEPTIONS) {
        free_internal_exception(interp);
    }
#ifdef RUNLOOP_TRACE
    fprintf(stderr, "[exiting loop %d, level %d]\n",
            our_runloop_id, our_runloop_level);
#endif
    interp->current_runloop_level = our_runloop_level - 1;
    interp->current_runloop_id = old_runloop_id;
    /*
     * not yet - this needs classifying of exceptions and handlers
     * so that only an exit handler does catch this exception
     */
#if 0
    do_exception(interp, EXCEPT_exit, 0);
#endif
}

/*

FUNCDOC: Parrot_runops_fromc

Runs the Parrot ops, called from C code. The function arguments are
already setup according to Parrot calling conventions, the C<sub> argument
is an invocable C<Sub> PMC.

*/

PARROT_API
parrot_context_t *
Parrot_runops_fromc(Interp *interp /*NN*/, PMC *sub)
{
    opcode_t offset, *dest;
    parrot_context_t *ctx;

    /* we need one return continuation with a NULL offset */
    PMC * const ret_c = new_ret_continuation_pmc(interp, NULL);
    interp->current_cont = ret_c;
#if GC_VERBOSE
    PObj_report_SET(ret_c);     /* s. also dod.c */
#endif
    /* invoke the sub, which places the context of the sub in the
     * interpreter, and switches code segments if needed
     * Passing a dummy true destination copies registers
     */
    dest = VTABLE_invoke(interp, sub, (void*) 1);
    if (!dest)
        internal_exception(1, "Subroutine returned a NULL address");
    ctx = CONTEXT(interp->ctx);
    offset = dest - interp->code->base.data;
    runops(interp, offset);
    return ctx;
}


static parrot_context_t *
runops_args(Parrot_Interp interp, PMC *sub, PMC *obj,
        STRING *meth, const char* sig, va_list ap)
{
    opcode_t offset, *dest;
    parrot_context_t *ctx;
    /*
     * FIXME argument count limited - check strlen of sig
     */
    char new_sig[10];
    const char *sig_p;
    parrot_context_t * const old_ctx = CONTEXT(interp->ctx);

    interp->current_cont  = new_ret_continuation_pmc(interp, NULL);
    interp->current_object = obj;
    dest = VTABLE_invoke(interp, sub, NULL);
    if (!dest)
        internal_exception(1, "Subroutine returned a NULL address");
    if (PMC_IS_NULL(obj)) {
        /* skip over the return type */
        sig_p = sig + 1;
    }
    else if (sig[1] == 'O') {
        /* skip over the return type */
        sig_p = sig + 1;
    }
    else  {
        const size_t len = strlen(sig);
        if (len > 8)
            internal_exception(1, "too many arguments in runops_args");
        new_sig[0] = 'O';
        strcpy(new_sig + 1, sig + 1);
        sig_p = new_sig;
    }

    if (*sig_p && dest[0] == PARROT_OP_get_params_pc) {
        dest = parrot_pass_args_fromc(interp, sig_p, dest, old_ctx, ap);
    }
    /*
     * main is now started with runops_args_fromc too
     * PASM subs usually don't have get_params
     * XXX we could check, if we are running main
     else {
     real_exception(interp, NULL, E_ValueError, "no get_params in sub");
     }
     */

    ctx = CONTEXT(interp->ctx);
    offset = dest - interp->code->base.data;
    runops(interp, offset);
    return ctx;
}


/*

FUNCDOC: Parrot_run_meth_fromc

Run a method sub from C. The function arguments are
already setup according to Parrot calling conventions, the C<sub> argument
is an invocable C<Sub> PMC.

If registers a PMC return values, it is returned.

=over 4

=item Parrot_runops_fromc_args

=item Parrot_runops_fromc_args_reti

=item Parrot_runops_fromc_args_retf

=item Parrot_runops_fromc_arglist

=item Parrot_run_meth_fromc_args

=item Parrot_run_meth_fromc_args_reti

=item Parrot_run_meth_fromc_args_retf

=back

Run parrot ops, called from C code, function arguments are passed as
C<va_args> according to the signature. The C<sub> argument is an
invocable C<Sub> PMC.

Signatures are similar to NCI:

    v ... void return
    I ... INTVAL (not Interpreter)
    N ... NUMVAL
    S ... STRING*
    P ... PMC*

*/

PARROT_API
void *
Parrot_run_meth_fromc(Parrot_Interp interp,
        PMC *sub, PMC *obj, STRING *meth)
{
    parrot_context_t *ctx;
    opcode_t offset, *dest;

    interp->current_cont = new_ret_continuation_pmc(interp, NULL);
    interp->current_object = obj;
    dest = VTABLE_invoke(interp, sub, (void*)1);
    if (!dest)
        internal_exception(1, "Subroutine returned a NULL address");
    ctx = CONTEXT(interp->ctx);
    offset = dest - interp->code->base.data;
    runops(interp, offset);
    return set_retval(interp, 0, ctx);
}

PARROT_API
PMC *
Parrot_runops_fromc_args(Parrot_Interp interp, PMC *sub,
        const char *sig, ...)
{
    va_list args;
    parrot_context_t *ctx;

    va_start(args, sig);
    ctx = runops_args(interp, sub, PMCNULL, NULL, sig, args);
    va_end(args);
    return (PMC *)set_retval(interp, *sig, ctx);
}

/*

FUNCDOC: Parrot_runops_fromc_args_event

Run code from within event handlers. This variant deals with some reentrency
issues. It also should do sanity checks, if e.g. the handler subroutine
didn't return properly.

*/

PARROT_API
void *
Parrot_runops_fromc_args_event(Parrot_Interp interp, PMC *sub,
        const char *sig, ...)
{
    va_list args;
    parrot_context_t *ctx;
    opcode_t *cargs, *params, *returns;
    PMC *cont;
    void *retval;
    /*
     * running code from event handlers isn't fully reentrant due to
     * these interpreter variables - mainly related to calls
     */
    cargs   = interp->current_args;
    params  = interp->current_params;
    returns = interp->current_returns;
    cont    = interp->current_cont;
    /* what else ? */

    va_start(args, sig);
    ctx = runops_args(interp, sub, PMCNULL, NULL, sig, args);
    va_end(args);
    retval = set_retval(interp, *sig, ctx);

    interp->current_args     = cargs;
    interp->current_params   = params;
    interp->current_returns  = returns;
    interp->current_cont     = cont;
    return retval;
}

PARROT_API
INTVAL
Parrot_runops_fromc_args_reti(Parrot_Interp interp, PMC *sub,
        const char *sig, ...)
{
    va_list args;
    parrot_context_t *ctx;

    va_start(args, sig);
    ctx = runops_args(interp, sub, PMCNULL, NULL, sig, args);
    va_end(args);
    return set_retval_i(interp, *sig, ctx);
}

PARROT_API
FLOATVAL
Parrot_runops_fromc_args_retf(Parrot_Interp interp, PMC *sub,
        const char *sig, ...)
{
    va_list args;
    parrot_context_t *ctx;

    va_start(args, sig);
    ctx = runops_args(interp, sub, PMCNULL, NULL, sig, args);
    va_end(args);
    return set_retval_f(interp, *sig, ctx);
}

PARROT_API
void*
Parrot_run_meth_fromc_args(Parrot_Interp interp,
        PMC *sub, PMC *obj, STRING *meth, const char *sig, ...)
{
    va_list args;
    parrot_context_t *ctx;

    va_start(args, sig);
    ctx = runops_args(interp, sub, obj, meth, sig, args);
    va_end(args);
    return set_retval(interp, *sig, ctx);
}

PARROT_API
INTVAL
Parrot_run_meth_fromc_args_reti(Parrot_Interp interp,
        PMC *sub, PMC *obj, STRING *meth, const char *sig, ...)
{
    va_list args;
    parrot_context_t *ctx;

    va_start(args, sig);
    ctx = runops_args(interp, sub, obj, meth, sig, args);
    va_end(args);
    return set_retval_i(interp, *sig, ctx);
}

PARROT_API
FLOATVAL
Parrot_run_meth_fromc_args_retf(Parrot_Interp interp,
        PMC *sub, PMC *obj, STRING *meth, const char *sig, ...)
{
    va_list args;
    parrot_context_t *ctx;

    va_start(args, sig);
    ctx = runops_args(interp, sub, obj, meth, sig, args);
    va_end(args);
    return set_retval_f(interp, *sig, ctx);
}

PARROT_API
void *
Parrot_runops_fromc_arglist(Parrot_Interp interp, PMC *sub,
        const char *sig, va_list args)
{
    parrot_context_t *ctx;

    ctx = runops_args(interp, sub, PMCNULL, NULL, sig, args);
    return set_retval(interp, *sig, ctx);
}

PARROT_API
INTVAL
Parrot_runops_fromc_arglist_reti(Parrot_Interp interp, PMC *sub,
        const char *sig, va_list args)
{
    parrot_context_t *ctx;

    ctx = runops_args(interp, sub, PMCNULL, NULL, sig, args);
    return set_retval_i(interp, *sig, ctx);
}

PARROT_API
FLOATVAL
Parrot_runops_fromc_arglist_retf(Parrot_Interp interp, PMC *sub,
        const char *sig, va_list args)
{
    parrot_context_t *ctx;

    ctx = runops_args(interp, sub, PMCNULL, NULL, sig, args);
    return set_retval_f(interp, *sig, ctx);
}

PARROT_API
void*
Parrot_run_meth_fromc_arglist(Parrot_Interp interp,
        PMC *sub, PMC *obj, STRING *meth, const char *sig, va_list args)
{
    parrot_context_t *ctx;

    ctx = runops_args(interp, sub, obj, meth, sig, args);
    return set_retval(interp, *sig, ctx);
}

PARROT_API
INTVAL
Parrot_run_meth_fromc_arglist_reti(Parrot_Interp interp,
        PMC *sub, PMC *obj, STRING *meth, const char *sig, va_list args)
{
    parrot_context_t *ctx;

    ctx = runops_args(interp, sub, obj, meth, sig, args);
    return set_retval_i(interp, *sig, ctx);
}

PARROT_API
FLOATVAL
Parrot_run_meth_fromc_arglist_retf(Parrot_Interp interp,
        PMC *sub, PMC *obj, STRING *meth, const char *sig, va_list args)
{
    parrot_context_t *ctx;

    ctx = runops_args(interp, sub, obj, meth, sig, args);
    return set_retval_f(interp, *sig, ctx);
}

/*

=head1 SEE ALSO

F<include/parrot/interpreter.h>, F<src/interpreter.c>.

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
