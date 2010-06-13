/*
Copyright (C) 2005-2010, Parrot Foundation.
$Id$

=head1 NAME

src/string/charset/unicode.c

=head1 DESCRIPTION

This file implements the charset functions for unicode data

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "unicode.h"
#include "ascii.h"
#include "tables.h"

/* HEADERIZER HFILE: src/string/charset/unicode.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static INTVAL compare(PARROT_INTERP,
    ARGIN(const STRING *lhs),
    ARGIN(const STRING *rhs))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CANNOT_RETURN_NULL
static STRING* compose(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static size_t compute_hash(PARROT_INTERP,
    ARGIN(const STRING *src),
    size_t seed)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL cs_rindex(PARROT_INTERP,
    SHIM(const STRING *src),
    SHIM(const STRING *search_string),
    SHIM(UINTVAL offset))
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
static STRING* decompose(PARROT_INTERP, SHIM(const STRING *src))
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
static STRING* downcase(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING* downcase_first(PARROT_INTERP, SHIM(const STRING *src))
        __attribute__nonnull__(1);

static INTVAL find_cclass(PARROT_INTERP,
    INTVAL flags,
    ARGIN(const STRING *src),
    UINTVAL offset,
    UINTVAL count)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

static INTVAL find_not_cclass(PARROT_INTERP,
    INTVAL flags,
    ARGIN(const STRING *src),
    UINTVAL offset,
    UINTVAL count)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_CANNOT_RETURN_NULL
static STRING * get_graphemes(PARROT_INTERP,
    ARGIN(const STRING *src),
    UINTVAL offset,
    UINTVAL count)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL is_cclass(PARROT_INTERP,
    INTVAL flags,
    ARGIN(const STRING *src),
    UINTVAL offset)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_CANNOT_RETURN_NULL
static STRING * string_from_codepoint(PARROT_INTERP, UINTVAL codepoint)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
static STRING* titlecase(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING* titlecase_first(PARROT_INTERP, SHIM(const STRING *src))
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
static STRING* to_charset(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static int u_iscclass(PARROT_INTERP, UINTVAL codepoint, INTVAL flags)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
static STRING* upcase(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING* upcase_first(PARROT_INTERP, SHIM(const STRING *src))
        __attribute__nonnull__(1);

static UINTVAL validate(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_compare __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(lhs) \
    , PARROT_ASSERT_ARG(rhs))
#define ASSERT_ARGS_compose __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_compute_hash __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cs_rindex __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_decompose __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_downcase __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_downcase_first __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_find_cclass __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_find_not_cclass __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_get_graphemes __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_is_cclass __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_string_from_codepoint __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_titlecase __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_titlecase_first __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_to_charset __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_u_iscclass __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_upcase __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_upcase_first __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_validate __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

#ifdef EXCEPTION
#  undef EXCEPTION
#endif

#if PARROT_HAS_ICU
#  include <unicode/ucnv.h>
#  include <unicode/utypes.h>
#  include <unicode/uchar.h>
#  include <unicode/ustring.h>
#  include <unicode/unorm.h>
#  include <../grapheme.h>
#endif
#define EXCEPTION(err, str) \
    Parrot_ex_throw_from_c_args(interp, NULL, (err), (str))

#define UNIMPL EXCEPTION(EXCEPTION_UNIMPLEMENTED, "unimplemented unicode")


/*

=item C<static STRING * get_graphemes(PARROT_INTERP, const STRING *src, UINTVAL
offset, UINTVAL count)>

Gets the graphemes from STRING C<src> starting at C<offset>. Gets
C<count> graphemes total.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING *
get_graphemes(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(get_graphemes)
    return ENCODING_GET_CODEPOINTS(interp, src, offset, count);
}


/*

=item C<static STRING* to_charset(PARROT_INTERP, const STRING *src)>

Converts input STRING C<src> to unicode STRING C<dest>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
to_charset(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(to_charset)
    const charset_converter_t conversion_func =
            Parrot_find_charset_converter(interp, src->charset,
                    Parrot_unicode_charset_ptr);

    if (conversion_func)
         return conversion_func(interp, src);

    return Parrot_utf8_encoding_ptr->to_encoding(interp, src);
}


/*

=item C<static STRING* compose(PARROT_INTERP, const STRING *src)>

If Parrot is built with ICU, composes the STRING C<src>. Attempts to
denormalize the STRING into the ICU default, NFC.

If Parrot does not have ICU included, throws an exception.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
compose(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(compose)
#if PARROT_HAS_ICU
    STRING *dest;
    int src_len, dest_len;
    UErrorCode err;
    /*
       U_STABLE int32_t U_EXPORT2
       unorm_normalize(const UChar *source, int32_t sourceLength,
       UNormalizationMode mode, int32_t options,
       UChar *result, int32_t resultLength,
       UErrorCode *status);
       */
    dest_len = src_len = src->strlen;
    dest     = Parrot_str_new_init(interp, NULL, src_len * sizeof (UChar),
            src->encoding, src->charset, 0);

    err      = U_ZERO_ERROR;
    dest_len = unorm_normalize((UChar *)src->strstart, src_len,
            UNORM_DEFAULT,      /* default is NFC */
            0,                  /* options 0 default - no specific icu
                                 * version */
            (UChar *)dest->strstart, dest_len, &err);

    dest->bufused = dest_len * sizeof (UChar);

    if (!U_SUCCESS(err)) {
        err = U_ZERO_ERROR;
        Parrot_gc_reallocate_string_storage(interp, dest, dest->bufused);
        dest_len = unorm_normalize((UChar *)src->strstart, src_len,
                UNORM_DEFAULT,      /* default is NFC */
                0,                  /* options 0 default - no specific
                                     * icu version */
                (UChar *)dest->strstart, dest_len, &err);
        PARROT_ASSERT(U_SUCCESS(err));
        dest->bufused = dest_len * sizeof (UChar);
    }
    dest->strlen = dest_len;
    return dest;
