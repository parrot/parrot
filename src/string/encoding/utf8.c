/*
Copyright (C) 2001-2010, Parrot Foundation.
$Id$

=head1 NAME

src/string/encoding/utf8.c - UTF-8 encoding

=head1 DESCRIPTION

UTF-8 (L<http://www.utf-8.com/>).

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "../unicode.h"
#include "shared.h"

/* HEADERIZER HFILE: none */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static UINTVAL utf8_decode(PARROT_INTERP, ARGIN(const utf8_t *ptr))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static void * utf8_encode(PARROT_INTERP, ARGIN(void *ptr), UINTVAL c)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static UINTVAL utf8_iter_get(PARROT_INTERP,
    ARGIN(const STRING *str),
    ARGIN(const String_iter *i),
    INTVAL offset)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static UINTVAL utf8_iter_get_and_advance(PARROT_INTERP,
    ARGIN(const STRING *str),
    ARGMOD(String_iter *i))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*i);

static void utf8_iter_set_and_advance(PARROT_INTERP,
    ARGMOD(STRING *str),
    ARGMOD(String_iter *i),
    UINTVAL c)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*str)
        FUNC_MODIFIES(*i);

static void utf8_iter_set_position(SHIM_INTERP,
    ARGIN(const STRING *str),
    ARGMOD(String_iter *i),
    UINTVAL pos)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*i);

static void utf8_iter_skip(SHIM_INTERP,
    ARGIN(const STRING *str),
    ARGMOD(String_iter *i),
    INTVAL skip)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*i);

static UINTVAL utf8_ord(PARROT_INTERP, ARGIN(const STRING *src), INTVAL idx)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static UINTVAL utf8_scan(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static UINTVAL utf8_scan2(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static const utf8_t * utf8_skip_backward(ARGIN(const void *ptr), UINTVAL n)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
static const utf8_t * utf8_skip_forward(ARGIN(const void *ptr), UINTVAL n)
        __attribute__nonnull__(1);

PARROT_CAN_RETURN_NULL
static STRING * utf8_to_encoding(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_utf8_decode __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ptr))
#define ASSERT_ARGS_utf8_encode __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ptr))
#define ASSERT_ARGS_utf8_iter_get __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(str) \
    , PARROT_ASSERT_ARG(i))
#define ASSERT_ARGS_utf8_iter_get_and_advance __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(str) \
    , PARROT_ASSERT_ARG(i))
#define ASSERT_ARGS_utf8_iter_set_and_advance __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(str) \
    , PARROT_ASSERT_ARG(i))
#define ASSERT_ARGS_utf8_iter_set_position __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(str) \
    , PARROT_ASSERT_ARG(i))
#define ASSERT_ARGS_utf8_iter_skip __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(str) \
    , PARROT_ASSERT_ARG(i))
#define ASSERT_ARGS_utf8_ord __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_utf8_scan __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_utf8_scan2 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_utf8_skip_backward __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ptr))
#define ASSERT_ARGS_utf8_skip_forward __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ptr))
#define ASSERT_ARGS_utf8_to_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

#define UNIMPL Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED, \
    "unimpl utf8")

const char Parrot_utf8skip[256] = {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,     /* ascii */
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,     /* ascii */
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,     /* ascii */
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,     /* ascii */
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,     /* ascii */
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,     /* ascii */
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,     /* ascii */
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,     /* ascii */
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,     /* bogus */
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,     /* bogus */
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,     /* bogus */
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,     /* bogus */
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,     /* scripts */
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,     /* scripts */
    3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,     /* cjk etc. */
    4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6      /* cjk etc. */
};


/*

=item C<static STRING * utf8_to_encoding(PARROT_INTERP, const STRING *src)>

Converts the string C<src> to this particular encoding.  If C<dest> is
provided, it will contain the result.  Otherwise this function operates in
place.

=cut

*/

