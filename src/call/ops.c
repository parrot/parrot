/*
Copyright (C) 2001-2008, Parrot Foundation.
$Id$

=head1 Calling Ops

=head1 Description

Various functions that call the run loop.

=head2 Functions

=over 4

=cut

*/


#include "parrot/parrot.h"
#include "parrot/oplib/ops.h"
#include "../pmc/pmc_continuation.h"

/* HEADERIZER HFILE: include/parrot/call.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static Parrot_Context * runops_args(PARROT_INTERP,
    ARGIN(PMC *sub),
    ARGIN_NULLOK(PMC *obj),
    SHIM(STRING *meth),
    ARGIN(const char *sig),
    va_list ap)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(5);

#define ASSERT_ARGS_runops_args __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sub) \
    || PARROT_ASSERT_ARG(sig)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

#define STACKED_EXCEPTIONS 1
#define RUNLOOP_TRACE      0

static int
runloop_id_counter = 0;          /* for synthesizing runloop ids. */

/*

=item C<void runops>

Run parrot ops. Set exception handler and/or resume after exception.

=cut

*/

void
runops(PARROT_INTERP, size_t offs)
{
    ASSERT_ARGS(runops)
    volatile size_t offset            = offs;
    const    int    old_runloop_id    = interp->current_runloop_id;
    const    int    our_runloop_level = ++interp->current_runloop_level;
    const    int    our_runloop_id    = ++runloop_id_counter;

    /* It is OK if the runloop ID overflows; we only ever test it for equality,
       so the chance of collision is slight. */
    interp->current_runloop_id = our_runloop_id;

#if RUNLOOP_TRACE
    fprintf(stderr, "[entering loop %d, level %d]\n",
            interp->current_runloop_id, our_runloop_level);
#endif

    /*
     * STACKED_EXCEPTIONS are necessary to catch exceptions in reentered
     * run loops, e.g. if a delegate method throws an exception
     */
#if ! STACKED_EXCEPTIONS
    if (!interp->current_runloop)
#endif
    {
        new_runloop_jump_point(interp);
        if (setjmp(interp->current_runloop->resume)) {
            /* an exception was handled */
            if (STACKED_EXCEPTIONS)
                free_runloop_jump_point(interp);

            interp->current_runloop_level = our_runloop_level - 1;
            interp->current_runloop_id    = old_runloop_id;

#if RUNLOOP_TRACE
            fprintf(stderr, "[handled exception; back to loop %d, level %d]\n",
                    interp->current_runloop_id, interp->current_runloop_level);
#endif
            return;
        }
    }

    runops_int(interp, offset);

    /* Remove the current runloop marker (put it on the free list). */
    if (STACKED_EXCEPTIONS || interp->current_runloop)
        free_runloop_jump_point(interp);

#if RUNLOOP_TRACE
    fprintf(stderr, "[exiting loop %d, level %d]\n",
            our_runloop_id, our_runloop_level);
#endif

    interp->current_runloop_level = our_runloop_level - 1;
    interp->current_runloop_id    = old_runloop_id;
}

/*

=item C<Parrot_Context * Parrot_runops_fromc>

Runs the Parrot ops, called from C code. The function arguments are
already setup according to Parrot calling conventions, the C<sub> argument
is an invocable C<Sub> PMC.

=cut

*/

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
Parrot_Context *
Parrot_runops_fromc(PARROT_INTERP, ARGIN(PMC *sub))
{
    ASSERT_ARGS(Parrot_runops_fromc)
    opcode_t offset, *dest;
    Parrot_Context *ctx;

    /* we need one return continuation with a NULL offset */
    PMC * const ret_c    = new_ret_continuation_pmc(interp, NULL);
    interp->current_cont = ret_c;
#if defined GC_VERBOSE && GC_VERBOSE
    PObj_report_SET(ret_c);     /* s. also src/gc/api.c */
#endif
    /* invoke the sub, which places the context of the sub in the
     * interpreter, and switches code segments if needed
     * Passing a dummy true destination copies registers
     */
    dest = VTABLE_invoke(interp, sub, (void*) 1);
    if (!dest)
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
            "Subroutine returned a NULL address");

    ctx    = CONTEXT(interp);
    offset = dest - interp->code->base.data;
    runops(interp, offset);
    return ctx;
}


