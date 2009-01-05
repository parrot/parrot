/*
Copyright (C) 2001-2008, The Perl Foundation.
$Id$

=head1 NAME

src/exceptions.c - Exceptions

=head1 DESCRIPTION

Define the the core subsystem for exceptions.

=head2 Exception Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/exceptions.h"
#include "exceptions.str"

#ifdef PARROT_HAS_BACKTRACE
#  include <execinfo.h>
#  include <dlfcn.h>
#endif

/* HEADERIZER HFILE: include/parrot/exceptions.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CANNOT_RETURN_NULL
static PMC * build_exception_from_args(PARROT_INTERP,
    int ex_type,
    ARGIN(const char *format),
    va_list arglist)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_CAN_RETURN_NULL
static opcode_t * pass_exception_args(PARROT_INTERP,
    ARGIN(const char *sig),
    ARGIN(opcode_t *dest),
    ARGIN(Parrot_Context * old_ctx),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

#define ASSERT_ARGS_build_exception_from_args __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(format)
#define ASSERT_ARGS_pass_exception_args __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sig) \
    || PARROT_ASSERT_ARG(dest) \
    || PARROT_ASSERT_ARG(old_ctx)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

#include <stdarg.h>

/*

=item C<PMC * Parrot_ex_build_exception>

Constructs a new exception object from the passed in arguments.

=cut

*/
PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_ex_build_exception(PARROT_INTERP, INTVAL severity,
        long error, ARGIN_NULLOK(STRING *msg))
{
    ASSERT_ARGS(Parrot_ex_build_exception)
    PMC *exception = pmc_new(interp, enum_class_Exception);

    VTABLE_set_integer_keyed_str(interp, exception, CONST_STRING(interp, "severity"), severity);
    VTABLE_set_integer_keyed_str(interp, exception, CONST_STRING(interp, "type"), error);
    if (msg)
        VTABLE_set_string_native(interp, exception, msg);

    return exception;
}

/*

=item C<void die_from_exception>

Print a stack trace for C<exception>, a message if there is one, and then exit.

=cut

*/

PARROT_DOES_NOT_RETURN
void
die_from_exception(PARROT_INTERP, ARGIN(PMC *exception))
{
    ASSERT_ARGS(die_from_exception)
    STRING * const message     = VTABLE_get_string(interp, exception);
    INTVAL         exit_status = 1;
    const INTVAL   severity    = VTABLE_get_integer_keyed_str(interp, exception, CONST_STRING(interp, "severity"));

    /* flush interpreter output to get things printed in order */
    Parrot_io_flush(interp, Parrot_io_STDOUT(interp));
    Parrot_io_flush(interp, Parrot_io_STDERR(interp));

    if (interp->debugger) {
        Parrot_io_flush(interp->debugger, Parrot_io_STDOUT(interp->debugger));
        Parrot_io_flush(interp->debugger, Parrot_io_STDERR(interp->debugger));
    }

    if (string_equal(interp, message, CONST_STRING(interp, "")) == 1) {
        Parrot_io_eprintf(interp, "%S\n", message);

        /* caution against output swap (with PDB_backtrace) */
        fflush(stderr);
        PDB_backtrace(interp);
    }
    else if (severity == EXCEPT_exit) {
        /* TODO: get exit status based on type */
        exit_status = VTABLE_get_integer_keyed_str(interp, exception, CONST_STRING(interp, "exit_code"));
    }
    else {
        Parrot_io_eprintf(interp, "No exception handler and no message\n");
        /* caution against output swap (with PDB_backtrace) */
        fflush(stderr);
        PDB_backtrace(interp);
    }

    /*
     * returning NULL from here returns resume address NULL to the
     * runloop, which will terminate the thread function finally
     *
     * RT #45917 this check should better be in Parrot_exit
     */

    /* no exception handler, but this is not the main thread */
    if (interp->thread_data && interp->thread_data->tid)
        pt_thread_detach(interp->thread_data->tid);

    /*
     * only main should run the destroy functions - exit handler chain
     * is freed during Parrot_exit
     */
    Parrot_exit(interp, exit_status);
}

