/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/exceptions.c - Exceptions

=head1 DESCRIPTION

Define the internal interpreter exceptions.

=over 4

=item * This is experimental code.

=item * The C<enum_class> of the Exception isn't fixed.

=item * The interface isn't fixed.

=item * Much of this may change in the future.

=back

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/exceptions.h"

#include <stdarg.h>

/*

=item C<void
internal_exception(int exitcode, const char *format, ...)>

Exception handler.

=cut

*/

void
internal_exception(int exitcode, const char *format, ...)
{
    va_list arglist;
    va_start(arglist, format);
    vfprintf(stderr, format, arglist);
    va_end(arglist);
    Parrot_exit(exitcode);
}

/* Panic handler */

#ifndef dumpcore
#define dumpcore() \
  fprintf(stderr, "Sorry, coredump is not yet implemented " \
          "for this platform.\n\n"); \
          exit(1);
#endif

/*

=item C<void
do_panic(Interp *interpreter, const char *message,
         const char *file, int line)>

Panic handler.

=cut

*/

void
do_panic(Interp *interpreter, const char *message,
         const char *file, int line)
{
    /* Note: we can't format any floats in here--Parrot_sprintf
    ** may panic because of floats.
    ** and we don't use Parrot_sprintf or such, because we are
    ** already in panic --leo
    */
    fprintf(stderr, "Parrot VM: PANIC: %s!\n",
               message ? message : "(no message available)");

    fprintf(stderr, "C file %s, line %d\n",
               file ? file : "(not available)", line);

    if (interpreter) {
        fprintf(stderr, "Parrot file %s, line %d\n",
                   interpreter->current_file &&
                   interpreter->current_file->strstart ?
                   (char *)interpreter->current_file->strstart : "(null)",
                   (int)interpreter->current_line);
    }
    else {
        fprintf(stderr, "Parrot file (not available), ");
        fprintf(stderr, "line (not available)\n");
    }

    fprintf(stderr, "\n\
We highly suggest you notify the Parrot team if you have not been working on\n\
Parrot.  Use parrotbug (located in parrot's root directory) or send an\n\
e-mail to perl6-internals@perl.org.\n\
Include the entire text of this error message and the text of the script that\n\
generated the error.  If you've made any modifications to Parrot, please\n\
describe them as well.\n\n");

    fprintf(stderr, "Version     : %s\n", PARROT_VERSION);
    fprintf(stderr, "Configured  : %s\n", PARROT_CONFIG_DATE);
    fprintf(stderr, "Architecture: %s\n", PARROT_ARCHNAME);
    fprintf(stderr, "JIT Capable : %s\n", JIT_CAPABLE ? "Yes" : "No");
    if (interpreter)
        fprintf(stderr, "Interp Flags: %#x\n", interpreter->flags);
    else
        fprintf(stderr, "Interp Flags: (no interpreter)\n");
    fprintf(stderr, "Exceptions  : %s\n", "(missing from core)");
    fprintf(stderr, "\nDumping Core...\n");

    dumpcore();
}

/*

=item C<void
push_exception(Parrot_Interp interpreter, PMC *handler)>

Add the exception handler on the stack.

=cut

*/

void
push_exception(Parrot_Interp interpreter, PMC *handler)
{
    if (handler->vtable->base_type != enum_class_Exception_Handler)
        PANIC("Tried to set_eh a non Exception_Handler");
    stack_push(interpreter, &interpreter->ctx.control_stack, handler,
            STACK_ENTRY_PMC, STACK_CLEANUP_NULL);
}

/*

=item C<static PMC *
find_exception_handler(Parrot_Interp interpreter, PMC *exception)>

Find the exception handler for C<exception>.

=cut

*/

