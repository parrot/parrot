/*
Copyright (C) 2004-2010, Parrot Foundation.
$Id$

=head1 NAME

src/string/charset/ascii.c

=head1 DESCRIPTION

This file implements the charset functions for ascii data and common
charset functionality for similar charsets like iso-8859-1.

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "ascii.h"

/*
 * TODO check interpreter error and warnings setting
 */

#include "tables.h"

/* HEADERIZER HFILE: src/string/charset/ascii.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CANNOT_RETURN_NULL
static STRING* compose(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING* decompose(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING* downcase(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING* downcase_first(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
static INTVAL find_cclass(PARROT_INTERP,
    INTVAL flags,
    ARGIN(STRING *src),
    UINTVAL offset,
    UINTVAL count)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

static INTVAL find_not_cclass(PARROT_INTERP,
    INTVAL flags,
    ARGIN(STRING *src),
    UINTVAL offset,
    UINTVAL count)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
static INTVAL is_cclass(PARROT_INTERP,
    INTVAL flags,
    ARGIN(const STRING *src),
    UINTVAL offset)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static STRING * string_from_codepoint(PARROT_INTERP, UINTVAL codepoint)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
static STRING* titlecase(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING* titlecase_first(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING * to_ascii(PARROT_INTERP, ARGIN(STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING * to_charset(PARROT_INTERP, ARGIN(STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING* upcase(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING* upcase_first(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
static UINTVAL validate(PARROT_INTERP, ARGIN(STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_compose __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_decompose __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_downcase __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_downcase_first __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_find_cclass __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_find_not_cclass __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
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
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_to_ascii __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_to_charset __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_upcase __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_upcase_first __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_validate __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<STRING * ascii_get_graphemes(PARROT_INTERP, const STRING *src, UINTVAL
offset, UINTVAL count)>

Retrieves the graphemes for the STRING C<src>, starting at
C<offset> and ending at C<offset + count>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
ascii_get_graphemes(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(ascii_get_graphemes)
    return ENCODING_GET_BYTES(interp, src, offset, count);
}

/*

=item C<static STRING * to_ascii(PARROT_INTERP, STRING *src)>

Attempts to convert STRING C<src> to ASCII in STRING C<dest>. Throws
an exception if unconvertable UNICODE characters are involved.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING *
to_ascii(PARROT_INTERP, ARGIN(STRING *src))
{
    ASSERT_ARGS(to_ascii)
    String_iter iter;
    UINTVAL offs;
    unsigned char *p;
    const UINTVAL len = src->strlen;

    /* the string can't grow. Just clone it */
    STRING * dest = Parrot_str_clone(interp, src);

    p = (unsigned char *)dest->strstart;
    ENCODING_ITER_INIT(interp, src, &iter);
    for (offs = 0; offs < len; ++offs) {
        const UINTVAL c = iter.get_and_advance(interp, &iter);
        if (c >= 128)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_LOSSY_CONVERSION,
                    "can't convert unicode string to ascii");
        *p++ = (unsigned char)c;
    }
    dest->bufused = len;
    dest->strlen = len;
    dest->charset = Parrot_ascii_charset_ptr;
    dest->encoding = CHARSET_GET_PREFERRED_ENCODING(interp, dest);
    return dest;
}

