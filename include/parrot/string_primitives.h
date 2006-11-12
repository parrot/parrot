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

#if !defined(PARROT_STRING_PRIMITIVES_H_GUARD)
#define PARROT_STRING_PRIMITIVES_H_GUARD

#ifdef PARROT_IN_CORE

/* Set the directory where ICU finds its data files (encodings,
   locales, etc.) */
void string_set_data_directory(const char *dir);

/* Convert from any supported encoding, into our internal format */
void string_fill_from_buffer(Interp *interp,
        const void *buffer, UINTVAL len, const char *encoding_name, STRING *s);

/* Utility method which knows how to uwind a single escape sequence */
typedef Parrot_UInt2 (*Parrot_unescape_cb)(Parrot_Int4 offset, void *context);
Parrot_UInt4
string_unescape_one(Interp *interp, UINTVAL *offset, STRING *string);

UINTVAL
Parrot_char_digit_value(Interp *interp, UINTVAL character);

/* Character properties */
INTVAL Parrot_char_is_alnum(Interp *interp, UINTVAL character);
INTVAL Parrot_char_is_alpha(Interp *interp, UINTVAL character);
INTVAL Parrot_char_is_ascii(Interp *interp, UINTVAL character);
INTVAL Parrot_char_is_blank(Interp *interp, UINTVAL character);
INTVAL Parrot_char_is_cntrl(Interp *interp, UINTVAL character);
INTVAL Parrot_char_is_digit(Interp *interp, UINTVAL character);
INTVAL Parrot_char_is_graph(Interp *interp, UINTVAL character);
INTVAL Parrot_char_is_lower(Interp *interp, UINTVAL character);
INTVAL Parrot_char_is_print(Interp *interp, UINTVAL character);
INTVAL Parrot_char_is_punct(Interp *interp, UINTVAL character);
INTVAL Parrot_char_is_space(Interp *interp, UINTVAL character);
INTVAL Parrot_char_is_UWhiteSpace(Interp *interp, UINTVAL character);
INTVAL Parrot_char_is_Whitespace(Interp *interp, UINTVAL character);
INTVAL Parrot_char_is_upper(Interp *interp, UINTVAL character);
INTVAL Parrot_char_is_JavaSpaceChar(Interp *interp, UINTVAL character);
INTVAL Parrot_char_is_xdigit(Interp *interp, UINTVAL character);

#endif /* PARROT_IN_CORE */
#endif /* PARROT_STRING_PRIMITIVES_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