static PMC *
find_exception_handler(Parrot_Interp interpreter, PMC *exception)
{
    PMC *handler;
    STRING *message;
    char *m;
    int exit_status, print_location;
    /* for now, we don't check the exception class and we don't
     * look for matching handlers
     */
    message = VTABLE_get_string_keyed_int(interpreter, exception, 0);
    do {
        Stack_Entry_t *e = stack_entry(interpreter,
                interpreter->ctx.control_stack, 0);
        if (!e)
            break;
        (void)stack_pop(interpreter, &interpreter->ctx.control_stack,
                        NULL, e->entry_type);
        if (e->entry_type == STACK_ENTRY_PMC) {
            handler = UVal_pmc(e->entry);
            if (handler && handler->vtable->base_type ==
                    enum_class_Exception_Handler) {
                return handler;
            }
        }
    } while (1);
    m = string_to_cstring(interpreter, message);
    exit_status = print_location = 1;
    if (m && *m) {
        fputs(m, stderr);
        if (m[strlen(m)-1] != '\n')
            fprintf(stderr, "%c", '\n');
    }
    else {
        INTVAL severity =
            VTABLE_get_integer_keyed_int(interpreter, exception, 2);
        if (severity == EXCEPT_exit) {
            print_location = 0;
            exit_status =
                (int)VTABLE_get_integer_keyed_int(interpreter, exception, 1);
        }
        else
            fprintf(stderr, "No exception handler and no message\n");
    }
    if (m)
        string_cstring_free(m);
    if (print_location)
        print_pbc_location_stdio(interpreter);
    /*
     * returning NULL from here returns resume address NULL to the
     * runloop, which will terminate the thread function finally
     *
     * XXX this check should better be in Parrot_exit
     */
    if (interpreter->thread_data && interpreter->thread_data->tid) {
        /*
         * we should probably detach the thread here
         */
        return NULL;
    }
    /*
     * only main should run the destroy functions - exit handler chain
     * is freed during Parrot_exit
     */
    Parrot_exit(exit_status);

    return NULL;
}

/*

=item C<void
pop_exception(Parrot_Interp interpreter)>

Pops the topmost exception handler off the stack.

=cut

*/

void
pop_exception(Parrot_Interp interpreter)
{
    Stack_entry_type type;
    PMC *handler;

    handler = stack_peek(interpreter, interpreter->ctx.control_stack, &type);
    if (type != STACK_ENTRY_PMC ||
            handler->vtable->base_type != enum_class_Exception_Handler)
        return; /* no exception on TOS */
    (void)stack_pop(interpreter, &interpreter->ctx.control_stack, NULL,
                    STACK_ENTRY_PMC);
}

/*

=item C<PMC*
new_c_exception_handler(Parrot_Interp interpreter, Parrot_exception *jb)>

Generate an exception handler, that catches PASM level exceptions inside
a C function. This could be a separate class too, for now just a private
flag bit is set.

=cut

*/

PMC*
new_c_exception_handler(Parrot_Interp interpreter, Parrot_exception *jb)
{
    PMC *handler = pmc_new(interpreter, enum_class_Exception_Handler);
    /*
     * this flag denotes a C exception handler
     */
    PObj_get_FLAGS(handler) |= PObj_private0_FLAG;
    VTABLE_set_pointer(interpreter, handler, jb);
    return handler;
}

/*

=item C<void
push_new_c_exception_handler(Parrot_Interp interpreter, Parrot_exception *jb)>

Pushes an new C exception handler onto the stack.

=cut

*/

void
push_new_c_exception_handler(Parrot_Interp interpreter, Parrot_exception *jb)
{
    push_exception(interpreter, new_c_exception_handler(interpreter, jb));
}

/*

=item C<void *
throw_exception(Parrot_Interp interpreter, PMC *exception, void *dest)>

Throw the exception.

=cut

*/

void *
throw_exception(Parrot_Interp interpreter, PMC *exception, void *dest)
{
    PMC *handler;
    void *address;

    handler = find_exception_handler(interpreter, exception);
    if (!handler)
        return NULL;
    /* create return continuation with current context */
    if (dest) {
        VTABLE_set_pmc_keyed_int(interpreter, exception, 4,
                new_ret_continuation_pmc(interpreter, dest));
    }
    /* put the handler aka continuation ctx in the interpreter */
    address = VTABLE_invoke(interpreter, handler, NULL);
    /* XXX preserve P5 register */
    VTABLE_set_pmc_keyed_int(interpreter, exception, 3, REG_PMC(5));
#if 0
    /* remember handler */
    key = key_new_cstring(interpreter, "_handler");
    VTABLE_set_pmc_keyed(interpreter, exception, key, handler);
#endif
    /* generate and place return continuation */
    /* put exception object in P5 */
    REG_PMC(5) = exception;
    /* address = VTABLE_get_pointer(interpreter, handler); */
    if (PObj_get_FLAGS(handler) & PObj_private0_FLAG) {
        /* its a C exception handler */
        Parrot_exception *jb = (Parrot_exception *) address;
        longjmp(jb->destination, 1);
    }
    /* return the address of the handler */
    return address;
}

