/* iso_8859_1.h
 *  Copyright: 2004 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the header for the iso_8859-1 charset functions
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_CHARSET_ISO_8859_1_H_GUARD)
#define PARROT_CHARSET_ISO_8859_1_H_GUARD

static void set_graphemes(Interp *, STRING *source_string, UINTVAL offset, UINTVAL replace_count, STRING *insert_string);
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

STRING *charset_cvt_iso_8859_1_to_ascii(Interp *, STRING *src, STRING *dest);

CHARSET *Parrot_charset_iso_8859_1_init(Interp *);

#endif /* PARROT_CHARSET_ISO_8859_1_H_GUARD */
/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
