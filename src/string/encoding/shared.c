/*
Copyright (C) 2004-2010, Parrot Foundation.
$Id$

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

static int u_iscclass(PARROT_INTERP, UINTVAL codepoint, INTVAL flags)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_u_iscclass __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

#define UNIMPL Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED, \
    "unimpl fixed_8")


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
    UINTVAL min_len, l_len, r_len;

    STRING_ITER_INIT(interp, &l_iter);
    STRING_ITER_INIT(interp, &r_iter);

    l_len = lhs->strlen;
    r_len = rhs->strlen;

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
*search, UINTVAL offs)>

Searches for the first instance of STRING C<search> in STRING C<src>.
returns the position where the substring is found if it is indeed found.
Returns -1 otherwise. Operates on different types of strings, not just
ASCII.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
encoding_index(PARROT_INTERP, ARGIN(const STRING *src), ARGIN(const STRING *search),
    UINTVAL offs)
{
    ASSERT_ARGS(encoding_index)
    String_iter start, end;

    STRING_ITER_INIT(interp, &start);
    STRING_iter_set_position(interp, src, &start, offs);

    return Parrot_str_iter_index(interp, src, &start, &end, search);
}


/*

=item C<INTVAL encoding_rindex(PARROT_INTERP, const STRING *src, const STRING
*search_string, UINTVAL offset)>

Finds the last index of substring C<search_string> in STRING C<src>,
starting from C<offset>. Not implemented.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
encoding_rindex(PARROT_INTERP, SHIM(const STRING *src),
        SHIM(const STRING *search_string), SHIM(UINTVAL offset))
{
    ASSERT_ARGS(encoding_rindex)
    /* TODO: https://trac.parrot.org/parrot/wiki/StringsTasklist Implement this. */
    UNIMPL;
}


/*

=item C<size_t encoding_hash(PARROT_INTERP, const STRING *src, size_t seed)>

Computes the hash of the given STRING C<src> with starting seed value C<seed>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
size_t
encoding_hash(PARROT_INTERP, ARGIN(const STRING *src), size_t seed)
{
    ASSERT_ARGS(encoding_hash)
    String_iter iter;
    size_t      hashval = seed;

    STRING_ITER_INIT(interp, &iter);

    while (iter.charpos < src->strlen) {
        const UINTVAL c = STRING_iter_get_and_advance(interp, src, &iter);
        hashval += hashval << 5;
        hashval += c;
    }

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

=item C<UINTVAL encoding_scan(PARROT_INTERP, const STRING *src)>

Returns the number of codepoints in string C<src>.

=cut

*/

UINTVAL
encoding_scan(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(encoding_scan)
    String_iter iter;
    /*
     * this is used to initially calculate src->strlen,
     * therefore we must scan the whole string
     */
    STRING_ITER_INIT(interp, &iter);
    while (iter.bytepos < src->bufused)
        STRING_iter_get_and_advance(interp, src, &iter);
    return iter.charpos;
}