/*

=item C<static Parrot_Context * runops_args>

Calls the PMC subroutine C<sub> with optional name C<meth>. If PMC object
C<obj> is provided, the call is treated as a method call on that object.
The function has a function signature C<sig> and a variadic argument list
C<ap>.

Signatures are similar to NCI:

    v ... void return
    I ... INTVAL (not Interpreter)
    N ... NUMVAL
    S ... STRING*
    P ... PMC*

TODO: Update this list of possible signature elements.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static Parrot_Context *
runops_args(PARROT_INTERP, ARGIN(PMC *sub), ARGIN_NULLOK(PMC *obj),
        SHIM(STRING *meth), ARGIN(const char *sig), va_list ap)
{
    ASSERT_ARGS(runops_args)
    opcode_t offset, *dest;
    Parrot_Context *ctx;

    char new_sig[10];
    const char *sig_p;
    Parrot_Context * const old_ctx = CONTEXT(interp);

    interp->current_cont  = new_ret_continuation_pmc(interp, NULL);
    interp->current_object = obj;
    dest = VTABLE_invoke(interp, sub, NULL);
    if (!dest)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PARROT_USAGE_ERROR,
            "Subroutine returned a NULL address");

    /* The following code assumes that an empty signature is not valid,
     * check that condition and throws in that case.
     */
    if (sig[0] == '\0')
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PARROT_USAGE_ERROR,
                "Invalid empty signature");

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
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                "too many arguments in runops_args");

        new_sig[0] = 'O';
        /* -1 from the end, +1 for the nul at the end */
        memcpy(new_sig+1, sig+1, len);
        sig_p = new_sig;
    }

    if (*sig_p && (dest[0]     == PARROT_OP_get_params_pc
    || (sub->vtable->base_type == enum_class_ExceptionHandler
    &&  PMC_cont(sub)->current_results))) {
        dest = parrot_pass_args_fromc(interp, sig_p, dest, old_ctx, ap);
    }

    /*
     * main is now started with runops_args_fromc too
     * PASM subs usually don't have get_params
     * XXX we could check, if we are running main
     else
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "no get_params in sub");
     */

    ctx    = Parrot_context_ref(interp, CONTEXT(interp));
    offset = dest - interp->code->base.data;
    runops(interp, offset);
    return ctx;
}


/*

=item C<void * Parrot_run_meth_fromc>

Run a method sub from C. The function arguments are
already setup according to Parrot calling conventions, the C<sub> argument
is an invocable C<Sub> PMC.

If a PMC return value is registered it is returned.

=cut

*/

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
void *
Parrot_run_meth_fromc(PARROT_INTERP, ARGIN(PMC *sub), ARGIN_NULLOK(PMC *obj), SHIM(STRING *meth))
{
    ASSERT_ARGS(Parrot_run_meth_fromc)
    Parrot_Context *ctx;
    opcode_t offset, *dest;

    interp->current_cont   = new_ret_continuation_pmc(interp, NULL);
    interp->current_object = obj;
    dest                   = VTABLE_invoke(interp, sub, (void *)1);

    if (!dest)
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
            "Subroutine returned a NULL address");

    ctx    = CONTEXT(interp);
    offset = dest - interp->code->base.data;
    runops(interp, offset);
    return set_retval(interp, 0, ctx);
}

/*

=item C<PMC * Parrot_runops_fromc_args>

Run parrot ops, called from C code, function arguments are passed as
C<va_args> according to the signature. The C<sub> argument is an
invocable C<Sub> PMC.

=cut

*/

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_runops_fromc_args(PARROT_INTERP, ARGIN(PMC *sub), ARGIN(const char *sig), ...)
{
    ASSERT_ARGS(Parrot_runops_fromc_args)
    va_list args;
    Parrot_Context *ctx;
    PMC *retval;

    va_start(args, sig);
    ctx = runops_args(interp, sub, PMCNULL, NULL, sig, args);
    va_end(args);
    retval = (PMC *)set_retval(interp, *sig, ctx);
    Parrot_free_context(interp, ctx, 1);
    return retval;
}

