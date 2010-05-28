/*
Copyright (C) 2001-2010, Parrot Foundation.
$Id$

=head1 NAME

src/string/encoding/utf16.c - UTF-16 encoding

=head1 DESCRIPTION

UTF-16 encoding with the help of the ICU library.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "../unicode.h"

/* HEADERIZER HFILE: src/string/encoding/utf16.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
static UINTVAL bytes(SHIM_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
static UINTVAL codepoints(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
static UINTVAL find_cclass(PARROT_INTERP,
    ARGIN(const STRING *s),
    ARGIN(const INTVAL *typetable),
    INTVAL flags,
    UINTVAL pos,
    UINTVAL end)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static UINTVAL get_byte(SHIM_INTERP,
    ARGIN(const STRING *src),
    UINTVAL offset)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING * get_bytes(PARROT_INTERP,
    ARGIN(const STRING *src),
    UINTVAL offset,
    UINTVAL count)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static UINTVAL get_codepoint(PARROT_INTERP,
    ARGIN(const STRING *src),
    UINTVAL offset)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING * get_codepoints(PARROT_INTERP,
    ARGIN(const STRING *src),
    UINTVAL offset,
    UINTVAL count)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

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

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING * to_encoding(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
static UINTVAL utf16_decode_and_advance(SHIM_INTERP, ARGMOD(String_iter *i))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*i);

static void utf16_encode_and_advance(SHIM_INTERP,
    ARGMOD(String_iter *i),
    UINTVAL c)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*i);

static void utf16_set_position(SHIM_INTERP,
    ARGMOD(String_iter *i),
    UINTVAL n)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*i);

#define ASSERT_ARGS_bytes __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_codepoints __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_find_cclass __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s) \
    , PARROT_ASSERT_ARG(typetable))
#define ASSERT_ARGS_get_byte __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_get_bytes __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_get_codepoint __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_get_codepoints __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_iter_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src) \
    , PARROT_ASSERT_ARG(iter))
#define ASSERT_ARGS_set_byte __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_to_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_utf16_decode_and_advance __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(i))
#define ASSERT_ARGS_utf16_encode_and_advance __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(i))
#define ASSERT_ARGS_utf16_set_position __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(i))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

#include "utf16.h"

#if PARROT_HAS_ICU
#  include <unicode/utf16.h>
#  include <unicode/ustring.h>
#endif

#define UNIMPL Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED, \
    "unimpl utf16")


/*

=item C<static STRING * to_encoding(PARROT_INTERP, const STRING *src)>

Converts the string C<src> to this particular encoding.  If C<dest> is
provided, it will contain the result.  Otherwise this function operates in
place.


=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
to_encoding(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(to_encoding)
#if PARROT_HAS_ICU
    UErrorCode err;
    int dest_len;
    UChar *p;
#endif
    int src_len;
    STRING *result;

    if (src->encoding == Parrot_utf16_encoding_ptr ||
            src->encoding == Parrot_ucs2_encoding_ptr)
        return Parrot_str_clone(interp, src);

    result = Parrot_gc_new_string_header(interp, 0);

    result->extra = NULL;
    /*
     * TODO adapt string creation functions
     */
    src_len = src->strlen;
    if (!src_len) {
        result->charset  = Parrot_unicode_charset_ptr;
        result->encoding = Parrot_ucs2_encoding_ptr;
        result->strlen = result->bufused = 0;
        return result;
    }
#if PARROT_HAS_ICU
    Parrot_gc_allocate_string_storage(interp, result, sizeof (UChar) * src_len);
    p = (UChar *)result->strstart;

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
            result->bufused = dest_len * sizeof (UChar);
            Parrot_gc_reallocate_string_storage(interp, result,
                                     sizeof (UChar) * dest_len);
            p = (UChar *)result->strstart;
            u_strFromUTF8(p, dest_len,
                    &dest_len, src->strstart, src->bufused, &err);
            PARROT_ASSERT(U_SUCCESS(err));
        }
    }
    result->bufused = dest_len * sizeof (UChar);
    result->charset  = Parrot_unicode_charset_ptr;
    result->encoding = Parrot_utf16_encoding_ptr;
    result->strlen = src_len;

    /* downgrade if possible */
    if (dest_len == (int)src->strlen)
        result->encoding = Parrot_ucs2_encoding_ptr;
    return result;
