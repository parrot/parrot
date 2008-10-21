/*
Copyright (C) 2005-2008, The Perl Foundation.
$Id$

=head1 NAME

src/charset/unicode.c

=head1 DESCRIPTION

This file implements the charset functions for unicode data

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "unicode.h"
#include "ascii.h"
#include "tables.h"

/* HEADERIZER HFILE: src/charset/unicode.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static INTVAL compare(PARROT_INTERP,
    ARGIN(const STRING *lhs),
    ARGIN(const STRING *rhs))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CANNOT_RETURN_NULL
static STRING* compose(PARROT_INTERP, ARGIN(STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static size_t compute_hash(PARROT_INTERP,
    ARGIN(const STRING *src),
    size_t seed)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL cs_rindex(PARROT_INTERP,
    SHIM(STRING *source_string),
    SHIM(STRING *search_string),
    UINTVAL offset)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
static STRING* decompose(PARROT_INTERP, SHIM(STRING *src))
        __attribute__nonnull__(1);

static void downcase(PARROT_INTERP, ARGIN(STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void downcase_first(PARROT_INTERP, SHIM(STRING *source_string))
        __attribute__nonnull__(1);

static INTVAL find_cclass(PARROT_INTERP,
    INTVAL flags,
    ARGIN(STRING *source_string),
    UINTVAL offset,
    UINTVAL count)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

static INTVAL find_not_cclass(PARROT_INTERP,
    INTVAL flags,
    ARGIN(STRING *source_string),
    UINTVAL offset,
    UINTVAL count)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_CANNOT_RETURN_NULL
static STRING * get_graphemes(PARROT_INTERP,
    ARGIN(STRING *source_string),
    UINTVAL offset,
    UINTVAL count)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING * get_graphemes_inplace(PARROT_INTERP,
    ARGIN(STRING *source_string),
    UINTVAL offset,
    UINTVAL count,
    ARGMOD(STRING *dest_string))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*dest_string);

static INTVAL is_cclass(PARROT_INTERP,
    INTVAL flags,
    ARGIN(const STRING *source_string),
    UINTVAL offset)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

static void set_graphemes(PARROT_INTERP,
    ARGIN(STRING *source_string),
    UINTVAL offset,
    UINTVAL replace_count,
    ARGMOD(STRING *insert_string))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*insert_string);

PARROT_CANNOT_RETURN_NULL
static STRING * string_from_codepoint(PARROT_INTERP, UINTVAL codepoint)
        __attribute__nonnull__(1);

static void titlecase(PARROT_INTERP, ARGIN(STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void titlecase_first(PARROT_INTERP, SHIM(STRING *source_string))
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
static STRING* to_charset(PARROT_INTERP,
    ARGIN(STRING *src),
    ARGIN_NULLOK(STRING *dest))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static int u_iscclass(PARROT_INTERP, UINTVAL codepoint, INTVAL flags)
        __attribute__nonnull__(1);

static void upcase(PARROT_INTERP, ARGIN(STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void upcase_first(PARROT_INTERP, SHIM(STRING *source_string))
        __attribute__nonnull__(1);

static UINTVAL validate(PARROT_INTERP, ARGIN(STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

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
#endif
#define EXCEPTION(err, str) \
    Parrot_ex_throw_from_c_args(interp, NULL, (err), (str))

#define UNIMPL EXCEPTION(EXCEPTION_UNIMPLEMENTED, "unimplemented unicode")

/*

=item C<static void set_graphemes>

Sets C<replace_count> graphemes in STRING C<source_string> starting at offset
C<offset>.  Gets the graphemes to be replaced from STRING C<insert_string>.

=cut

*/

static void
set_graphemes(PARROT_INTERP, ARGIN(STRING *source_string),
        UINTVAL offset, UINTVAL replace_count, ARGMOD(STRING *insert_string))
{
    ENCODING_SET_CODEPOINTS(interp, source_string, offset,
            replace_count, insert_string);
}