#else
    UNUSED(src);
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_LIBRARY_ERROR,
        "no ICU lib loaded");
#endif
}


/*

=item C<static STRING* decompose(PARROT_INTERP, const STRING *src)>

Decompose function for unicode charset. This function is not yet implemented.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
decompose(PARROT_INTERP, SHIM(const STRING *src))
{
    ASSERT_ARGS(decompose)
    /* TODO: https://trac.parrot.org/parrot/wiki/StringsTasklist Implement this. */
    UNIMPL;
}


/*

=item C<static STRING* upcase(PARROT_INTERP, const STRING *src)>

Converts the STRING C<src> to all upper-case graphemes, for those characters
which support upper-case versions.

Throws an exception if ICU is not installed.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
upcase(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(upcase)
#if PARROT_HAS_ICU
    UErrorCode err;
    int dest_len, src_len, needed;
    STRING *res;
#endif

    if (src->bufused  == src->strlen
            && src->encoding == Parrot_utf8_encoding_ptr) {
        return Parrot_ascii_charset_ptr->upcase(interp, src);
    }

#if PARROT_HAS_ICU
    /* to_encoding will allocate new string */
    res = Parrot_utf16_encoding_ptr->to_encoding(interp, src);
    /*
       U_CAPI int32_t U_EXPORT2
       u_strToUpper(UChar *dest, int32_t destCapacity,
       const UChar *src, int32_t srcLength,
       const char *locale,
       UErrorCode *pErrorCode);
       */
    err = U_ZERO_ERROR;

    /* use all available space - see below XXX */
    /* TODO downcase, titlecase too */
    dest_len = Buffer_buflen(res) / sizeof (UChar);
    src_len  = res->bufused       / sizeof (UChar);

    /*
     * XXX troubles:
     *   t/op/string_cs_45  upcase unicode:"\u01f0"
     *   this creates \u004a \u030c J+NON-SPACING HACEK
     *   the string needs resizing, *if* the src buffer is
     *   too short. *But* with icu 3.2/3.4 the src string is
     *   overwritten with partial result, despite the icu docs sayeth:
     *
     *      The source string and the destination buffer
     *      are allowed to overlap.
     *
     *  Workaround:  'preflighting' returns needed length
     *  Alternative: forget about inplace operation - create new result
     *
     *  TODO downcase, titlecase
     */
    needed = u_strToUpper(NULL, 0,
            (UChar *)res->strstart, src_len,
            NULL,       /* locale = default */
            &err);

    if (needed > dest_len) {
        Parrot_gc_reallocate_string_storage(interp, res, needed * sizeof (UChar));
        dest_len = needed;
    }

    err      = U_ZERO_ERROR;
    dest_len = u_strToUpper((UChar *)res->strstart, dest_len,
            (UChar *)res->strstart, src_len,
            NULL,       /* locale = default */
            &err);
    PARROT_ASSERT(U_SUCCESS(err));
    res->bufused = dest_len * sizeof (UChar);

    /* downgrade if possible */
    if (dest_len == (int)src->strlen)
        res->encoding = Parrot_ucs2_encoding_ptr;
    else {
        /* string is likely still ucs2 if it was earlier
         * but strlen changed due to combining char
         */
        res->strlen = dest_len;
    }

    return res;

