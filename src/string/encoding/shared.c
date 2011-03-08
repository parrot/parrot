/*
Copyright (C) 2004-2010, Parrot Foundation.

=head1 NAME

src/string/encoding/shared.c

=head1 DESCRIPTION

This file implements general encoding functions for strings.

Functions starting with encoding_ work with any type of string.
Functions starting with fixed8_ work with fixed8 strings.
Functions starting with unicode_ work with unicode strings.

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "tables.h"
#include "shared.h"

#if PARROT_HAS_ICU
#  include <unicode/ucnv.h>
#  include <unicode/utypes.h>
#  include <unicode/uchar.h>
#  include <unicode/ustring.h>
#  include <unicode/unorm.h>
#endif

/* HEADERIZER HFILE: src/string/encoding/shared.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static size_t convert_case_buf(PARROT_INTERP,
    ARGMOD_NULLOK(char *dest_buf),
    size_t dest_len,
    ARGIN(const char *src_buf),
    size_t src_len,
    int mode)
        __attribute__nonnull__(1)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*dest_buf);

static int u_iscclass(PARROT_INTERP, UINTVAL codepoint, INTVAL flags)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
static STRING* unicode_convert_case(PARROT_INTERP,
    ARGIN(const STRING *src),
    int mode)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_convert_case_buf __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src_buf))
#define ASSERT_ARGS_u_iscclass __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_unicode_convert_case __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*

=item C<STRING * encoding_to_encoding(PARROT_INTERP, const STRING *src, const
STR_VTABLE *encoding, double avg_bytes)>

Converts the string C<src> to encoding C<encoding>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
encoding_to_encoding(PARROT_INTERP, ARGIN(const STRING *src),
        ARGIN(const STR_VTABLE *encoding), double avg_bytes)
{
    ASSERT_ARGS(encoding_to_encoding)
    STRING           *result;
    String_iter       src_iter, dest_iter;
    UINTVAL           src_len, alloc_bytes;
    UINTVAL           max_bytes = encoding->max_bytes_per_codepoint;

    if (src->encoding == encoding)
        return Parrot_str_clone(interp, src);

    src_len          = src->strlen;
    result           = Parrot_gc_new_string_header(interp, 0);
    result->encoding = encoding;
    result->strlen   = src_len;

    if (!src_len)
        return result;

    alloc_bytes = (UINTVAL)(src_len * avg_bytes);
    if (alloc_bytes < max_bytes)
        alloc_bytes = max_bytes;
    Parrot_gc_allocate_string_storage(interp, result, alloc_bytes);
    result->bufused = alloc_bytes;

    STRING_ITER_INIT(interp, &src_iter);
    STRING_ITER_INIT(interp, &dest_iter);

    while (src_iter.charpos < src_len) {
        const UINTVAL c      = STRING_iter_get_and_advance(interp, src, &src_iter);
        const UINTVAL needed = dest_iter.bytepos + max_bytes;

        if (needed > result->bufused) {
            alloc_bytes  = src_len - src_iter.charpos;
            alloc_bytes  = (UINTVAL)(alloc_bytes * avg_bytes);
            alloc_bytes += needed;
            Parrot_gc_reallocate_string_storage(interp, result, alloc_bytes);
            result->bufused = alloc_bytes;
        }

        STRING_iter_set_and_advance(interp, result, &dest_iter, c);
    }

    result->bufused = dest_iter.bytepos;

    return result;
}


/*

=item C<INTVAL encoding_equal(PARROT_INTERP, const STRING *lhs, const STRING
*rhs)>

Compares two STRINGs, C<lhs> and C<rhs>. If STRING C<lhs> == C<rhs>,
returns 1. If C<lhs> != C<rhs> returns 0.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
encoding_equal(PARROT_INTERP, ARGIN(const STRING *lhs), ARGIN(const STRING *rhs))
{
    ASSERT_ARGS(encoding_equal)
    String_iter l_iter, r_iter;
    const UINTVAL len = STRING_length(lhs);

    if (len != STRING_length(rhs))
        return 0;
    if (len == 0)
        return 1;
    if (lhs == rhs)
        return 1;
    if (lhs->hashval && rhs->hashval && lhs->hashval != rhs->hashval)
        return 0;
    if (lhs->encoding == rhs->encoding)
        return memcmp(lhs->strstart, rhs->strstart, STRING_byte_length(lhs)) == 0;

    STRING_ITER_INIT(interp, &l_iter);
    STRING_ITER_INIT(interp, &r_iter);

    while (l_iter.charpos < len) {
        const UINTVAL cl = STRING_iter_get_and_advance(interp, lhs, &l_iter);
        const UINTVAL cr = STRING_iter_get_and_advance(interp, rhs, &r_iter);

        if (cl != cr)
            return 0;
    }

    return 1;
}


/*

=item C<INTVAL encoding_compare(PARROT_INTERP, const STRING *lhs, const STRING
*rhs)>

Compares two STRINGs, C<lhs> and C<rhs>. Returns -1 if C<lhs> < C<rhs>. Returns
0 if C<lhs> = C<rhs>. Returns 1 if C<lhs> > C<rhs>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
encoding_compare(PARROT_INTERP, ARGIN(const STRING *lhs), ARGIN(const STRING *rhs))
{
    ASSERT_ARGS(encoding_compare)
    String_iter l_iter, r_iter;
    const UINTVAL l_len = STRING_length(lhs);
    const UINTVAL r_len = STRING_length(rhs);
    UINTVAL min_len;

    if (r_len == 0)
        return l_len != 0;
    if (l_len == 0)
        return -1;

    STRING_ITER_INIT(interp, &l_iter);
    STRING_ITER_INIT(interp, &r_iter);

    min_len = l_len > r_len ? r_len : l_len;

    while (l_iter.charpos < min_len) {
        const UINTVAL cl = STRING_iter_get_and_advance(interp, lhs, &l_iter);
        const UINTVAL cr = STRING_iter_get_and_advance(interp, rhs, &r_iter);

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

=item C<INTVAL encoding_index(PARROT_INTERP, const STRING *src, const STRING
*search, INTVAL offset)>

Searches for the first instance of STRING C<search> in STRING C<src>.
returns the position where the substring is found if it is indeed found.
Returns -1 otherwise. Operates on different types of strings, not just
ASCII.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
encoding_index(PARROT_INTERP, ARGIN(const STRING *src),
        ARGIN(const STRING *search), INTVAL offset)
{
    ASSERT_ARGS(encoding_index)
    String_iter start, end;

    if ((UINTVAL)offset >= STRING_length(src)
    ||  !STRING_length(search))
        return -1;

    STRING_ITER_INIT(interp, &start);
    STRING_iter_skip(interp, src, &start, offset);

    return Parrot_str_iter_index(interp, src, &start, &end, search);
}


/*

=item C<INTVAL encoding_rindex(PARROT_INTERP, const STRING *src, const STRING
*search, INTVAL offset)>

Finds the last index of substring C<search_string> in STRING C<src>,
starting from C<offset>. Not implemented.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
encoding_rindex(PARROT_INTERP, ARGIN(const STRING *src),
        ARGIN(const STRING *search), INTVAL offset)
{
    ASSERT_ARGS(encoding_rindex)
    String_iter search_iter, search_start, start;
    const UINTVAL len = search->strlen;
    UINTVAL c0;
    INTVAL  skip;

    if (offset < 0
    ||  len == 0
    ||  src->strlen < len)
        return -1;

    skip = src->strlen - len;

    if (offset < skip)
        skip = offset;

    STRING_ITER_INIT(interp, &start);
    STRING_iter_skip(interp, src, &start, skip);

    STRING_ITER_INIT(interp, &search_start);
    c0 = STRING_iter_get_and_advance(interp, search, &search_start);

    while (1) {
        UINTVAL c1 = STRING_iter_get(interp, src, &start, 0);

        if (c1 == c0) {
            UINTVAL c2;
            String_iter iter = start;

            STRING_iter_skip(interp, src, &iter, 1);
            search_iter = search_start;

            do {
                if (search_iter.charpos >= len)
                    return start.charpos;
                c1 = STRING_iter_get_and_advance(interp, src, &iter);
                c2 = STRING_iter_get_and_advance(interp, search, &search_iter);
            } while (c1 == c2);
        }

        if (start.charpos == 0)
            break;

        STRING_iter_skip(interp, src, &start, -1);
    }

    return -1;
}


/*

=item C<size_t encoding_hash(PARROT_INTERP, const STRING *src, size_t hashval)>

Computes the hash of the given STRING C<src> with starting seed value C<seed>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
size_t
encoding_hash(PARROT_INTERP, ARGIN(const STRING *src), size_t hashval)
{
    ASSERT_ARGS(encoding_hash)
    DECL_CONST_CAST;
    STRING * const s = PARROT_const_cast(STRING *, src);
    String_iter iter;

    STRING_ITER_INIT(interp, &iter);

    while (iter.charpos < s->strlen) {
        const UINTVAL c = STRING_iter_get_and_advance(interp, s, &iter);
        hashval += hashval << 5;
        hashval += c;
    }

    s->hashval = hashval;

    return hashval;
}


/*

=item C<static int u_iscclass(PARROT_INTERP, UINTVAL codepoint, INTVAL flags)>

Returns Boolean.

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

=item C<void encoding_ord_error(PARROT_INTERP, const STRING *s, INTVAL offset)>

Throws the right exception if STRING_ord was called with a wrong index.
C<offset> is the wrong offset into the string C<s>.

=cut

*/

