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

static void set_graphemes(Interp *interpreter, STRING *source_string, UINTVAL offset, UINTVAL replace_count, STRING *insert_string);
static void to_charset(Interp *interpreter, STRING *source_string, CHARSET *new_charset);
static STRING *copy_to_charset(Interp *interpreter, STRING *source_string, CHARSET *new_charset);
static void to_unicode(Interp *interpreter, STRING *source_string);
static void compose(Interp *interpreter, STRING *source_string);
static void decompose(Interp *interpreter, STRING *source_string);
static void upcase(Interp *interpreter, STRING *source_string);
static void downcase(Interp *interpreter, STRING *source_string);
static void titlecase(Interp *interpreter, STRING *source_string);
static void upcase_first(Interp *interpreter, STRING *source_string);
static void downcase_first(Interp *interpreter, STRING *source_string);
static void titlecase_first(Interp *interpreter, STRING *source_string);
static INTVAL compare(Interp *interpreter, STRING *lhs, STRING *rhs);
static INTVAL cs_index(Interp *interpreter, const STRING *source_string, const STRING *search_string, UINTVAL offset);
static INTVAL cs_rindex(Interp *interpreter, const STRING *source_string, const STRING *search_string, UINTVAL offset);
static UINTVAL validate(Interp *interpreter, STRING *source_string);
static INTVAL is_wordchar(Interp *interpreter, STRING *source_string, UINTVAL offset);
static INTVAL find_wordchar(Interp *interpreter, STRING *source_string, UINTVAL offset);
static INTVAL find_not_wordchar(Interp *interpreter, STRING *source_string, UINTVAL offset);
static INTVAL is_whitespace(Interp *interpreter, STRING *source_string, UINTVAL offset);
static INTVAL find_whitespace(Interp *interpreter, STRING *source_string, UINTVAL offset);
static INTVAL find_not_whitespace(Interp *interpreter, STRING *source_string, UINTVAL offset);
static INTVAL is_digit(Interp *interpreter, STRING *source_string, UINTVAL offset);
static INTVAL find_digit(Interp *interpreter, STRING *source_string, UINTVAL offset);
static INTVAL find_not_digit(Interp *interpreter, STRING *source_string, UINTVAL offset);
static INTVAL is_punctuation(Interp *interpreter, STRING *source_string, UINTVAL offset);
static INTVAL find_punctuation(Interp *interpreter, STRING *source_string, UINTVAL offset);
static INTVAL find_not_punctuation(Interp *interpreter, STRING *source_string, UINTVAL offset);
static INTVAL is_newline(Interp *interpreter, STRING *source_string, UINTVAL offset);
static INTVAL find_newline(Interp *interpreter, STRING *source_string, UINTVAL offset);
static INTVAL find_not_newline(Interp *interpreter, STRING *source_string, UINTVAL offset);
static INTVAL find_word_boundary(Interp *interpreter, STRING *source_string, UINTVAL offset);
static size_t compute_hash(Interp *interpreter, STRING *source_string);
CHARSET *Parrot_charset_iso_8859_1_init(Interp *interpreter);


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