#else
    UNUSED(src);
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_LIBRARY_ERROR,
        "no ICU lib loaded");
#endif
}


/*

=item C<static STRING* downcase(PARROT_INTERP, const STRING *src)>

Converts all graphemes to lower-case, for those graphemes which have cases.

Throws an exception if ICU is not installed.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
downcase(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(downcase)
#if PARROT_HAS_ICU
    UErrorCode err;
    int dest_len, src_len;
    STRING *res;
#endif

    if (src->bufused  == src->strlen
            && src->encoding == Parrot_utf8_encoding_ptr) {
        return Parrot_ascii_charset_ptr->downcase(interp, src);
    }

#if PARROT_HAS_ICU
    /* to_encoding will allocate new string */
    res = Parrot_utf16_encoding_ptr->to_encoding(interp, src);
    /*
U_CAPI int32_t U_EXPORT2
u_strToLower(UChar *dest, int32_t destCapacity,
             const UChar *src, int32_t srcLength,
             const char *locale,
             UErrorCode *pErrorCode);
     */
    err      = U_ZERO_ERROR;
    src_len  = res->bufused / sizeof (UChar);
    dest_len = u_strToLower((UChar *)res->strstart, src_len,
            (UChar *)res->strstart, src_len,
            NULL,       /* locale = default */
            &err);
    res->bufused = dest_len * sizeof (UChar);

    if (!U_SUCCESS(err)) {
        err = U_ZERO_ERROR;
        Parrot_gc_reallocate_string_storage(interp, res, res->bufused);
        dest_len = u_strToLower((UChar *)res->strstart, dest_len,
                (UChar *)res->strstart, src_len,
                NULL,       /* locale = default */
                &err);
        PARROT_ASSERT(U_SUCCESS(err));
    }

    /* downgrade if possible */
    if (dest_len == (int)res->strlen)
        res->encoding = Parrot_ucs2_encoding_ptr;

    return res;

#else
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_LIBRARY_ERROR,
        "no ICU lib loaded");
#endif
}


/*

=item C<static STRING* titlecase(PARROT_INTERP, const STRING *src)>

Converts the string to title case, for those characters which support cases.

Throws an exception if ICU is not installed.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
titlecase(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(titlecase)
#if PARROT_HAS_ICU

    UErrorCode err;
    int dest_len, src_len;
    STRING *res;

    if (src->bufused  == src->strlen
    &&  src->encoding == Parrot_utf8_encoding_ptr) {
        return Parrot_ascii_charset_ptr->titlecase(interp, src);
    }

    /* to_encoding will allocate new string */
    res = Parrot_utf16_encoding_ptr->to_encoding(interp, src);

    /*
U_CAPI int32_t U_EXPORT2
u_strToTitle(UChar *dest, int32_t destCapacity,
             const UChar *src, int32_t srcLength,
             UBreakIterator *titleIter,
             const char *locale,
             UErrorCode *pErrorCode);
     */

    err      = U_ZERO_ERROR;
    src_len  = res->bufused / sizeof (UChar);
    dest_len = u_strToTitle((UChar *)res->strstart, src_len,
            (UChar *)res->strstart, src_len,
            NULL,       /* default titleiter */
            NULL,       /* locale = default */
            &err);
    res->bufused = dest_len * sizeof (UChar);

    if (!U_SUCCESS(err)) {
        err = U_ZERO_ERROR;
        Parrot_gc_reallocate_string_storage(interp, res, res->bufused);
        dest_len = u_strToTitle((UChar *)res->strstart, dest_len,
                (UChar *)res->strstart, src_len,
                NULL, NULL,
                &err);
        PARROT_ASSERT(U_SUCCESS(err));
    }

    /* downgrade if possible */
    if (dest_len == (int)res->strlen)
        res->encoding = Parrot_ucs2_encoding_ptr;

    return res;

