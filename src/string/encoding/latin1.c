/*
Copyright (C) 2004-2010, Parrot Foundation.
$Id$

=head1 NAME

src/string/encoding/latin1.c

=head1 DESCRIPTION

This file implements encoding functions for ISO-8859-1 strings.

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "latin1.h"
#include "shared.h"
#include "tables.h"

/* HEADERIZER HFILE: src/string/encoding/latin1.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CANNOT_RETURN_NULL
static STRING * latin1_chr(PARROT_INTERP, UINTVAL codepoint)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
static STRING* latin1_downcase(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING* latin1_downcase_first(PARROT_INTERP,
    ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL latin1_find_cclass(PARROT_INTERP,
    INTVAL flags,
    ARGIN(const STRING *src),
    UINTVAL offset,
    UINTVAL count)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

static INTVAL latin1_find_not_cclass(PARROT_INTERP,
    INTVAL flags,
    ARGIN(const STRING *src),
    UINTVAL offset,
    UINTVAL count)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

static INTVAL latin1_is_cclass(PARROT_INTERP,
    INTVAL flags,
    ARGIN(const STRING *src),
    UINTVAL offset)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_CANNOT_RETURN_NULL
static STRING* latin1_titlecase(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING* latin1_titlecase_first(PARROT_INTERP,
    ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static STRING * latin1_to_encoding(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING* latin1_upcase(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING* latin1_upcase_first(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static UINTVAL latin1_validate(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_latin1_chr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_latin1_downcase __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_latin1_downcase_first __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_latin1_find_cclass __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_latin1_find_not_cclass __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_latin1_is_cclass __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_latin1_titlecase __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_latin1_titlecase_first __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_latin1_to_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_latin1_upcase __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_latin1_upcase_first __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_latin1_validate __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*

=item C<static STRING * latin1_to_encoding(PARROT_INTERP, const STRING *src)>

Converts the STRING C<src> to an ISO-8859-1 STRING C<dest>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static STRING *
latin1_to_encoding(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(latin1_to_encoding)
    STRING      *dest;

    if (STRING_max_bytes_per_codepoint(src) == 1) {
        dest           = Parrot_str_clone(interp, src);
        dest->encoding = Parrot_latin1_encoding_ptr;
    }
    else {
        String_iter  iter;
        unsigned char *p;
        const UINTVAL len = src->strlen;

        dest = Parrot_str_new_init(interp, NULL, len,
                Parrot_latin1_encoding_ptr, 0);
        p    = (unsigned char *)dest->strstart;
        STRING_ITER_INIT(interp, &iter);

        while (iter.charpos < len) {
            const UINTVAL c = STRING_iter_get_and_advance(interp, src, &iter);
            if (c >= 0x100)
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_LOSSY_CONVERSION,
                    "lossy conversion to iso-8559-1");
            *p++ = c;
        }

        dest->bufused = len;
        dest->strlen  = len;
    }

    return dest;
}


/*

=item C<static STRING * latin1_chr(PARROT_INTERP, UINTVAL codepoint)>

Creates a new STRING from the single codepoint C<codepoint>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING *
latin1_chr(PARROT_INTERP, UINTVAL codepoint)
{
    ASSERT_ARGS(latin1_chr)
    char real_codepoint = (char)codepoint;
    STRING * const return_string = string_make(interp, &real_codepoint, 1,
            "iso-8859-1", 0);
    PARROT_ASSERT(codepoint < 0x100);
    return return_string;
}


/*

=item C<static UINTVAL latin1_validate(PARROT_INTERP, const STRING *src)>

Returns 1 if the STRING C<src> is a valid ISO-8859-1 STRING. Returns 0 otherwise.

=cut

*/

static UINTVAL
latin1_validate(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(latin1_validate)
    INTVAL offset;
    const INTVAL length =  Parrot_str_length(interp, src);

    for (offset = 0; offset < length; ++offset) {
        const UINTVAL codepoint = STRING_ord(interp, src, offset);
        if (codepoint >= 0x100)
            return 0;
    }
    return 1;
}


