/* charset.h
 *  Copyright: 2004 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the header for the 8-bit fixed-width encoding
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_CHARSET_H_GUARD)
#define PARROT_CHARSET_H_GUARD

#include "parrot/encoding.h"

struct _struct;
typedef struct _charset CHARSET;

typedef STRING *(*charset_get_graphemes_t)(Interp *interpreter, STRING *source_string, UINTVAL offset, UINTVAL count);
typedef void (*charset_set_graphemes_t)(Interp *interpreter, STRING *source_string, UINTVAL offset, UINTVAL replace_count, STRING *insert_string);
typedef void (*charset_to_charset_t)(Interp *interpreter, STRING *source_string, CHARSET *new_charset);
typedef STRING *(*charset_copy_to_charset_t)(Interp *interpreter, STRING *source_string, CHARSET *new_charset);
typedef void (*charset_to_unicode_t)(Interp *interpreter, STRING *source_string);
typedef void (*charset_compose_t)(Interp *interpreter, STRING *source_string);
typedef void (*charset_decompose_t)(Interp *interpreter, STRING *source_string);
typedef void (*charset_upcase_t)(Interp *interpreter, STRING *source_string);
typedef void (*charset_downcase_t)(Interp *interpreter, STRING *source_string);
typedef void (*charset_titlecase_t)(Interp *interpreter, STRING *source_string);
typedef void (*charset_upcase_first_t)(Interp *interpreter, STRING *source_string);
typedef void (*charset_downcase_first_t)(Interp *interpreter, STRING *source_string);
typedef void (*charset_titlecase_first_t)(Interp *interpreter, STRING *source_string);
typedef INTVAL (*charset_compare_t)(Interp *interpreter, STRING *lhs, STRING *rhs);
typedef INTVAL (*charset_index_t)(Interp *interpreter, STRING *source_string, STRING *search_string, UINTVAL offset);
typedef INTVAL (*charset_rindex_t)(Interp *interpreter, STRING *source_string, STRING *search_string, UINTVAL offset);
typedef UINTVAL (*charset_validate_t)(Interp *interpreter, STRING *source_string);
typedef INTVAL (*charset_is_wordchar_t)(Interp *interpreter, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_find_wordchar_t)(Interp *interpreter, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_find_not_wordchar_t)(Interp *interpreter, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_is_whitespace_t)(Interp *interpreter, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_find_whitespace_t)(Interp *interpreter, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_find_not_whitespace_t)(Interp *interpreter, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_is_digit_t)(Interp *interpreter, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_find_digit_t)(Interp *interpreter, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_find_not_digit_t)(Interp *interpreter, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_is_punctuation_t)(Interp *interpreter, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_find_punctuation_t)(Interp *interpreter, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_find_not_punctuation_t)(Interp *interpreter, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_is_newline_t)(Interp *interpreter, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_find_newline_t)(Interp *interpreter, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_find_not_newline_t)(Interp *interpreter, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_find_word_boundary_t)(Interp *interpreter, STRING *source_string, UINTVAL offset);

static STRING *get_graphemes(Interp *interpreter, STRING *source_string, UINTVAL offset, UINTVAL count);
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
static INTVAL index(Interp *interpreter, STRING *source_string, STRING *search_string, UINTVAL offset);
static INTVAL rindex(Interp *interpreter, STRING *source_string, STRING *search_string, UINTVAL offset);
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
CHARSET *Parrot_charset_binary_init(Interp *interpreter);

CHARSET *Parrot_new_charset(Interp *interpreter);

struct _charset {
    const char *name;
    charset_get_graphemes_t get_graphemes;
    charset_set_graphemes_t set_graphemes;
    charset_to_charset_t to_charset;
    charset_copy_to_charset_t copy_to_charset;
    charset_to_unicode_t to_unicode;
    charset_compose_t compose;
    charset_decompose_t decompose;
    charset_upcase_t upcase;
    charset_downcase_t downcase;
    charset_titlecase_t titlecase;
    charset_upcase_first_t upcase_first;
    charset_downcase_first_t downcase_first;
    charset_titlecase_first_t titlecase_first;
    charset_compare_t compare;
    charset_index_t index;
    charset_rindex_t rindex;
    charset_validate_t validate;
    charset_is_wordchar_t is_wordchar;
    charset_find_wordchar_t find_wordchar;
    charset_find_not_wordchar_t find_not_wordchar;
    charset_is_whitespace_t is_whitespace;
    charset_find_whitespace_t find_whitespace;
    charset_find_not_whitespace_t find_not_whitespace;
    charset_is_digit_t is_digit;
    charset_find_digit_t find_digit;
    charset_find_not_digit_t find_not_digit;
    charset_is_punctuation_t is_punctuation;
    charset_find_punctuation_t find_punctuation;
    charset_find_not_punctuation_t find_not_punctuation;
    charset_is_newline_t is_newline;
    charset_find_newline_t find_newline;
    charset_find_not_newline_t find_not_newline;
    charset_find_word_boundary_t find_word_boundary;
};



#endif /* PARROT_CHARSET_H_GUARD */
/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