#else
    UNUSED(src);
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_LIBRARY_ERROR,
        "no ICU lib loaded");
#endif
}


/*

=item C<static STRING* upcase_first(PARROT_INTERP, const STRING *src)>

Converts the first grapheme in the STRING C<src> to uppercase, if the
grapheme supports it. Not implemented.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
upcase_first(PARROT_INTERP, SHIM(const STRING *src))
{
    ASSERT_ARGS(upcase_first)
    /* TODO: https://trac.parrot.org/parrot/wiki/StringsTasklist Implement this. */
    UNIMPL;
}


/*

=item C<static STRING* downcase_first(PARROT_INTERP, const STRING *src)>

Converts the first grapheme in the STRING C<src> to lower-case, if
the grapheme supports it. Not implemented

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
downcase_first(PARROT_INTERP, SHIM(const STRING *src))
{
    ASSERT_ARGS(downcase_first)
    /* TODO: https://trac.parrot.org/parrot/wiki/StringsTasklist Implement this. */
    UNIMPL;
}


/*

=item C<static STRING* titlecase_first(PARROT_INTERP, const STRING *src)>

Converts the first grapheme in STRING C<src> to title case, if the
string supports it. Not implemented.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
titlecase_first(PARROT_INTERP, SHIM(const STRING *src))
{
    ASSERT_ARGS(titlecase_first)
    /* TODO: https://trac.parrot.org/parrot/wiki/StringsTasklist Implement this. */
    UNIMPL;
}


/*

=item C<static INTVAL compare(PARROT_INTERP, const STRING *lhs, const STRING
*rhs)>

Compares two STRINGs, C<lhs> and C<rhs>. Returns -1 if C<lhs> < C<rhs>. Returns
0 if C<lhs> = C<rhs>. Returns 1 if C<lhs> > C<rhs>.

=cut

*/

static INTVAL
compare(PARROT_INTERP, ARGIN(const STRING *lhs), ARGIN(const STRING *rhs))
{
    ASSERT_ARGS(compare)
    String_iter l_iter, r_iter;
    UINTVAL offs, cl, cr, min_len, l_len, r_len;

    /* TODO make optimized equal - strings are equal length then already */
    ENCODING_ITER_INIT(interp, lhs, &l_iter);
    ENCODING_ITER_INIT(interp, rhs, &r_iter);

    l_len = lhs->strlen;
    r_len = rhs->strlen;

    min_len = l_len > r_len ? r_len : l_len;

    for (offs = 0; offs < min_len; ++offs) {
        cl = l_iter.get_and_advance(interp, &l_iter);
        cr = r_iter.get_and_advance(interp, &r_iter);

        if (cl != cr)
            return cl < cr ? -1 : 1;
    }

    if (l_len < r_len)
        return -1;

    if (l_len > r_len)
        return 1;

    return 0;
}


/*

=item C<static INTVAL cs_rindex(PARROT_INTERP, const STRING *src, const STRING
*search_string, UINTVAL offset)>

Finds the last index of substring C<search_string> in STRING C<src>,
starting from C<offset>. Not implemented.

=cut

*/

static INTVAL
cs_rindex(PARROT_INTERP, SHIM(const STRING *src),
        SHIM(const STRING *search_string), SHIM(UINTVAL offset))
{
    ASSERT_ARGS(cs_rindex)
    /* TODO: https://trac.parrot.org/parrot/wiki/StringsTasklist Implement this. */
    UNIMPL;
}