/*

=item C<static INTVAL latin1_is_cclass(PARROT_INTERP, INTVAL flags, const STRING
*src, UINTVAL offset)>

Returns Boolean.

=cut

*/

static INTVAL
latin1_is_cclass(PARROT_INTERP, INTVAL flags, ARGIN(const STRING *src), UINTVAL offset)
{
    ASSERT_ARGS(latin1_is_cclass)
    UINTVAL codepoint;

    if (offset >= src->strlen) return 0;
    codepoint = STRING_ord(interp, src, offset);

    if (codepoint >= sizeof (Parrot_ascii_typetable) /
                     sizeof (Parrot_ascii_typetable[0])) {
        return 0;
    }
    return (Parrot_iso_8859_1_typetable[codepoint] & flags) ? 1 : 0;
}


/*

=item C<static INTVAL latin1_find_cclass(PARROT_INTERP, INTVAL flags, const
STRING *src, UINTVAL offset, UINTVAL count)>

Find a character in the given character class.  Delegates to the find_cclass
method of the encoding plugin.

=cut

*/

static INTVAL
latin1_find_cclass(PARROT_INTERP, INTVAL flags,
                ARGIN(const STRING *src), UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(latin1_find_cclass)
    const unsigned char *contents = (const unsigned char *)src->strstart;
    UINTVAL pos = offset;
    UINTVAL end = offset + count;

    end = src->strlen < end ? src->strlen : end;
    for (; pos < end; ++pos) {
        if ((Parrot_iso_8859_1_typetable[contents[pos]] & flags) != 0) {
            return pos;
        }
    }
    return end;
}


/*

=item C<static INTVAL latin1_find_not_cclass(PARROT_INTERP, INTVAL flags, const
STRING *src, UINTVAL offset, UINTVAL count)>

Returns C<INTVAL>.

=cut

*/

static INTVAL
latin1_find_not_cclass(PARROT_INTERP, INTVAL flags,
                ARGIN(const STRING *src), UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(latin1_find_not_cclass)
    const unsigned char *contents = (const unsigned char *)src->strstart;
    UINTVAL pos = offset;
    UINTVAL end = offset + count;

    end = src->strlen < end ? src->strlen : end;
    for (; pos < end; ++pos) {
        if ((Parrot_iso_8859_1_typetable[contents[pos]] & flags) == 0) {
            return pos;
        }
    }
    return end;
}


/*

=item C<static STRING* latin1_upcase(PARROT_INTERP, const STRING *src)>

Convert all graphemes in the STRING C<src> to upper case, for those
graphemes that support cases.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
latin1_upcase(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(latin1_upcase)
    unsigned char *buffer;
    UINTVAL        offset = 0;
    STRING        *result = Parrot_str_clone(interp, src);

    if (!result->strlen)
        return result;

    buffer = (unsigned char *)result->strstart;
    for (offset = 0; offset < result->strlen; ++offset) {
        unsigned int c = buffer[offset]; /* XXX use encoding ? */
        if (c >= 0xe0 && c != 0xf7)
            c &= ~0x20;
        else
            c = toupper((unsigned char)c);
        buffer[offset] = (unsigned char)c;
    }

    return result;
}


