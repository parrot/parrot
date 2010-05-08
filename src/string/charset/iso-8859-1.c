/*
Copyright (C) 2004-2010, Parrot Foundation.
$Id$

=head1 NAME

src/string/charset/iso-8859-1.c

=head1 DESCRIPTION

This file implements the charset functions for iso-8859-1 data

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "iso-8859-1.h"
#include "ascii.h"

/* HEADERIZER HFILE: src/string/charset/iso-8859-1.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static STRING* compose(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING* decompose(PARROT_INTERP, SHIM(const STRING *src))
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
static STRING* downcase(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING* downcase_first(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

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
static STRING* titlecase_first(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static STRING * to_charset(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING * to_iso_8859_1(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING * to_unicode(PARROT_INTERP, ARGIN(const STRING *src))
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

static UINTVAL validate(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_compose __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_decompose __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
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
#define ASSERT_ARGS_to_charset __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_to_iso_8859_1 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_to_unicode __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
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

#include "tables.h"

/*

=item C<static STRING * to_iso_8859_1(PARROT_INTERP, const STRING *src)>

Converts STRING C<src> to iso-8859-1 in STRING C<dest>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING *
to_iso_8859_1(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(to_iso_8859_1)
    UINTVAL offs, src_len;
    String_iter iter;
    /* iso-8859-1 is never bigger then source */
    STRING * dest = Parrot_str_clone(interp, src);

    ENCODING_ITER_INIT(interp, src, &iter);
    src_len = src->strlen;
    dest->bufused = src_len;
    dest->charset = Parrot_iso_8859_1_charset_ptr;
    dest->encoding = Parrot_fixed_8_encoding_ptr;
    for (offs = 0; offs < src_len; ++offs) {
        const UINTVAL c = iter.get_and_advance(interp, &iter);
        if (c >= 0x100)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_LOSSY_CONVERSION,
                "lossy conversion to iso-8559-1");

        ENCODING_SET_BYTE(interp, dest, offs, c);
    }
    return dest;
}

/*

=item C<static STRING * to_unicode(PARROT_INTERP, const STRING *src)>

Converts STRING C<src> to unicode STRING C<dest>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING *
to_unicode(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(to_unicode)
    STRING * dest = Parrot_str_clone(interp, src);
    UINTVAL offs;
    String_iter iter;

    dest->charset = Parrot_unicode_charset_ptr;
    dest->encoding = CHARSET_GET_PREFERRED_ENCODING(interp, dest);
    Parrot_gc_reallocate_string_storage(interp, dest, src->strlen);
    ENCODING_ITER_INIT(interp, dest, &iter);
    for (offs = 0; offs < src->strlen; ++offs) {
        const UINTVAL c = ENCODING_GET_BYTE(interp, src, offs);

        if (iter.bytepos >= Buffer_buflen(dest) - 4) {
            UINTVAL need = (UINTVAL)((src->strlen - offs) * 1.5);
            if (need < 16)
                need = 16;
            Parrot_gc_reallocate_string_storage(interp, dest,
                    Buffer_buflen(dest) + need);
        }
        iter.set_and_advance(interp, &iter, c);
    }
    dest->bufused = iter.bytepos;
    dest->strlen  = iter.charpos;
    return dest;
}

/*

=item C<static STRING * to_charset(PARROT_INTERP, const STRING *src)>

Converts the STRING C<src> to an ISO-8859-1 STRING C<dest>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static STRING *
to_charset(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(to_charset)
    const charset_converter_t conversion_func =
        Parrot_find_charset_converter(interp, src->charset, Parrot_iso_8859_1_charset_ptr);

    if (conversion_func)
        return conversion_func(interp, src);
    else
        return to_iso_8859_1(interp, src);
}


/*

=item C<static STRING* compose(PARROT_INTERP, const STRING *src)>

ISO-8859-1 does not support composing, so we just copy the STRING C<src> and return the
copy.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static STRING*
compose(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(compose)

    STRING * const dest = Parrot_str_copy(interp, src);

    return dest;
}

/*

=item C<static STRING* decompose(PARROT_INTERP, const STRING *src)>

SO-8859-1 does not support decomposing, so we throw an exception.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
decompose(PARROT_INTERP, SHIM(const STRING *src))
{
    ASSERT_ARGS(decompose)
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
            "decompose for iso-8859-1 not implemented");
}

/*

=item C<static STRING* upcase(PARROT_INTERP, const STRING *src)>

Convert all graphemes in the STRING C<src> to upper case, for those
graphemes that support cases.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
upcase(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(upcase)
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

=item C<static STRING* downcase(PARROT_INTERP, const STRING *src)>

Converts all graphemes in STRING C<src> to lower-case, for those graphemes
that support cases.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
downcase(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(downcase)
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

=item C<static STRING* titlecase(PARROT_INTERP, const STRING *src)>

Converts the graphemes in STRING C<src> to title case, for those graphemes
that support cases.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
titlecase(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(titlecase)
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

=item C<static STRING* upcase_first(PARROT_INTERP, const STRING *src)>

Converts the first grapheme in STRING C<src> to upper case, if it
supports cases.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
upcase_first(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(upcase_first)
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

=item C<static STRING* downcase_first(PARROT_INTERP, const STRING *src)>

Converts the first character of the STRING C<src> to lower case, if the
grapheme supports lower case.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
downcase_first(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(downcase_first)
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

=item C<static STRING* titlecase_first(PARROT_INTERP, const STRING *src)>

Converts the first grapheme in STRING C<src> to title case, if the grapheme
supports case.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
titlecase_first(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(titlecase_first)
    return upcase_first(interp, src);
}


/*

=item C<static UINTVAL validate(PARROT_INTERP, const STRING *src)>

Returns 1 if the STRING C<src> is a valid ISO-8859-1 STRING. Returns 0 otherwise.

=cut

*/

