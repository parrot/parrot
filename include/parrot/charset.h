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

struct _charset;
typedef struct _charset CHARSET;


#if !defined PARROT_NO_EXTERN_CHARSET_PTRS
extern CHARSET *Parrot_iso_8859_1_charset_ptr;
extern CHARSET *Parrot_binary_charset_ptr;
extern CHARSET *Parrot_default_charset_ptr;
extern CHARSET *Parrot_unicode_charset_ptr;
extern CHARSET *Parrot_ascii_charset_ptr;
#endif

#define PARROT_DEFAULT_CHARSET Parrot_iso_8859_1_charset_ptr
#define PARROT_BINARY_CHARSET Parrot_binary_charset
#define PARROT_UNICODE_CHARSET Parrot_unicode_charset_ptr

typedef STRING *(*charset_get_graphemes_t)(Interp *, STRING *source_string, UINTVAL offset, UINTVAL count);
typedef STRING *(*charset_get_graphemes_inplace_t)(Interp *, STRING *source_string, UINTVAL offset, UINTVAL count, STRING *dest_string);
typedef void (*charset_set_graphemes_t)(Interp *, STRING *source_string, UINTVAL offset, UINTVAL replace_count, STRING *insert_string);

typedef STRING * (*charset_to_charset_t)(Interp *, STRING *source_string,
        CHARSET *new_charset, STRING *dest);
typedef STRING * (*charset_to_unicode_t)(Interp *, STRING *src, STRING *dest);
typedef STRING * (*charset_from_charset_t)(Interp *, STRING *source_string,
        STRING *dest);
typedef STRING * (*charset_from_unicode_t)(Interp *, STRING *source_string,
        STRING *dest);
typedef void (*charset_compose_t)(Interp *, STRING *source_string);
typedef void (*charset_decompose_t)(Interp *, STRING *source_string);
typedef void (*charset_upcase_t)(Interp *, STRING *source_string);
typedef void (*charset_downcase_t)(Interp *, STRING *source_string);
typedef void (*charset_titlecase_t)(Interp *, STRING *source_string);
typedef void (*charset_upcase_first_t)(Interp *, STRING *source_string);
typedef void (*charset_downcase_first_t)(Interp *, STRING *source_string);
typedef void (*charset_titlecase_first_t)(Interp *, STRING *source_string);
typedef INTVAL (*charset_compare_t)(Interp *, STRING *lhs, STRING *rhs);
typedef INTVAL (*charset_index_t)(Interp *, STRING *source_string, STRING *search_string, UINTVAL offset);
typedef INTVAL (*charset_rindex_t)(Interp *, STRING *source_string, STRING *search_string, UINTVAL offset);
typedef UINTVAL (*charset_validate_t)(Interp *, STRING *source_string);
typedef INTVAL (*charset_is_wordchar_t)(Interp *, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_find_wordchar_t)(Interp *, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_find_not_wordchar_t)(Interp *, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_is_whitespace_t)(Interp *, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_find_whitespace_t)(Interp *, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_find_not_whitespace_t)(Interp *, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_is_digit_t)(Interp *, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_find_digit_t)(Interp *, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_find_not_digit_t)(Interp *, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_is_punctuation_t)(Interp *, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_find_punctuation_t)(Interp *, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_find_not_punctuation_t)(Interp *, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_is_newline_t)(Interp *, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_find_newline_t)(Interp *, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_find_not_newline_t)(Interp *, STRING *source_string, UINTVAL offset);
typedef INTVAL (*charset_find_word_boundary_t)(Interp *, STRING *source_string, UINTVAL offset);
typedef STRING *(*charset_string_from_codepoint_t)(Interp *, UINTVAL codepoint);
typedef size_t (*charset_compute_hash_t)(Interp *, STRING *source_string);

CHARSET *Parrot_new_charset(Interp *);
CHARSET *Parrot_load_charset(Interp *, const char *charsetname);
CHARSET *Parrot_find_charset(Interp *, const char *charsetname);
INTVAL Parrot_register_charset(Interp *, const char *charsetname, CHARSET *charset);
INTVAL Parrot_make_default_charset(Interp *, const char *charsetname, CHARSET *charset);
CHARSET *Parrot_default_charset(Interp *);
typedef STRING* (*charset_converter_t)(Interp *, STRING *src, STRING *dst);
charset_converter_t Parrot_find_charset_converter(Interp *, CHARSET *lhs, CHARSET *rhs);
void Parrot_register_charset_converter(Interp *,
        CHARSET *lhs, CHARSET *rhs, charset_converter_t func);

