/*
Copyright (C) 2001-2007, The Perl Foundation.
$Id$

=head1 NAME

src/encodings/ucs2.c - UCS-2 encoding

=head1 DESCRIPTION

UCS-2 encoding with the help of the ICU library.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "../unicode.h"

/* HEADERIZER HFILE: src/encodings/ucs2.h */

/* HEADERIZER BEGIN: static */

static void become_encoding(PARROT_INTERP, SHIM(STRING *src))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
static UINTVAL bytes(PARROT_INTERP, NOTNULL(STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
static UINTVAL codepoints(PARROT_INTERP, NOTNULL(STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static UINTVAL get_byte(PARROT_INTERP,
    SHIM(const STRING *src),
    UINTVAL offset)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING * get_bytes(PARROT_INTERP,
    SHIM(STRING *src),
    UINTVAL offset,
    UINTVAL count)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING * get_bytes_inplace(PARROT_INTERP,
    SHIM(STRING *src),
    UINTVAL offset,
    UINTVAL count,
    SHIM(STRING *return_string))
        __attribute__nonnull__(1);

static UINTVAL get_codepoint(PARROT_INTERP,
    ARGIN(const STRING *src),
    UINTVAL offset)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING * get_codepoints(PARROT_INTERP,
    NOTNULL(STRING *src),
    UINTVAL offset,
    UINTVAL count)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING * get_codepoints_inplace(PARROT_INTERP,
    SHIM(STRING *src),
    UINTVAL offset,
    UINTVAL count,
    SHIM(STRING *dest_string))
        __attribute__nonnull__(1);

static void iter_init(PARROT_INTERP,
    ARGIN(const STRING *src),
    NOTNULL(String_iter *iter))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void set_byte(PARROT_INTERP,
    SHIM(const STRING *src),
    UINTVAL offset,
    UINTVAL byte)
        __attribute__nonnull__(1);

static void set_bytes(PARROT_INTERP,
    SHIM(STRING *src),
    UINTVAL offset,
    UINTVAL count,
    SHIM(STRING *new_bytes))
        __attribute__nonnull__(1);

static void set_codepoint(PARROT_INTERP,
    NOTNULL(STRING *src),
    UINTVAL offset,
    UINTVAL codepoint)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void set_codepoints(PARROT_INTERP,
    SHIM(STRING *src),
    UINTVAL offset,
    UINTVAL count,
    SHIM(STRING *new_codepoints))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING * to_encoding(PARROT_INTERP,
    NOTNULL(STRING *src),
    NOTNULL(STRING *dest))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static UINTVAL ucs2_decode_and_advance(PARROT_INTERP,
    NOTNULL(String_iter *i))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void ucs2_encode_and_advance(PARROT_INTERP,
    NOTNULL(String_iter *i),
    UINTVAL c)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void ucs2_set_position(SHIM_INTERP,
    NOTNULL(String_iter *i),
    UINTVAL n)
        __attribute__nonnull__(2);

/* HEADERIZER END: static */

#include "ucs2.h"

#if PARROT_HAS_ICU
#  include <unicode/ustring.h>
#endif

#define UNIMPL real_exception(interp, NULL, UNIMPLEMENTED, "unimpl ucs2")



/*

=item C<PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
to_encoding(PARROT_INTERP, NOTNULL(STRING *src), NOTNULL(STRING *dest))>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
to_encoding(PARROT_INTERP, NOTNULL(STRING *src), NOTNULL(STRING *dest))
{
    STRING * const result =
        Parrot_utf16_encoding_ptr->to_encoding(interp, src, dest);
    /*
     * conversion to utf16 downgrads to ucs-2 if possible - check result
     */
    if (result->encoding == Parrot_utf16_encoding_ptr) {
        real_exception(interp, NULL, E_UnicodeError,
            "can't convert string with surrogates to ucs2");
    }
    return result;
}

/*

=item C<static UINTVAL
get_codepoint(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset)>

RT#48260: Not yet documented!!!

=cut

*/

static UINTVAL
get_codepoint(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset)
{
#if PARROT_HAS_ICU
    UChar * const s = (UChar*) src->strstart;
    return s[offset];
#else
    real_exception(interp, NULL, E_LibraryNotLoadedError,
            "no ICU lib loaded");
#endif
}

/*

=item C<static void
set_codepoint(PARROT_INTERP, NOTNULL(STRING *src), UINTVAL offset, UINTVAL codepoint)>

RT#48260: Not yet documented!!!

=cut

*/

static void
set_codepoint(PARROT_INTERP, NOTNULL(STRING *src), UINTVAL offset, UINTVAL codepoint)
{
#if PARROT_HAS_ICU
    UChar * const s = (UChar*) src->strstart;
    s[offset] = codepoint;
#else
    UNUSED(src);
    real_exception(interp, NULL, E_LibraryNotLoadedError,
            "no ICU lib loaded");
#endif
}

/*

=item C<static UINTVAL
get_byte(PARROT_INTERP, SHIM(const STRING *src), UINTVAL offset)>

RT#48260: Not yet documented!!!

=cut

*/

static UINTVAL
get_byte(PARROT_INTERP, SHIM(const STRING *src), UINTVAL offset)
{
    UNIMPL;
}

/*

=item C<static void
set_byte(PARROT_INTERP, SHIM(const STRING *src), UINTVAL offset, UINTVAL byte)>

RT#48260: Not yet documented!!!

=cut

*/

static void
set_byte(PARROT_INTERP, SHIM(const STRING *src), UINTVAL offset, UINTVAL byte)
{
    UNIMPL;
}

/*

=item C<PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
get_codepoints(PARROT_INTERP, NOTNULL(STRING *src), UINTVAL offset, UINTVAL count)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
get_codepoints(PARROT_INTERP, NOTNULL(STRING *src), UINTVAL offset, UINTVAL count)
{
    STRING * const return_string = Parrot_make_COW_reference(interp, src);
#if PARROT_HAS_ICU
    return_string->strstart = (char*)src->strstart + offset * sizeof (UChar);
    return_string->bufused = count * sizeof (UChar);
#else
    {
        String_iter iter;
        UINTVAL start;

        iter_init(interp, src, &iter);
        iter.set_position(interp, &iter, offset);
        start = iter.bytepos;
        return_string->strstart = (char *)return_string->strstart + start;
        iter.set_position(interp, &iter, offset + count);
        return_string->bufused = iter.bytepos - start;
    }
#endif
    return_string->strlen = count;
    return_string->hashval = 0;
    return return_string;
}

/*

=item C<PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
get_bytes(PARROT_INTERP, SHIM(STRING *src), UINTVAL offset, UINTVAL count)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
get_bytes(PARROT_INTERP, SHIM(STRING *src), UINTVAL offset, UINTVAL count)
{
    UNIMPL;
}


/*

=item C<PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
get_codepoints_inplace(PARROT_INTERP, SHIM(STRING *src),
        UINTVAL offset, UINTVAL count, SHIM(STRING *dest_string))>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
get_codepoints_inplace(PARROT_INTERP, SHIM(STRING *src),
        UINTVAL offset, UINTVAL count, SHIM(STRING *dest_string))
{

    UNIMPL;
}

/*

=item C<PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
get_bytes_inplace(PARROT_INTERP, SHIM(STRING *src),
        UINTVAL offset, UINTVAL count, SHIM(STRING *return_string))>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
get_bytes_inplace(PARROT_INTERP, SHIM(STRING *src),
        UINTVAL offset, UINTVAL count, SHIM(STRING *return_string))
{
    UNIMPL;
}

/*

=item C<static void
set_codepoints(PARROT_INTERP, SHIM(STRING *src),
        UINTVAL offset, UINTVAL count, SHIM(STRING *new_codepoints))>

RT#48260: Not yet documented!!!

=cut

*/

static void
set_codepoints(PARROT_INTERP, SHIM(STRING *src),
        UINTVAL offset, UINTVAL count, SHIM(STRING *new_codepoints))
{
    UNIMPL;
}

/*

=item C<static void
set_bytes(PARROT_INTERP, SHIM(STRING *src),
        UINTVAL offset, UINTVAL count, SHIM(STRING *new_bytes))>

RT#48260: Not yet documented!!!

=cut

*/

static void
set_bytes(PARROT_INTERP, SHIM(STRING *src),
        UINTVAL offset, UINTVAL count, SHIM(STRING *new_bytes))
{
    UNIMPL;
}

/*

=item C<static void
become_encoding(PARROT_INTERP, SHIM(STRING *src))>

Unconditionally makes the string be in this encoding, if that's valid

=cut

*/

static void
become_encoding(PARROT_INTERP, SHIM(STRING *src))
{
    UNIMPL;
}


/*

=item C<PARROT_WARN_UNUSED_RESULT
static UINTVAL
codepoints(PARROT_INTERP, NOTNULL(STRING *src))>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
static UINTVAL
codepoints(PARROT_INTERP, NOTNULL(STRING *src))
{
#if PARROT_HAS_ICU
    return src->bufused / sizeof (UChar);
#else
    real_exception(interp, NULL, E_LibraryNotLoadedError,
            "no ICU lib loaded");
#endif
}

/*

=item C<PARROT_WARN_UNUSED_RESULT
static UINTVAL
bytes(PARROT_INTERP, NOTNULL(STRING *src))>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
static UINTVAL
bytes(PARROT_INTERP, NOTNULL(STRING *src))
{
    return src->bufused;
}

/*

=item C<static UINTVAL
ucs2_decode_and_advance(PARROT_INTERP, NOTNULL(String_iter *i))>

RT#48260: Not yet documented!!!

=cut

*/

#if PARROT_HAS_ICU
static UINTVAL
ucs2_decode_and_advance(PARROT_INTERP, NOTNULL(String_iter *i))
{
    UChar * const s = (UChar*) i->str->strstart;
    size_t pos = i->bytepos / sizeof (UChar);

    /* TODO either make sure that we don't go past end or use SAFE
     *      iter versions
     */
    const UChar c = s[pos++];
    i->charpos++;
    i->bytepos = pos * sizeof (UChar);
    return c;
}

/*

=item C<static void
ucs2_encode_and_advance(PARROT_INTERP, NOTNULL(String_iter *i), UINTVAL c)>

RT#48260: Not yet documented!!!

=cut

*/

static void
ucs2_encode_and_advance(PARROT_INTERP, NOTNULL(String_iter *i), UINTVAL c)
{
    UChar * const s = (UChar*) i->str->strstart;
    UINTVAL pos = i->bytepos / sizeof (UChar);
    s[pos++] = (UChar)c;
    i->charpos++;
    i->bytepos = pos * sizeof (UChar);
}

/*

=item C<static void
ucs2_set_position(SHIM_INTERP, NOTNULL(String_iter *i), UINTVAL n)>

RT#48260: Not yet documented!!!

=cut

*/

static void
ucs2_set_position(SHIM_INTERP, NOTNULL(String_iter *i), UINTVAL n)
{
    i->charpos = n;
    i->bytepos = n * sizeof (UChar);
}

#endif

/*

=item C<static void
iter_init(PARROT_INTERP, ARGIN(const STRING *src), NOTNULL(String_iter *iter))>

RT#48260: Not yet documented!!!

=cut

*/

static void
iter_init(PARROT_INTERP, ARGIN(const STRING *src), NOTNULL(String_iter *iter))
{
#if PARROT_HAS_ICU
    iter->str = src;
    iter->bytepos = 0;
    iter->charpos = 0;
    iter->get_and_advance = ucs2_decode_and_advance;
    iter->set_and_advance = ucs2_encode_and_advance;
    iter->set_position =    ucs2_set_position;
#else
    real_exception(interp, NULL, E_LibraryNotLoadedError,
            "no ICU lib loaded");
#endif
}

/*

=item C<PARROT_CANNOT_RETURN_NULL
ENCODING *
Parrot_encoding_ucs2_init(PARROT_INTERP)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_CANNOT_RETURN_NULL
ENCODING *
Parrot_encoding_ucs2_init(PARROT_INTERP)
{
    ENCODING * const return_encoding = Parrot_new_encoding(interp);

    static const ENCODING base_encoding = {
        "ucs2",
        2, /* Max bytes per codepoint 0 .. 0x10ffff */
        to_encoding,
        get_codepoint,
        set_codepoint,
        get_byte,
        set_byte,
        get_codepoints,
        get_codepoints_inplace,
        get_bytes,
        get_bytes_inplace,
        set_codepoints,
        set_bytes,
        become_encoding,
        codepoints,
        bytes,
        iter_init
    };
    STRUCT_COPY(return_encoding, &base_encoding);
    Parrot_register_encoding(interp, "ucs2", return_encoding);
    return return_encoding;
}

/*

=back

=head1 SEE ALSO

F<src/encodings/fixed_8.c>,
F<src/encodings/utf8.c>,
F<src/string.c>,
F<include/parrot/string.h>,
F<docs/string.pod>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