/*

=item C<static STRING* latin1_downcase(PARROT_INTERP, const STRING *src)>

Converts all graphemes in STRING C<src> to lower-case, for those graphemes
that support cases.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
latin1_downcase(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(latin1_downcase)
    unsigned char *buffer;
    UINTVAL        offset = 0;
    STRING        *result = Parrot_str_clone(interp, src);

    if (!result->strlen)
        return result;

    buffer = (unsigned char *)result->strstart;
    for (offset = 0; offset < result->strlen; ++offset) {
        unsigned int c = buffer[offset];
        if (c >= 0xc0 && c != 0xd7 && c <= 0xde)
            c |= 0x20;
        else
            c = tolower((unsigned char)c);
        buffer[offset] = (unsigned char)c;
    }

    return result;
}


/*

=item C<static STRING* latin1_titlecase(PARROT_INTERP, const STRING *src)>

Converts the graphemes in STRING C<src> to title case, for those graphemes
that support cases.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
latin1_titlecase(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(latin1_titlecase)
    unsigned char *buffer;
    unsigned int   c;
    UINTVAL        offset;
    STRING        *result = Parrot_str_clone(interp, src);

    if (!result->strlen)
        return result;

    buffer = (unsigned char *)result->strstart;
    c = buffer[0];
    if (c >= 0xe0 && c != 0xf7)
        c &= ~0x20;
    else
        c = toupper((unsigned char)c);
    buffer[0] = (unsigned char)c;

    for (offset = 1; offset < result->strlen; ++offset) {
        c = buffer[offset];
        if (c >= 0xc0 && c != 0xd7 && c <= 0xde)
            c |= 0x20;
        else
            c = tolower((unsigned char)c);
        buffer[offset] = (unsigned char)c;
    }

    return result;
}


/*

=item C<static STRING* latin1_upcase_first(PARROT_INTERP, const STRING *src)>

Converts the first grapheme in STRING C<src> to upper case, if it
supports cases.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
latin1_upcase_first(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(latin1_upcase_first)
    unsigned char *buffer;
    unsigned int   c;
    STRING        *result = Parrot_str_clone(interp, src);

    if (!result->strlen)
        return result;

    buffer = (unsigned char *)result->strstart;
    c = buffer[0];
    if (c >= 0xe0 && c != 0xf7)
        c &= ~0x20;
    else
        c = toupper((unsigned char)c);
    buffer[0] = (unsigned char)c;

    return result;
}


/*

=item C<static STRING* latin1_downcase_first(PARROT_INTERP, const STRING *src)>

Converts the first character of the STRING C<src> to lower case, if the
grapheme supports lower case.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
latin1_downcase_first(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(latin1_downcase_first)
    unsigned char *buffer;
    unsigned int   c;
    STRING        *result = Parrot_str_clone(interp, src);

    if (!result->strlen)
        return result;

    buffer = (unsigned char *)result->strstart;
    c = buffer[0];
    if (c >= 0xc0 && c != 0xd7 && c <= 0xde)
        c &= ~0x20;
    else
        c = tolower((unsigned char)c);
    buffer[0] = (unsigned char)c;

    return result;
}


/*

=item C<static STRING* latin1_titlecase_first(PARROT_INTERP, const STRING *src)>

Converts the first grapheme in STRING C<src> to title case, if the grapheme
supports case.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
latin1_titlecase_first(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(latin1_titlecase_first)
    return latin1_upcase_first(interp, src);
}


static STR_VTABLE Parrot_latin1_encoding = {
    0,
    "iso-8859-1",
    NULL,
    1, /* Max bytes per codepoint */

    latin1_to_encoding,
    latin1_chr,

    fixed8_equal,
    fixed8_compare,
    fixed8_index,
    fixed8_rindex,
    fixed8_hash,
    latin1_validate,

    fixed8_scan,
    fixed8_ord,
    fixed8_substr,

    latin1_is_cclass,
    latin1_find_cclass,
    latin1_find_not_cclass,

    encoding_get_graphemes,
    fixed8_compose,
    encoding_decompose,

    latin1_upcase,
    latin1_downcase,
    latin1_titlecase,
    latin1_upcase_first,
    latin1_downcase_first,
    latin1_titlecase_first,

    fixed8_iter_get,
    fixed8_iter_skip,
    fixed8_iter_get_and_advance,
    fixed8_iter_set_and_advance,
    fixed8_iter_set_position
};

STR_VTABLE *Parrot_latin1_encoding_ptr = &Parrot_latin1_encoding;


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
