/* exceptions.h
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

#include <stdarg.h>

/* Exception Handler */
void internal_exception(int exitcode, const char * format, ... ) {
	va_list arglist;
	va_start(arglist, format);
	vfprintf(stderr,format,arglist);
	va_end(arglist);
	exit(exitcode);	
}

/* Panic handler */

#define dumpcore() printf("Sorry, coredump is not yet implemented for this platform.\n\n");  exit(1);

void do_panic(struct Parrot_Interp *interpreter, char *message, char *file, int line) {
    printf(
"Parrot VM: PANIC: %s!\n\
C file %s, line %d\n\
Parrot file %s, line %d\n\
\n\
We highly suggest you notify the Parrot team if you have not been working on \n\
Parrot.  Use bugs6.perl.org or send an e-mail to perl6-internals@perl.org.  \n\
Include the entire text of this error message and the text of the script that \n\
generated the error.  If you've made any modifications to Parrot, please \n\
describe them as well.\n\
\n\
Version     : " PARROT_VERSION     "\n\
Configured  : " PARROT_CONFIG_DATE "\n\
Architecture: " PARROT_ARCHNAME    "\n\
JIT Capable : %s\n\
\n\
Interp Flags: 0x%x\n\
Exceptions  : (missing from core)\n\
\n\
Dumping core...\n\
\n",
        message, 
        file, 
        line, 
        "(not available)", 
        interpreter->current_line, 
        (JIT_CAPABLE ? "Yes" : "No"),
        interpreter->flags);
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
