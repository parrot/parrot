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

static STRING *get_graphemes(Interp *, STRING *source_string, UINTVAL offset, UINTVAL count);
static STRING *get_graphemes_inplace(Interp *, STRING *source_string, STRING *dest_string, UINTVAL offset, UINTVAL count);
static void set_graphemes(Interp *, STRING *source_string, UINTVAL offset, UINTVAL replace_count, STRING *insert_string);
static void to_charset(Interp *, STRING *source_string, CHARSET *new_charset);
static STRING *copy_to_charset(Interp *, STRING *source_string, CHARSET *new_charset);
static void to_unicode(Interp *, STRING *source_string);
static void compose(Interp *, STRING *source_string);
static void decompose(Interp *, STRING *source_string);
static void upcase(Interp *, STRING *source_string);
static void downcase(Interp *, STRING *source_string);
static void titlecase(Interp *, STRING *source_string);
static void upcase_first(Interp *, STRING *source_string);
static void downcase_first(Interp *, STRING *source_string);
static void titlecase_first(Interp *, STRING *source_string);
static INTVAL compare(Interp *, STRING *lhs, STRING *rhs);
static INTVAL cs_index(Interp *, const STRING *source_string, const STRING *search_string, UINTVAL offset);
static INTVAL cs_rindex(Interp *, const STRING *source_string, const STRING *search_string, UINTVAL offset);
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
static INTVAL is_newline(Interp *, STRING *source_string, UINTVAL offset);
static INTVAL find_newline(Interp *, STRING *source_string, UINTVAL offset);
static INTVAL find_not_newline(Interp *, STRING *source_string, UINTVAL offset);
static INTVAL find_word_boundary(Interp *, STRING *source_string, UINTVAL offset);
static size_t compute_hash(Interp *, STRING *source_string);
CHARSET *Parrot_charset_ascii_init(Interp *);


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