/*

=item C<void *
rethrow_exception(Parrot_Interp interpreter, PMC *exception)>

Rethrow the exception.

=cut

*/

void *
rethrow_exception(Parrot_Interp interpreter, PMC *exception)
{
    PMC *handler;
    void *address;

    if (exception->vtable->base_type != enum_class_Exception)
        PANIC("Illegal rethrow");
    handler = find_exception_handler(interpreter, exception);
    address = VTABLE_invoke(interpreter, handler, NULL);
    /* put exception object in P5 */
    REG_PMC(5) = exception;
    /* return the address of the handler */
    return address;
}

/*

=item C<void
rethrow_c_exception(Parrot_Interp interpreter)>

Return back to runloop, assumes exception is still in C<REG_PMC(5)> and
that this is called from within a handler setup with C<new_c_exception>

=cut

*/

void
rethrow_c_exception(Parrot_Interp interpreter)
{
    PMC *exception, *handler, *p5;
    Parrot_exception *the_exception = interpreter->exceptions;

    p5 = VTABLE_get_pmc_keyed_int(interpreter, REG_PMC(5), 3);
    exception = REG_PMC(5);
    REG_PMC(5) = p5;
    handler = find_exception_handler(interpreter, exception);
    /* XXX we should only peek for the next handler */
    push_exception(interpreter, handler);
    /*
     * if there was no user handler, interpreter is already shutdown
     */
    the_exception->resume = VTABLE_get_pointer(interpreter, handler);
    the_exception->error = VTABLE_get_integer_keyed_int(interpreter,
            exception, 1);
    the_exception->severity = VTABLE_get_integer_keyed_int(interpreter,
            exception, 2);
    the_exception->msg = VTABLE_get_string_keyed_int(interpreter, exception, 0);
    longjmp(the_exception->destination, 1);
}

/*

=item C<static size_t
dest2offset(Parrot_Interp interpreter, opcode_t *dest)>

Translate an absolute bytecode location to an offset used for resuming
after an exception had occured.

=cut

*/

static size_t
dest2offset(Parrot_Interp interpreter, opcode_t *dest)
{
    size_t offset;
    /* translate an absolute location in byte_code to an offset
     * used for resuming after an exception had occured
     */
    switch (interpreter->run_core) {
        case PARROT_SWITCH_CORE:
        case PARROT_CGP_CORE:
            offset = (void **)dest - interpreter->prederef.code;
        default:
            offset = dest - interpreter->code->byte_code;
    }
    return offset;
}

/*

=item C<static opcode_t *
create_exception(Parrot_Interp interpreter)>

Create an exception.

=cut

*/

static opcode_t *
create_exception(Parrot_Interp interpreter)
{
    PMC *exception;     /* exception object */
    opcode_t *dest;     /* absolute address of handler */
    Parrot_exception *the_exception = interpreter->exceptions;

    /*
     * if the exception number is in the range of our known exceptions
     * use the precreated exception
     */
    if (the_exception->error <= E_LAST_PYTHON_E) {
        exception = interpreter->exception_list[the_exception->error];
    }
    else {
        /* create an exception object */
        exception = pmc_new(interpreter, enum_class_Exception);
        /* exception type */
        VTABLE_set_integer_keyed_int(interpreter, exception, 1,
                the_exception->error);
    }
    /* exception severity */
    VTABLE_set_integer_keyed_int(interpreter, exception, 2,
            (INTVAL)the_exception->severity);
    if (the_exception->msg) {
        VTABLE_set_string_keyed_int(interpreter, exception, 0,
                the_exception->msg);
    }
    /* now fill rest of exception, locate handler and get
     * destination of handler
     */
    dest = throw_exception(interpreter, exception, the_exception->resume);
    return dest;
}