/*

=item C<static STRING * get_graphemes>

Gets the graphemes from STRING C<source_string> starting at C<offset>. Gets
C<count> graphemes total.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING *
get_graphemes(PARROT_INTERP, ARGIN(STRING *source_string),
        UINTVAL offset, UINTVAL count)
{
    return ENCODING_GET_CODEPOINTS(interp, source_string, offset, count);
}


/*

=item C<static STRING * get_graphemes_inplace>

Gets C<count> graphemes in place from STRING C<source_string> starting at
offset C<offset>. Puts them into STRING C<dest_string>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING *
get_graphemes_inplace(PARROT_INTERP, ARGIN(STRING *source_string),
        UINTVAL offset, UINTVAL count, ARGMOD(STRING *dest_string))
{
    return ENCODING_GET_CODEPOINTS_INPLACE(interp, source_string,
            offset, count, dest_string);
}


/*

=item C<static STRING* to_charset>

Converts input STRING C<src> to unicode STRING C<dest>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
to_charset(PARROT_INTERP, ARGIN(STRING *src), ARGIN_NULLOK(STRING *dest))
{
    const charset_converter_t conversion_func =
            Parrot_find_charset_converter(interp, src->charset,
                    Parrot_unicode_charset_ptr);

    if (conversion_func)
         return conversion_func(interp, src, dest);

    return Parrot_utf8_encoding_ptr->to_encoding(interp, src, dest);
}


/*

=item C<static STRING* compose>

If Parrot is built with ICU, composes the STRING C<src>. Attempts to
denormalize the STRING into the ICU default, NFC.

If Parrot does not have ICU included, throws an exception.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
compose(PARROT_INTERP, ARGIN(STRING *src))
{
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
    dest     = string_make_direct(interp, NULL, src_len * sizeof (UChar),
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
        Parrot_reallocate_string(interp, dest, dest->bufused);
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

=item C<static STRING* decompose>

Decompose function for unicode charset. This function is not yet implemented.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
decompose(PARROT_INTERP, SHIM(STRING *src))
{
    /* TODO: RT #59696 Implement this. */
    UNIMPL;
}


/*

=item C<static void upcase>

Converts the STRING C<src> to all upper-case graphemes, for those characters
which support upper-case versions.

Throws an exception if ICU is not installed.

=cut

*/

static void
upcase(PARROT_INTERP, ARGIN(STRING *src))
{
#if PARROT_HAS_ICU

    UErrorCode err;
    int dest_len, src_len, needed;

    if (src->bufused  == src->strlen
    &&  src->encoding == Parrot_utf8_encoding_ptr) {
        Parrot_ascii_charset_ptr->upcase(interp, src);
        return;
    }

    src = Parrot_utf16_encoding_ptr->to_encoding(interp, src, NULL);
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
    dest_len = PObj_buflen(src) / sizeof (UChar);
    src_len  = src->bufused     / sizeof (UChar);

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
            (UChar *)src->strstart, src_len,
            NULL,       /* locale = default */
            &err);

    if (needed > dest_len) {
        Parrot_reallocate_string(interp, src, needed * sizeof (UChar));
        dest_len = needed;
    }

    err      = U_ZERO_ERROR;
    dest_len = u_strToUpper((UChar *)src->strstart, dest_len,
            (UChar *)src->strstart, src_len,
            NULL,       /* locale = default */
            &err);
    PARROT_ASSERT(U_SUCCESS(err));
    src->bufused = dest_len * sizeof (UChar);

    /* downgrade if possible */
    if (dest_len == (int)src->strlen)
        src->encoding = Parrot_ucs2_encoding_ptr;
    else {
        /* string is likely still ucs2 if it was earlier
         * but strlen changed due to combining char
         */
        src->strlen = dest_len;
    }

#else
    UNUSED(src);
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_LIBRARY_ERROR,
        "no ICU lib loaded");
#endif
}


/*

=item C<static void downcase>

Converts all graphemes to lower-case, for those graphemes which have cases.

Throws an exception if ICU is not installed.

=cut

*/

static void
downcase(PARROT_INTERP, ARGIN(STRING *src))
{
    if (src->bufused  == src->strlen
    &&  src->encoding == Parrot_utf8_encoding_ptr) {
        Parrot_ascii_charset_ptr->downcase(interp, src);
        return;
    }
    else {
#if PARROT_HAS_ICU

    UErrorCode err;
    int dest_len, src_len;

    src = Parrot_utf16_encoding_ptr->to_encoding(interp, src, NULL);
    /*
U_CAPI int32_t U_EXPORT2
u_strToLower(UChar *dest, int32_t destCapacity,
             const UChar *src, int32_t srcLength,
             const char *locale,
             UErrorCode *pErrorCode);
     */
    err      = U_ZERO_ERROR;
    src_len  = src->bufused / sizeof (UChar);
    dest_len = u_strToLower((UChar *)src->strstart, src_len,
            (UChar *)src->strstart, src_len,
            NULL,       /* locale = default */
            &err);
    src->bufused = dest_len * sizeof (UChar);

    if (!U_SUCCESS(err)) {
        err = U_ZERO_ERROR;
        Parrot_reallocate_string(interp, src, src->bufused);
        dest_len = u_strToLower((UChar *)src->strstart, dest_len,
                (UChar *)src->strstart, src_len,
                NULL,       /* locale = default */
                &err);
        PARROT_ASSERT(U_SUCCESS(err));
    }

    /* downgrade if possible */
    if (dest_len == (int)src->strlen)
        src->encoding = Parrot_ucs2_encoding_ptr;
#else
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_LIBRARY_ERROR,
        "no ICU lib loaded");
#endif
    }
}