void Parrot_charsets_encodings_init(Interp *);
void Parrot_charsets_encodings_deinit(Interp *);

INTVAL Parrot_charset_number(Interp *, STRING *charsetname);
STRING* Parrot_charset_name(Interp *, INTVAL);
const char* Parrot_charset_c_name(Interp *, INTVAL);
INTVAL Parrot_charset_number_of_str(Interp *, STRING *src);
CHARSET* Parrot_get_charset(Interp *, INTVAL number_of_charset);

struct _charset {
    const char *name;
    charset_get_graphemes_t get_graphemes;
    charset_get_graphemes_inplace_t get_graphemes_inplace;
    charset_set_graphemes_t set_graphemes;
    charset_to_charset_t to_charset;
    charset_to_unicode_t to_unicode;
    charset_from_charset_t from_charset;
    charset_from_unicode_t from_unicode;
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
    charset_string_from_codepoint_t string_from_codepoint;
    charset_compute_hash_t compute_hash;
    ENCODING *preferred_encoding;
};

#define CHARSET_GET_GRAPEMES(interp, source, offset, count) ((CHARSET *)source->charset)->get_graphemes(interpreter, source, offset, count)
#define CHARSET_GET_GRAPHEMES_INPLACE(interp, source, dest, offset, count) ((CHARSET *)source->charset)->get_graphemes(interpreter, source, dest, offset, count)
#define CHARSET_SET_GRAPHEMES(interp, source, offset, replace_count, insert) ((CHARSET *)source->charset)->set_graphemes(interpreter, source, offset, replace_count, insert)
#define CHARSET_TO_CHARSET(interp, source, new_charset, dest) ((CHARSET *)source->charset)->to_charset(interpreter, source, new_charset, dest)
#define CHARSET_TO_UNICODE(interp, source, dest) ((CHARSET *)source->charset)->to_unicode(interpreter, source, dest)
#define CHARSET_COMPOSE(interp, source) ((CHARSET *)source->charset)->compose(interpreter, source)
#define CHARSET_DECOMPOSE(interp, source) ((CHARSET *)source->charset)->decompose(interpreter, source)
#define CHARSET_UPCASE(interp, source) ((CHARSET *)source->charset)->upcase(interpreter, source)
#define CHARSET_DOWNCASE(interp, source) ((CHARSET *)source->charset)->downcase(interpreter, source)
#define CHARSET_TITLECASE(interp, source) ((CHARSET *)source->charset)->titlecase(interpreter, source)
#define CHARSET_UPCASE_FIRST(interp, source) ((CHARSET *)source->charset)->upcase_first(interpreter, source)
#define CHARSET_DOWNCASE_FIRST(interp, source) ((CHARSET *)source->charset)->downcase_first(interpreter, source)
#define CHARSET_TITLECASE_FIRST(interp, source) ((CHARSET *)source->charset)->titlecase_first(interpreter, source)
#define CHARSET_COMPARE(interp, lhs, rhs) ((CHARSET *)lhs->charset)->compare(interpreter, lhs, rhs)
#define CHARSET_INDEX(interp, source, search, offset) ((CHARSET *)source->charset)->index(interpreter, source, search, offset)
#define CHARSET_RINDEX(interp, source, search, offset) ((CHARSET *)source->charset)->rindex(interpreter, source, search, offset)
#define CHARSET_VALIDATE(interp, source, offset) ((CHARSET *)source->charset)->validate(interpreter, source)
#define CHARSET_IS_WORDCHAR(interp, source, offset) ((CHARSET *)source->charset)->is_wordchar(interpreter, source, offset)
#define CHARSET_FIND_WORDCHAR(interp, source, offset) ((CHARSET *)source->charset)->find_wordchar(interpreter, source, offset)
#define CHARSET_FIND_NOT_WORDCHAR(interp, source, offset) ((CHARSET *)source->charset)->find_not_wordchar(interpreter, source, offset)
#define CHARSET_IS_WHITESPACE(interp, source, offset) ((CHARSET *)source->charset)->is_whitespace(interpreter, source, offset)
#define CHARSET_FIND_WHITESPACE(interp, source, offset) ((CHARSET *)source->charset)->find_whitespace(interpreter, source, offset)
#define CHARSET_FIND_NOT_WHITESPACE(interp, source, offset) ((CHARSET *)source->charset)->find_not_whitespace(interpreter, source, offset)
#define CHARSET_IS_DIGIT(interp, source, offset) ((CHARSET *)source->charset)->is_digit(interpreter, source, offset)
#define CHARSET_FIND_DIGIT(interp, source, offset) ((CHARSET *)source->charset)->find_digit(interpreter, source, offset)
#define CHARSET_FIND_NOT_DIGIT(interp, source, offset) ((CHARSET *)source->charset)->find_not_digit(interpreter, source, offset)
#define CHARSET_IS_PUNCTUATION(interp, source, offset) ((CHARSET *)source->charset)->is_punctuation(interpreter, source, offset)
#define CHARSET_FIND_PUNCTUATION(interp, source, offset) ((CHARSET *)source->charset)->find_punctuation(interpreter, source, offset)
#define CHARSET_FIND_NOT_PUNCTUATION(interp, source, offset) ((CHARSET *)source->charset)->find_not_punctuation(interpreter, source, offset)
#define CHARSET_IS_NEWLINE(interp, source, offset) ((CHARSET *)source->charset)->is_newline(interpreter, source, offset)
#define CHARSET_FIND_NEWLINE(interp, source, offset) ((CHARSET *)source->charset)->find_newline(interpreter, source, offset)
#define CHARSET_FIND_NOT_NEWLINE(interp, source, offset) ((CHARSET *)source->charset)->find_not_newline(interpreter, source, offset)
#define CHARSET_FIND_WORD_BOUNDARY(interp, source, offset) ((CHARSET *)source->charset)->find_word_boundary(interpreter, source, offset)
#define CHARSET_COMPUTE_HASH(interp, source) ((CHARSET *)source->charset)->compute_hash(interpreter, source)
#define CHARSET_GET_PREFERRED_ENCODING(interp, source) ((CHARSET *)source->charset)->preferred_encoding

