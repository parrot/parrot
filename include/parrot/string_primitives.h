/* string_funcs.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
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
void string_fill_from_buffer(Interp *interpreter,
	const void *buffer, UINTVAL len, const char *encoding_name, STRING *s);

/* Utility method which knows how to uwind a single escape sequence */
typedef Parrot_UInt2 (*Parrot_unescape_cb)(Parrot_Int4 offset, void *context);
Parrot_UInt4
string_unescape_one(Parrot_unescape_cb cb,
    Parrot_UInt4 *offset, Parrot_UInt4 input_length, void *string);

UINTVAL
Parrot_char_digit_value(Interp *interpreter, UINTVAL character);

/* Character properties */
INTVAL Parrot_char_is_alnum(Interp *interpreter, UINTVAL character);
INTVAL Parrot_char_is_alpha(Interp *interpreter, UINTVAL character);
INTVAL Parrot_char_is_ascii(Interp *interpreter, UINTVAL character);
INTVAL Parrot_char_is_blank(Interp *interpreter, UINTVAL character);
INTVAL Parrot_char_is_cntrl(Interp *interpreter, UINTVAL character);
INTVAL Parrot_char_is_digit(Interp *interpreter, UINTVAL character);
INTVAL Parrot_char_is_graph(Interp *interpreter, UINTVAL character);
INTVAL Parrot_char_is_lower(Interp *interpreter, UINTVAL character);
INTVAL Parrot_char_is_print(Interp *interpreter, UINTVAL character);
INTVAL Parrot_char_is_punct(Interp *interpreter, UINTVAL character);
INTVAL Parrot_char_is_space(Interp *interpreter, UINTVAL character);
INTVAL Parrot_char_is_upper(Interp *interpreter, UINTVAL character);
INTVAL Parrot_char_is_xdigit(Interp *interpreter, UINTVAL character);

#endif /* PARROT_IN_CORE */
#endif /* PARROT_STRING_PRIMITIVES_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