void
encoding_ord_error(PARROT_INTERP, ARGIN(const STRING *s), INTVAL offset)
{
    ASSERT_ARGS(encoding_ord_error)
    const UINTVAL len = STRING_length(s);
    const char   *err_msg;

    if (!len)
        err_msg = "Cannot get character of empty string";
    else if (offset >= 0)
        err_msg = "Cannot get character past end of string";
    else if (offset < 0)
        err_msg = "Cannot get character before beginning of string";

    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_ORD_OUT_OF_STRING,
        err_msg);
}


/*

=item C<STRING * encoding_substr(PARROT_INTERP, const STRING *src, INTVAL
offset, INTVAL length)>

Returns the codepoints in string C<src> at position C<offset> and length
C<count>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
STRING *
encoding_substr(PARROT_INTERP, ARGIN(const STRING *src), INTVAL offset, INTVAL length)
{
    ASSERT_ARGS(encoding_substr)
    const UINTVAL  strlen = STRING_length(src);
    STRING        *return_string;
    String_iter    iter;
    UINTVAL        start;

    if (offset < 0)
        offset += strlen;

    if ((UINTVAL)offset >= strlen || length <= 0) {
        /* Allow regexes to return $' easily for "aaa" =~ /aaa/ */
        if ((UINTVAL)offset == strlen || length <= 0)
            return Parrot_str_new_constant(interp, "");

        Parrot_ex_throw_from_c_args(interp, NULL,
            EXCEPTION_SUBSTR_OUT_OF_STRING,
            "Cannot take substr outside string");
    }

    return_string = Parrot_str_copy(interp, src);

    if (offset == 0 && (UINTVAL)length >= strlen)
        return return_string;

    STRING_ITER_INIT(interp, &iter);

    if (offset)
        STRING_iter_skip(interp, src, &iter, offset);

    start = iter.bytepos;
    return_string->strstart += start;

    if ((UINTVAL)length >= strlen - (UINTVAL)offset) {
        return_string->bufused -= start;
        return_string->strlen  -= offset;
    }
    else {
        STRING_iter_skip(interp, src, &iter, length);
        return_string->bufused = iter.bytepos - start;
        return_string->strlen  = length;
    }

    return_string->hashval = 0;

    return return_string;
}


