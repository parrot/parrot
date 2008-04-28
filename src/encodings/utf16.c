/*
Copyright (C) 2001-2007, The Perl Foundation.
$Id$

=head1 NAME

src/encodings/utf16.c - UTF-16 encoding

=head1 DESCRIPTION

UTF-16 encoding with the help of the ICU library.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "../unicode.h"

/* HEADERIZER HFILE: src/encodings/utf16.h */

/* HEADERIZER BEGIN: static */

static void become_encoding(PARROT_INTERP, SHIM(STRING *src))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
static UINTVAL bytes(SHIM_INTERP, ARGIN(STRING *src))
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
static UINTVAL codepoints(PARROT_INTERP, ARGIN(STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static UINTVAL get_byte(SHIM_INTERP,
    ARGIN(const STRING *src),
    UINTVAL offset)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING * get_bytes(PARROT_INTERP,
    ARGIN(STRING *src),
    UINTVAL offset,
    UINTVAL count)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING * get_bytes_inplace(PARROT_INTERP,
    ARGIN(STRING *src),
    UINTVAL offset,
    UINTVAL count,
    ARGIN(STRING *return_string))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(5);

static UINTVAL get_codepoint(PARROT_INTERP,
    ARGIN(const STRING *src),
    UINTVAL offset)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING * get_codepoints(PARROT_INTERP,
    ARGIN(STRING *src),
    UINTVAL offset,
    UINTVAL count)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING * get_codepoints_inplace(PARROT_INTERP,
    ARGIN(STRING *src),
    UINTVAL offset,
    UINTVAL count,
    ARGMOD(STRING *return_string))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*return_string);

static void iter_init(PARROT_INTERP,
    ARGIN(const STRING *src),
    ARGOUT(String_iter *iter))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*iter);

static void set_byte(PARROT_INTERP,
    ARGIN(const STRING *src),
    UINTVAL offset,
    UINTVAL byte)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void set_bytes(PARROT_INTERP,
    SHIM(STRING *src),
    UINTVAL offset,
    UINTVAL count,
    SHIM(STRING *new_bytes))
        __attribute__nonnull__(1);

static void set_codepoint(PARROT_INTERP,
    ARGIN(STRING *src),
    UINTVAL offset,
    UINTVAL codepoint)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void set_codepoints(PARROT_INTERP,
    ARGIN(STRING *src),
    UINTVAL offset,
    UINTVAL count,
    ARGIN(STRING *new_codepoints))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(5);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING * to_encoding(PARROT_INTERP,
    ARGIN(STRING *src),
    ARGIN_NULLOK(STRING *dest))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
static UINTVAL utf16_decode_and_advance(PARROT_INTERP,
    ARGMOD(String_iter *i))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*i);

static void utf16_encode_and_advance(PARROT_INTERP,
    ARGMOD(String_iter *i),
    UINTVAL c)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*i);

static void utf16_set_position(PARROT_INTERP,
    ARGMOD(String_iter *i),
    UINTVAL n)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*i);

/* HEADERIZER END: static */

#include "utf16.h"

#if PARROT_HAS_ICU
#  include <unicode/utf16.h>
#  include <unicode/ustring.h>
#endif

#define UNIMPL real_exception(interp, NULL, UNIMPLEMENTED, "unimpl utf16")


/*

=item C<static STRING * to_encoding>

Convert string C<src> to this encoding. If C<dest> is set
fill it with the converted result, else operate inplace.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
to_encoding(PARROT_INTERP, ARGIN(STRING *src), ARGIN_NULLOK(STRING *dest))
{
#if PARROT_HAS_ICU
    UErrorCode err;
    int dest_len;
    UChar *p;
#endif
    int src_len;
    int in_place = dest == NULL;
    STRING *result;

    if (src->encoding == Parrot_utf16_encoding_ptr ||
            src->encoding == Parrot_ucs2_encoding_ptr)
        return in_place ? src : string_copy(interp, src);
    /*
     * TODO adapt string creation functions
     */
    src_len = src->strlen;
    if (in_place) {
        result = src;
    }
    else {
        result = dest;
    }
    if (!src_len) {
        result->charset  = Parrot_unicode_charset_ptr;
        result->encoding = Parrot_ucs2_encoding_ptr;
        result->strlen = result->bufused = 0;
        return result;
    }
    /*
       u_strFromUTF8(UChar *dest,
       int32_t destCapacity,
       int32_t *pDestLength,
       const char *src,
       int32_t srcLength,
       UErrorCode *pErrorCode);
       */