/*

=item C<static STRING * to_charset(PARROT_INTERP, STRING *src)>

Converts STRING C<src> to ASCII charset STRING C<dest>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING *
to_charset(PARROT_INTERP, ARGIN(STRING *src))
{
    ASSERT_ARGS(to_charset)
    const charset_converter_t conversion_func =
        Parrot_find_charset_converter(interp, src->charset, Parrot_ascii_charset_ptr);

    if (conversion_func) {
         return conversion_func(interp, src);
    }
    else {
        return to_ascii(interp, src);
    }
}

/*

=item C<static STRING* compose(PARROT_INTERP, const STRING *src)>

Can't compose ASCII strings, so performs a string copy on it and
returns the new string.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
compose(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(compose)

    STRING * const dest = Parrot_str_copy(interp, src);

    return dest;
}

/*

=item C<static STRING* decompose(PARROT_INTERP, const STRING *src)>

Can't decompose ASCII, so we perform a string copy instead and return
a pointer to the new string.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
decompose(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(decompose)

    STRING * const dest = Parrot_str_copy(interp, src);

    return dest;
}

/*

=item C<static STRING* upcase(PARROT_INTERP, const STRING *src)>

Converts the STRING C<src> to all uppercase.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
upcase(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(upcase)
    STRING * const result = Parrot_str_clone(interp, src);
    const UINTVAL n = src->strlen;

    if (n) {
        char * const buffer = result->strstart;
        UINTVAL offset;

        for (offset = 0; offset < n; offset++) {
            buffer[offset] = (char)toupper((unsigned char)buffer[offset]);
        }
    }

    return result;
}

/*

=item C<static STRING* downcase(PARROT_INTERP, const STRING *src)>

Converts the STRING C<src> to all lower-case.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
downcase(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(downcase)
    STRING       *result = Parrot_str_clone(interp, src);
    const UINTVAL n      = src->strlen;

    if (n) {
        char * const buffer = result->strstart;
        UINTVAL offset;

        for (offset = 0; offset < n; offset++) {
            buffer[offset] = (char)tolower((unsigned char)buffer[offset]);
        }
    }

    return result;
}

/*

=item C<static STRING* titlecase(PARROT_INTERP, const STRING *src)>

Converts the STRING given by C<src> to title case, where
the first character is upper case and all the rest of the characters
are lower-case.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
titlecase(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(titlecase)
    STRING       *result = Parrot_str_clone(interp, src);
    const UINTVAL n      = src->strlen;

    if (n) {
        char * const buffer = result->strstart;
        UINTVAL offset;

        buffer[0] = (char)toupper((unsigned char)buffer[0]);
        for (offset = 1; offset < n; offset++) {
            buffer[offset] = (char)tolower((unsigned char)buffer[offset]);
        }
    }

    return result;
}

/*

=item C<static STRING* upcase_first(PARROT_INTERP, const STRING *src)>

Sets the first character in the STRING C<src> to upper case,
but doesn't modify the rest of the string.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
upcase_first(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(upcase_first)
    STRING *result = Parrot_str_clone(interp, src);

    if (result->strlen) {
        char * const buffer = result->strstart;
        buffer[0] = (char)toupper((unsigned char)buffer[0]);
    }

    return result;
}

/*

=item C<static STRING* downcase_first(PARROT_INTERP, const STRING *src)>

Sets the first character of the STRING C<src> to lowercase,
but doesn't modify the rest of the characters.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
downcase_first(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(downcase_first)
    STRING *result = Parrot_str_clone(interp, src);

    if (result->strlen) {
        char * const buffer = result->strstart;
        buffer[0] = (char)tolower((unsigned char)buffer[0]);
    }

    return result;
}

/*

=item C<static STRING* titlecase_first(PARROT_INTERP, const STRING *src)>

Converts the first letter of STRING C<src> to upper case,
but doesn't modify the rest of the string.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
titlecase_first(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(titlecase_first)
    STRING * const result = Parrot_str_clone(interp, src);

    if (result->strlen) {
        char * const buffer = result->strstart;
        buffer[0] = (char)toupper((unsigned char)buffer[0]);
    }

    return result;
}

/*

=item C<INTVAL ascii_compare(PARROT_INTERP, const STRING *lhs, const STRING
*rhs)>

Compares two strings as ASCII strings. If STRING C<lhs> > C<rhs>, returns
1. If C<lhs> == C<rhs> returns 0. If STRING C<lhs> < C<rhs>, returns  -1.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
ascii_compare(PARROT_INTERP, ARGIN(const STRING *lhs), ARGIN(const STRING *rhs))
{
    ASSERT_ARGS(ascii_compare)
    const UINTVAL l_len = lhs->strlen;
    const UINTVAL r_len = rhs->strlen;
    const UINTVAL min_len = l_len > r_len ? r_len : l_len;
    String_iter iter;

    if (lhs->encoding == rhs->encoding) {
        const int ret_val = memcmp(lhs->strstart, rhs->strstart, min_len);
        if (ret_val)
            return ret_val < 0 ? -1 : 1;
    }
    else {
        UINTVAL offs;
        ENCODING_ITER_INIT(interp, rhs, &iter);
        for (offs = 0; offs < min_len; ++offs) {
            const UINTVAL cl = ENCODING_GET_BYTE(interp, lhs, offs);
            const UINTVAL cr = iter.get_and_advance(interp, &iter);
            if (cl != cr)
                return cl < cr ? -1 : 1;
        }
    }
    if (l_len < r_len) {
        return -1;
    }
    if (l_len > r_len) {
        return 1;
    }
    return 0;
}

/*

=item C<INTVAL mixed_cs_index(PARROT_INTERP, STRING *src, STRING *search,
UINTVAL offs)>

Searches for the first instance of STRING C<search> in STRING C<src>.
returns the position where the substring is found if it is indeed found.
Returns -1 otherwise. Operates on different types of strings, not just
ASCII.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
mixed_cs_index(PARROT_INTERP, ARGIN(STRING *src), ARGIN(STRING *search),
    UINTVAL offs)
{
    ASSERT_ARGS(mixed_cs_index)
    String_iter src_iter, search_iter;
    UINTVAL len, next_pos;
    INTVAL found_at;

    ENCODING_ITER_INIT(interp, src, &src_iter);
    src_iter.set_position(interp, &src_iter, offs);
    ENCODING_ITER_INIT(interp, search, &search_iter);
    len = search->strlen;

    found_at = -1;
    next_pos = offs;

    for (; len && offs < src->strlen ;) {
        const UINTVAL c1 = src_iter.get_and_advance(interp, &src_iter);
        const UINTVAL c2 = search_iter.get_and_advance(interp, &search_iter);

        if (c1 == c2) {
            --len;
            if (found_at == -1)
                found_at = offs;
            ++offs;
        }
        else {
            len = search->strlen;
            ++offs;
            ++next_pos;
            if (offs != next_pos) {
                src_iter.set_position(interp, &src_iter, next_pos);
                offs = next_pos;
            }

            found_at = -1;
            search_iter.set_position(interp, &search_iter, 0);
        }
    }
    if (len == 0)
        return found_at;
    return -1;
}

/*

=item C<INTVAL ascii_cs_index(PARROT_INTERP, STRING *src, STRING *search_string,
UINTVAL offset)>

Searches for the first instance of STRING C<search> in STRING C<src>.
returns the position where the substring is found if it is indeed found.
Returns -1 otherwise.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
ascii_cs_index(PARROT_INTERP, ARGIN(STRING *src),
        ARGIN(STRING *search_string), UINTVAL offset)
{
    ASSERT_ARGS(ascii_cs_index)
    INTVAL retval;
    if (src->charset != search_string->charset) {
        return mixed_cs_index(interp, src, search_string, offset);
    }

    PARROT_ASSERT(src->encoding == Parrot_fixed_8_encoding_ptr);
    retval = Parrot_byte_index(interp, src,
            search_string, offset);
    return retval;
}

/*

=item C<INTVAL ascii_cs_rindex(PARROT_INTERP, STRING *src, STRING
*search_string, UINTVAL offset)>

Searches for the last instance of STRING C<search_string> in STRING
C<src>. Starts searching at C<offset>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
ascii_cs_rindex(PARROT_INTERP, ARGIN(STRING *src),
        ARGIN(STRING *search_string), UINTVAL offset)
{
    ASSERT_ARGS(ascii_cs_rindex)
    INTVAL retval;

    if (src->charset != search_string->charset)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
            "Cross-charset index not supported");

    PARROT_ASSERT(src->encoding == Parrot_fixed_8_encoding_ptr);
    retval = Parrot_byte_rindex(interp, src,
            search_string, offset);
    return retval;
}

/*

=item C<static UINTVAL validate(PARROT_INTERP, STRING *src)>

Verifies that the given string is valid ASCII. Returns 1 if it is ASCII,
returns 0 otherwise.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static UINTVAL
validate(PARROT_INTERP, ARGIN(STRING *src))
{
    ASSERT_ARGS(validate)
    UINTVAL offset;
    String_iter iter;

    ENCODING_ITER_INIT(interp, src, &iter);
    for (offset = 0; offset < Parrot_str_byte_length(interp, src); ++offset) {
        const UINTVAL codepoint = iter.get_and_advance(interp, &iter);
        if (codepoint >= 0x80)
            return 0;
    }
    return 1;
}

/*

=item C<static STRING * string_from_codepoint(PARROT_INTERP, UINTVAL codepoint)>

Creates a new STRING object from a single codepoint C<codepoint>. Returns
the new STRING.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static STRING *
string_from_codepoint(PARROT_INTERP, UINTVAL codepoint)
{
    ASSERT_ARGS(string_from_codepoint)
    char real_codepoint = (char)codepoint;
    STRING * const return_string = string_make(interp, &real_codepoint, 1, "ascii", 0);
    return return_string;
}

/*

=item C<static INTVAL is_cclass(PARROT_INTERP, INTVAL flags, const STRING *src,
UINTVAL offset)>

=cut

*/