/*

=item C<void Parrot_ex_add_c_handler>

Adds a new exception handler (defined in C) to the concurrency scheduler. Since
the exception handler is C code, it stores a runloop jump point to the start of
the handler code.

=cut

*/

PARROT_EXPORT
void
Parrot_ex_add_c_handler(PARROT_INTERP, ARGIN(Parrot_runloop *jp))
{
    ASSERT_ARGS(Parrot_ex_add_c_handler)
    PMC * const handler = pmc_new(interp, enum_class_ExceptionHandler);
    /* Flag to mark a C exception handler */
    PObj_get_FLAGS(handler) |= SUB_FLAG_C_HANDLER;
    VTABLE_set_pointer(interp, handler, jp);
    Parrot_cx_add_handler_local(interp, handler);
}

/*

=item C<opcode_t * Parrot_ex_throw_from_op>

Runs the exception handler.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
opcode_t *
Parrot_ex_throw_from_op(PARROT_INTERP, ARGIN(PMC *exception), ARGIN_NULLOK(void *dest))
{
    ASSERT_ARGS(Parrot_ex_throw_from_op)
    opcode_t   *address;
    PMC * const handler = Parrot_cx_find_handler_local(interp, exception);
    if (PMC_IS_NULL(handler)) {
        STRING * const message     = VTABLE_get_string(interp, exception);
        const INTVAL   severity    = VTABLE_get_integer_keyed_str(interp, exception, CONST_STRING(interp, "severity"));
        if (severity < EXCEPT_error) {
            PMC * const resume = VTABLE_get_attr_str(interp, exception, CONST_STRING(interp, "resume"));
            if (string_equal(interp, message, CONST_STRING(interp, "")) == 1) {
                Parrot_io_eprintf(interp, "%S\n", message);
            }
            else {
                Parrot_io_eprintf(interp, "%S\n", CONST_STRING(interp, "Warning"));
            }

            /* caution against output swap (with PDB_backtrace) */
            fflush(stderr);
            /* PDB_backtrace(interp); */

            if (!PMC_IS_NULL(resume)) {
                return VTABLE_invoke(interp, resume, NULL);
            }
        }
        die_from_exception(interp, exception);
    }

    address    = VTABLE_invoke(interp, handler, dest);

    /* Set up the continuation context of the handler in the interpreter. */
    if (PMC_cont(handler)->current_results)
        address = pass_exception_args(interp, "P", address,
                CONTEXT(interp), exception);

    if (PObj_get_FLAGS(handler) & SUB_FLAG_C_HANDLER) {
        /* it's a C exception handler */
        Parrot_runloop * const jump_point = (Parrot_runloop *)address;
        longjmp(jump_point->resume, 1);
    }

    /* return the address of the handler */
    return address;
}

PARROT_CAN_RETURN_NULL
static opcode_t *
pass_exception_args(PARROT_INTERP, ARGIN(const char *sig),
        ARGIN(opcode_t *dest), ARGIN(Parrot_Context * old_ctx), ...)
{
    ASSERT_ARGS(pass_exception_args)
    va_list   ap;
    opcode_t *next;

    va_start(ap, old_ctx);
    next = parrot_pass_args_fromc(interp, sig, dest, old_ctx, ap);
    va_end(ap);

    return next;
}

PARROT_CANNOT_RETURN_NULL
static PMC *
build_exception_from_args(PARROT_INTERP, int ex_type,
        ARGIN(const char *format), va_list arglist)
{
    ASSERT_ARGS(build_exception_from_args)
    /* Make and set exception message. */
    STRING * const msg =
        strchr(format, '%')
            ? Parrot_vsprintf_c(interp, format, arglist)
            : string_make(interp, format, strlen(format), NULL, 0);

    return Parrot_ex_build_exception(interp, EXCEPT_error, ex_type, msg);
}