/*

=item C<INTVAL encoding_is_cclass(PARROT_INTERP, INTVAL flags, const STRING
*src, UINTVAL offset)>

Returns Boolean.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
encoding_is_cclass(PARROT_INTERP, INTVAL flags, ARGIN(const STRING *src), UINTVAL offset)
{
    ASSERT_ARGS(encoding_is_cclass)
    UINTVAL codepoint;

    if (offset >= src->strlen)
        return 0;

    codepoint = STRING_ord(interp, src, offset);

    if (codepoint >= 256)
        return u_iscclass(interp, codepoint, flags) != 0;

    return (Parrot_iso_8859_1_typetable[codepoint] & flags) ? 1 : 0;
}


/*

=item C<INTVAL encoding_find_cclass(PARROT_INTERP, INTVAL flags, const STRING
*src, UINTVAL offset, UINTVAL count)>

Find a character in the given character class.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
encoding_find_cclass(PARROT_INTERP, INTVAL flags, ARGIN(const STRING *src),
        UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(encoding_find_cclass)
    String_iter iter;
    UINTVAL     codepoint;
    UINTVAL     end = offset + count;

    STRING_ITER_INIT(interp, &iter);
    STRING_iter_skip(interp, src, &iter, offset);

    end = src->strlen < end ? src->strlen : end;

    while (iter.charpos < end) {
        codepoint = STRING_iter_get_and_advance(interp, src, &iter);
        if (codepoint >= 256) {
            if (u_iscclass(interp, codepoint, flags))
                    return iter.charpos - 1;
        }
        else {
            if (Parrot_iso_8859_1_typetable[codepoint] & flags)
                return iter.charpos - 1;
        }
    }

    return end;
}


/*

=item C<INTVAL encoding_find_not_cclass(PARROT_INTERP, INTVAL flags, const
STRING *src, UINTVAL offset, UINTVAL count)>

Returns C<INTVAL>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
encoding_find_not_cclass(PARROT_INTERP, INTVAL flags, ARGIN(const STRING *src),
        UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(encoding_find_not_cclass)
    String_iter iter;
    UINTVAL     codepoint;
    UINTVAL     end = offset + count;
    int         bit;

    if (offset > src->strlen) {
        /* XXX: Throw in this case? */
        return offset + count;
    }

    STRING_ITER_INIT(interp, &iter);

    if (offset)
        STRING_iter_skip(interp, src, &iter, offset);

    end = src->strlen < end ? src->strlen : end;

    if (flags == enum_cclass_any)
        return end;

    while (iter.charpos < end) {
        codepoint = STRING_iter_get_and_advance(interp, src, &iter);
        if (codepoint >= 256) {
            for (bit = enum_cclass_uppercase;
                    bit <= enum_cclass_word ; bit <<= 1) {
                if ((bit & flags) && !u_iscclass(interp, codepoint, bit))
                    return iter.charpos - 1;
            }
        }
        else {
            if (!(Parrot_iso_8859_1_typetable[codepoint] & flags))
                return iter.charpos - 1;
        }
    }

    return end;
}