#if PARROT_HAS_ICU
    if (in_place) {
        /* need intermediate memory */
        p = (UChar *)mem_sys_allocate(src_len * sizeof (UChar));
    }
    else {
        Parrot_reallocate_string(interp, dest, sizeof (UChar) * src_len);
        p = (UChar *)dest->strstart;
    }
    if (src->charset == Parrot_iso_8859_1_charset_ptr ||
            src->charset == Parrot_ascii_charset_ptr) {
        for (dest_len = 0; dest_len < (int)src->strlen; ++dest_len) {
            p[dest_len] = (UChar)((unsigned char*)src->strstart)[dest_len];
        }
    }
    else {
        err = U_ZERO_ERROR;
        u_strFromUTF8(p, src_len,
                &dest_len, src->strstart, src->bufused, &err);
        if (!U_SUCCESS(err)) {
            /*
             * have to resize - required len in UChars is in dest_len
             */
            if (in_place)
                p = (UChar *)mem_sys_realloc(p, dest_len * sizeof (UChar));
            else {
                result->bufused = dest_len * sizeof (UChar);
                Parrot_reallocate_string(interp, dest,
                                         sizeof (UChar) * dest_len);
                p = (UChar *)dest->strstart;
            }
            u_strFromUTF8(p, dest_len,
                    &dest_len, src->strstart, src->bufused, &err);
            PARROT_ASSERT(U_SUCCESS(err));
        }
    }
    result->bufused = dest_len * sizeof (UChar);
    if (in_place) {
        Parrot_reallocate_string(interp, src, src->bufused);
        memcpy(src->strstart, p, src->bufused);
        mem_sys_free(p);
    }
    result->charset  = Parrot_unicode_charset_ptr;
    result->encoding = Parrot_utf16_encoding_ptr;
    result->strlen = src_len;

    /* downgrade if possible */
    if (dest_len == (int)src->strlen)
        result->encoding = Parrot_ucs2_encoding_ptr;
    return result;
#else
    real_exception(interp, NULL, E_LibraryNotLoadedError,
            "no ICU lib loaded");
#endif
}

/*

=item C<static UINTVAL get_codepoint>

RT#48260: Not yet documented!!!

=cut

*/

static UINTVAL
get_codepoint(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset)
{
#if PARROT_HAS_ICU
    UChar * const s = (UChar*) src->strstart;
    UINTVAL c, pos;

    pos = 0;
    U16_FWD_N_UNSAFE(s, pos, offset);
    U16_GET_UNSAFE(s, pos, c);
    return c;
#else
    UNUSED(src);
    UNUSED(offset);

    real_exception(interp, NULL, E_LibraryNotLoadedError, "no ICU lib loaded");
#endif
}

/*

=item C<static void set_codepoint>

RT#48260: Not yet documented!!!

=cut

*/

static void
set_codepoint(PARROT_INTERP, ARGIN(STRING *src), UINTVAL offset, UINTVAL codepoint)
{
    UNIMPL;
    UNUSED(interp);
    UNUSED(src);
    UNUSED(offset);
    UNUSED(codepoint);
}

/*

=item C<static UINTVAL get_byte>

RT#48260: Not yet documented!!!

=cut

*/

static UINTVAL
get_byte(SHIM_INTERP, ARGIN(const STRING *src), UINTVAL offset)
{
    const unsigned char * const contents = (unsigned char *)src->strstart;
    if (offset >= src->bufused) {
/*        real_exception(interp, NULL, 0,
                "get_byte past the end of the buffer (%i of %i)",
                offset, src->bufused);*/
        return 0;
    }
    return contents[offset];
}

/*

=item C<static void set_byte>

RT#48260: Not yet documented!!!

=cut

*/

static void
set_byte(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset, UINTVAL byte)
{
    unsigned char *contents;
    if (offset >= src->bufused) {
        real_exception(interp, NULL, 0, "set_byte past the end of the buffer");
    }
    contents = (unsigned char *)src->strstart;
    contents[offset] = (unsigned char)byte;
}

/*

=item C<static STRING * get_codepoints>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
get_codepoints(PARROT_INTERP, ARGIN(STRING *src), UINTVAL offset, UINTVAL count)
{
    String_iter iter;
    UINTVAL start;
    STRING * const return_string = Parrot_make_COW_reference(interp, src);

    iter_init(interp, src, &iter);
    iter.set_position(interp, &iter, offset);
    start = iter.bytepos;
    return_string->strstart = (char *)return_string->strstart + start ;
    iter.set_position(interp, &iter, offset + count);
    return_string->bufused = iter.bytepos - start;
    return_string->strlen = count;
    return_string->hashval = 0;
    return return_string;
}


/*

=item C<static STRING * get_codepoints_inplace>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
get_codepoints_inplace(PARROT_INTERP, ARGIN(STRING *src),
        UINTVAL offset, UINTVAL count, ARGMOD(STRING *return_string))
{
    String_iter iter;
    UINTVAL start;
    Parrot_reuse_COW_reference(interp, src, return_string);
    iter_init(interp, src, &iter);
    iter.set_position(interp, &iter, offset);
    start = iter.bytepos;
    return_string->strstart = (char *)return_string->strstart + start ;
    iter.set_position(interp, &iter, offset + count);
    return_string->bufused = iter.bytepos - start;
    return_string->strlen = count;
    return_string->hashval = 0;
    return return_string;
}

/*

=item C<static STRING * get_bytes>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
get_bytes(PARROT_INTERP, ARGIN(STRING *src), UINTVAL offset, UINTVAL count)
{
    UNIMPL;
    UNUSED(interp);
    UNUSED(src);
    UNUSED(offset)
    UNUSED(count);
}

/*

=item C<static STRING * get_bytes_inplace>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
get_bytes_inplace(PARROT_INTERP, ARGIN(STRING *src),
        UINTVAL offset, UINTVAL count, ARGIN(STRING *return_string))
{
    UNIMPL;
    UNUSED(interp);
    UNUSED(src);
    UNUSED(offset)
    UNUSED(count);
    UNUSED(return_string);
}

/*

=item C<static void set_codepoints>

RT#48260: Not yet documented!!!

=cut

*/