/*

=item C<static UINTVAL validate(PARROT_INTERP, const STRING *src)>

Returns 1 if the STRING C<src> is a valid unicode string, returns 0 otherwise.

=cut

*/

static UINTVAL
validate(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(validate)
    INTVAL      offset;
    String_iter iter;
    const INTVAL length = Parrot_str_length(interp, src);

    ENCODING_ITER_INIT(interp, src, &iter);
    for (offset = 0; offset < length; ++offset) {
        const UINTVAL codepoint = iter.get_and_advance(interp, &iter);
        /* Check for Unicode non-characters */
        if (codepoint >= 0xfdd0
        && (codepoint <= 0xfdef || (codepoint & 0xfffe) == 0xfffe)
        &&  codepoint <= 0x10ffff)
            return 0;
    }

    return 1;
}


/*

=item C<static int u_iscclass(PARROT_INTERP, UINTVAL codepoint, INTVAL flags)>

=cut

*/

static int
u_iscclass(PARROT_INTERP, UINTVAL codepoint, INTVAL flags)
{
    ASSERT_ARGS(u_iscclass)
#if PARROT_HAS_ICU
    UNUSED(interp);
            /* XXX which one
               return u_charDigitValue(codepoint);
               */
    if ((flags & enum_cclass_uppercase)    && u_isupper(codepoint))  return 1;
    if ((flags & enum_cclass_lowercase)    && u_islower(codepoint))  return 1;
    if ((flags & enum_cclass_alphabetic)   && u_isalpha(codepoint))  return 1;
    if ((flags & enum_cclass_numeric)      && u_isdigit(codepoint))  return 1;
    if ((flags & enum_cclass_hexadecimal)  && u_isxdigit(codepoint)) return 1;
    if ((flags & enum_cclass_whitespace)   && u_isspace(codepoint))  return 1;
    if ((flags & enum_cclass_printing)     && u_isprint(codepoint))  return 1;
    if ((flags & enum_cclass_graphical)    && u_isgraph(codepoint))  return 1;
    if ((flags & enum_cclass_blank)        && u_isblank(codepoint))  return 1;
    if ((flags & enum_cclass_control)      && u_iscntrl(codepoint))  return 1;
    if ((flags & enum_cclass_alphanumeric) && u_isalnum(codepoint))  return 1;
    if ((flags & enum_cclass_word)         &&
        (u_isalnum(codepoint) || codepoint == '_'))                  return 1;

    return 0;
#else
    if (codepoint < 256)
        return (Parrot_iso_8859_1_typetable[codepoint] & flags) ? 1 : 0;

    if (flags == enum_cclass_any)
        return 1;

    /* All codepoints from u+0100 to u+02af are alphabetic, so we
     * cheat on the WORD and ALPHABETIC properties to include these
     * (and incorrectly exclude all others).  This is a stopgap until
     * ICU is everywhere, or we have better non-ICU unicode support. */
    if (flags == enum_cclass_word || flags == enum_cclass_alphabetic)
        return (codepoint < 0x2b0);

    if (flags & enum_cclass_whitespace) {
        /* from http://www.unicode.org/Public/UNIDATA/PropList.txt */
        switch (codepoint) {
          case 0x1680: case 0x180e: case 0x2000: case 0x2001:
          case 0x2002: case 0x2003: case 0x2004: case 0x2005:
          case 0x2006: case 0x2007: case 0x2008: case 0x2009:
          case 0x200a: case 0x2028: case 0x2029: case 0x202f:
          case 0x205f: case 0x3000:
            return 1;
          default:
            break;
        }
    }

    if (flags & enum_cclass_numeric) {
        /* from http://www.unicode.org/Public/UNIDATA/UnicodeData.txt */
        if (codepoint >= 0x0660 && codepoint <= 0x0669) return 1;
        if (codepoint >= 0x06f0 && codepoint <= 0x06f9) return 1;
        if (codepoint >= 0x07c0 && codepoint <= 0x07c9) return 1;
        if (codepoint >= 0x0966 && codepoint <= 0x096f) return 1;
        if (codepoint >= 0x09e6 && codepoint <= 0x09ef) return 1;
        if (codepoint >= 0x0a66 && codepoint <= 0x0a6f) return 1;
        if (codepoint >= 0x0ae6 && codepoint <= 0x0aef) return 1;
        if (codepoint >= 0x0b66 && codepoint <= 0x0b6f) return 1;
        if (codepoint >= 0x0be6 && codepoint <= 0x0bef) return 1;
        if (codepoint >= 0x0c66 && codepoint <= 0x0c6f) return 1;
        if (codepoint >= 0x0ce6 && codepoint <= 0x0cef) return 1;
        if (codepoint >= 0x0d66 && codepoint <= 0x0d6f) return 1;
        if (codepoint >= 0x0e50 && codepoint <= 0x0e59) return 1;
        if (codepoint >= 0x0ed0 && codepoint <= 0x0ed9) return 1;
        if (codepoint >= 0x0f20 && codepoint <= 0x0f29) return 1;
        if (codepoint >= 0x1040 && codepoint <= 0x1049) return 1;
        if (codepoint >= 0x17e0 && codepoint <= 0x17e9) return 1;
        if (codepoint >= 0x1810 && codepoint <= 0x1819) return 1;
        if (codepoint >= 0x1946 && codepoint <= 0x194f) return 1;
        if (codepoint >= 0x19d0 && codepoint <= 0x19d9) return 1;
        if (codepoint >= 0x1b50 && codepoint <= 0x1b59) return 1;
        if (codepoint >= 0xff10 && codepoint <= 0xff19) return 1;
    }

    if (flags & ~(enum_cclass_whitespace | enum_cclass_numeric | enum_cclass_newline))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_LIBRARY_ERROR,
            "no ICU lib loaded");

    return 0;