/*

=item C<STRING * encoding_get_graphemes(PARROT_INTERP, const STRING *src,
UINTVAL offset, UINTVAL count)>

Retrieves the graphemes for the STRING C<src>, starting at
C<offset> and ending at C<offset + count>. Returns codepoints for now.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
encoding_get_graphemes(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(encoding_get_graphemes)
    return STRING_substr(interp, src, offset, count);
}


/*

=item C<STRING* encoding_decompose(PARROT_INTERP, const STRING *src)>

Decompose function. This function is not yet implemented.

=cut

*/

PARROT_CANNOT_RETURN_NULL
STRING*
encoding_decompose(PARROT_INTERP, SHIM(const STRING *src))
{
    ASSERT_ARGS(encoding_decompose)
    /* TODO: https://trac.parrot.org/parrot/wiki/StringsTasklist Implement this. */
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
        "Decompose not implemented");
}


/*

=item C<STRING * fixed8_to_encoding(PARROT_INTERP, const STRING *src, const
STR_VTABLE *enc)>

Converts STRING C<src> to a string with fixed8 encoding C<enc>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
STRING *
fixed8_to_encoding(PARROT_INTERP, ARGIN(const STRING *src),
        ARGIN(const STR_VTABLE *enc))
{
    ASSERT_ARGS(fixed8_to_encoding)
    STRING        *dest;
    const UINTVAL  limit = enc == Parrot_ascii_encoding_ptr ? 0x80 : 0x100;

    if (STRING_max_bytes_per_codepoint(src) == 1) {
        if (limit < 0x100) {
            const unsigned char * const ptr = (unsigned char *)src->strstart;
            UINTVAL i;

            for (i = 0; i < src->strlen; ++i) {
                if (ptr[i] >= limit)
                    Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_LOSSY_CONVERSION,
                        "Lossy conversion to single byte encoding");
            }
        }

        dest           = Parrot_str_copy(interp, src);
        dest->encoding = enc;
    }
    else {
        String_iter    iter;
        unsigned char *ptr;
        const UINTVAL  len = src->strlen;

        dest  = Parrot_str_new_init(interp, NULL, len, enc, 0);
        ptr   = (unsigned char *)dest->strstart;

        STRING_ITER_INIT(interp, &iter);

        while (iter.charpos < len) {
            const UINTVAL c = STRING_iter_get_and_advance(interp, src, &iter);

            if (c >= limit)
                Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_LOSSY_CONVERSION,
                    "Lossy conversion to single byte encoding");

            *ptr++ = c;
        }

        dest->bufused = len;
        dest->strlen  = len;
    }

    return dest;
}


/*

=item C<INTVAL fixed8_equal(PARROT_INTERP, const STRING *lhs, const STRING
*rhs)>

Compares a fixed8 string with another string. If STRING C<lhs> == C<rhs>,
returns 1. If C<lhs> != C<rhs> returns 0.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
fixed8_equal(PARROT_INTERP, ARGIN(const STRING *lhs), ARGIN(const STRING *rhs))
{
    ASSERT_ARGS(fixed8_equal)
    const UINTVAL len = STRING_length(lhs);

    if (len != STRING_length(rhs))
        return 0;
    if (len == 0)
        return 1;
    if (lhs == rhs)
        return 1;
    if (lhs->hashval && rhs->hashval && lhs->hashval != rhs->hashval)
        return 0;

    if (STRING_max_bytes_per_codepoint(rhs) == 1) {
        return memcmp(lhs->strstart, rhs->strstart, len) == 0;
    }
    else {
        const unsigned char * const buf = (unsigned char *)lhs->strstart;
        String_iter iter;

        STRING_ITER_INIT(interp, &iter);

        while (iter.charpos < len) {
            const UINTVAL cl = buf[iter.charpos];
            const UINTVAL cr = STRING_iter_get_and_advance(interp, rhs, &iter);
            if (cl != cr)
                return 0;
        }

        return 1;
    }
}


/*

=item C<INTVAL fixed8_compare(PARROT_INTERP, const STRING *lhs, const STRING
*rhs)>

Compares a fixed8 string with another string. If STRING C<lhs> > C<rhs>, returns
1. If C<lhs> == C<rhs> returns 0. If STRING C<lhs> < C<rhs>, returns  -1.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
fixed8_compare(PARROT_INTERP, ARGIN(const STRING *lhs), ARGIN(const STRING *rhs))
{
    ASSERT_ARGS(fixed8_compare)
    const UINTVAL l_len = STRING_length(lhs);
    const UINTVAL r_len = STRING_length(rhs);
    UINTVAL min_len;

    if (r_len == 0)
        return l_len != 0;
    if (l_len == 0)
        return -1;

    min_len = l_len > r_len ? r_len : l_len;

    if (STRING_max_bytes_per_codepoint(rhs) == 1) {
        const int ret_val = memcmp(lhs->strstart, rhs->strstart, min_len);
        if (ret_val)
            return ret_val < 0 ? -1 : 1;
    }
    else {
        const unsigned char * const buf = (unsigned char *)lhs->strstart;
        String_iter iter;

        STRING_ITER_INIT(interp, &iter);

        while (iter.charpos < min_len) {
            const UINTVAL cl = buf[iter.charpos];
            const UINTVAL cr = STRING_iter_get_and_advance(interp, rhs, &iter);
            if (cl != cr)
                return cl < cr ? -1 : 1;
        }
    }

    if (l_len < r_len)
        return -1;
    if (l_len > r_len)
        return 1;

    return 0;
}


/*

=item C<INTVAL fixed8_index(PARROT_INTERP, const STRING *src, const STRING
*search, INTVAL offset)>

Searches for the first instance of STRING C<search> in STRING C<src>.
returns the position where the substring is found if it is indeed found.
Returns -1 otherwise.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
fixed8_index(PARROT_INTERP, ARGIN(const STRING *src),
        ARGIN(const STRING *search), INTVAL offset)
{
    ASSERT_ARGS(fixed8_index)

    if (STRING_max_bytes_per_codepoint(search) != 1)
        return encoding_index(interp, src, search, offset);

    if ((UINTVAL)offset >= STRING_length(src)
    ||  !STRING_length(search))
        return -1;

    return Parrot_util_byte_index(interp, src, search, offset);
}


/*

=item C<INTVAL fixed8_rindex(PARROT_INTERP, const STRING *src, const STRING
*search_string, INTVAL offset)>

Searches for the last instance of STRING C<search_string> in STRING
C<src>. Starts searching at C<offset>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
fixed8_rindex(PARROT_INTERP, ARGIN(const STRING *src),
        ARGIN(const STRING *search_string), INTVAL offset)
{
    ASSERT_ARGS(fixed8_rindex)

    if (STRING_max_bytes_per_codepoint(search_string) != 1)
        return encoding_rindex(interp, src, search_string, offset);

    if (offset < 0
    ||  !STRING_length(search_string))
        return -1;

    return Parrot_util_byte_rindex(interp, src, search_string, offset);
}


/*

=item C<size_t fixed8_hash(PARROT_INTERP, const STRING *src, size_t hashval)>

Returns the hashed value of the string, given a seed in hashval.

=cut

*/

