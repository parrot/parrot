/* ascii.h
 *  Copyright: 2004 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the header for the ascii charset functions
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_CHARSET_ASCII_H_GUARD)
#define PARROT_CHARSET_ASCII_H_GUARD

/*
 * common functions for ascii-ish charsets
 */

INTVAL
ascii_find_thing(Interp *interpreter, STRING *string, UINTVAL start,
        unsigned char type, const unsigned char *table);
INTVAL
ascii_find_not_thing(Interp *interpreter, STRING *string, UINTVAL start,
        unsigned char type, const unsigned char *table);
STRING *ascii_get_graphemes(Interp *, STRING *source_string,
        UINTVAL offset, UINTVAL count);
STRING *ascii_get_graphemes_inplace(Interp *, STRING *source_string,
        STRING *dest_string, UINTVAL offset, UINTVAL count);
INTVAL ascii_is_newline(Interp *, STRING *source_string, UINTVAL offset);
INTVAL ascii_find_newline(Interp *, STRING *source_string, UINTVAL offset);
INTVAL ascii_find_not_newline(Interp *, STRING *source_string, UINTVAL offset);
INTVAL ascii_find_word_boundary(Interp *, STRING *source_string,
        UINTVAL offset, const unsigned char *typetable);
INTVAL ascii_compare(Interp *, STRING *lhs, STRING *rhs);
INTVAL ascii_compare(Interp *, STRING *lhs, STRING *rhs);
INTVAL ascii_cs_index(Interp *, const STRING *source_string,
        const STRING *search_string, UINTVAL offset);
INTVAL ascii_cs_rindex(Interp *, const STRING *source_string,
        const STRING *search_string, UINTVAL offset);
size_t ascii_compute_hash(Interp *, STRING *source_string);
STRING * ascii_to_unicode(Interp *, STRING *source_string, STRING *dest);
STRING * ascii_to_charset(Interp *, STRING *src, CHARSET *new_cs, STRING *dest);

static void compose(Interp *, STRING *source_string);
static void decompose(Interp *, STRING *source_string);
static void upcase(Interp *, STRING *source_string);
static void downcase(Interp *, STRING *source_string);
static void titlecase(Interp *, STRING *source_string);
static void upcase_first(Interp *, STRING *source_string);
static void downcase_first(Interp *, STRING *source_string);
static void titlecase_first(Interp *, STRING *source_string);
static UINTVAL validate(Interp *, STRING *source_string);
static INTVAL is_wordchar(Interp *, STRING *source_string, UINTVAL offset);
static INTVAL find_wordchar(Interp *, STRING *source_string, UINTVAL offset);
static INTVAL find_not_wordchar(Interp *, STRING *source_string, UINTVAL offset);
static INTVAL is_whitespace(Interp *, STRING *source_string, UINTVAL offset);
static INTVAL find_whitespace(Interp *, STRING *source_string, UINTVAL offset);
static INTVAL find_not_whitespace(Interp *, STRING *source_string, UINTVAL offset);
static INTVAL is_digit(Interp *, STRING *source_string, UINTVAL offset);
static INTVAL find_digit(Interp *, STRING *source_string, UINTVAL offset);
static INTVAL find_not_digit(Interp *, STRING *source_string, UINTVAL offset);
static INTVAL is_punctuation(Interp *, STRING *source_string, UINTVAL offset);
static INTVAL find_punctuation(Interp *, STRING *source_string, UINTVAL offset);
static INTVAL find_not_punctuation(Interp *, STRING *source_string, UINTVAL offset);
CHARSET *Parrot_charset_ascii_init(Interp *);

STRING *charset_cvt_ascii_to_binary(Interp *, STRING *src, STRING *dest);
STRING *charset_cvt_ascii_to_iso_8859_1(Interp *, STRING *src, STRING *dest);

#endif /* PARROT_CHARSET_ASCII_H_GUARD */
/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