#endif
}


/*

=item C<static INTVAL is_cclass(PARROT_INTERP, INTVAL flags, const STRING *src,
UINTVAL offset)>

=cut

*/

static INTVAL
is_cclass(PARROT_INTERP, INTVAL flags, ARGIN(const STRING *src), UINTVAL offset)
{
    ASSERT_ARGS(is_cclass)
    UINTVAL codepoint;

    if (offset >= src->strlen)
        return 0;

    codepoint = ENCODING_GET_CODEPOINT(interp, src, offset);

#if PARROT_HAS_ICU
    if (src->encoding == Parrot_nfg_encoding_ptr)
        codepoint = get_grapheme_base(interp, (grapheme_table *)src->extra,
                                      (int32_t) codepoint);
#endif /* PARROT_HAS_ICU */

    if (codepoint >= 256)
        return u_iscclass(interp, codepoint, flags) != 0;

    return (Parrot_iso_8859_1_typetable[codepoint] & flags) ? 1 : 0;
}


/*

=item C<static INTVAL find_cclass(PARROT_INTERP, INTVAL flags, const STRING
*src, UINTVAL offset, UINTVAL count)>

=cut

*/

static INTVAL
find_cclass(PARROT_INTERP, INTVAL flags, ARGIN(const STRING *src), UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(find_cclass)
    String_iter iter;
    UINTVAL     codepoint;
    UINTVAL     pos = offset;
    UINTVAL     end = offset + count;

    ENCODING_ITER_INIT(interp, src, &iter);

    iter.set_position(interp, &iter, pos);

    end = src->strlen < end ? src->strlen : end;

    for (; pos < end; ++pos) {
        codepoint = iter.get_and_advance(interp, &iter);
#if PARROT_HAS_ICU
        if (src->encoding == Parrot_nfg_encoding_ptr)
            codepoint = get_grapheme_base(interp, (grapheme_table *)src->extra,
                                          (int32_t) codepoint);
#endif /* PARROT_HAS_ICU */

        if (codepoint >= 256) {
            if (u_iscclass(interp, codepoint, flags))
                    return pos;
        }
        else {
            if (Parrot_iso_8859_1_typetable[codepoint] & flags)
                return pos;
        }
    }

    return end;
}