PARROT_WARN_UNUSED_RESULT
size_t
fixed8_hash(SHIM_INTERP, ARGIN(const STRING *src), size_t hashval)
{
    ASSERT_ARGS(fixed8_hash)
    DECL_CONST_CAST;
    STRING * const s = PARROT_const_cast(STRING *, src);
    const unsigned char *pos = (const unsigned char *)s->strstart;
    s->hashval = hashval = Parrot_hash_buffer(pos, s->strlen, hashval);
    return hashval;
}


/*

=item C<UINTVAL fixed8_ord(PARROT_INTERP, const STRING *src, INTVAL idx)>

codepoints are bytes, so delegate

=cut

*/

PARROT_WARN_UNUSED_RESULT
UINTVAL
fixed8_ord(PARROT_INTERP, ARGIN(const STRING *src), INTVAL idx)
{
    ASSERT_ARGS(fixed8_ord)
    const UINTVAL len = STRING_length(src);

    if (idx < 0)
        idx += len;

    if ((UINTVAL)idx >= len)
        encoding_ord_error(interp, src, idx);

    return (unsigned char)src->strstart[idx];
}


/*

=item C<STRING * fixed_substr(PARROT_INTERP, const STRING *src, INTVAL offset,
INTVAL length)>

Returns the codepoints in string C<src> at position C<offset> and length
C<count>. Works for all fixed size encodings.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
fixed_substr(PARROT_INTERP, ARGIN(const STRING *src), INTVAL offset, INTVAL length)
{
    ASSERT_ARGS(fixed_substr)
    const UINTVAL  strlen = STRING_length(src);
    STRING        *return_string;
    UINTVAL        maxlen, bytes_per_codepoint;

    if (offset < 0)
        offset += strlen;

    if ((UINTVAL)offset >= strlen || length <= 0) {
        /* Allow regexes to return $' easily for "aaa" =~ /aaa/ */
        if ((UINTVAL)offset == strlen || length <= 0)
            return Parrot_str_new_constant(interp, "");

        Parrot_ex_throw_from_c_args(interp, NULL,
            EXCEPTION_SUBSTR_OUT_OF_STRING,
            "Cannot take substr outside string");
    }

    return_string = Parrot_str_copy(interp, src);

    if (offset == 0 && (UINTVAL)length >= strlen)
        return return_string;

    bytes_per_codepoint = src->encoding->max_bytes_per_codepoint;
    maxlen              = strlen - offset;

    if ((UINTVAL)length > maxlen)
        length = maxlen;

    return_string->strstart += offset * bytes_per_codepoint;
    return_string->bufused   = length * bytes_per_codepoint;
    return_string->strlen    = length;
    return_string->hashval   = 0;

    return return_string;
}