/*

=item C<void * Parrot_runops_fromc_args_event>

Run code from within event handlers. This variant deals with some reentrency
issues. It also should do sanity checks, if e.g. the handler subroutine
didn't return properly.

=cut

*/

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
void *
Parrot_runops_fromc_args_event(PARROT_INTERP, ARGIN(PMC *sub),
        ARGIN(const char *sig), ...)
{
    ASSERT_ARGS(Parrot_runops_fromc_args_event)
    va_list args;
    Parrot_Context *ctx;
    void *retval;
    /*
     * running code from event handlers isn't fully reentrant due to
     * these interpreter variables - mainly related to calls
     */
    opcode_t * const cargs   = interp->current_args;
    opcode_t * const params  = interp->current_params;
    opcode_t * const returns = interp->current_returns;
    PMC *      const cont    = interp->current_cont;
    /* what else ? */

    va_start(args, sig);
    ctx = runops_args(interp, sub, PMCNULL, NULL, sig, args);
    va_end(args);
    retval = set_retval(interp, *sig, ctx);
    Parrot_free_context(interp, ctx, 1);

    interp->current_args     = cargs;
    interp->current_params   = params;
    interp->current_returns  = returns;
    interp->current_cont     = cont;
    return retval;
}

/*

=item C<INTVAL Parrot_runops_fromc_args_reti>

Called from C code, runs a Parrot subroutine C<sub>. The subroutine has
function signature C<sig> and a C variadic argument list. Returns an
C<INTVAL>.

=cut

*/

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
INTVAL
Parrot_runops_fromc_args_reti(PARROT_INTERP, ARGIN(PMC *sub),
        ARGIN(const char *sig), ...)
{
    ASSERT_ARGS(Parrot_runops_fromc_args_reti)
    va_list args;
    Parrot_Context *ctx;
    INTVAL retval;

    va_start(args, sig);
    ctx = runops_args(interp, sub, PMCNULL, NULL, sig, args);
    va_end(args);
    retval = set_retval_i(interp, *sig, ctx);
    Parrot_free_context(interp, ctx, 1);
    return retval;
}

/*

=item C<FLOATVAL Parrot_runops_fromc_args_retf>

Called from C code, runs a Parrot subroutine C<sub>. The subroutine has
function signature C<sig> and a C variadic argument list. Returns a
C<FLOATVAL>.

=cut

*/

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
FLOATVAL
Parrot_runops_fromc_args_retf(PARROT_INTERP, ARGIN(PMC *sub),
        ARGIN(const char *sig), ...)
{
    ASSERT_ARGS(Parrot_runops_fromc_args_retf)
    va_list args;
    Parrot_Context *ctx;
    FLOATVAL retval;

    va_start(args, sig);
    ctx = runops_args(interp, sub, PMCNULL, NULL, sig, args);
    va_end(args);
    retval = set_retval_f(interp, *sig, ctx);
    Parrot_free_context(interp, ctx, 1);
    return retval;
}

/*

=item C<void* Parrot_run_meth_fromc_args>

Called from C code, runs a Parrot subroutine C<sub> as a method on object
C<obj>. The subroutine has function signature C<sig> and a C variadic argument
list.

=cut

*/

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
void*
Parrot_run_meth_fromc_args(PARROT_INTERP, ARGIN(PMC *sub), ARGIN_NULLOK(PMC *obj),
        ARGIN(STRING *meth), ARGIN(const char *sig), ...)
{
    ASSERT_ARGS(Parrot_run_meth_fromc_args)
    va_list args;
    Parrot_Context *ctx;
    void* retval;

    va_start(args, sig);
    ctx = runops_args(interp, sub, obj, meth, sig, args);
    va_end(args);
    retval = set_retval(interp, *sig, ctx);
    Parrot_free_context(interp, ctx, 1);
    return retval;
}

/*

=item C<INTVAL Parrot_run_meth_fromc_args_reti>

Called from C code, runs a Parrot subroutine C<sub> as a method on object
C<obj>. The subroutine has function signature C<sig> and a C variadic argument
list. Returns an C<INTVAL>.

=cut

*/

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
INTVAL
Parrot_run_meth_fromc_args_reti(PARROT_INTERP, ARGIN(PMC *sub), ARGIN_NULLOK(PMC *obj),
        ARGIN(STRING *meth), ARGIN(const char *sig), ...)
{
    ASSERT_ARGS(Parrot_run_meth_fromc_args_reti)
    va_list args;
    Parrot_Context *ctx;
    INTVAL retval;

    va_start(args, sig);
    ctx = runops_args(interp, sub, obj, meth, sig, args);
    va_end(args);
    retval = set_retval_i(interp, *sig, ctx);
    Parrot_free_context(interp, ctx, 1);
    return retval;
}

