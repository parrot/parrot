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


/* Prototypes */
void internal_exception(int exitcode, const char * format, ... );
void do_panic(struct Parrot_Interp *interpreter, const char *message, const char *file, int line);

#define PANIC(message)\
        do_panic(interpreter, message, __FILE__, __LINE__)

/* Exception Types */
#define NO_REG_FRAMES 1
#define SUBSTR_OUT_OF_STRING 1
#define ORD_OUT_OF_STRING 1
#define MALFORMED_UTF8 1
#define MALFORMED_UTF16 1
#define MALFORMED_UTF32 1
#define INVALID_CHARACTER 1
#define NEG_REPEAT 1
#define NEG_SUBSTR 1
#define NEG_SLEEP 1
#define NEG_CHOP 1
#define ARG_OP_NOT_HANDLED 1
#define KEY_NOT_FOUND 1
#define JIT_UNAVAILABLE 1
#define INTERP_ERROR 1
#define PREDEREF_LOAD_ERROR 1
#define PARROT_USAGE_ERROR 1
#define PIO_ERROR 1
#define PARROT_POINTER_ERROR 1
#define DIV_BY_ZERO 1
#define PIO_NOT_IMPLEMENTED 1
#define ALLOCATION_ERROR 1
#define INTERNAL_PANIC 1
#define OUT_OF_BOUNDS 1

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