/*

=item C<void Parrot_ex_throw_from_c>

Throws an exception object.

See also C<exit_fatal()>, which signals fatal errors, and
C<Parrot_ex_throw_from_op>.

The 'invoke' vtable function doesn't actually execute a
sub/continuation/handler, it only sets up the environment for invocation and
returns the address of the start of the sub's code. That address then becomes
the next op in the runloop.

Exceptions thrown from C and caught by a continuation-based handler are
resumable at the level of a C instruction. When handled, they return the
exception object. Any values returned from the handler to the C code that threw
the exception can be stored in the exception's payload.

=cut

*/

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
void
Parrot_ex_throw_from_c(PARROT_INTERP, ARGIN(PMC *exception))
{
    ASSERT_ARGS(Parrot_ex_throw_from_c)
    PMC * const handler = Parrot_cx_find_handler_local(interp, exception);
    RunProfile * const profile      = interp->profile;
    Parrot_runloop    *return_point = interp->current_runloop;
    if (PMC_IS_NULL(handler)) {
        die_from_exception(interp, exception);
    }

    /* If profiling, remember end time of lastop and generate entry for
     * exception. */
    if (profile && Interp_flags_TEST(interp, PARROT_PROFILE_FLAG)) {
        const FLOATVAL now = Parrot_floatval_time();

        profile->data[profile->cur_op].time += now - profile->starttime;
        profile->cur_op                      = PARROT_PROF_EXCEPTION;
        profile->starttime                   = now;
        profile->data[PARROT_PROF_EXCEPTION].numcalls++;
    }

    if (Interp_debug_TEST(interp, PARROT_BACKTRACE_DEBUG_FLAG)) {
        STRING * const msg = VTABLE_get_string(interp, exception);
        int exitcode       = VTABLE_get_integer_keyed_str(interp, exception, CONST_STRING(interp, "exit_code"));

        Parrot_io_eprintf(interp,
            "Parrot_ex_throw_from_c (severity:%d error:%d): %Ss\n",
            EXCEPT_error, exitcode, msg);
        PDB_backtrace(interp);
    }

    /* it's a C exception handler */
    if (PObj_get_FLAGS(handler) & SUB_FLAG_C_HANDLER) {
        Parrot_runloop * const jump_point =
            (Parrot_runloop * const)VTABLE_get_pointer(interp, handler);
        longjmp(jump_point->resume, 1);
    }

    /* Run the handler. */
    Parrot_runops_fromc_args(interp, handler, "vP", exception);

    /* After handling a C exception, you don't want to resume at the point
     * where the C exception was thrown, you want to resume the next outer
     * runloop.  */
    longjmp(return_point->resume, 1);
}

/*

=item C<opcode_t * Parrot_ex_throw_from_op_args>

Throws an exception from an opcode, with an error message constructed
from a format string and arguments.

See also C<Parrot_ex_throw_from_c>, C<Parrot_ex_throw_from_op>, and
C<exit_fatal()>.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
opcode_t *
Parrot_ex_throw_from_op_args(PARROT_INTERP, ARGIN_NULLOK(void *dest),
        int ex_type, ARGIN(const char *format), ...)
{
    ASSERT_ARGS(Parrot_ex_throw_from_op_args)
    PMC *exception;

    va_list arglist;
    va_start(arglist, format);
    exception = build_exception_from_args(interp, ex_type, format, arglist);
    va_end(arglist);

    return Parrot_ex_throw_from_op(interp, exception, dest);
}

/*

=item C<void Parrot_ex_throw_from_c_args>

Throws an exception, with an error message constructed from a format string and
arguments. C<ret_addr> is the address from which to resume, if some handler
decides that is appropriate, or zero to make the error non-resumable.
C<exitcode> is a C<exception_type_enum> value.

See also C<Parrot_ex_throw_from_c>, C<Parrot_ex_throw_from_op>, and
C<exit_fatal()>.

=cut

*/

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
void
Parrot_ex_throw_from_c_args(PARROT_INTERP, SHIM(void *ret_addr),
        int exitcode, ARGIN(const char *format), ...)
{
    ASSERT_ARGS(Parrot_ex_throw_from_c_args)
    PMC *exception;

    va_list arglist;
    va_start(arglist, format);
    exception = build_exception_from_args(interp, exitcode, format, arglist);
    va_end(arglist);

    Parrot_ex_throw_from_c(interp, exception);
}