PARROT_WARN_UNUSED_RESULT
static INTVAL
is_cclass(PARROT_INTERP, INTVAL flags, ARGIN(const STRING *src), UINTVAL offset)
{
    ASSERT_ARGS(is_cclass)
    UINTVAL codepoint;

    if (offset >= src->strlen)
        return 0;
    codepoint = ENCODING_GET_CODEPOINT(interp, src, offset);

    if (codepoint >= sizeof (Parrot_ascii_typetable) /
            sizeof (Parrot_ascii_typetable[0])) {
        return 0;
    }
    return (Parrot_ascii_typetable[codepoint] & flags) ? 1 : 0;
}

/*

=item C<static INTVAL find_cclass(PARROT_INTERP, INTVAL flags, STRING *src,
UINTVAL offset, UINTVAL count)>

Find a character in the given character class.  Delegates to the find_cclass
method of the encoding plugin.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static INTVAL
find_cclass(PARROT_INTERP, INTVAL flags, ARGIN(STRING *src),
            UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(find_cclass)
    UINTVAL pos = offset;
    UINTVAL end = offset + count;

    end = src->strlen < end ? src->strlen : end;
    return ENCODING_FIND_CCLASS(interp, src, Parrot_ascii_typetable,
            flags, pos, end);
}

/*

=item C<static INTVAL find_not_cclass(PARROT_INTERP, INTVAL flags, STRING *src,
UINTVAL offset, UINTVAL count)>

=cut

*/