PARROT_CAN_RETURN_NULL
static STRING *
utf8_to_encoding(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(utf8_to_encoding)
    STRING *result;
    const STR_VTABLE *src_encoding = src->encoding;
    UINTVAL dest_len, dest_pos, src_len;
    unsigned char *p;

    if (src_encoding == Parrot_utf8_encoding_ptr)
        return Parrot_str_clone(interp, src);

    src_len          = src->strlen;
    result           = Parrot_gc_new_string_header(interp, 0);
    result->encoding = Parrot_utf8_encoding_ptr;
    result->strlen   = src_len;

    if (!src_len)
        return result;

    Parrot_gc_allocate_string_storage(interp, result, src_len);
    p = (unsigned char *)result->strstart;

    if (src_encoding == Parrot_ascii_encoding_ptr) {
        for (dest_len = 0; dest_len < src_len; ++dest_len) {
            p[dest_len] = ((unsigned char*)src->strstart)[dest_len];
        }
        result->bufused = dest_len;
    }
    else {
        String_iter src_iter;
        STRING_ITER_INIT(interp, &src_iter);
        dest_len = src_len;
        dest_pos = 0;
        while (src_iter.charpos < src_len) {
            const UINTVAL c = src_encoding->iter_get_and_advance(interp, src, &src_iter);
            unsigned char *new_pos;
            unsigned char *pos;

            if (dest_len - dest_pos < 6) {
                UINTVAL need = (UINTVAL)((src->strlen - src_iter.charpos + 1) * 1.5);
                if (need < 16)
                    need = 16;
                dest_len += need;
                result->bufused = dest_pos;
                Parrot_gc_reallocate_string_storage(interp, result, dest_len);
                p = (unsigned char *)result->strstart;
            }

            pos = p + dest_pos;
            new_pos = (unsigned char *)utf8_encode(interp, pos, c);
            dest_pos += (new_pos - pos);
        }
        result->bufused = dest_pos;
    }

    return result;
}


/*

=item C<static UINTVAL utf8_scan(PARROT_INTERP, const STRING *src)>

Returns the number of characters in string C<str> by scanning the string.

=cut

*/

static UINTVAL
utf8_scan(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(utf8_scan)
    const utf8_t *u8ptr = (const utf8_t *)src->strstart;
    const utf8_t *u8end = (const utf8_t *)(src->strstart + src->bufused);
    UINTVAL characters = 0;

    while (u8ptr < u8end) {
        u8ptr += UTF8SKIP(u8ptr);
        ++characters;
    }

    if (u8ptr > u8end)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_UTF8,
            "Unaligned end in UTF-8 string\n");

    return characters;
}


/*

=item C<static UINTVAL utf8_scan2(PARROT_INTERP, const STRING *src)>

Returns the number of codepoints in string C<src>.

=cut

*/

static UINTVAL
utf8_scan2(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(utf8_scan2)
    String_iter iter;
    /*
     * this is used to initially calculate src->strlen,
     * therefore we must scan the whole string
     */
    STRING_ITER_INIT(interp, &iter);
    while (iter.bytepos < src->bufused)
        utf8_iter_get_and_advance(interp, src, &iter);
    return iter.charpos;
}


/*

=item C<static UINTVAL utf8_ord(PARROT_INTERP, const STRING *src, INTVAL idx)>

Returns the codepoint in string C<src> at position C<offset>.

=cut

*/

static UINTVAL
utf8_ord(PARROT_INTERP, ARGIN(const STRING *src), INTVAL idx)
{
    ASSERT_ARGS(utf8_ord)
    const UINTVAL len = STRING_length(src);
    const utf8_t *start;

    if (idx < 0)
        idx += len;

    if ((UINTVAL)idx >= len)
        encoding_ord_error(interp, src, idx);

    start = utf8_skip_forward(src->strstart, idx);

    return utf8_decode(interp, start);
}


/*

=item C<static UINTVAL utf8_decode(PARROT_INTERP, const utf8_t *ptr)>

Returns the integer for the UTF-8 character found at C<*ptr>.

=cut

*/

static UINTVAL
utf8_decode(PARROT_INTERP, ARGIN(const utf8_t *ptr))
{
    ASSERT_ARGS(utf8_decode)
    const utf8_t *u8ptr = ptr;
    UINTVAL c = *u8ptr;

    if (UTF8_IS_START(c)) {
        UINTVAL len = UTF8SKIP(u8ptr);
        UINTVAL count;

        c &= UTF8_START_MASK(len);
        for (count = 1; count < len; ++count) {
            ++u8ptr;

            if (!UTF8_IS_CONTINUATION(*u8ptr))
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_UTF8,
                    "Malformed UTF-8 string\n");

            c = UTF8_ACCUMULATE(c, *u8ptr);
        }

        if (UNICODE_IS_SURROGATE(c))
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_UTF8,
                "Surrogate in UTF-8 string\n");
    }
    else if (!UNICODE_IS_INVARIANT(c)) {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_UTF8,
            "Malformed UTF-8 string\n");
    }

    return c;
}