/*

=item C<INTVAL fixed8_is_cclass(PARROT_INTERP, INTVAL flags, const STRING *src,
UINTVAL offset)>

Returns Boolean.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
fixed8_is_cclass(SHIM_INTERP, INTVAL flags, ARGIN(const STRING *src), UINTVAL offset)
{
    ASSERT_ARGS(fixed8_is_cclass)
    const unsigned char * const ptr = (unsigned char *)src->strstart;
    UINTVAL codepoint;

    if (offset >= src->strlen)
        return 0;
    codepoint = ptr[offset];

    return Parrot_iso_8859_1_typetable[codepoint] & flags ? 1 : 0;
}


/*

=item C<INTVAL fixed8_find_cclass(PARROT_INTERP, INTVAL flags, const STRING
*src, UINTVAL offset, UINTVAL count)>

Find a character in the given character class.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
fixed8_find_cclass(SHIM_INTERP, INTVAL flags, ARGIN(const STRING *src),
        UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(fixed8_find_cclass)
    const unsigned char * const ptr = (const unsigned char *)src->strstart;
    UINTVAL pos;
    UINTVAL end = offset + count;

    if (end > src->strlen)
        end = src->strlen;

    for (pos = offset; pos < end; ++pos) {
        if (Parrot_iso_8859_1_typetable[ptr[pos]] & flags)
            return pos;
    }

    return end;
}


/*

=item C<INTVAL fixed8_find_not_cclass(PARROT_INTERP, INTVAL flags, const STRING
*src, UINTVAL offset, UINTVAL count)>

Returns C<INTVAL>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
fixed8_find_not_cclass(SHIM_INTERP, INTVAL flags, ARGIN(const STRING *src),
        UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(fixed8_find_not_cclass)
    const unsigned char * const ptr = (unsigned char *)src->strstart;
    UINTVAL pos;
    UINTVAL end = offset + count;

    if (end > src->strlen)
        end = src->strlen;

    for (pos = offset; pos < end; ++pos) {
        if ((Parrot_iso_8859_1_typetable[ptr[pos]] & flags) == 0)
            return pos;
    }

    return end;
}


/*

=item C<STRING* fixed8_compose(PARROT_INTERP, const STRING *src)>

Can't compose ASCII strings, so performs a string copy on it and
returns the new string.

=cut

*/

PARROT_CANNOT_RETURN_NULL
STRING*
fixed8_compose(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(fixed8_compose)

    return Parrot_str_copy(interp, src);
}


/*

=item C<UINTVAL fixed8_iter_get(PARROT_INTERP, const STRING *str, const
String_iter *iter, INTVAL offset)>

Get the character at C<iter> plus C<offset>.

=cut

*/

UINTVAL
fixed8_iter_get(SHIM_INTERP,
    ARGIN(const STRING *str), ARGIN(const String_iter *iter), INTVAL offset)
{
    ASSERT_ARGS(fixed8_iter_get)
    const unsigned char * const ptr = (unsigned char *)str->strstart;

    PARROT_ASSERT(iter->charpos + offset < str->bufused);

    return ptr[iter->charpos + offset];
}


/*

=item C<void fixed8_iter_skip(PARROT_INTERP, const STRING *str, String_iter
*iter, INTVAL skip)>

Moves the string iterator C<i> by C<skip> characters.

=cut

*/

void
fixed8_iter_skip(SHIM_INTERP,
    ARGIN(const STRING *str), ARGMOD(String_iter *iter), INTVAL skip)
{
    ASSERT_ARGS(fixed8_iter_skip)

    iter->bytepos += skip;
    iter->charpos += skip;

    PARROT_ASSERT(iter->bytepos <= str->bufused);
}


