/*
Copyright (C) 2004-2010, Parrot Foundation.
$Id$

=head1 NAME

src/string/encoding/ascii.c

=head1 DESCRIPTION

This file implements encoding functions for ASCII strings.

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "shared.h"
#include "tables.h"

/* HEADERIZER HFILE: none */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static STRING * ascii_chr(PARROT_INTERP, UINTVAL codepoint)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
static STRING* ascii_downcase(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING* ascii_downcase_first(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
static INTVAL ascii_find_cclass(PARROT_INTERP,
    INTVAL flags,
    ARGIN(const STRING *src),
    UINTVAL offset,
    UINTVAL count)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

static INTVAL ascii_find_not_cclass(PARROT_INTERP,
    INTVAL flags,
    ARGIN(const STRING *src),
    UINTVAL offset,
    UINTVAL count)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
static INTVAL ascii_is_cclass(PARROT_INTERP,
    INTVAL flags,
    ARGIN(const STRING *src),
    UINTVAL offset)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_CANNOT_RETURN_NULL
static STRING* ascii_titlecase(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING* ascii_titlecase_first(PARROT_INTERP,
    ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING * ascii_to_encoding(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING* ascii_upcase(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING* ascii_upcase_first(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
static UINTVAL ascii_validate(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_ascii_chr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_ascii_downcase __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_ascii_downcase_first __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_ascii_find_cclass __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_ascii_find_not_cclass __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_ascii_is_cclass __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_ascii_titlecase __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_ascii_titlecase_first __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_ascii_to_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_ascii_upcase __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_ascii_upcase_first __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_ascii_validate __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*

=item C<static STRING * ascii_to_encoding(PARROT_INTERP, const STRING *src)>

Converts STRING C<src> to ASCII charset STRING C<dest>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING *
ascii_to_encoding(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(ascii_to_encoding)
    STRING        *dest;

    if (STRING_max_bytes_per_codepoint(src) == 1) {
        unsigned char * const src_buf  = (unsigned char *)src->strstart;
        UINTVAL offs;

        for (offs = 0; offs < src->strlen; ++offs) {
            UINTVAL c = src_buf[offs];
            if (c >= 0x80)
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_LOSSY_CONVERSION,
                    "lossy conversion to ascii");
        }

        dest           = Parrot_str_clone(interp, src);
        dest->encoding = Parrot_ascii_encoding_ptr;
    }
    else {
        String_iter iter;
        unsigned char *p;
        const UINTVAL len = src->strlen;

        dest = Parrot_str_new_init(interp, NULL, len,
                Parrot_ascii_encoding_ptr, 0);
        p    = (unsigned char *)dest->strstart;
        STRING_ITER_INIT(interp, &iter);

        while (iter.charpos < len) {
            const UINTVAL c = STRING_iter_get_and_advance(interp, src, &iter);
            if (c >= 0x80)
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_LOSSY_CONVERSION,
                        "can't convert unicode string to ascii");
            *p++ = c;
        }

        dest->bufused = len;
        dest->strlen  = len;
    }

    return dest;
}

/*

=item C<static STRING * ascii_chr(PARROT_INTERP, UINTVAL codepoint)>

Creates a new STRING object from a single codepoint C<codepoint>. Returns
the new STRING.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static STRING *
ascii_chr(PARROT_INTERP, UINTVAL codepoint)
{
    ASSERT_ARGS(ascii_chr)
    char real_codepoint = (char)codepoint;
    return Parrot_str_new_init(interp, &real_codepoint, 1,
            Parrot_ascii_encoding_ptr, 0);
}

/*

=item C<static UINTVAL ascii_validate(PARROT_INTERP, const STRING *src)>

Verifies that the given string is valid ASCII. Returns 1 if it is ASCII,
returns 0 otherwise.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static UINTVAL
ascii_validate(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(ascii_validate)
    String_iter iter;
    const UINTVAL length = Parrot_str_length(interp, src);

    STRING_ITER_INIT(interp, &iter);
    while (iter.charpos < length) {
        const UINTVAL codepoint = STRING_iter_get_and_advance(interp, src, &iter);
        if (codepoint >= 0x80)
            return 0;
    }
    return 1;
}

/*

=item C<static INTVAL ascii_is_cclass(PARROT_INTERP, INTVAL flags, const STRING
*src, UINTVAL offset)>

Returns Boolean.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static INTVAL
ascii_is_cclass(PARROT_INTERP, INTVAL flags, ARGIN(const STRING *src), UINTVAL offset)
{
    ASSERT_ARGS(ascii_is_cclass)
    UINTVAL codepoint;

    if (offset >= src->strlen)
        return 0;
    codepoint = STRING_ord(interp, src, offset);

    if (codepoint >= sizeof (Parrot_ascii_typetable) / sizeof (Parrot_ascii_typetable[0])) {
        return 0;
    }
    return (Parrot_ascii_typetable[codepoint] & flags) ? 1 : 0;
}

/*

=item C<static INTVAL ascii_find_cclass(PARROT_INTERP, INTVAL flags, const
STRING *src, UINTVAL offset, UINTVAL count)>

Find a character in the given character class.  Delegates to the find_cclass
method of the encoding plugin.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static INTVAL
ascii_find_cclass(PARROT_INTERP, INTVAL flags, ARGIN(const STRING *src), UINTVAL offset,
                    UINTVAL count)
{
    ASSERT_ARGS(ascii_find_cclass)
    const unsigned char *contents = (const unsigned char *)src->strstart;
    UINTVAL pos = offset;
    UINTVAL end = offset + count;

    end = src->strlen < end ? src->strlen : end;
    for (; pos < end; ++pos) {
        if ((Parrot_ascii_typetable[contents[pos]] & flags) != 0) {
            return pos;
        }
    }
    return end;
}

/*

=item C<static INTVAL ascii_find_not_cclass(PARROT_INTERP, INTVAL flags, const
STRING *src, UINTVAL offset, UINTVAL count)>

Returns C<INTVAL>.

=cut

*/

static INTVAL
ascii_find_not_cclass(PARROT_INTERP,
                INTVAL flags, ARGIN(const STRING *src), UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(ascii_find_not_cclass)
    const unsigned char *contents = (const unsigned char *)src->strstart;
    UINTVAL pos = offset;
    UINTVAL end = offset + count;

    end = src->strlen < end ? src->strlen : end;
    for (; pos < end; ++pos) {
        if ((Parrot_ascii_typetable[contents[pos]] & flags) == 0) {
            return pos;
        }
    }
    return end;
}

/*

=item C<static STRING* ascii_upcase(PARROT_INTERP, const STRING *src)>

Converts the STRING C<src> to all uppercase.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
ascii_upcase(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(ascii_upcase)
    STRING * const result = Parrot_str_clone(interp, src);
    const UINTVAL n = src->strlen;

    if (n) {
        char * const buffer = result->strstart;
        UINTVAL offset;

        for (offset = 0; offset < n; ++offset) {
            buffer[offset] = (char)toupper((unsigned char)buffer[offset]);
        }
    }

    return result;
}

/*

=item C<static STRING* ascii_downcase(PARROT_INTERP, const STRING *src)>

Converts the STRING C<src> to all lower-case.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
ascii_downcase(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(ascii_downcase)
    STRING       *result = Parrot_str_clone(interp, src);
    const UINTVAL n      = src->strlen;

    if (n) {
        char * const buffer = result->strstart;
        UINTVAL offset;

        for (offset = 0; offset < n; ++offset) {
            buffer[offset] = (char)tolower((unsigned char)buffer[offset]);
        }
    }

    return result;
}

/*

=item C<static STRING* ascii_titlecase(PARROT_INTERP, const STRING *src)>

Converts the STRING given by C<src> to title case, where
the first character is upper case and all the rest of the characters
are lower-case.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
ascii_titlecase(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(ascii_titlecase)
    STRING       *result = Parrot_str_clone(interp, src);
    const UINTVAL n      = src->strlen;

    if (n) {
        char * const buffer = result->strstart;
        UINTVAL offset;

        buffer[0] = (char)toupper((unsigned char)buffer[0]);
        for (offset = 1; offset < n; ++offset) {
            buffer[offset] = (char)tolower((unsigned char)buffer[offset]);
        }
    }

    return result;
}

/*

=item C<static STRING* ascii_upcase_first(PARROT_INTERP, const STRING *src)>

Sets the first character in the STRING C<src> to upper case,
but doesn't modify the rest of the string.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
ascii_upcase_first(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(ascii_upcase_first)
    STRING * const result = Parrot_str_clone(interp, src);

    if (result->strlen > 0) {
        char * const buffer = result->strstart;
        buffer[0] = (char)toupper((unsigned char)buffer[0]);
    }

    return result;
}

/*

=item C<static STRING* ascii_downcase_first(PARROT_INTERP, const STRING *src)>

Sets the first character of the STRING C<src> to lowercase,
but doesn't modify the rest of the characters.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
ascii_downcase_first(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(ascii_downcase_first)
    STRING * const result = Parrot_str_clone(interp, src);

    if (result->strlen > 0) {
        char * const buffer = result->strstart;
        buffer[0] = (char)tolower((unsigned char)buffer[0]);
    }

    return result;
}

/*

=item C<static STRING* ascii_titlecase_first(PARROT_INTERP, const STRING *src)>

Converts the first letter of STRING C<src> to upper case,
but doesn't modify the rest of the string.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
ascii_titlecase_first(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(ascii_titlecase_first)
    STRING * const result = Parrot_str_clone(interp, src);

    if (result->strlen > 0) {
        char * const buffer = result->strstart;
        buffer[0] = (char)toupper((unsigned char)buffer[0]);
    }

    return result;
}

static STR_VTABLE Parrot_ascii_encoding = {
    0,
    "ascii",
    NULL,
    1, /* Max bytes per codepoint */

    ascii_to_encoding,
    ascii_chr,

    fixed8_equal,
    fixed8_compare,
    fixed8_index,
    fixed8_rindex,
    fixed8_hash,
    ascii_validate,

    fixed8_scan,
    fixed8_ord,
    fixed_substr,

    ascii_is_cclass,
    ascii_find_cclass,
    ascii_find_not_cclass,

    encoding_get_graphemes,
    fixed8_compose,
    encoding_decompose,

    ascii_upcase,
    ascii_downcase,
    ascii_titlecase,
    ascii_upcase_first,
    ascii_downcase_first,
    ascii_titlecase_first,

    fixed8_iter_get,
    fixed8_iter_skip,
    fixed8_iter_get_and_advance,
    fixed8_iter_set_and_advance,
    fixed8_iter_set_position
};

STR_VTABLE *Parrot_ascii_encoding_ptr = &Parrot_ascii_encoding;


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

