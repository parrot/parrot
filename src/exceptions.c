/* exceptions.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     define the internal interpreter exceptions
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"
#include "parrot/exceptions.h"

#include <stdarg.h>

/* Exception Handler */
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

void
do_panic(struct Parrot_Interp *interpreter, const char *message,
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
Parrot.  Use bugs6.perl.org or send an e-mail to perl6-internals@perl.org.\n\
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

void
push_exception(Parrot_Interp interpreter, PMC *handler)
{
    if (handler->vtable->base_type != enum_class_Exception_Handler)
        PANIC("Tried to set_eh a non Exception_Handler");
    stack_push(interpreter, &interpreter->ctx.control_stack, handler,
            STACK_ENTRY_PMC, STACK_CLEANUP_NULL);
}

static PMC *
find_exception_handler(Parrot_Interp interpreter, PMC *exception)
{
    PMC *handler;
    Stack_entry_type type;
    STRING *message, *s;
    PMC *key;
    char *m;
    /* for now, we don't check the exception class and we don't
     * look for matching handlers
     */
    s = string_make(interpreter, "_message", 8, NULL,0,NULL);
    key = key_new_string(interpreter, s);
    message = VTABLE_get_string_keyed(interpreter, exception, key);
    do {
        handler =
            stack_peek(interpreter, interpreter->ctx.control_stack, &type);
        if (!handler)
            break;
        (void)stack_pop(interpreter, &interpreter->ctx.control_stack, &handler,
                        STACK_ENTRY_PMC);
        if (type == STACK_ENTRY_PMC &&
                handler->vtable->base_type == enum_class_Exception_Handler)
            return handler;
    } while (1);
    m = string_to_cstring(interpreter, message);
    if (m && *m) {
        fputs(m, stderr);
        if (m[strlen(m-1)] != '\n')
            fprintf(stderr, "%c", '\n');
    }
    else
        fprintf(stderr, "No exception handler and no message\n");
    Parrot_exit(1);

    return NULL;
}

void
pop_exception(Parrot_Interp interpreter)
{
    Stack_entry_type type;
    PMC *handler;

    handler = stack_peek(interpreter, interpreter->ctx.control_stack, &type);
    if (type != STACK_ENTRY_PMC ||
            handler->vtable->base_type != enum_class_Exception_Handler)
        PANIC("Tried to clear_eh a non Exception_Handler");
    (void)stack_pop(interpreter, &interpreter->ctx.control_stack, handler,
                    STACK_ENTRY_PMC);
}

void *
throw_exception(Parrot_Interp interpreter, PMC *exception, void *dest)
{
    PMC *handler;
    struct Parrot_Sub * cc;
    PMC* key;
    STRING *s;

    Parrot_block_DOD(interpreter);
    handler = find_exception_handler(interpreter, exception);
    cc = (struct Parrot_Sub*)PMC_data(handler);
    /* preserve P5 register */
    s = string_make(interpreter, "_P5", 3, NULL,0,NULL);
    key = key_new_string(interpreter, s);
    VTABLE_set_pmc_keyed(interpreter, exception, key, REG_PMC(5));
    /* generate and place return continuation */
    if (dest) {
        s = string_make(interpreter, "_invoke_cc", 10, NULL,0,NULL);
        key = key_new_string(interpreter, s);
        VTABLE_set_pmc_keyed(interpreter, exception, key,
                new_continuation_pmc(interpreter, dest));
    }
    /* put the continuation ctx in the interpreter */
    restore_context(interpreter, &cc->ctx);
    /* put exception object in P5 */
    REG_PMC(5) = exception;
    Parrot_unblock_DOD(interpreter);
    /* return the address of the handler */
    return handler->cache.struct_val;
}

void *
rethrow_exception(Parrot_Interp interpreter, PMC *exception)
{
    return NULL;
}

#ifdef HAS_HEADER_SETJMP
/* XXX s. interpreter.c */
Parrot_exception the_exception;
size_t handle_exception(Parrot_Interp);
void do_exception(exception_severity severity, long error);

static size_t
dest2offset(Parrot_Interp interpreter, opcode_t *dest)
{
    size_t offset;
    /* translate an absolute location in byte_code to an offset
     * used for resuming after an exception had occured
     */
    switch (interpreter->flags) {
        case PARROT_PREDEREF_FLAG:
            offset = (void **)dest - interpreter->prederef_code;
        default:
            offset = dest - interpreter->code->byte_code;
    }
    return offset;
}

size_t
handle_exception(Parrot_Interp interpreter)
{
    PMC *exception;     /* exception object */
    size_t offset;      /* resume offset of handler */
    PMC* key;
    STRING *s;
    opcode_t *dest;     /* absolute address of handler */

    Parrot_block_DOD(interpreter);
    /* create an exception object */
    exception = pmc_new(interpreter, enum_class_Exception);
    /* exception type */
    s = string_make(interpreter, "_type", 5, NULL,0,NULL);
    key = key_new_string(interpreter, s);
    VTABLE_set_integer_keyed(interpreter, exception, key,
            the_exception.error);
    /* exception severity */
    s = string_make(interpreter, "_severity", 9, NULL,0,NULL);
    key = key_new_string(interpreter, s);
    VTABLE_set_integer_keyed(interpreter, exception, key,
            (INTVAL)the_exception.severity);
    /* now fill rest of exception, locate handler and get
     * destination of handler
     */
    dest = throw_exception(interpreter, exception, NULL);
    offset = dest2offset(interpreter, dest);

    Parrot_unblock_DOD(interpreter);
    return offset;
}

void
do_exception(exception_severity severity, long error)
{
    the_exception.error = error;
    the_exception.severity = severity;
    longjmp(the_exception.destination, 1);
}

#endif

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