/*

=item C<UINTVAL fixed8_iter_get_and_advance(PARROT_INTERP, const STRING *str,
String_iter *iter)>

Moves the string iterator C<i> to the next codepoint.

=cut

*/

UINTVAL
fixed8_iter_get_and_advance(SHIM_INTERP, ARGIN(const STRING *str), ARGMOD(String_iter *iter))
{
    ASSERT_ARGS(fixed8_iter_get_and_advance)
    unsigned char * const ptr = (unsigned char *)str->strstart;
    const UINTVAL         c   = ptr[iter->charpos++];

    iter->bytepos++;

    PARROT_ASSERT(iter->bytepos <= str->bufused);

    return c;
}


/*

=item C<void fixed8_iter_set_and_advance(PARROT_INTERP, STRING *str, String_iter
*iter, UINTVAL c)>

With the string iterator C<i>, appends the codepoint C<c> and advances to the
next position in the string.

=cut

*/

void
fixed8_iter_set_and_advance(PARROT_INTERP,
    ARGMOD(STRING *str), ARGMOD(String_iter *iter), UINTVAL c)
{
    ASSERT_ARGS(fixed8_iter_set_and_advance)
    unsigned char * const ptr = (unsigned char *)str->strstart;

    UINTVAL limit = str->encoding == Parrot_ascii_encoding_ptr ? 0x80 : 0x100;

    if (c >= limit)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_LOSSY_CONVERSION,
            "Lossy conversion to single byte encoding");

    ptr[iter->charpos++] = c;
    iter->bytepos++;

    if (str->bufused < iter->bytepos)
        str->bufused = iter->bytepos;
}


/*

=item C<STRING * unicode_chr(PARROT_INTERP, UINTVAL codepoint)>

Returns a one-codepoint string for the given codepoint.

=cut

*/

PARROT_CANNOT_RETURN_NULL
STRING *
unicode_chr(PARROT_INTERP, UINTVAL codepoint)
{
    ASSERT_ARGS(unicode_chr)
    String_iter    iter;
    STRING * const dest = Parrot_str_new_init(interp, NULL, 4,
        Parrot_utf8_encoding_ptr, 0);

    dest->bufused = 4;
    dest->strlen  = 1;

    STRING_ITER_INIT(interp, &iter);
    STRING_iter_set_and_advance(interp, dest, &iter, codepoint);
    dest->bufused = iter.bytepos;

    return dest;
}


/*

=item C<STRING* unicode_compose(PARROT_INTERP, const STRING *src)>

If Parrot is built with ICU, composes the STRING C<src>. Attempts to
denormalize the STRING into the ICU default, NFC.

If Parrot does not have ICU included, throws an exception.

=cut

*/

PARROT_CANNOT_RETURN_NULL
STRING*
unicode_compose(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(unicode_compose)
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
            src->encoding, 0);

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


#define ENCODING_UPCASE     1
#define ENCODING_DOWNCASE   2
#define ENCODING_TITLECASE  3

/*

=item C<static size_t convert_case_buf(PARROT_INTERP, char *dest_buf, size_t
dest_len, const char *src_buf, size_t src_len, int mode)>

Converts a UTF-16 buffer to upper, lower or title case using the ICU library.

Throws an exception if ICU is not installed.

=cut

*/

static size_t
convert_case_buf(PARROT_INTERP, ARGMOD_NULLOK(char *dest_buf), size_t dest_len,
    ARGIN(const char *src_buf), size_t src_len, int mode)
{
    ASSERT_ARGS(convert_case_buf)
#if PARROT_HAS_ICU
    UErrorCode err = U_ZERO_ERROR;
    int        res;

    switch (mode) {
      case ENCODING_UPCASE:
        res = u_strToUpper((UChar *)dest_buf, dest_len / 2,
                           (const UChar *)src_buf, src_len / 2, NULL, &err);
        break;
      case ENCODING_DOWNCASE:
        res = u_strToLower((UChar *)dest_buf, dest_len / 2,
                           (const UChar *)src_buf, src_len / 2, NULL, &err);
        break;
      case ENCODING_TITLECASE:
        res = u_strToTitle((UChar *)dest_buf, dest_len / 2,
                           (const UChar *)src_buf, src_len / 2,
                           NULL, NULL, &err);
        break;
      default:
        res = 0; /* Should never happen, just to avoid a warning */
        break;
    }

    if (dest_buf != NULL)
        PARROT_ASSERT(U_SUCCESS(err));

    return res * 2;
#else
    UNUSED(dest_buf);
    UNUSED(dest_len);
    UNUSED(src_buf);
    UNUSED(src_len);
    UNUSED(mode);
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_LIBRARY_ERROR,
        "no ICU lib loaded");