static INTVAL
find_not_cclass(PARROT_INTERP, INTVAL flags, ARGIN(STRING *src), UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(find_not_cclass)
    UINTVAL pos = offset;
    UINTVAL end = offset + count;

    end = src->strlen < end ? src->strlen : end;
    for (; pos < end; ++pos) {
        const UINTVAL codepoint = ENCODING_GET_CODEPOINT(interp, src, pos);
        if ((Parrot_ascii_typetable[codepoint] & flags) == 0) {
            return pos;
        }
    }
    return end;
}

/*

=item C<size_t ascii_compute_hash(PARROT_INTERP, const STRING *src, size_t
seed)>

Computes the hash of STRING C<src> starting with seed value
C<seed>.

=cut

*/

PARROT_PURE_FUNCTION
size_t
ascii_compute_hash(SHIM_INTERP, ARGIN(const STRING *src), size_t seed)
{
    ASSERT_ARGS(ascii_compute_hash)
    size_t hashval = seed;
    const char *buffptr = (const char *)src->strstart;
    UINTVAL len = src->strlen;

    PARROT_ASSERT(src->encoding == Parrot_fixed_8_encoding_ptr);
    while (len--) {
        hashval += hashval << 5;
        hashval += *buffptr++;
    }
    return hashval;
}

/*

=item C<void Parrot_charset_ascii_init(PARROT_INTERP)>

Initialize the ASCII charset but registering all the necessary
function pointers and settings.

=cut

*/

void
Parrot_charset_ascii_init(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_charset_ascii_init)
    CHARSET * const return_set = Parrot_new_charset(interp);
    static const CHARSET base_set = {
        "ascii",
        ascii_get_graphemes,
        to_charset,
        compose,
        decompose,
        upcase,
        downcase,
        titlecase,
        upcase_first,
        downcase_first,
        titlecase_first,
        ascii_compare,
        ascii_cs_index,
        ascii_cs_rindex,
        validate,
        is_cclass,
        find_cclass,
        find_not_cclass,
        string_from_codepoint,
        ascii_compute_hash,
        NULL
    };

    STRUCT_COPY_FROM_STRUCT(return_set, base_set);
    return_set->preferred_encoding = Parrot_fixed_8_encoding_ptr;
    Parrot_register_charset(interp, "ascii", return_set);

    return;
}

/*

=item C<STRING * charset_cvt_ascii_to_binary(PARROT_INTERP, STRING *src)>

Converts an ASCII STRING C<src> to a binary STRING C<dest>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
STRING *
charset_cvt_ascii_to_binary(PARROT_INTERP, ARGIN(STRING *src))
{
    ASSERT_ARGS(charset_cvt_ascii_to_binary)
    STRING * const dest = Parrot_str_clone(interp, src);
    UINTVAL offs;

    for (offs = 0; offs < src->strlen; ++offs) {
        const UINTVAL c = ENCODING_GET_BYTE(interp, src, offs);
        ENCODING_SET_BYTE(interp, dest, offs, c);
    }

    dest->charset = Parrot_binary_charset_ptr;
    return dest;
}

/*

=item C<STRING * charset_cvt_ascii_to_iso_8859_1(PARROT_INTERP, STRING *src)>

Converts ASCII STRING C<src> to ISO8859-1 STRING C<dest>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
STRING *
charset_cvt_ascii_to_iso_8859_1(PARROT_INTERP, ARGIN(STRING *src))
{
    ASSERT_ARGS(charset_cvt_ascii_to_iso_8859_1)
    STRING * const dest = Parrot_str_clone(interp, src);
    UINTVAL offs;

    for (offs = 0; offs < src->strlen; ++offs) {
        const UINTVAL c = ENCODING_GET_BYTE(interp, src, offs);
        ENCODING_SET_BYTE(interp, dest, offs, c);
    }

    dest->charset = Parrot_iso_8859_1_charset_ptr;
    return dest;
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
