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

#define dumpcore() PIO_printf(interpreter, "Sorry, coredump is not yet implemented for this platform.\n\n");  exit(1);

void
do_panic(struct Parrot_Interp *interpreter, const char *message,
         const char *file, int line)
{
    /* Note: we can't format any floats in here--Parrot_sprintf
    ** may panic because of floats.
    */
    char flag_buffer[40];
    if (interpreter)
        Parrot_sprintf(interpreter, flag_buffer, "%#x", interpreter->flags);
    else
        strcpy(flag_buffer, "(null interpreter)");

    PIO_printf(interpreter, "Parrot VM: PANIC: %s!\n",
               message ? message : "(no message available)");

    PIO_printf(interpreter, "C file %s, line %d\n",
               file ? file : "(not available)", line);

    if (interpreter) {
        PIO_printf(interpreter, "Parrot file %Ss, line %d\n",
                   interpreter->current_file, interpreter->current_line);
    } else {
        PIO_printf(interpreter, "Parrot file (not available), ");
        PIO_printf(interpreter, "line (not available)\n");
    }

    PIO_printf(interpreter, "\n\
We highly suggest you notify the Parrot team if you have not been working on\n\
Parrot.  Use bugs6.perl.org or send an e-mail to perl6-internals@perl.org.\n\
Include the entire text of this error message and the text of the script that\n\
generated the error.  If you've made any modifications to Parrot, please\n\
describe them as well.\n\n");

    PIO_printf(interpreter, "Version     : %s\n", PARROT_VERSION);
    PIO_printf(interpreter, "Configured  : %s\n", PARROT_CONFIG_DATE);
    PIO_printf(interpreter, "Architecture: %s\n", PARROT_ARCHNAME);
    PIO_printf(interpreter, "JIT Capable : %s\n", JIT_CAPABLE ? "Yes" : "No");
    PIO_printf(interpreter, "Interp Flags: %s\n", flag_buffer);
    PIO_printf(interpreter, "Exceptions  : %s\n", "(missing from core)");
    PIO_printf(interpreter, "\nDumping Core...\n");
    
    dumpcore();
}  

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