#endif
}


/*

=item C<static STRING* unicode_convert_case(PARROT_INTERP, const STRING *src,
int mode)>

Converts the string to upper, lower or title case.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
unicode_convert_case(PARROT_INTERP, ARGIN(const STRING *src), int mode)
{
    ASSERT_ARGS(unicode_convert_case)
    STRING *dest;
    size_t  dest_len;

    if (src->encoding != Parrot_utf16_encoding_ptr
    &&  src->encoding != Parrot_ucs2_encoding_ptr)
        src = Parrot_utf16_encoding_ptr->to_encoding(interp, src);

    /* In-place operation is not safe for old ICU versions */
    dest_len = convert_case_buf(interp, NULL, 0, src->strstart, src->bufused,
                                mode);

    dest = Parrot_str_new_init(interp, NULL, dest_len, src->encoding, 0);

    dest->bufused = convert_case_buf(interp, dest->strstart, dest_len,
                                     src->strstart, src->bufused, mode);
    STRING_scan(interp, dest);

    /* downgrade if possible */
    if (dest->bufused == dest->strlen * 2)
        dest->encoding = Parrot_ucs2_encoding_ptr;
    else
        dest->encoding = Parrot_utf16_encoding_ptr;

    return dest;
}


/*

=item C<STRING* unicode_upcase(PARROT_INTERP, const STRING *src)>

Converts the STRING C<src> to all upper-case graphemes, for those characters
which support upper-case versions.

=cut

*/

PARROT_CANNOT_RETURN_NULL
STRING*
unicode_upcase(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(unicode_upcase)

    if (src->bufused  == src->strlen
    &&  src->encoding == Parrot_utf8_encoding_ptr)
        return Parrot_ascii_encoding_ptr->upcase(interp, src);

    return unicode_convert_case(interp, src, ENCODING_UPCASE);
}


/*

=item C<STRING* unicode_downcase(PARROT_INTERP, const STRING *src)>

Converts all graphemes to lower-case, for those graphemes which have cases.

=cut

*/

PARROT_CANNOT_RETURN_NULL
STRING*
unicode_downcase(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(unicode_downcase)

    if (src->bufused  == src->strlen
    &&  src->encoding == Parrot_utf8_encoding_ptr)
        return Parrot_ascii_encoding_ptr->downcase(interp, src);

    return unicode_convert_case(interp, src, ENCODING_DOWNCASE);
}


/*

=item C<STRING* unicode_titlecase(PARROT_INTERP, const STRING *src)>

Converts the string to title case, for those characters which support cases.

=cut

*/

PARROT_CANNOT_RETURN_NULL
STRING*
unicode_titlecase(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(unicode_titlecase)

    if (src->bufused  == src->strlen
    &&  src->encoding == Parrot_utf8_encoding_ptr)
        return Parrot_ascii_encoding_ptr->titlecase(interp, src);

    return unicode_convert_case(interp, src, ENCODING_TITLECASE);
}


/*

=item C<STRING* unicode_upcase_first(PARROT_INTERP, const STRING *src)>

Converts the first grapheme in the STRING C<src> to uppercase, if the
grapheme supports it. Not implemented.

=cut

*/

PARROT_CANNOT_RETURN_NULL
STRING*
unicode_upcase_first(PARROT_INTERP, SHIM(const STRING *src))
{
    ASSERT_ARGS(unicode_upcase_first)
    /* TODO: https://trac.parrot.org/parrot/wiki/StringsTasklist Implement this. */
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
        "Unicode upcase_first not implemented");
}


/*

=item C<STRING* unicode_downcase_first(PARROT_INTERP, const STRING *src)>

Converts the first grapheme in the STRING C<src> to lower-case, if
the grapheme supports it. Not implemented

=cut

*/

PARROT_CANNOT_RETURN_NULL
STRING*
unicode_downcase_first(PARROT_INTERP, SHIM(const STRING *src))
{
    ASSERT_ARGS(unicode_downcase_first)
    /* TODO: https://trac.parrot.org/parrot/wiki/StringsTasklist Implement this. */
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
        "Unicode downcase_first not implemented");
}


/*

=item C<STRING* unicode_titlecase_first(PARROT_INTERP, const STRING *src)>

Converts the first grapheme in STRING C<src> to title case, if the
string supports it. Not implemented.

=cut

*/

PARROT_CANNOT_RETURN_NULL
STRING*
unicode_titlecase_first(PARROT_INTERP, SHIM(const STRING *src))
{
    ASSERT_ARGS(unicode_titlecase_first)
    /* TODO: https://trac.parrot.org/parrot/wiki/StringsTasklist Implement this. */
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
        "Unicode titlecase_first not implemented");
}


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