#else
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_LIBRARY_ERROR,
        "no ICU lib loaded");
#endif
}

/*

=item C<static UINTVAL get_codepoint(PARROT_INTERP, const STRING *src, UINTVAL
offset)>

Returns the codepoint in string C<src> at position C<offset>.

=cut

*/

static UINTVAL
get_codepoint(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset)
{
    ASSERT_ARGS(get_codepoint)
#if PARROT_HAS_ICU
    const UChar * const s = (UChar*) src->strstart;
    UINTVAL c, pos;
    UNUSED(interp);

    pos = 0;
    U16_FWD_N_UNSAFE(s, pos, offset);
    U16_GET_UNSAFE(s, pos, c);
    return c;
#else
    UNUSED(src);
    UNUSED(offset);

    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_LIBRARY_ERROR,
        "no ICU lib loaded");
#endif
}


/*

=item C<static UINTVAL find_cclass(PARROT_INTERP, const STRING *s, const INTVAL
*typetable, INTVAL flags, UINTVAL pos, UINTVAL end)>

Stub, the charset level handles this for unicode strings.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static UINTVAL
find_cclass(PARROT_INTERP, ARGIN(const STRING *s), ARGIN(const INTVAL *typetable),
INTVAL flags, UINTVAL pos, UINTVAL end)
{
    UNUSED(s);
    UNUSED(typetable);
    UNUSED(flags);
    UNUSED(pos);
    UNUSED(end);

    Parrot_ex_throw_from_c_args(interp, NULL,
        EXCEPTION_UNIMPLEMENTED,
        "No find_cclass support in unicode encoding plugins");
}

/*

=item C<static UINTVAL get_byte(PARROT_INTERP, const STRING *src, UINTVAL
offset)>

Returns the byte in string C<src> at position C<offset>.

=cut

*/

static UINTVAL
get_byte(SHIM_INTERP, ARGIN(const STRING *src), UINTVAL offset)
{
    ASSERT_ARGS(get_byte)
    const unsigned char * const contents = (unsigned char *)src->strstart;
    if (offset >= src->bufused) {
/*        Parrot_ex_throw_from_c_args(interp, NULL, 0,
                "get_byte past the end of the buffer (%i of %i)",
                offset, src->bufused); */
        return 0;
    }
    return contents[offset];
}

/*

=item C<static void set_byte(PARROT_INTERP, const STRING *src, UINTVAL offset,
UINTVAL byte)>

Sets, in string C<src> at position C<offset>, the byte C<byte>.

=cut

*/

static void
set_byte(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset, UINTVAL byte)
{
    ASSERT_ARGS(set_byte)
    unsigned char *contents;

    if (offset >= src->bufused)
        Parrot_ex_throw_from_c_args(interp, NULL, 0,
            "set_byte past the end of the buffer");

    contents = (unsigned char *)src->strstart;
    contents[offset] = (unsigned char)byte;
}

