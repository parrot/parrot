/*
Copyright (C) 2001-2010, Parrot Foundation.
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
#include "exceptions.str"
#include "pmc/pmc_continuation.h"

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
static void setup_exception_args(PARROT_INTERP, ARGIN(const char *sig), ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_build_exception_from_args __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(format))
#define ASSERT_ARGS_setup_exception_args __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sig))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

#include <stdarg.h>

/*

=item C<PMC * Parrot_ex_build_exception(PARROT_INTERP, INTVAL severity, long
error, STRING *msg)>

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
    PMC * const exception = Parrot_pmc_new(interp, enum_class_Exception);

    VTABLE_set_integer_keyed_str(interp, exception, CONST_STRING(interp, "severity"), severity);
    VTABLE_set_integer_keyed_str(interp, exception, CONST_STRING(interp, "type"), error);
    if (msg)
        VTABLE_set_string_native(interp, exception, msg);

    return exception;
}

/*

=item C<void die_from_exception(PARROT_INTERP, PMC *exception)>

Print a stack trace for C<exception>, a message if there is one, and then exit.

=cut

*/

PARROT_DOES_NOT_RETURN
PARROT_COLD
void
die_from_exception(PARROT_INTERP, ARGIN(PMC *exception))
{
    ASSERT_ARGS(die_from_exception)
    STRING * const message     = VTABLE_get_string(interp, exception);
    INTVAL         exit_status = 1;
    const INTVAL   severity    = VTABLE_get_integer_keyed_str(interp, exception, CONST_STRING(interp, "severity"));

    /* In some cases we have a fatal exception before the IO system
     * is completely initialized. Do some attempt to output the
     * message to stderr, to help diagnosing. */
    int use_perr = !PMC_IS_NULL(Parrot_io_STDERR(interp));

    /* flush interpreter output to get things printed in order */
    if (!PMC_IS_NULL(Parrot_io_STDOUT(interp)))
        Parrot_io_flush(interp, Parrot_io_STDOUT(interp));
    if (use_perr)
        Parrot_io_flush(interp, Parrot_io_STDERR(interp));

    if (interp->pdb) {
        Interp * interpdeb = interp->pdb->debugger;
        if (interpdeb) {
            Parrot_io_flush(interpdeb, Parrot_io_STDOUT(interpdeb));
            Parrot_io_flush(interpdeb, Parrot_io_STDERR(interpdeb));
        }
    }

    if (Parrot_str_not_equal(interp, message, CONST_STRING(interp, ""))) {
        if (use_perr)
            Parrot_io_eprintf(interp, "%S\n", message);
        else {
            char * const msg = Parrot_str_to_cstring(interp, message);
            fflush(stderr);
            fprintf(stderr, "\n%s\n", msg);
            Parrot_str_free_cstring(msg);
        }

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
     * TT #1287 this check should better be in Parrot_exit
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

=item C<void Parrot_ex_add_c_handler(PARROT_INTERP, Parrot_runloop *jp)>

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
    PMC * const handler = Parrot_pmc_new(interp, enum_class_ExceptionHandler);
    /* Flag to mark a C exception handler */
    PObj_get_FLAGS(handler) |= SUB_FLAG_C_HANDLER;
    VTABLE_set_pointer(interp, handler, jp);
    Parrot_cx_add_handler_local(interp, handler);
}

/*

=item C<opcode_t * Parrot_ex_throw_from_op(PARROT_INTERP, PMC *exception, void
*dest)>

Throw an exception from inside an op. Looks for an exception handler in the
current concurrency scheduler. If a suitable handler is found, invoke it and
return the address where execution should continue. If no handler is found,
the exception message is printed along with the current line number
annotation and a backtrace before exiting Parrot.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
opcode_t *
Parrot_ex_throw_from_op(PARROT_INTERP, ARGIN(PMC *exception), ARGIN_NULLOK(void *dest))
{
    ASSERT_ARGS(Parrot_ex_throw_from_op)
    opcode_t   *address;
    PMC        *handler;

    /* Note the thrower. */
    VTABLE_set_attr_str(interp, exception, CONST_STRING(interp, "thrower"), CURRENT_CONTEXT(interp));

    /* Locate the handler, if there is one. */
    handler = Parrot_cx_find_handler_local(interp, exception);
    if (PMC_IS_NULL(handler)) {
        STRING * const message     = VTABLE_get_string(interp, exception);
        const INTVAL   severity    = VTABLE_get_integer_keyed_str(interp, exception, CONST_STRING(interp, "severity"));
        if (severity < EXCEPT_error) {
            PMC * const resume = VTABLE_get_attr_str(interp, exception, CONST_STRING(interp, "resume"));
            if (Parrot_str_not_equal(interp, message, CONST_STRING(interp, ""))) {
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
    setup_exception_args(interp, "P", exception);

    if (PObj_get_FLAGS(handler) & SUB_FLAG_C_HANDLER) {
        /* it's a C exception handler */
        Parrot_runloop * const jump_point = (Parrot_runloop *)address;
        longjmp(jump_point->resume, 1);
    }

    /* return the address of the handler */
    return address;
}

/*

=item C<static void setup_exception_args(PARROT_INTERP, const char *sig, ...)>

Sets up arguments to the exception handler invocation.

=cut

*/

PARROT_CAN_RETURN_NULL
static void
setup_exception_args(PARROT_INTERP, ARGIN(const char *sig), ...)
{
    ASSERT_ARGS(setup_exception_args)
    va_list  args;
    PMC     *sig_obj;

    va_start(args, sig);
    sig_obj = Parrot_pcc_build_call_from_varargs(interp, PMCNULL, sig, &args);
    va_end(args);

    CALLSIGNATURE_is_exception_SET(sig_obj);

    Parrot_pcc_set_signature(interp, CURRENT_CONTEXT(interp), sig_obj);
}

/*

=item C<static PMC * build_exception_from_args(PARROT_INTERP, int ex_type, const
char *format, va_list arglist)>

Builds an exception PMC with the given integer type C<ex_type>, and the string
message given as a format/arglist combo, like is used by the Parrot_vsprintf*
family of functions.

=cut

*/

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

=item C<void Parrot_ex_throw_from_c(PARROT_INTERP, PMC *exception)>

Throws an exception object from any location in C code. A suitable handler
is retrieved from the concurrency scheduler. If the handler is found, control
flow is passed to it. Handlers can be either C-level or PIR-level routines. If
no suitable handler is found, Parrot exits with the stored exception error
message.

See also C<exit_fatal()>, which signals fatal errors, and
C<Parrot_ex_throw_from_op> which throws an exception from within an op.

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
PARROT_COLD
void
Parrot_ex_throw_from_c(PARROT_INTERP, ARGIN(PMC *exception))
{
    ASSERT_ARGS(Parrot_ex_throw_from_c)

    Parrot_runloop    *return_point = interp->current_runloop;
    opcode_t *address;
    PMC        * const handler      =
                             Parrot_cx_find_handler_local(interp, exception);

    if (PMC_IS_NULL(handler))
        die_from_exception(interp, exception);

    if (Interp_debug_TEST(interp, PARROT_BACKTRACE_DEBUG_FLAG)) {
        STRING * const exit_code = CONST_STRING(interp, "exit_code");
        STRING * const msg       = VTABLE_get_string(interp, exception);
        int            exitcode  = VTABLE_get_integer_keyed_str(interp,
                                        exception, exit_code);

        Parrot_io_eprintf(interp,
            "Parrot_ex_throw_from_c (severity:%d error:%d): %Ss\n",
            EXCEPT_error, exitcode, msg);
        PDB_backtrace(interp);
    }

    /* Note the thrower.
     * Don't split line. It will break CONST_STRING handling. */
    VTABLE_set_attr_str(interp, exception, CONST_STRING(interp, "thrower"), CURRENT_CONTEXT(interp));

    /* it's a C exception handler */
    if (PObj_get_FLAGS(handler) & SUB_FLAG_C_HANDLER) {
        Parrot_runloop * const jump_point =
            (Parrot_runloop * const)VTABLE_get_pointer(interp, handler);
        longjmp(jump_point->resume, 1);
    }

    /* Run the handler. */
    address = VTABLE_invoke(interp, handler, NULL);
    setup_exception_args(interp, "P", exception);
    PARROT_ASSERT(return_point->handler_start == NULL);
    return_point->handler_start = address;
    longjmp(return_point->resume, 2);
}

/*

=item C<opcode_t * Parrot_ex_throw_from_op_args(PARROT_INTERP, void *dest, int
ex_type, const char *format, ...)>

Throws an exception from an opcode, with an error message constructed
from a format string and arguments. Constructs an Exception PMC, and passes it
to C<Parrot_ex_throw_from_op>.

See also C<Parrot_ex_throw_from_c> and C<exit_fatal()>.

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

=item C<void Parrot_ex_throw_from_c_args(PARROT_INTERP, void *ret_addr, int
exitcode, const char *format, ...)>

Throws an exception, with an error message constructed from a format string and
arguments. C<ret_addr> is the address from which to resume, if some handler
decides that is appropriate, or zero to make the error non-resumable.
C<exitcode> is a C<exception_type_enum> value. Constructs an Exception PMC
and passes it to C<Parrot_ex_throw_from_c>.

See also C<Parrot_ex_throw_from_op> and C<exit_fatal()>.

=cut

*/

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
PARROT_COLD
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

=item C<opcode_t * Parrot_ex_rethrow_from_op(PARROT_INTERP, PMC *exception)>

Rethrow the given exception from an op, if it has previously been thrown and
not handled by the provided handler. Marks the exception object as being
unhandled and throws it again.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
opcode_t *
Parrot_ex_rethrow_from_op(PARROT_INTERP, ARGIN(PMC *exception))
{
    ASSERT_ARGS(Parrot_ex_rethrow_from_op)

    Parrot_ex_mark_unhandled(interp, exception);

    return Parrot_ex_throw_from_op(interp, exception, NULL);
}

/*

=item C<void Parrot_ex_rethrow_from_c(PARROT_INTERP, PMC *exception)>

Rethrow the exception from C code. Marks the Exception PMC as being unhandled
and throws it again.

=cut

*/

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
PARROT_COLD
void
Parrot_ex_rethrow_from_c(PARROT_INTERP, ARGIN(PMC *exception))
{
    ASSERT_ARGS(Parrot_ex_rethrow_from_c)
    Parrot_ex_mark_unhandled(interp, exception);

    Parrot_ex_throw_from_c(interp, exception);
}

/*

=item C<void Parrot_ex_mark_unhandled(PARROT_INTERP, PMC *exception)>

Mark an exception as unhandled, as part of rethrowing it.

=back

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

=head2 Error Functions

=over 4

=item C<void Parrot_assert(INTVAL condition, const char *condition_string, const
char *file, unsigned int line)>

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

=item C<void Parrot_confess(const char *cond, const char *file, unsigned int
line)>

Prints a backtrace and message for a failed assertion.

=cut

*/

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
PARROT_COLD
void
Parrot_confess(ARGIN(const char *cond), ARGIN(const char *file), unsigned int line)
{
    ASSERT_ARGS(Parrot_confess)
    fprintf(stderr, "%s:%u: failed assertion '%s'\n", file, line, cond);
    Parrot_print_backtrace();
    abort();
}

/*

=item C<void Parrot_print_backtrace(void)>

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
#  ifndef PARROT_HAS_DLINFO
#    define BACKTRACE_VERBOSE
#  endif
    /* stolen from http://www.delorie.com/gnu/docs/glibc/libc_665.html */
    void *array[BACKTRACE_DEPTH];
    int i;

    const int size = backtrace(array, BACKTRACE_DEPTH);

    fprintf(stderr,
            "Backtrace - Obtained %d stack frames (max trace depth is %d).\n",
            size, BACKTRACE_DEPTH);
#  ifndef BACKTRACE_VERBOSE
    for (i = 0; i < size; ++i) {
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
        if (strings) {
            for (i = 0; i < size; ++i)
                fprintf(stderr, "%s\n", strings[i]);
            /* backtrace_symbols gets memory using malloc */
            free(strings);
        }
        else
            fputs("Not enough memory for backtrace_symbols\n", stderr);
    }
#  endif

#  undef BACKTRACE_DEPTH
#endif /* ifdef PARROT_HAS_BACKTRACE */
}

/*

=item C<void exit_fatal(int exitcode, const char *format, ...)>

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
PARROT_COLD
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

=item C<void do_panic(NULLOK_INTERP, const char *message, const char *file,
unsigned int line)>

Panic handler. Things have gone very wrong in an unexpected way. Print out an
error message and instructions for the user to report the error to the
developers

=cut

*/

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
PARROT_COLD
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
e-mail to parrot-dev@lists.parrot.org.\n\
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
