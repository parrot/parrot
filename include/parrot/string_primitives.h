/* string_funcs.h
 *  Copyright (C) 2001-2003, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This is the api header for the string subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_STRING_PRIMITIVES_H_GUARD
#define PARROT_STRING_PRIMITIVES_H_GUARD

#ifdef PARROT_IN_CORE

/* Set the directory where ICU finds its data files (encodings,
   locales, etc.) */
PARROT_API void string_set_data_directory(Interp *interp, const char *dir);

/* Convert from any supported encoding, into our internal format */
PARROT_API void string_fill_from_buffer(Interp *interp,
        const void *buffer, UINTVAL len, const char *encoding_name, STRING *s);

/* Utility method which knows how to uwind a single escape sequence */
typedef Parrot_UInt2 (*Parrot_unescape_cb)(Parrot_Int4 offset, void *context);
PARROT_API Parrot_UInt4
string_unescape_one(Interp *interp, UINTVAL *offset, STRING *string);

PARROT_API UINTVAL
Parrot_char_digit_value(Interp *interp, UINTVAL character);

#endif /* PARROT_IN_CORE */
#endif /* PARROT_STRING_PRIMITIVES_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
