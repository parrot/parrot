/* charset.h
 *  Copyright (C) 2004-2010, Parrot Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This is the header for the 8-bit fixed-width encoding
 */

#ifndef PARROT_CHARSET_H_GUARD
#define PARROT_CHARSET_H_GUARD


#include "parrot/encoding.h"
#include "parrot/cclass.h"

struct _charset;
typedef struct _charset CHARSET;


#if !defined PARROT_NO_EXTERN_CHARSET_PTRS
PARROT_DATA CHARSET *Parrot_iso_8859_1_charset_ptr;
PARROT_DATA CHARSET *Parrot_binary_charset_ptr;
PARROT_DATA CHARSET *Parrot_default_charset_ptr;
PARROT_DATA CHARSET *Parrot_unicode_charset_ptr;
PARROT_DATA CHARSET *Parrot_ascii_charset_ptr;
#endif

#define PARROT_DEFAULT_CHARSET Parrot_ascii_charset_ptr
#define PARROT_BINARY_CHARSET Parrot_binary_charset_ptr
#define PARROT_UNICODE_CHARSET Parrot_unicode_charset_ptr

typedef STRING * (*charset_get_graphemes_t)(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset, UINTVAL count);
typedef STRING * (*charset_to_charset_t)(PARROT_INTERP, ARGIN(const STRING *src));
typedef STRING * (*charset_from_unicode_t)(PARROT_INTERP, ARGIN(const STRING *src));
typedef STRING * (*charset_compose_t)(PARROT_INTERP, ARGIN(const STRING *src));
typedef STRING * (*charset_decompose_t)(PARROT_INTERP, ARGIN(const STRING *src));
typedef STRING * (*charset_upcase_t)(PARROT_INTERP, ARGIN(const STRING *src));
typedef STRING * (*charset_downcase_t)(PARROT_INTERP, ARGIN(const STRING *src));
typedef STRING * (*charset_titlecase_t)(PARROT_INTERP, ARGIN(const STRING *src));
typedef STRING * (*charset_upcase_first_t)(PARROT_INTERP, ARGIN(const STRING *src));
typedef STRING * (*charset_downcase_first_t)(PARROT_INTERP, ARGIN(const STRING *src));
typedef STRING * (*charset_titlecase_first_t)(PARROT_INTERP, ARGIN(const STRING *src));
typedef INTVAL   (*charset_compare_t)(PARROT_INTERP, ARGIN(const STRING *lhs), ARGIN(const STRING *rhs));
typedef INTVAL   (*charset_index_t)(PARROT_INTERP, ARGIN(const STRING *src), ARGIN(const STRING *search_string), UINTVAL offset);
typedef INTVAL   (*charset_rindex_t)(PARROT_INTERP, ARGIN(const STRING *src), ARGIN(const STRING *search_string), UINTVAL offset);
typedef UINTVAL  (*charset_validate_t)(PARROT_INTERP, ARGIN(const STRING *src));
typedef INTVAL   (*charset_is_cclass_t)(PARROT_INTERP, INTVAL, ARGIN(const STRING *src), UINTVAL offset);
typedef INTVAL   (*charset_find_cclass_t)(PARROT_INTERP, INTVAL, ARGIN(const STRING *src), UINTVAL offset, UINTVAL count);
typedef INTVAL   (*charset_find_not_cclass_t)(PARROT_INTERP, INTVAL, ARGIN(const STRING *src), UINTVAL offset, UINTVAL count);
typedef INTVAL   (*charset_is_wordchar_t)(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset);
typedef INTVAL   (*charset_find_wordchar_t)(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset);
typedef INTVAL   (*charset_find_not_wordchar_t)(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset);
typedef INTVAL   (*charset_is_whitespace_t)(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset);
typedef INTVAL   (*charset_find_whitespace_t)(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset);
typedef INTVAL   (*charset_find_not_whitespace_t)(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset);
typedef INTVAL   (*charset_is_digit_t)(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset);
typedef INTVAL   (*charset_find_digit_t)(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset);
typedef INTVAL   (*charset_find_not_digit_t)(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset);
typedef INTVAL   (*charset_is_punctuation_t)(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset);
typedef INTVAL   (*charset_find_punctuation_t)(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset);
typedef INTVAL   (*charset_find_not_punctuation_t)(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset);
typedef INTVAL   (*charset_is_newline_t)(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset);
typedef INTVAL   (*charset_find_newline_t)(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset);
typedef INTVAL   (*charset_find_not_newline_t)(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset);
typedef INTVAL   (*charset_find_word_boundary_t)(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset);
typedef STRING * (*charset_string_from_codepoint_t)(PARROT_INTERP, UINTVAL codepoint);
typedef size_t   (*charset_compute_hash_t)(PARROT_INTERP, ARGIN(const STRING *src), size_t seed);

typedef STRING * (*charset_converter_t)(PARROT_INTERP, ARGIN(const STRING *src));