static UINTVAL
validate(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(validate)
    INTVAL offset;

    for (offset = 0; offset < Parrot_str_length(interp, src); ++offset) {
        const UINTVAL codepoint = ENCODING_GET_CODEPOINT(interp, src, offset);
        if (codepoint >= 0x100)
            return 0;
    }
    return 1;
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

    if (offset >= src->strlen) return 0;
    codepoint = ENCODING_GET_CODEPOINT(interp, src, offset);

    if (codepoint >= sizeof (Parrot_ascii_typetable) /
                     sizeof (Parrot_ascii_typetable[0])) {
        return 0;
    }
    return (Parrot_iso_8859_1_typetable[codepoint] & flags) ? 1 : 0;
}

/*

=item C<static INTVAL find_cclass(PARROT_INTERP, INTVAL flags, const STRING
*src, UINTVAL offset, UINTVAL count)>

Find a character in the given character class.  Delegates to the find_cclass
method of the encoding plugin.

=cut

*/

static INTVAL
find_cclass(PARROT_INTERP, INTVAL flags,
                ARGIN(const STRING *src), UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(find_cclass)
    const UINTVAL pos = offset;
    UINTVAL end = offset + count;

    end = src->strlen < end ? src->strlen : end;
    return ENCODING_FIND_CCLASS(interp, src,
            Parrot_iso_8859_1_typetable, flags, pos, end);
}

/*

=item C<static INTVAL find_not_cclass(PARROT_INTERP, INTVAL flags, const STRING
*src, UINTVAL offset, UINTVAL count)>

=cut

*/

static INTVAL
find_not_cclass(PARROT_INTERP, INTVAL flags,
                ARGIN(const STRING *src), UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(find_not_cclass)
    UINTVAL pos = offset;
    UINTVAL end = offset + count;

    end = src->strlen < end ? src->strlen : end;
    for (; pos < end; ++pos) {
        const UINTVAL codepoint = ENCODING_GET_CODEPOINT(interp, src, pos);
        if ((Parrot_iso_8859_1_typetable[codepoint] & flags) == 0) {
            return pos;
        }
    }
    return end;
}


/*

=item C<static STRING * string_from_codepoint(PARROT_INTERP, UINTVAL codepoint)>

Creates a new STRING from the single codepoint C<codepoint>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING *
string_from_codepoint(PARROT_INTERP, UINTVAL codepoint)
{
    ASSERT_ARGS(string_from_codepoint)
    char real_codepoint = (char)codepoint;
    STRING * const return_string = string_make(interp, &real_codepoint, 1,
            "iso-8859-1", 0);
    return return_string;
}

/*

=item C<void Parrot_charset_iso_8859_1_init(PARROT_INTERP)>

Initializes the ISO-8859-1 charset by installing all the necessary function pointers.

=cut

*/

void
Parrot_charset_iso_8859_1_init(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_charset_iso_8859_1_init)
    CHARSET * const return_set = Parrot_new_charset(interp);
    static const CHARSET base_set = {
        "iso-8859-1",
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
    Parrot_register_charset(interp, "iso-8859-1", return_set);

    return;
}

/*

=item C<STRING * charset_cvt_iso_8859_1_to_ascii(PARROT_INTERP, const STRING
*src)>

Converts STRING C<src> in ISO-8859-1 to ASCII STRING C<dest>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
charset_cvt_iso_8859_1_to_ascii(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(charset_cvt_iso_8859_1_to_ascii)
    UINTVAL offs;
    STRING *dest = Parrot_str_clone(interp, src);

    for (offs = 0; offs < src->strlen; ++offs) {
        UINTVAL c = ENCODING_GET_BYTE(interp, src, offs);
        if (c >= 0x80)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_LOSSY_CONVERSION,
                "lossy conversion to ascii");

        ENCODING_SET_BYTE(interp, dest, offs, c);
    }
    return dest;
}

/*

=back

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