/*

=item C<static void * utf8_encode(PARROT_INTERP, void *ptr, UINTVAL c)>

Returns the UTF-8 encoding of integer C<c>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static void *
utf8_encode(PARROT_INTERP, ARGIN(void *ptr), UINTVAL c)
{
    ASSERT_ARGS(utf8_encode)
    const UINTVAL        len   = UNISKIP(c);

    /* the const is good on u8ptr, but using ptr on other variables avoids the
     * need to do a yucky cast to remove constness */
    const utf8_t * const u8ptr = (utf8_t *)ptr;
    utf8_t              *u8end = (utf8_t *)ptr + len - 1;

    if (c > 0x10FFFF || UNICODE_IS_SURROGATE(c)) {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_CHARACTER,
                           "Invalid character for UTF-8 encoding\n");
    }

    while (u8end > u8ptr) {
        *u8end-- =
            (utf8_t)((c & UTF8_CONTINUATION_MASK) | UTF8_CONTINUATION_MARK);
        c >>= UTF8_ACCUMULATION_SHIFT;
    }
    *u8end = (utf8_t)((c & UTF8_START_MASK(len)) | UTF8_START_MARK(len));

    return (utf8_t *)ptr + len;
}


/*

=item C<static const utf8_t * utf8_skip_forward(const void *ptr, UINTVAL n)>

Moves C<ptr> C<n> characters forward.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static const utf8_t *
utf8_skip_forward(ARGIN(const void *ptr), UINTVAL n)
{
    ASSERT_ARGS(utf8_skip_forward)
    const utf8_t *u8ptr = (const utf8_t *)ptr;

    while (n-- > 0) {
        u8ptr += UTF8SKIP(u8ptr);
    }

    return u8ptr;
}


/*

=item C<static const utf8_t * utf8_skip_backward(const void *ptr, UINTVAL n)>

Moves C<ptr> C<n> characters back.

XXX This function is unused.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static const utf8_t *
utf8_skip_backward(ARGIN(const void *ptr), UINTVAL n)
{
    ASSERT_ARGS(utf8_skip_backward)
    const utf8_t *u8ptr = (const utf8_t *)ptr;

    while (n-- > 0) {
        --u8ptr;
        while (UTF8_IS_CONTINUATION(*u8ptr))
            --u8ptr;
    }

    return u8ptr;
}


/*

=item C<static UINTVAL utf8_iter_get(PARROT_INTERP, const STRING *str, const
String_iter *i, INTVAL offset)>

Get the character at C<i> plus C<offset>.

=cut

*/

static UINTVAL
utf8_iter_get(PARROT_INTERP,
    ARGIN(const STRING *str), ARGIN(const String_iter *i), INTVAL offset)
{
    ASSERT_ARGS(utf8_iter_get)
    const utf8_t *u8ptr = (utf8_t *)((char *)str->strstart + i->bytepos);

    if (offset > 0) {
        u8ptr = utf8_skip_forward(u8ptr, offset);
    }
    else if (offset < 0) {
        u8ptr = utf8_skip_backward(u8ptr, -offset);
    }

    return utf8_decode(interp, u8ptr);
}


/*

=item C<static void utf8_iter_skip(PARROT_INTERP, const STRING *str, String_iter
*i, INTVAL skip)>

Moves the string iterator C<i> by C<skip> characters.

=cut

*/

static void
utf8_iter_skip(SHIM_INTERP,
    ARGIN(const STRING *str), ARGMOD(String_iter *i), INTVAL skip)
{
    ASSERT_ARGS(utf8_iter_skip)
    const utf8_t *u8ptr = (utf8_t *)((char *)str->strstart + i->bytepos);

    if (skip > 0) {
        u8ptr = utf8_skip_forward(u8ptr, skip);
    }
    else if (skip < 0) {
        u8ptr = utf8_skip_backward(u8ptr, -skip);
    }

    i->charpos += skip;
    i->bytepos = (const char *)u8ptr - (const char *)str->strstart;
}


/*

=item C<static UINTVAL utf8_iter_get_and_advance(PARROT_INTERP, const STRING
*str, String_iter *i)>

The UTF-8 implementation of the string iterator's C<get_and_advance>
function.

=cut

*/