static void
set_codepoints(PARROT_INTERP, ARGIN(STRING *src),
        UINTVAL offset, UINTVAL count, ARGIN(STRING *new_codepoints))
{
    UNIMPL;
    UNUSED(interp);
    UNUSED(src);
    UNUSED(offset)
    UNUSED(count);
    UNUSED(new_codepoints);
}

/*

=item C<static void set_bytes>

RT#48260: Not yet documented!!!

=cut

*/

static void
set_bytes(PARROT_INTERP, SHIM(STRING *src),
        UINTVAL offset, UINTVAL count, SHIM(STRING *new_bytes))
{
    UNIMPL;
    UNUSED(interp);
    UNUSED(offset)
    UNUSED(count);
}

/*

=item C<static void become_encoding>

Unconditionally makes the string be in this encoding, if that's valid

=cut

*/

static void
become_encoding(PARROT_INTERP, SHIM(STRING *src))
{
    UNIMPL;
}


/*

=item C<static UINTVAL codepoints>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
static UINTVAL
codepoints(PARROT_INTERP, ARGIN(STRING *src))
{
    String_iter iter;
    /*
     * this is used to initially calculate src->strlen,
     * therefore we must scan the whole string
     */
    iter_init(interp, src, &iter);
    while (iter.bytepos < src->bufused)
        iter.get_and_advance(interp, &iter);
    return iter.charpos;
}

/*

=item C<static UINTVAL bytes>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
static UINTVAL
bytes(SHIM_INTERP, ARGIN(STRING *src))
{
    return src->bufused;
}

#if PARROT_HAS_ICU
/*

=item C<static UINTVAL utf16_decode_and_advance>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
static UINTVAL
utf16_decode_and_advance(PARROT_INTERP, ARGMOD(String_iter *i))
{
    UChar *s = (UChar*) i->str->strstart;
    UINTVAL c, pos;
    pos = i->bytepos / sizeof (UChar);
    /* TODO either make sure that we don't go past end or use SAFE
     *      iter versions
     */
    U16_NEXT_UNSAFE(s, pos, c);
    i->charpos++;
    i->bytepos = pos * sizeof (UChar);
    return c;
}

/*

=item C<static void utf16_encode_and_advance>

RT#48260: Not yet documented!!!

=cut

*/

static void
utf16_encode_and_advance(PARROT_INTERP, ARGMOD(String_iter *i), UINTVAL c)
{
    UChar *s = (UChar*) i->str->strstart;
    UINTVAL pos;
    pos = i->bytepos / sizeof (UChar);
    U16_APPEND_UNSAFE(s, pos, c);
    i->charpos++;
    i->bytepos = pos * sizeof (UChar);
}

/*

=item C<static void utf16_set_position>

RT#48260: Not yet documented!!!

=cut

*/

static void
utf16_set_position(PARROT_INTERP, ARGMOD(String_iter *i), UINTVAL n)
{
    UChar * const s = (UChar*) i->str->strstart;
    UINTVAL pos;
    pos = 0;
    U16_FWD_N_UNSAFE(s, pos, n);
    i->charpos = n;
    i->bytepos = pos * sizeof (UChar);
}

#endif

/*

=item C<static void iter_init>

RT#48260: Not yet documented!!!

=cut

*/

static void
iter_init(PARROT_INTERP, ARGIN(const STRING *src), ARGOUT(String_iter *iter))
{
    iter->str = src;
    iter->bytepos = iter->charpos = 0;
#if PARROT_HAS_ICU
    iter->get_and_advance = utf16_decode_and_advance;
    iter->set_and_advance = utf16_encode_and_advance;
    iter->set_position =    utf16_set_position;
#else
    real_exception(interp, NULL, E_LibraryNotLoadedError,
            "no ICU lib loaded");
#endif
}

/*

=item C<ENCODING * Parrot_encoding_utf16_init>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_CANNOT_RETURN_NULL
ENCODING *
Parrot_encoding_utf16_init(PARROT_INTERP)
{
    ENCODING * const return_encoding = Parrot_new_encoding(interp);

    static const ENCODING base_encoding = {
        "utf16",
        4, /* Max bytes per codepoint 0 .. 0x10ffff */
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
    STRUCT_COPY_FROM_STRUCT(return_encoding, base_encoding);
    Parrot_register_encoding(interp, "utf16", return_encoding);
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