/* HEADERIZER BEGIN: src/string/charset.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
const char * Parrot_charset_c_name(SHIM_INTERP, INTVAL number_of_charset);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING * Parrot_charset_name(SHIM_INTERP, INTVAL number_of_charset);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_charset_number(PARROT_INTERP,
    ARGIN(const STRING *charsetname))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_charset_number_of_str(SHIM_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_charsets_encodings_deinit(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_charsets_encodings_init(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const CHARSET * Parrot_default_charset(SHIM_INTERP);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
const CHARSET * Parrot_find_charset(SHIM_INTERP,
    ARGIN(const char *charsetname))
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
charset_converter_t Parrot_find_charset_converter(SHIM_INTERP,
    ARGIN(const CHARSET *lhs),
    ARGIN(const CHARSET *rhs))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
const CHARSET * Parrot_get_charset(SHIM_INTERP, INTVAL number_of_charset);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
const CHARSET * Parrot_load_charset(PARROT_INTERP,
    ARGIN(const char *charsetname))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
INTVAL Parrot_make_default_charset(SHIM_INTERP,
    SHIM(const char *charsetname),
    ARGIN(const CHARSET *charset))
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
CHARSET * Parrot_new_charset(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
INTVAL Parrot_register_charset(PARROT_INTERP,
    ARGIN(const char *charsetname),
    ARGIN(CHARSET *charset))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
void Parrot_register_charset_converter(PARROT_INTERP,
    ARGIN(const CHARSET *lhs),
    ARGIN(const CHARSET *rhs),
    ARGIN(charset_converter_t func))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

#define ASSERT_ARGS_Parrot_charset_c_name __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_charset_name __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_charset_number __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(charsetname))
#define ASSERT_ARGS_Parrot_charset_number_of_str __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_Parrot_charsets_encodings_deinit \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_charsets_encodings_init \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_default_charset __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_find_charset __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(charsetname))
#define ASSERT_ARGS_Parrot_find_charset_converter __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lhs) \
    , PARROT_ASSERT_ARG(rhs))
#define ASSERT_ARGS_Parrot_get_charset __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_load_charset __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(charsetname))
#define ASSERT_ARGS_Parrot_make_default_charset __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(charset))
#define ASSERT_ARGS_Parrot_new_charset __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_register_charset __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(charsetname) \
    , PARROT_ASSERT_ARG(charset))
#define ASSERT_ARGS_Parrot_register_charset_converter \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(lhs) \
    , PARROT_ASSERT_ARG(rhs) \
    , PARROT_ASSERT_ARG(func))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/string/charset.c */

struct _charset {
    const char *name;
    charset_get_graphemes_t get_graphemes;
    charset_to_charset_t to_charset;
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
    charset_is_cclass_t is_cclass;
    charset_find_cclass_t find_cclass;
    charset_find_not_cclass_t find_not_cclass;
    charset_string_from_codepoint_t string_from_codepoint;
    charset_compute_hash_t compute_hash;
    const ENCODING *preferred_encoding;
};

#define CHARSET_GET_GRAPEMES(interp, source, offset, count) ((source)->charset)->get_graphemes((interp), (source), (offset), (count))
#define CHARSET_TO_UNICODE(interp, source, dest) ((source)->charset)->to_unicode((interp), (source), (dest))
#define CHARSET_COMPOSE(interp, source) ((source)->charset)->compose((interp), (source))
#define CHARSET_DECOMPOSE(interp, source) ((source)->charset)->decompose((interp), (source))
#define CHARSET_UPCASE(interp, source) ((source)->charset)->upcase((interp), (source))
#define CHARSET_DOWNCASE(interp, source) ((source)->charset)->downcase((interp), (source))
#define CHARSET_TITLECASE(interp, source) ((source)->charset)->titlecase((interp), (source))
#define CHARSET_UPCASE_FIRST(interp, source) ((source)->charset)->upcase_first((interp), (source))
#define CHARSET_DOWNCASE_FIRST(interp, source) ((source)->charset)->downcase_first((interp), (source))
#define CHARSET_TITLECASE_FIRST(interp, source) ((source)->charset)->titlecase_first((interp), (source))
#define CHARSET_COMPARE(interp, lhs, rhs) ((const CHARSET *)(lhs)->charset)->compare((interp), (lhs), (rhs))
#define CHARSET_INDEX(interp, source, search, offset) ((source)->charset)->index((interp), (source), (search), (offset))
#define CHARSET_RINDEX(interp, source, search, offset) ((source)->charset)->rindex((interp), (source), (search), (offset))
#define CHARSET_VALIDATE(interp, source) ((source)->charset)->validate((interp), (source))
#define CHARSET_IS_CCLASS(interp, flags, source, offset) ((source)->charset)->is_cclass((interp), (flags), (source), (offset))
#define CHARSET_FIND_CCLASS(interp, flags, source, offset, count) ((source)->charset)->find_cclass((interp), (flags), (source), (offset), (count))
#define CHARSET_FIND_NOT_CCLASS(interp, flags, source, offset, count) ((source)->charset)->find_not_cclass((interp), (flags), (source), (offset), (count))
#define CHARSET_COMPUTE_HASH(interp, source, seed) ((source)->charset)->compute_hash((interp), (source), (seed))
#define CHARSET_GET_PREFERRED_ENCODING(interp, source) ((source)->charset)->preferred_encoding

#define CHARSET_TO_ENCODING(interp, source) ((source)->encoding)->to_encoding((interp), (source))
#define CHARSET_COPY_TO_ENCODING(interp, source) ((source)->encoding)->copy_to_encoding((interp), (source))
#define CHARSET_GET_CODEPOINT(interp, source, offset) ((source)->encoding)->get_codepoint((interp), (source), (offset))
#define CHARSET_GET_BYTE(interp, source, offset) ((source)->encoding)->get_byte((interp), (source), (offset))
#define CHARSET_SET_BYTE(interp, source, offset, value) ((source)->encoding)->set_byte((interp), (source), (offset), (value))
#define CHARSET_GET_CODEPOINTS(interp, source, offset, count) ((source)->encoding)->get_codepoints((interp), (source), (offset), (count))
#define CHARSET_GET_BYTES(interp, source, offset, count) ((source)->encoding)->get_bytes((interp), (source), (offset), (count))
#define CHARSET_CODEPOINTS(interp, source) ((source)->encoding)->codepoints((interp), (source))
#define CHARSET_BYTES(interp, source) ((source)->encoding)->bytes((interp), (source))


#endif /* PARROT_CHARSET_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