/*

=item C<FLOATVAL Parrot_run_meth_fromc_args_retf>

Called from C code, runs a Parrot subroutine C<sub> as a method on object
C<obj>. The subroutine has function signature C<sig> and a C variadic argument
list C<args>. Returns a C<FLOATVAL>.

=cut

*/

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
FLOATVAL
Parrot_run_meth_fromc_args_retf(PARROT_INTERP, ARGIN(PMC *sub), ARGIN_NULLOK(PMC *obj),
        ARGIN(STRING *meth), ARGIN(const char *sig), ...)
{
    ASSERT_ARGS(Parrot_run_meth_fromc_args_retf)
    va_list args;
    Parrot_Context *ctx;
    FLOATVAL retval;

    va_start(args, sig);
    ctx = runops_args(interp, sub, obj, meth, sig, args);
    va_end(args);
    retval = set_retval_f(interp, *sig, ctx);
    Parrot_free_context(interp, ctx, 1);
    return retval;
}

/*

=item C<void * Parrot_runops_fromc_arglist>

Called from C code, runs a Parrot subroutine C<sub>.
The subroutine has function signature C<sig> and a C C<va_list>
argument list C<args>.

=cut

*/

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
void *
Parrot_runops_fromc_arglist(PARROT_INTERP, ARGIN(PMC *sub),
        ARGIN(const char *sig), va_list args)
{
    ASSERT_ARGS(Parrot_runops_fromc_arglist)
    void* retval;
    Parrot_Context * const ctx = runops_args(interp, sub, PMCNULL, NULL, sig, args);

    retval = set_retval(interp, *sig, ctx);
    Parrot_free_context(interp, ctx, 1);
    return retval;
}

/*

=item C<INTVAL Parrot_runops_fromc_arglist_reti>

Called from C code, runs a Parrot subroutine C<sub>.
The subroutine has function signature C<sig> and a C C<va_list>
argument list C<args>. Returns an C<INTVAL>.

=cut

*/

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
INTVAL
Parrot_runops_fromc_arglist_reti(PARROT_INTERP, ARGIN(PMC *sub),
        ARGIN(const char *sig), va_list args)
{
    ASSERT_ARGS(Parrot_runops_fromc_arglist_reti)
    INTVAL retval;
    Parrot_Context * const ctx = runops_args(interp, sub, PMCNULL, NULL, sig, args);

    retval = set_retval_i(interp, *sig, ctx);
    Parrot_free_context(interp, ctx, 1);
    return retval;
}

/*

=item C<FLOATVAL Parrot_runops_fromc_arglist_retf>

Called from C code, runs a Parrot subroutine C<sub>.
The subroutine has function signature C<sig> and a C C<va_list>
argument list C<args>. Returns an C<FLOATVAL>.

=cut

*/

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
FLOATVAL
Parrot_runops_fromc_arglist_retf(PARROT_INTERP, ARGIN(PMC *sub),
        ARGIN(const char *sig), va_list args)
{
    ASSERT_ARGS(Parrot_runops_fromc_arglist_retf)
    FLOATVAL retval;
    Parrot_Context * const ctx = runops_args(interp, sub, PMCNULL, NULL, sig, args);

    retval = set_retval_f(interp, *sig, ctx);
    Parrot_free_context(interp, ctx, 1);
    return retval;
}

/*

=item C<void* Parrot_run_meth_fromc_arglist>

Calls the subroutine C<sub> as a method on object C<obj>. The method to be
called is named C<meth>, has the function signature C<sig> and arguments
C<args>. C<args> is a C variadic argument list created with C<va_start>.

=cut

*/

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
void*
Parrot_run_meth_fromc_arglist(PARROT_INTERP, ARGIN(PMC *sub), ARGIN_NULLOK(PMC *obj),
        ARGIN(STRING *meth), ARGIN(const char *sig), va_list args)
{
    ASSERT_ARGS(Parrot_run_meth_fromc_arglist)
    Parrot_Context *ctx;
    void* retval;

    ctx = runops_args(interp, sub, obj, meth, sig, args);
    retval = set_retval(interp, *sig, ctx);
    Parrot_free_context(interp, ctx, 1);
    return retval;
}

