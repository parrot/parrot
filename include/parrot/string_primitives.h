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
void string_fill_from_buffer(struct Parrot_Interp *interpreter,
	const void *buffer, UINTVAL len, const char *encoding_name, STRING *s);

UINTVAL
Parrot_char_digit_value(struct Parrot_Interp *interpreter, UINTVAL character);

/* Character properties */
INTVAL Parrot_char_is_alnum(struct Parrot_Interp *interpreter, UINTVAL character);
INTVAL Parrot_char_is_alpha(struct Parrot_Interp *interpreter, UINTVAL character);
INTVAL Parrot_char_is_ascii(struct Parrot_Interp *interpreter, UINTVAL character);
INTVAL Parrot_char_is_blank(struct Parrot_Interp *interpreter, UINTVAL character);
INTVAL Parrot_char_is_cntrl(struct Parrot_Interp *interpreter, UINTVAL character);
INTVAL Parrot_char_is_digit(struct Parrot_Interp *interpreter, UINTVAL character);
INTVAL Parrot_char_is_graph(struct Parrot_Interp *interpreter, UINTVAL character);
INTVAL Parrot_char_is_lower(struct Parrot_Interp *interpreter, UINTVAL character);
INTVAL Parrot_char_is_print(struct Parrot_Interp *interpreter, UINTVAL character);
INTVAL Parrot_char_is_punct(struct Parrot_Interp *interpreter, UINTVAL character);
INTVAL Parrot_char_is_space(struct Parrot_Interp *interpreter, UINTVAL character);
INTVAL Parrot_char_is_upper(struct Parrot_Interp *interpreter, UINTVAL character);
INTVAL Parrot_char_is_xdigit(struct Parrot_Interp *interpreter, UINTVAL character);

#endif

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