/*

=item C<STRING * encoding_substr(PARROT_INTERP, const STRING *src, UINTVAL
offset, UINTVAL count)>

Returns the codepoints in string C<src> at position C<offset> and length
C<count>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
STRING *
encoding_substr(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(encoding_substr)

    STRING * const return_string = Parrot_str_copy(interp, src);
    String_iter    iter;
    UINTVAL        start;

    STRING_ITER_INIT(interp, &iter);

    if (offset)
        STRING_iter_set_position(interp, src, &iter, offset);

    start                   = iter.bytepos;
    return_string->strstart = (char *)return_string->strstart + start;

    if (count)
        STRING_iter_set_position(interp, src, &iter, offset + count);

    return_string->bufused  = iter.bytepos - start;
    return_string->strlen   = count;
    return_string->hashval  = 0;

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
    STRING_iter_set_position(interp, src, &iter, offset);

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
        STRING_iter_set_position(interp, src, &iter, offset);

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
    UNIMPL;
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
    const UINTVAL l_len = lhs->strlen;
    const UINTVAL r_len = rhs->strlen;
    const UINTVAL min_len = l_len > r_len ? r_len : l_len;

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
*search_string, UINTVAL offset)>

Searches for the first instance of STRING C<search> in STRING C<src>.
returns the position where the substring is found if it is indeed found.
Returns -1 otherwise.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
fixed8_index(PARROT_INTERP, ARGIN(const STRING *src),
        ARGIN(const STRING *search_string), UINTVAL offset)
{
    ASSERT_ARGS(fixed8_index)
    INTVAL retval;

    if (STRING_max_bytes_per_codepoint(search_string) != 1) {
        return encoding_index(interp, src, search_string, offset);
    }

    PARROT_ASSERT(STRING_max_bytes_per_codepoint(src) == 1);
    retval = Parrot_byte_index(interp, src,
            search_string, offset);
    return retval;
}


/*

=item C<INTVAL fixed8_rindex(PARROT_INTERP, const STRING *src, const STRING
*search_string, UINTVAL offset)>

Searches for the last instance of STRING C<search_string> in STRING
C<src>. Starts searching at C<offset>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
fixed8_rindex(PARROT_INTERP, ARGIN(const STRING *src),
        ARGIN(const STRING *search_string), UINTVAL offset)
{
    ASSERT_ARGS(fixed8_rindex)
    INTVAL retval;

    if (STRING_max_bytes_per_codepoint(search_string) != 1)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
            "Cross-charset rindex not supported");

    PARROT_ASSERT(STRING_max_bytes_per_codepoint(src) == 1);
    retval = Parrot_byte_rindex(interp, src, search_string, offset);
    return retval;
}


/*

=item C<size_t fixed8_hash(PARROT_INTERP, const STRING *s, size_t hashval)>

Returns the hashed value of the string, given a seed in hashval.

=cut

*/

PARROT_WARN_UNUSED_RESULT
size_t
fixed8_hash(SHIM_INTERP, ARGIN(const STRING *s), size_t hashval)
{
    ASSERT_ARGS(fixed8_hash)
    const unsigned char *pos = (const unsigned char *)s->strstart;
    UINTVAL        len = s->strlen;

    while (len--) {
        hashval += hashval << 5;
        hashval += *(pos++);
    }

    return hashval;
}


/*

=item C<UINTVAL fixed8_scan(PARROT_INTERP, const STRING *src)>

Returns the number of codepoints in string C<src>. No scanning needed
for fixed encodings.

=cut

*/

PARROT_WARN_UNUSED_RESULT
UINTVAL
fixed8_scan(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(fixed8_scan)
    return src->bufused;
}


/*

=item C<UINTVAL fixed8_ord(PARROT_INTERP, const STRING *src, UINTVAL offset)>

codepoints are bytes, so delegate

=cut

*/

PARROT_WARN_UNUSED_RESULT
UINTVAL
fixed8_ord(PARROT_INTERP, ARGIN(const STRING *src),
        UINTVAL offset)
{
    ASSERT_ARGS(fixed8_ord)
    const unsigned char * const buf = (unsigned char *)src->strstart;

    if (offset >= src->bufused) {
/*        Parrot_ex_throw_from_c_args(interp, NULL, 0,
                "fixed8_ord past the end of the buffer (%i of %i)",
                offset, src->bufused); */
        return 0;
    }

    return buf[offset];
}


/*

=item C<STRING * fixed8_substr(PARROT_INTERP, const STRING *src, UINTVAL offset,
UINTVAL count)>

Returns the codepoints in string C<src> at position C<offset> and length
C<count>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
fixed8_substr(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(fixed8_substr)
    STRING * const return_string = Parrot_str_copy(interp, src);

    return_string->encoding = src->encoding;

    return_string->strstart = (char *)return_string->strstart + offset ;
    return_string->bufused = count;

    return_string->strlen = count;
    return_string->hashval = 0;

    return return_string;
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
fixed8_iter_get(PARROT_INTERP,
    ARGIN(const STRING *str), ARGIN(const String_iter *iter), INTVAL offset)
{
    ASSERT_ARGS(fixed8_iter_get)
    return fixed8_ord(interp, str, iter->charpos + offset);
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
    PARROT_ASSERT(iter->bytepos <= Buffer_buflen(str));
}


/*

=item C<UINTVAL fixed8_iter_get_and_advance(PARROT_INTERP, const STRING *str,
String_iter *iter)>

Moves the string iterator C<i> to the next codepoint.

=cut

*/