/*

=item C<INTVAL Parrot_run_meth_fromc_arglist_reti>

Calls the subroutine C<sub> as a method on object C<obj>. The method to be
called is named C<meth>, has the function signature C<sig> and arguments
C<args>. C<args> is a C variadic argument list created with C<va_start>.
Returns an C<INTVAL>.

=cut

*/

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
INTVAL
Parrot_run_meth_fromc_arglist_reti(PARROT_INTERP, ARGIN(PMC *sub), ARGIN_NULLOK(PMC *obj),
        ARGIN(STRING *meth), ARGIN(const char *sig), va_list args)
{
    ASSERT_ARGS(Parrot_run_meth_fromc_arglist_reti)
    INTVAL retval;
    Parrot_Context * const ctx = runops_args(interp, sub, obj, meth, sig, args);

    retval = set_retval_i(interp, *sig, ctx);
    Parrot_free_context(interp, ctx, 1);
    return retval;
}

/*

=item C<FLOATVAL Parrot_run_meth_fromc_arglist_retf>

Calls the subroutine C<sub> as a method on object C<obj>. The method to be
called is named C<meth>, has the function signature C<sig> and arguments
C<args>. C<args> is a C variadic argument list created with C<va_start>.
Returns a C<FLOATVAL>.

=cut

*/

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
FLOATVAL
Parrot_run_meth_fromc_arglist_retf(PARROT_INTERP, ARGIN(PMC *sub), ARGIN_NULLOK(PMC *obj),
        ARGIN(STRING *meth), ARGIN(const char *sig), va_list args)
{
    ASSERT_ARGS(Parrot_run_meth_fromc_arglist_retf)
    FLOATVAL retval;
    Parrot_Context * const ctx = runops_args(interp, sub, obj, meth, sig, args);

    retval = set_retval_f(interp, *sig, ctx);
    Parrot_free_context(interp, ctx, 1);
    return retval;
}

/*

=back

=head2 Helper Functions

=over 4

=item C<void new_runloop_jump_point>

Create a new runloop jump point, either by allocating it or by
getting one from the free list.

=cut

*/

PARROT_EXPORT
void
new_runloop_jump_point(PARROT_INTERP)
{
    ASSERT_ARGS(new_runloop_jump_point)
    Parrot_runloop *jump_point;

    if (interp->runloop_jmp_free_list) {
        jump_point                    = interp->runloop_jmp_free_list;
        interp->runloop_jmp_free_list = jump_point->prev;
    }
    else
        jump_point = mem_allocate_typed(Parrot_runloop);

    jump_point->prev        = interp->current_runloop;
    interp->current_runloop = jump_point;
}

/*

=item C<void free_runloop_jump_point>

Place runloop jump point back on the free list.

=cut

*/

PARROT_EXPORT
void
free_runloop_jump_point(PARROT_INTERP)
{
    ASSERT_ARGS(free_runloop_jump_point)
    Parrot_runloop * const jump_point = interp->current_runloop;
    interp->current_runloop           = jump_point->prev;
    jump_point->prev                  = interp->runloop_jmp_free_list;
    interp->runloop_jmp_free_list     = jump_point;
}

/*

=item C<void destroy_runloop_jump_points>

Destroys (and frees the memory of) the runloop jump point list and the
associated free list for the specified interpreter.

=cut

*/

void
destroy_runloop_jump_points(PARROT_INTERP)
{
    ASSERT_ARGS(destroy_runloop_jump_points)
    really_destroy_runloop_jump_points(interp->current_runloop);
    really_destroy_runloop_jump_points(interp->runloop_jmp_free_list);
}

/*

=item C<void really_destroy_runloop_jump_points>

Takes a pointer to a runloop jump point (which had better be the last one in
the list). Walks back through the list, freeing the memory of each one, until
it encounters NULL. Used by C<destroy_runloop_jump_points>.

=cut

*/

void
really_destroy_runloop_jump_points(ARGIN_NULLOK(Parrot_runloop *jump_point))
{
    ASSERT_ARGS(really_destroy_runloop_jump_points)
    while (jump_point) {
        Parrot_runloop * const prev = jump_point->prev;
        mem_sys_free(jump_point);
        jump_point = prev;
    }
}


/*

=back

=head1 SEE ALSO

F<include/parrot/interpreter.h>, F<src/interpreter.c>.

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