/*

=item C<static INTVAL find_not_cclass(PARROT_INTERP, INTVAL flags, const STRING
*src, UINTVAL offset, UINTVAL count)>

=cut

*/

static INTVAL
find_not_cclass(PARROT_INTERP, INTVAL flags, ARGIN(const STRING *src),
        UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(find_not_cclass)
    String_iter iter;
    UINTVAL     codepoint;
    UINTVAL     pos = offset;
    UINTVAL     end = offset + count;
    int         bit;

    if (pos > src->strlen) {
        /* XXX: Throw in this case? */
        return offset + count;
    }

    ENCODING_ITER_INIT(interp, src, &iter);

    if (pos)
        iter.set_position(interp, &iter, pos);

    end = src->strlen < end ? src->strlen : end;

    if (flags == enum_cclass_any)
        return end;

    for (; pos < end; ++pos) {
        codepoint = iter.get_and_advance(interp, &iter);
#if PARROT_HAS_ICU
        if (src->encoding == Parrot_nfg_encoding_ptr)
            codepoint = get_grapheme_base(interp, (grapheme_table *)src->extra,
                                          (int32_t) codepoint);
#endif /* PARROT_HAS_ICU */
        if (codepoint >= 256) {
            for (bit = enum_cclass_uppercase;
                    bit <= enum_cclass_word ; bit <<= 1) {
                if ((bit & flags) && !u_iscclass(interp, codepoint, bit))
                    return pos;
            }
        }
        else {
            if (!(Parrot_iso_8859_1_typetable[codepoint] & flags))
                return pos;
        }
    }

    return end;
}


/*

=item C<static STRING * string_from_codepoint(PARROT_INTERP, UINTVAL codepoint)>

Returns a one-codepoint string for the given codepoint.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING *
string_from_codepoint(PARROT_INTERP, UINTVAL codepoint)
{
    ASSERT_ARGS(string_from_codepoint)
    String_iter    iter;
    STRING * const dest = string_make(interp, "", 1, "unicode", 0);

    dest->strlen = 1;

    ENCODING_ITER_INIT(interp, dest, &iter);
    iter.set_and_advance(interp, &iter, codepoint);
    dest->bufused = iter.bytepos;

    return dest;
}


/*

=item C<static size_t compute_hash(PARROT_INTERP, const STRING *src, size_t
seed)>

Computes the hash of the given STRING C<src> with starting seed value C<seed>.

=cut

*/

static size_t
compute_hash(PARROT_INTERP, ARGIN(const STRING *src), size_t seed)
{
    ASSERT_ARGS(compute_hash)
    String_iter iter;
    UINTVAL     offs;
    size_t      hashval = seed;

    ENCODING_ITER_INIT(interp, src, &iter);

    for (offs = 0; offs < src->strlen; ++offs) {
        const UINTVAL c = iter.get_and_advance(interp, &iter);
        hashval += hashval << 5;
        hashval += c;
    }

    return hashval;
}


/*

=item C<void Parrot_charset_unicode_init(PARROT_INTERP)>

Initializes the Unicode charset by installing all the necessary function
pointers.

=cut

*/

void
Parrot_charset_unicode_init(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_charset_unicode_init)
    CHARSET * const      return_set = Parrot_new_charset(interp);
    static const CHARSET base_set   = {
        "unicode",
        get_graphemes,
        to_charset,
        compose,
        decompose,
        upcase,
        downcase,
        titlecase,
        upcase_first,
        downcase_first,
        titlecase_first,
        compare,
        mixed_cs_index,
        cs_rindex,
        validate,
        is_cclass,
        find_cclass,
        find_not_cclass,
        string_from_codepoint,
        compute_hash,
        NULL
    };

    STRUCT_COPY_FROM_STRUCT(return_set, base_set);

    /*
     * for now use utf8
     * TODO replace it with a fixed uint_16 or uint_32 encoding
     *      XXX if this is changed, modify string_make so it
     *          still takes "utf8" when fed "unicode" as charset!
     */
    return_set->preferred_encoding = Parrot_utf8_encoding_ptr;
    Parrot_register_charset(interp, "unicode", return_set);

    return;
}


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