/*

=item C<static void titlecase>

Converts the string to title case, for those characters which support cases.

Throws an exception if ICU is not installed.

=cut

*/

static void
titlecase(PARROT_INTERP, ARGIN(STRING *src))
{
#if PARROT_HAS_ICU

    UErrorCode err;
    int dest_len, src_len;

    if (src->bufused  == src->strlen
    &&  src->encoding == Parrot_utf8_encoding_ptr) {
        Parrot_ascii_charset_ptr->titlecase(interp, src);
        return;
    }

    src = Parrot_utf16_encoding_ptr->to_encoding(interp, src, NULL);

    /*
U_CAPI int32_t U_EXPORT2
u_strToTitle(UChar *dest, int32_t destCapacity,
             const UChar *src, int32_t srcLength,
             UBreakIterator *titleIter,
             const char *locale,
             UErrorCode *pErrorCode);
     */

    err      = U_ZERO_ERROR;
    src_len  = src->bufused / sizeof (UChar);
    dest_len = u_strToTitle((UChar *)src->strstart, src_len,
            (UChar *)src->strstart, src_len,
            NULL,       /* default titleiter */
            NULL,       /* locale = default */
            &err);
    src->bufused = dest_len * sizeof (UChar);

    if (!U_SUCCESS(err)) {
        err = U_ZERO_ERROR;
        Parrot_reallocate_string(interp, src, src->bufused);
        dest_len = u_strToTitle((UChar *)src->strstart, dest_len,
                (UChar *)src->strstart, src_len,
                NULL, NULL,
                &err);
        PARROT_ASSERT(U_SUCCESS(err));
    }

    /* downgrade if possible */
    if (dest_len == (int)src->strlen)
        src->encoding = Parrot_ucs2_encoding_ptr;
#else
    UNUSED(src);
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_LIBRARY_ERROR,
        "no ICU lib loaded");
#endif
}


/*

=item C<static void upcase_first>

Converts the first grapheme in the STRING C<source_string> to uppercase, if the
grapheme supports it. Not implemented.

=cut

*/

static void
upcase_first(PARROT_INTERP, SHIM(STRING *source_string))
{
    /* TODO: RT #59696 Implement this. */
    UNIMPL;
}


/*

=item C<static void downcase_first>

Converts the first grapheme in the STRING C<source_string> to lower-case, if
the grapheme supports it. Not implemented

=cut

*/

static void
downcase_first(PARROT_INTERP, SHIM(STRING *source_string))
{
    /* TODO: RT #59696 Implement this. */
    UNIMPL;
}


/*

=item C<static void titlecase_first>

Converts the first grapheme in STRING C<source_string> to title case, if the
string supports it. Not implemented.

=cut

*/

static void
titlecase_first(PARROT_INTERP, SHIM(STRING *source_string))
{
    /* TODO: RT #59696 Implement this. */
    UNIMPL;
}


/*

=item C<static INTVAL compare>

Compares two STRINGs, C<lhs> and C<rhs>. Returns -1 if C<lhs> < C<rhs>. Returns
0 if C<lhs> = C<rhs>. Returns 1 if C<lhs> > C<rhs>.

=cut

*/