#define CHARSET_TO_ENCODING(interp, source, offset, count) ((ENCODING *)source->encoding)->to_encoding(interp, source, offset, count)
#define CHARSET_COPY_TO_ENCODING(interp, source) ((ENCODING *)source->encoding)->copy_to_encoding(interp, source)
#define CHARSET_GET_CODEPOINT(interp, source, offset) ((ENCODING *)source->encoding)->get_codepoint(interp, source, offset)
#define CHARSET_SET_CODEPOINT(interp, source, offset, codepoint) ((ENCODING *)source->encoding)->set_codepoint(interp, source, offset, codepoint)
#define CHARSET_GET_BYTE(interp, source, offset) ((ENCODING *)source->encoding)->get_byte(interp, source, offset)
#define CHARSET_SET_BYTE(interp, source, offset, value) ((ENCODING *)source->encoding)->set_byte(interp, source, offset, value)
#define CHARSET_GET_CODEPOINTS(interp, source, offset, count) ((ENCODING *)source->encoding)->get_codepoints(interp, source, offset, count)
#define CHARSET_GET_CODEPOINTS_INPLACE(interp, source, dest, offset, count) ((ENCODING *)source->encoding)->get_codepoints_inplace(interp, source, dest, offset, count)
#define CHARSET_GET_BYTES(interp, source, offset, count) ((ENCODING *)source->encoding)->get_bytes(interp, source, offset, count)
#define CHARSET_GET_BYTES_INPLACE(interp, source, offset, count, dest) ((ENCODING *)source->encoding)->get_bytes(interp, source, offset, count, dest)
#define CHARSET_SET_CODEPOINTS(interp, source, offset, count, newdata) ((ENCODING *)source->encoding)->set_codepoints(interp, source, offset, count, newdata)
#define CHARSET_SET_BYTES(interp, source, offset, count, newdata) ((ENCODING *)source->encoding)->set_bytes(interp, source, offset, count, newdata)
#define CHARSET_BECOME_ENCODING(interp, source) ((ENCODING *)source->encoding)->become_encoding(interp, source)
#define CHARSET_CODEPOINTS(interp, source) ((ENCODING *)source->encoding)->codepoints(interp, source)
#define CHARSET_BYTES(interp, source) ((ENCODING *)source->encoding)->bytes(interp, source)


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
