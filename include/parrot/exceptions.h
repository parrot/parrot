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

#if !defined(PARROT_EXCEPTIONS_H_GUARD)
#define PARROT_EXCEPTIONS_H_GUARD

#define INTERNAL_EXCEPTION(x,y) {fprintf(stderr, y); exit(x);}

#define NO_REG_FRAMES 1
#define SUBSTR_OUT_OF_STRING 1
#define ORD_OUT_OF_STRING 1
#define MALFORMED_UTF8 1
#define MALFORMED_UTF16 1
#define MALFORMED_UTF32 1
#define INVALID_CHARACTER 1

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