UINTVAL
fixed8_iter_get_and_advance(PARROT_INTERP,
    ARGIN(const STRING *str), ARGMOD(String_iter *iter))
{
    ASSERT_ARGS(fixed8_iter_get_and_advance)
    const UINTVAL c = fixed8_ord(interp, str, iter->charpos++);
    iter->bytepos++;
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
    unsigned char *buf = (unsigned char *)str->strstart;
    buf[iter->charpos++] = c;
    iter->bytepos++;
}


/*

=item C<void fixed8_iter_set_position(PARROT_INTERP, const STRING *str,
String_iter *iter, UINTVAL pos)>

Moves the string iterator C<i> to the position C<n> in the string.

=cut

*/

void
fixed8_iter_set_position(SHIM_INTERP,
    ARGIN(const STRING *str), ARGMOD(String_iter *iter), UINTVAL pos)
{
    ASSERT_ARGS(fixed8_iter_set_position)
    iter->bytepos = iter->charpos = pos;
    PARROT_ASSERT(pos <= Buffer_buflen(str));
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
    STRING * const dest = string_make(interp, "", 1, "unicode", 0);

    dest->strlen = 1;

    STRING_ITER_INIT(interp, &iter);
    STRING_iter_set_and_advance(interp, dest, &iter, codepoint);
    dest->bufused = iter.bytepos;

    return dest;
}


/*

=item C<UINTVAL unicode_validate(PARROT_INTERP, const STRING *src)>

Returns 1 if the STRING C<src> is a valid unicode string, returns 0 otherwise.

=cut

*/

UINTVAL
unicode_validate(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(unicode_validate)
    String_iter iter;
    const UINTVAL length = Parrot_str_length(interp, src);

    STRING_ITER_INIT(interp, &iter);
    while (iter.charpos < length) {
        const UINTVAL codepoint = STRING_iter_get_and_advance(interp, src, &iter);
        /* Check for Unicode non-characters */
        if (codepoint >= 0xfdd0
        && (codepoint <= 0xfdef || (codepoint & 0xfffe) == 0xfffe)
        &&  codepoint <= 0x10ffff)
            return 0;
    }

    return 1;
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


/*

=item C<STRING* unicode_upcase(PARROT_INTERP, const STRING *src)>

Converts the STRING C<src> to all upper-case graphemes, for those characters
which support upper-case versions.

Throws an exception if ICU is not installed.

=cut

*/

PARROT_CANNOT_RETURN_NULL
STRING*
unicode_upcase(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(unicode_upcase)
#if PARROT_HAS_ICU
    UErrorCode err;
    int dest_len, src_len, needed;
    STRING *res;
#endif

    if (src->bufused  == src->strlen
            && src->encoding == Parrot_utf8_encoding_ptr) {
        return Parrot_ascii_encoding_ptr->upcase(interp, src);
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

=item C<STRING* unicode_downcase(PARROT_INTERP, const STRING *src)>

Converts all graphemes to lower-case, for those graphemes which have cases.

Throws an exception if ICU is not installed.

=cut

*/

PARROT_CANNOT_RETURN_NULL
STRING*
unicode_downcase(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(unicode_downcase)
#if PARROT_HAS_ICU
    UErrorCode err;
    int dest_len, src_len;
    STRING *res;
#endif

    if (src->bufused  == src->strlen
            && src->encoding == Parrot_utf8_encoding_ptr) {
        return Parrot_ascii_encoding_ptr->downcase(interp, src);
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

=item C<STRING* unicode_titlecase(PARROT_INTERP, const STRING *src)>

Converts the string to title case, for those characters which support cases.

Throws an exception if ICU is not installed.

=cut

*/

PARROT_CANNOT_RETURN_NULL
STRING*
unicode_titlecase(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(unicode_titlecase)
#if PARROT_HAS_ICU

    UErrorCode err;
    int dest_len, src_len;
    STRING *res;

    if (src->bufused  == src->strlen
    &&  src->encoding == Parrot_utf8_encoding_ptr) {
        return Parrot_ascii_encoding_ptr->titlecase(interp, src);
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
    UNIMPL;
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
    UNIMPL;
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
    UNIMPL;
}


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