/*

=item C<opcode_t * Parrot_ex_rethrow_from_op>

Rethrow the exception.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
opcode_t *
Parrot_ex_rethrow_from_op(PARROT_INTERP, ARGIN(PMC *exception))
{
    ASSERT_ARGS(Parrot_ex_rethrow_from_op)
    if (exception->vtable->base_type != enum_class_Exception)
        PANIC(interp, "Illegal rethrow");

    Parrot_ex_mark_unhandled(interp, exception);

    return Parrot_ex_throw_from_op(interp, exception, NULL);
}

/*

=item C<void Parrot_ex_rethrow_from_c>

Return back to runloop, assumes exception is still in todo (see RT #45915) and
that this is called from within a handler setup with C<new_c_exception>.

=cut

*/

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
void
Parrot_ex_rethrow_from_c(PARROT_INTERP, ARGIN(PMC *exception))
{
    ASSERT_ARGS(Parrot_ex_rethrow_from_c)
    Parrot_ex_mark_unhandled(interp, exception);

    Parrot_ex_throw_from_c(interp, exception);
}

/*

=item C<void Parrot_ex_mark_unhandled>

Mark an exception as unhandled, as part of rethrowing it.

=cut

*/

PARROT_EXPORT
void
Parrot_ex_mark_unhandled(PARROT_INTERP, ARGIN(PMC *exception))
{
    ASSERT_ARGS(Parrot_ex_mark_unhandled)
    VTABLE_set_integer_keyed_str(interp, exception, CONST_STRING(interp, "handled"), -1);
}

/*

=item C<size_t Parrot_ex_calc_handler_offset>

Retrieve an exception from the concurrency scheduler, prepare a call to the
handler, and return the offset to the handler so it can become the next op in
the runloop.

=cut

*/

PARROT_EXPORT
size_t
Parrot_ex_calc_handler_offset(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_ex_calc_handler_offset)
    PMC * const exception = VTABLE_pop_pmc(interp, interp->scheduler);

    /* now fill rest of exception, locate handler and get
     * destination of handler */
    opcode_t * const handler_address = Parrot_ex_throw_from_op(interp, exception, NULL);

    if (handler_address == NULL)
        PANIC(interp, "Unable to calculate opcode address for exception handler");

    /* return the *offset* of the handler */
    return handler_address - interp->code->base.data;
}

/*

=back

=head2 Error Functions

=over 4

=item C<void Parrot_assert>

A better version of assert() that gives a backtrace.

=cut

*/

PARROT_EXPORT
PARROT_DOES_NOT_RETURN_WHEN_FALSE
void
Parrot_assert(INTVAL condition, ARGIN(const char *condition_string),
        ARGIN(const char *file), unsigned int line)
{
    ASSERT_ARGS(Parrot_assert)
    if (!condition)
        Parrot_confess(condition_string, file, line);
}

/*

=item C<void Parrot_confess>

Prints a backtrace and message for a failed assertion.

=cut

*/

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
void
Parrot_confess(ARGIN(const char *cond), ARGIN(const char *file), unsigned int line)
{
    ASSERT_ARGS(Parrot_confess)
    fprintf(stderr, "%s:%u: failed assertion '%s'\n", file, line, cond);
    Parrot_print_backtrace();
    abort();
}

/*

=item C<void Parrot_print_backtrace>

Displays the primrose path to disaster, (the stack frames leading up to the
abort).  Used by C<Parrot_confess>.

=cut

*/