/*

=item C<size_t handle_exception(Parrot_Interp interpreter)>

Handle an exception.

=cut

*/

size_t
handle_exception(Parrot_Interp interpreter)
{
    opcode_t *dest;     /* absolute address of handler */

    dest = create_exception(interpreter);
    return dest2offset(interpreter, dest);
}

/*

=item C<void
new_internal_exception(Parrot_Interp interpreter)>

Create a new internal exception buffer, either by allocating it or by
getting one from the free list.

=cut

*/

void
new_internal_exception(Parrot_Interp interpreter)
{
    Parrot_exception *the_exception;

    if (interpreter->exc_free_list) {
        the_exception = interpreter->exc_free_list;
        interpreter->exc_free_list = the_exception->prev;
    }
    else
        the_exception = mem_sys_allocate(sizeof(*the_exception));
    the_exception->prev = interpreter->exceptions;
    the_exception->resume = NULL;
    the_exception->msg = NULL;
    interpreter->exceptions = the_exception;
}

/*

=item C<void
do_exception(Parrot_Interp interpreter,
        exception_severity severity, long error)>

Called from interrupt code. Does a C<longjmp> in front of the runloop,
which calls C<handle_exception()>, returning the handler address where
execution then resumes.

=cut

*/
void
do_exception(Parrot_Interp interpreter,
        exception_severity severity, long error)
{
    Parrot_exception *the_exception = interpreter->exceptions;

    the_exception->error = error;
    the_exception->severity = severity;
    the_exception->msg = NULL;
    the_exception->resume = NULL;
    longjmp(the_exception->destination, 1);
}

/*

=item C<void
real_exception(Interp *interpreter, void *ret_addr,
        int exitcode,  const char *format, ...)>

Unlike C<internal_exception()> this throws a real exception.

=cut

*/

void
real_exception(Interp *interpreter, void *ret_addr,
        int exitcode,  const char *format, ...)
{
    STRING *msg;
    Parrot_exception *the_exception = interpreter->exceptions;

    /*
     * if profiling remember end time of lastop and
     * generate entry for exception
     */
    if (interpreter->profile &&
            Interp_flags_TEST(interpreter, PARROT_PROFILE_FLAG)) {
        RunProfile *profile = interpreter->profile;
        FLOATVAL now = Parrot_floatval_time();
        profile->data[profile->cur_op].time += now - profile->starttime;
        profile->cur_op = PARROT_PROF_EXCEPTION;
        profile->starttime = now;
        profile->data[PARROT_PROF_EXCEPTION].numcalls++;
    }

    /*
     * make exception message
     */
    if (strchr(format, '%')) {
        va_list arglist;
        va_start(arglist, format);
        msg = Parrot_vsprintf_c(interpreter, format, arglist);
        va_end(arglist);
    }
    else
        msg = string_make(interpreter, format, strlen(format),
                "iso-8859-1", PObj_external_FLAG);
    /* string_from_cstring(interpreter, format, strlen(format)); */
    /*
     * FIXME classify errors
     */
    the_exception->severity = EXCEPT_error;
    the_exception->error = exitcode;
    the_exception->msg = msg;
    the_exception->resume = ret_addr;
    /*
     * reenter runloop
     */
    longjmp(the_exception->destination, 1);
}

/*

=item C<void Parrot_init_exceptions(Interp *interpreter)>

Create exception objects.

*/

void
Parrot_init_exceptions(Interp *interpreter) {
    int i;
    PMC *ex;

    interpreter->exception_list = mem_sys_allocate(
            sizeof(PMC*) * (E_LAST_PYTHON_E + 1));
    for (i = 0; i <= E_LAST_PYTHON_E; ++i) {
        ex = pmc_new(interpreter, enum_class_Exception);
        interpreter->exception_list[i] = ex;
        VTABLE_set_integer_keyed_int(interpreter, ex, 1, i);
    }
}

/*

=back

=head1 SEE ALSO

F<include/parrot/exceptions.h>.

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
