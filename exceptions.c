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
    exit(exitcode);
}

/* Panic handler */

#define dumpcore() printf("Sorry, coredump is not yet implemented for this platform.\n\n");  exit(1);

void
do_panic(struct Parrot_Interp *interpreter, const char *message,
         const char *file, int line)
{
    printf("Parrot VM: PANIC: %s!\n", message ? message : "(no message available)");
    printf("C file %s, line %d\n", file ? file : "(file name not available)", line);
    printf("Parrot file %s, ", "(not available)");
    if (interpreter)
        printf("line %d\n", interpreter->current_line);
    else
        printf("line ((not available)\n");
    printf("\n\
We highly suggest you notify the Parrot team if you have not been working on \n\
Parrot.  Use bugs6.perl.org or send an e-mail to perl6-internals@perl.org.  \n\
Include the entire text of this error message and the text of the script that \n\
generated the error.  If you've made any modifications to Parrot, please \n\
describe them as well.\n");
    printf("Version     : %s\n", PARROT_VERSION);
    printf("Configured  : %s\n", PARROT_CONFIG_DATE);
    printf("Architecture: %s\n", PARROT_ARCHNAME);
    printf("JIT Capable : %s\n", (JIT_CAPABLE ? "Yes" : "No"));
    if (interpreter)
        printf("Interp Flags: 0x%x\n", interpreter->flags);
    else
        printf("Interp Flags: (not available)\n");
    printf("Exceptions  : (missing from core)\n");
    printf("\nDumping core...\n\n");
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