void
Parrot_print_backtrace(void)
{
    ASSERT_ARGS(Parrot_print_backtrace)
#ifdef PARROT_HAS_BACKTRACE
#  define BACKTRACE_DEPTH 32
/*#  define BACKTRACE_VERBOSE */
    /* stolen from http://www.delorie.com/gnu/docs/glibc/libc_665.html */
    void *array[BACKTRACE_DEPTH];
    int i;

    const int size = backtrace(array, BACKTRACE_DEPTH);

    fprintf(stderr,
            "Backtrace - Obtained %d stack frames (max trace depth is %d).\n",
            size, BACKTRACE_DEPTH);
#  ifndef BACKTRACE_VERBOSE
    for (i = 0; i < size; i++) {
        Dl_info   frameInfo;
        const int found  = dladdr(array[i], &frameInfo);

        /* always indent */
        const int indent = 2 + (2 * i);

        fprintf(stderr, "%*s", indent, "");

        if (found && frameInfo.dli_sname)
            fprintf(stderr, "%s\n", frameInfo.dli_sname);
        else
            fprintf(stderr, "(unknown)\n");
    }

#  else
    { /* Scope for strings */
        char ** strings = backtrace_symbols(array, size);
        for (i = 0; i < size; i++)
            fprintf(stderr, "%s\n", strings[i]);

        mem_sys_free(strings);
    }
#  endif

#  undef BACKTRACE_DEPTH
#endif /* ifdef PARROT_HAS_BACKTRACE */
}

/*

=item C<void exit_fatal>

Signal a fatal error condition.  This should only be used with dire errors that
cannot throw an exception (because no interpreter is available, or the nature
of the error would interfere with the exception system).

This involves printing an error message to stderr, and calling C<exit> to exit
the process with the given exitcode. It is not possible for Parrot bytecode to
intercept a fatal error (for that, use C<Parrot_ex_throw_from_c_args>).
C<exit_fatal> does not call C<Parrot_exit> to invoke exit handlers (that would
require an interpreter).

=cut

*/

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
void
exit_fatal(int exitcode, ARGIN(const char *format), ...)
{
    ASSERT_ARGS(exit_fatal)
    va_list arglist;
    va_start(arglist, format);
    vfprintf(stderr, format, arglist);
    fprintf(stderr, "\n");
    /* caution against output swap (with PDB_backtrace) */
    fflush(stderr);
    va_end(arglist);
    exit(exitcode);
}

/* The DUMPCORE macro is defined for most platforms, but defined here if not
 * found elsewhere, so we're sure it's safe to call. */

#ifndef DUMPCORE
#  define DUMPCORE() \
     fprintf(stderr, "Sorry, coredump is not yet implemented " \
             "for this platform.\n\n"); \
             exit(EXIT_FAILURE);
#endif

/*

=item C<void do_panic>

Panic handler.

=cut

*/

PARROT_DOES_NOT_RETURN
void
do_panic(NULLOK_INTERP, ARGIN_NULLOK(const char *message),
         ARGIN_NULLOK(const char *file), unsigned int line)
{
    ASSERT_ARGS(do_panic)
    /* Note: we can't format any floats in here--Parrot_sprintf
    ** may panic because of floats.
    ** and we don't use Parrot_sprintf or such, because we are
    ** already in panic --leo
    */
    fprintf(stderr, "Parrot VM: PANIC: %s!\n",
               message ? message : "(no message available)");

    fprintf(stderr, "C file %s, line %u\n",
               file ? file : "(not available)", line);

    fprintf(stderr, "Parrot file (not available), ");
    fprintf(stderr, "line (not available)\n");

    fprintf(stderr, "\n\
We highly suggest you notify the Parrot team if you have not been working on\n\
Parrot.  Use parrotbug (located in parrot's root directory) or send an\n\
e-mail to parrot-porters@perl.org.\n\
Include the entire text of this error message and the text of the script that\n\
generated the error.  If you've made any modifications to Parrot, please\n\
describe them as well.\n\n");

    fprintf(stderr, "Version     : %s\n", PARROT_VERSION);
    fprintf(stderr, "Configured  : %s\n", PARROT_CONFIG_DATE);
    fprintf(stderr, "Architecture: %s\n", PARROT_ARCHNAME);
    fprintf(stderr, "JIT Capable : %s\n", JIT_CAPABLE ? "Yes" : "No");
    if (interp)
        fprintf(stderr, "Interp Flags: %#x\n", (unsigned int)interp->flags);
    else
        fprintf(stderr, "Interp Flags: (no interpreter)\n");
    fprintf(stderr, "Exceptions  : %s\n", "(missing from core)");
    fprintf(stderr, "\nDumping Core...\n");

    DUMPCORE();
}


/*

=back

=head1 SEE ALSO

F<include/parrot/exceptions.h>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