static INTVAL
compare(PARROT_INTERP, ARGIN(const STRING *lhs), ARGIN(const STRING *rhs))
{
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

=item C<static INTVAL cs_rindex>

Finds the last index of substring C<search_string> in STRING C<source_string>,
starting from C<offset>. Not implemented.

=cut

*/

static INTVAL
cs_rindex(PARROT_INTERP, SHIM(STRING *source_string),
        SHIM(STRING *search_string), UINTVAL offset)
{
    /* TODO: RT #59696 Implement this. */
    UNIMPL;
}


/*

=item C<static UINTVAL validate>

Returns 1 if the STRING C<src> is a valid unicode string, returns 0 otherwise.

=cut

*/

static UINTVAL
validate(PARROT_INTERP, ARGIN(STRING *src))
{
    UINTVAL     offset;
    String_iter iter;

    ENCODING_ITER_INIT(interp, src, &iter);
    for (offset = 0; offset < string_length(interp, src); ++offset) {
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

=item C<static int u_iscclass>

RT #48260: Not yet documented!!!

=cut

*/

static int
u_iscclass(PARROT_INTERP, UINTVAL codepoint, INTVAL flags)
{
#if PARROT_HAS_ICU
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

    if (flags & enum_cclass_whitespace) {
        /* from http://www.unicode.org/Public/UNIDATA/PropList.txt */
        switch (codepoint) {
            case 0x1680: case 0x180e: case 0x2000: case 0x2001:
            case 0x2002: case 0x2003: case 0x2004: case 0x2005:
            case 0x2006: case 0x2007: case 0x2008: case 0x2009:
            case 0x200a: case 0x202f: case 0x205f: case 0x3000:
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

=item C<static INTVAL is_cclass>

RT #48260: Not yet documented!!!

=cut

*/

static INTVAL
is_cclass(PARROT_INTERP, INTVAL flags,
          ARGIN(const STRING *source_string), UINTVAL offset)
{
    UINTVAL codepoint;

    if (offset >= source_string->strlen)
        return 0;

    codepoint = ENCODING_GET_CODEPOINT(interp, source_string, offset);

    if (codepoint >= 256)
        return u_iscclass(interp, codepoint, flags) != 0;

    return (Parrot_iso_8859_1_typetable[codepoint] & flags) ? 1 : 0;
}


/*

=item C<static INTVAL find_cclass>

RT #48260: Not yet documented!!!

=cut

*/

static INTVAL
find_cclass(PARROT_INTERP, INTVAL flags,
            ARGIN(STRING *source_string), UINTVAL offset, UINTVAL count)
{
    String_iter iter;
    UINTVAL     codepoint;
    UINTVAL     pos = offset;
    UINTVAL     end = offset + count;

    PARROT_ASSERT(source_string != 0);
    ENCODING_ITER_INIT(interp, source_string, &iter);

    iter.set_position(interp, &iter, pos);

    end = source_string->strlen < end ? source_string->strlen : end;

    for (; pos < end; ++pos) {
        codepoint = iter.get_and_advance(interp, &iter);
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

=item C<static INTVAL find_not_cclass>

RT #48260: Not yet documented!!!

=cut

*/

static INTVAL
find_not_cclass(PARROT_INTERP, INTVAL flags,
                ARGIN(STRING *source_string), UINTVAL offset, UINTVAL count)
{
    String_iter iter;
    UINTVAL     codepoint;
    UINTVAL     pos = offset;
    UINTVAL     end = offset + count;
    int         bit;

    PARROT_ASSERT(source_string);
    ENCODING_ITER_INIT(interp, source_string, &iter);

    if (pos)
        iter.set_position(interp, &iter, pos);

    end = source_string->strlen < end ? source_string->strlen : end;

    if (flags == enum_cclass_any)
        return end;

    for (; pos < end; ++pos) {
        codepoint = iter.get_and_advance(interp, &iter);
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

=item C<static STRING * string_from_codepoint>

Returns a one-codepoint string for the given codepoint.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING *
string_from_codepoint(PARROT_INTERP, UINTVAL codepoint)
{
    String_iter    iter;
    STRING * const dest = string_make(interp, "", 1, "unicode", 0);

    dest->strlen = 1;

    ENCODING_ITER_INIT(interp, dest, &iter);
    iter.set_and_advance(interp, &iter, codepoint);
    dest->bufused = iter.bytepos;

    return dest;
}


/*

=item C<static size_t compute_hash>

Computes the hash of the given STRING C<src> with starting seed value C<seed>.

=cut

*/

static size_t
compute_hash(PARROT_INTERP, ARGIN(const STRING *src), size_t seed)
{
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

=item C<const CHARSET * Parrot_charset_unicode_init>

Initializes the Unicode charset by installing all the necessary function
pointers.

=cut

*/

PARROT_CANNOT_RETURN_NULL
const CHARSET *
Parrot_charset_unicode_init(PARROT_INTERP)
{
    CHARSET * const      return_set = Parrot_new_charset(interp);
    static const CHARSET base_set   = {
        "unicode",
        get_graphemes,
        get_graphemes_inplace,
        set_graphemes,
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
    return return_set;
}


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
