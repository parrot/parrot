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

#ifdef HAS_HEADER_STDARG

#include <stdarg.h>

/* Exception Handler */
void internal_exception(int exitcode, const char * format, ... ) {
	va_list arglist;
	va_start(arglist, format);
	vfprintf(stderr,format,arglist);
	va_end(arglist);
	exit(exitcode);	
}
#else
void internal_exception(int exitcode, const char * format, ... ) {
	fprintf(stderr, format);
	exit(exitcode);
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