static UINTVAL
utf8_iter_get_and_advance(PARROT_INTERP,
    ARGIN(const STRING *str), ARGMOD(String_iter *i))
{
    ASSERT_ARGS(utf8_iter_get_and_advance)
    const utf8_t *u8ptr = (utf8_t *)((char *)str->strstart + i->bytepos);
    UINTVAL c = *u8ptr;

    if (UTF8_IS_START(c)) {
        UINTVAL len = UTF8SKIP(u8ptr);

        c &= UTF8_START_MASK(len);
        i->bytepos += len;
        for (len--; len; len--) {
            u8ptr++;

            if (!UTF8_IS_CONTINUATION(*u8ptr))
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_UTF8,
                    "Malformed UTF-8 string\n");
            c = UTF8_ACCUMULATE(c, *u8ptr);
        }

        if (UNICODE_IS_SURROGATE(c))
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_UTF8,
                "Surrogate in UTF-8 string\n");
    }
    else if (!UNICODE_IS_INVARIANT(c)) {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_UTF8,
            "Malformed UTF-8 string\n");
    }
    else {
        i->bytepos++;
    }

    i->charpos++;
    return c;
}


/*

=item C<static void utf8_iter_set_and_advance(PARROT_INTERP, STRING *str,
String_iter *i, UINTVAL c)>

The UTF-8 implementation of the string iterator's C<set_and_advance>
function.

=cut

*/

static void
utf8_iter_set_and_advance(PARROT_INTERP,
    ARGMOD(STRING *str), ARGMOD(String_iter *i), UINTVAL c)
{
    ASSERT_ARGS(utf8_iter_set_and_advance)
    unsigned char * const pos = (unsigned char *)str->strstart + i->bytepos;
    unsigned char * const new_pos = (unsigned char *)utf8_encode(interp, pos, c);

    i->bytepos += (new_pos - pos);
    /* XXX possible buffer overrun exception? */
    PARROT_ASSERT(i->bytepos <= Buffer_buflen(str));
    i->charpos++;
}


/*

=item C<static void utf8_iter_set_position(PARROT_INTERP, const STRING *str,
String_iter *i, UINTVAL pos)>

The UTF-8 implementation of the string iterator's C<set_position>
function.

=cut

*/

static void
utf8_iter_set_position(SHIM_INTERP,
    ARGIN(const STRING *str), ARGMOD(String_iter *i), UINTVAL pos)
{
    ASSERT_ARGS(utf8_iter_set_position)
    const utf8_t *u8ptr = (const utf8_t *)str->strstart;

    if (pos == 0) {
        i->charpos = 0;
        i->bytepos = 0;
        return;
    }

    /*
     * we know the byte offsets of three positions: start, current and end
     * now find the shortest way to reach pos
     */
    if (pos < i->charpos) {
        if (pos <= (i->charpos >> 1)) {
            /* go forward from start */
            u8ptr = utf8_skip_forward(u8ptr, pos);
        }
        else {
            /* go backward from current */
            u8ptr = utf8_skip_backward(u8ptr + i->bytepos, i->charpos - pos);
        }
    }
    else {
        const UINTVAL  len = str->strlen;
        if (pos <= i->charpos + ((len - i->charpos) >> 1)) {
            /* go forward from current */
            u8ptr = utf8_skip_forward(u8ptr + i->bytepos, pos - i->charpos);
        }
        else {
            /* go backward from end */
            u8ptr = utf8_skip_backward(u8ptr + str->bufused, len - pos);
        }
    }

    i->charpos = pos;
    i->bytepos = (const char *)u8ptr - (const char *)str->strstart;
}


static STR_VTABLE Parrot_utf8_encoding = {
    0,
    "utf8",
    NULL,
    4, /* Max bytes per codepoint */

    utf8_to_encoding,
    unicode_chr,

    encoding_equal,
    encoding_compare,
    encoding_index,
    encoding_rindex,
    encoding_hash,
    unicode_validate,

    utf8_scan2,
    utf8_ord,
    encoding_substr,

    encoding_is_cclass,
    encoding_find_cclass,
    encoding_find_not_cclass,

    encoding_get_graphemes,
    unicode_compose,
    encoding_decompose,

    unicode_upcase,
    unicode_downcase,
    unicode_titlecase,
    unicode_upcase_first,
    unicode_downcase_first,
    unicode_titlecase_first,

    utf8_iter_get,
    utf8_iter_skip,
    utf8_iter_get_and_advance,
    utf8_iter_set_and_advance,
    utf8_iter_set_position
};

STR_VTABLE *Parrot_utf8_encoding_ptr = &Parrot_utf8_encoding;


/*

=back

=head1 SEE ALSO

F<src/string/encoding/fixed_8.c>,
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
