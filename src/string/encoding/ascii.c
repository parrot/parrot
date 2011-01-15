/*
Copyright (C) 2004-2010, Parrot Foundation.

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

static INTVAL ascii_partial_scan(PARROT_INTERP,
    ARGIN(const char *buf),
    ARGMOD(Parrot_String_Bounds *bounds))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*bounds);

static void ascii_scan(PARROT_INTERP, ARGMOD(STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*src);

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

#define ASSERT_ARGS_ascii_chr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_ascii_downcase __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_ascii_downcase_first __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_ascii_partial_scan __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(buf) \
    , PARROT_ASSERT_ARG(bounds))
#define ASSERT_ARGS_ascii_scan __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
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

    return fixed8_to_encoding(interp, src, Parrot_ascii_encoding_ptr);
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

=item C<static void ascii_scan(PARROT_INTERP, STRING *src)>

Returns the number of codepoints in string C<src>.

=cut

*/

static void
ascii_scan(PARROT_INTERP, ARGMOD(STRING *src))
{
    ASSERT_ARGS(ascii_scan)
    unsigned char *p = (unsigned char *)src->strstart;
    UINTVAL i;

    for (i = 0; i < src->bufused; ++i) {
        if (p[i] >= 0x80)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_STRING_REPRESENTATION,
                "Invalid character in ASCII string");
    }

    src->strlen = src->bufused;
}


/*

=item C<static INTVAL ascii_partial_scan(PARROT_INTERP, const char *buf,
Parrot_String_Bounds *bounds)>

Partial scan of ascii string. Stops after C<count> bytes or if character
C<delim> is found. Setting C<count> or C<delim> to -1 disables these tests.

=cut

*/

static INTVAL
ascii_partial_scan(PARROT_INTERP, ARGIN(const char *buf),
        ARGMOD(Parrot_String_Bounds *bounds))
{
    ASSERT_ARGS(ascii_partial_scan)
    UINTVAL       i;
    UINTVAL       len   = bounds->bytes;
    const INTVAL  chars = bounds->chars;
    const INTVAL  delim = bounds->delim;
    INTVAL        c     = -1;

    if (chars >= 0 && (UINTVAL)chars < len)
        len = chars;

    for (i = 0; i < len; ++i) {
        c = (unsigned char)buf[i];

        if (c >= 0x80)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_STRING_REPRESENTATION,
                "Invalid character in ASCII string");

        if (c == delim) {
            len = i + 1;
            break;
        }
    }

    bounds->bytes = len;
    bounds->chars = len;
    bounds->delim = c;

    return 0;
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
    -1,
    "ascii",
    NULL,
    1, /* Bytes per unit */
    1, /* Max bytes per codepoint */

    ascii_to_encoding,
    ascii_chr,

    fixed8_equal,
    fixed8_compare,
    fixed8_index,
    fixed8_rindex,
    fixed8_hash,

    ascii_scan,
    ascii_partial_scan,
    fixed8_ord,
    fixed_substr,

    fixed8_is_cclass,
    fixed8_find_cclass,
    fixed8_find_not_cclass,

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
    fixed8_iter_set_and_advance
};

STR_VTABLE *Parrot_ascii_encoding_ptr = &Parrot_ascii_encoding;


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