/*

=item C<static STRING * get_codepoints(PARROT_INTERP, const STRING *src, UINTVAL
offset, UINTVAL count)>

Returns the codepoints in string C<src> at position C<offset> and length
C<count>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
get_codepoints(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(get_codepoints)
    String_iter iter;
    UINTVAL start;
    STRING * const return_string = Parrot_str_copy(interp, src);

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

=item C<static STRING * get_bytes(PARROT_INTERP, const STRING *src, UINTVAL
offset, UINTVAL count)>

Returns the bytes in string C<src> at position C<offset> and length C<count>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
get_bytes(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(get_bytes)
    UNUSED(interp);
    UNUSED(src);
    UNUSED(offset)
    UNUSED(count);
    UNIMPL;
}

/*

=item C<static UINTVAL codepoints(PARROT_INTERP, const STRING *src)>

Returns the number of codepoints in string C<src>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static UINTVAL
codepoints(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(codepoints)
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

=item C<static UINTVAL bytes(PARROT_INTERP, const STRING *src)>

Returns the number of bytes in string C<src>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static UINTVAL
bytes(SHIM_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(bytes)
    return src->bufused;
}

#if PARROT_HAS_ICU
/*

=item C<static UINTVAL utf16_decode_and_advance(PARROT_INTERP, String_iter *i)>

Moves the string iterator C<i> to the next UTF-16 codepoint.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static UINTVAL
utf16_decode_and_advance(SHIM_INTERP, ARGMOD(String_iter *i))
{
    ASSERT_ARGS(utf16_decode_and_advance)
    const UChar * const s = (const UChar*) i->str->strstart;
    UINTVAL pos = i->bytepos / sizeof (UChar);
    UINTVAL c;

    /* TODO either make sure that we don't go past end or use SAFE
     *      iter versions
     */
    U16_NEXT_UNSAFE(s, pos, c);
    ++i->charpos;
    i->bytepos = pos * sizeof (UChar);
    return c;
}

/*

=item C<static void utf16_encode_and_advance(PARROT_INTERP, String_iter *i,
UINTVAL c)>

With the string iterator C<i>, appends the codepoint C<c> and advances to the
next position in the string.

=cut

*/

static void
utf16_encode_and_advance(SHIM_INTERP, ARGMOD(String_iter *i), UINTVAL c)
{
    ASSERT_ARGS(utf16_encode_and_advance)
    UChar * const s = (UChar*) i->str->strstart;
    UINTVAL pos = i->bytepos / sizeof (UChar);
    U16_APPEND_UNSAFE(s, pos, c);
    ++i->charpos;
    i->bytepos = pos * sizeof (UChar);
}

/*

=item C<static void utf16_set_position(PARROT_INTERP, String_iter *i, UINTVAL
n)>

Moves the string iterator C<i> to the position C<n> in the string.

=cut

*/

static void
utf16_set_position(SHIM_INTERP, ARGMOD(String_iter *i), UINTVAL n)
{
    ASSERT_ARGS(utf16_set_position)
    UChar * const s = (UChar*) i->str->strstart;
    UINTVAL pos;
    pos = 0;
    U16_FWD_N_UNSAFE(s, pos, n);
    i->charpos = n;
    i->bytepos = pos * sizeof (UChar);
}

#endif

/*

=item C<static void iter_init(PARROT_INTERP, const STRING *src, String_iter
*iter)>

Initializes for string C<src> the string iterator C<iter>.

=cut

*/

static void
iter_init(PARROT_INTERP, ARGIN(const STRING *src), ARGOUT(String_iter *iter))
{
    ASSERT_ARGS(iter_init)
    iter->str = src;
    iter->bytepos = iter->charpos = 0;
#if PARROT_HAS_ICU
    UNUSED(interp);
    iter->get_and_advance = utf16_decode_and_advance;
    iter->set_and_advance = utf16_encode_and_advance;
    iter->set_position =    utf16_set_position;
#else
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_LIBRARY_ERROR,
        "no ICU lib loaded");
#endif
}

/*

=item C<void Parrot_encoding_utf16_init(PARROT_INTERP)>

Initializes the UTF-16 encoding.

=cut

*/

void
Parrot_encoding_utf16_init(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_encoding_utf16_init)
    ENCODING * const return_encoding = Parrot_new_encoding(interp);

    static const ENCODING base_encoding = {
        "utf16",
        4, /* Max bytes per codepoint 0 .. 0x10ffff */
        to_encoding,
        get_codepoint,
        get_byte,
        set_byte,
        get_codepoints,
        get_bytes,
        codepoints,
        bytes,
        iter_init,
        find_cclass,
        NULL
    };
    STRUCT_COPY_FROM_STRUCT(return_encoding, base_encoding);
    Parrot_register_encoding(interp, "utf16", return_encoding);

    return;
}

/*

=back

=head1 SEE ALSO

F<src/string/encoding/fixed_8.c>,
F<src/string/encoding/utf8.c>,
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
