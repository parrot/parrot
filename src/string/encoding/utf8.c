/*
Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

src/string/encoding/utf8.c - UTF-8 encoding

=head1 DESCRIPTION

UTF-8 (L<http://www.utf-8.com/>).

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "unicode.h"
#include "shared.h"

/* HEADERIZER HFILE: none */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static UINTVAL utf8_decode(PARROT_INTERP, ARGIN(const utf8_t *ptr))
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static utf8_t * utf8_encode(PARROT_INTERP, ARGMOD(utf8_t *ptr), UINTVAL c)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*ptr);

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

static void utf8_iter_skip(PARROT_INTERP,
    ARGIN(const STRING *str),
    ARGMOD(String_iter *i),
    INTVAL skip)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*i);

static UINTVAL utf8_ord(PARROT_INTERP, ARGIN(const STRING *src), INTVAL idx)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL utf8_partial_scan(PARROT_INTERP,
    ARGIN(const char *buf),
    ARGMOD(Parrot_String_Bounds *bounds))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*bounds);

static void utf8_scan(PARROT_INTERP, ARGMOD(STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*src);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static const utf8_t * utf8_skip_backward(
    ARGIN(const utf8_t *ptr),
    UINTVAL n)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
static const utf8_t * utf8_skip_forward(ARGIN(const utf8_t *ptr), UINTVAL n)
        __attribute__nonnull__(1);

PARROT_CAN_RETURN_NULL
static STRING * utf8_to_encoding(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_utf8_decode __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ptr))
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
#define ASSERT_ARGS_utf8_iter_skip __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(str) \
    , PARROT_ASSERT_ARG(i))
#define ASSERT_ARGS_utf8_ord __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_utf8_partial_scan __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(buf) \
    , PARROT_ASSERT_ARG(bounds))
#define ASSERT_ARGS_utf8_scan __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
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
    STRING  *result;

    if (src->encoding == Parrot_ascii_encoding_ptr) {
        result           = Parrot_str_clone(interp, src);
        result->encoding = Parrot_utf8_encoding_ptr;
    }
    else {
        result = encoding_to_encoding(interp, src, Parrot_utf8_encoding_ptr, 1.2);
    }

    return result;
}


/*

=item C<static void utf8_scan(PARROT_INTERP, STRING *src)>

Returns the number of characters in string C<str> by scanning the string.

=cut

*/

static void
utf8_scan(PARROT_INTERP, ARGMOD(STRING *src))
{
    ASSERT_ARGS(utf8_scan)
    Parrot_String_Bounds bounds;

    bounds.bytes = src->bufused;
    bounds.chars = -1;
    bounds.delim = -1;

    utf8_partial_scan(interp, src->strstart, &bounds);

    if (bounds.bytes != src->bufused)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_UTF8,
            "Unaligned end in UTF-8 string\n");

    src->strlen = bounds.chars;
}


/*

=item C<static INTVAL utf8_partial_scan(PARROT_INTERP, const char *buf,
Parrot_String_Bounds *bounds)>

Partial scan of UTF-8 string

=cut

*/

static INTVAL
utf8_partial_scan(PARROT_INTERP, ARGIN(const char *buf),
        ARGMOD(Parrot_String_Bounds *bounds))
{
    ASSERT_ARGS(utf8_partial_scan)
    const utf8_t * const p         = (const utf8_t *)buf;
    UINTVAL              len       = bounds->bytes;
    INTVAL               max_chars = bounds->chars;
    const INTVAL         delim     = bounds->delim;
    INTVAL               c         = -1;
    INTVAL               chars     = 0;
    INTVAL               res       = 0;
    UINTVAL              i;

    if (max_chars < 0)
        max_chars = len;

    for (i = 0; i < len && chars < max_chars; ++i) {
        c = p[i];

        if (UTF8_IS_START(c)) {
            UINTVAL len2 = Parrot_utf8skip[c];
            UINTVAL count;

            if (i + len2 > len) {
                res = i + len2 - len;
                break;
            }

            /* Check for overlong forms */
            if (UTF8_IS_OVERLONG(c, p[i+1]))
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_UTF8,
                    "Overlong form in UTF-8 string\n");

            c &= UTF8_START_MASK(len2);

            for (count = 1; count < len2; ++count) {
                ++i;

                if (!UTF8_IS_CONTINUATION(p[i]))
                    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_UTF8,
                        "Malformed UTF-8 string\n");

                c = UTF8_ACCUMULATE(c, p[i]);
            }

            if (UNICODE_IS_INVALID(c))
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_CHARACTER,
                    "Invalid character in UTF-8 string\n");
        }
        else if (!UNICODE_IS_INVARIANT(c)) {
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_UTF8,
                "Malformed UTF-8 string\n");
        }

        ++chars;

        if (c == delim) {
            i += 1;
            break;
        }
    }

    bounds->bytes = i;
    bounds->chars = chars;
    bounds->delim = c;

    return res;
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

    start = utf8_skip_forward((utf8_t *)src->strstart, idx);

    return utf8_decode(interp, start);
}


/*

=item C<static UINTVAL utf8_decode(PARROT_INTERP, const utf8_t *ptr)>

Returns the integer for the UTF-8 character found at C<*ptr>.

=cut

*/

static UINTVAL
utf8_decode(SHIM_INTERP, ARGIN(const utf8_t *ptr))
{
    ASSERT_ARGS(utf8_decode)
    const utf8_t *u8ptr = ptr;
    UINTVAL c = *u8ptr;

    if (UTF8_IS_START(c)) {
        const UINTVAL len = Parrot_utf8skip[c];
        UINTVAL count;

        c &= UTF8_START_MASK(len);

        for (count = 1; count < len; ++count) {
            ++u8ptr;

            c = UTF8_ACCUMULATE(c, *u8ptr);
        }
    }

    return c;
}


/*

=item C<static utf8_t * utf8_encode(PARROT_INTERP, utf8_t *ptr, UINTVAL c)>

Returns the UTF-8 encoding of integer C<c>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static utf8_t *
utf8_encode(PARROT_INTERP, ARGMOD(utf8_t *ptr), UINTVAL c)
{
    ASSERT_ARGS(utf8_encode)
    UINTVAL  len;
    utf8_t  *end;

    if (c < 0x80) {
        *ptr = c;
        return ptr + 1;
    }

    if (UNICODE_IS_INVALID(c))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_CHARACTER,
                "Invalid character for UTF-8 encoding\n");

    len = UNISKIP(c);
    end = ptr + len - 1;

    while (end > ptr) {
        *end-- = (c & UTF8_CONTINUATION_MASK) | UTF8_CONTINUATION_MARK;
        c >>= UTF8_ACCUMULATION_SHIFT;
    }

    *end = c | UTF8_START_MARK(len);

    return ptr + len;
}


/*

=item C<static const utf8_t * utf8_skip_forward(const utf8_t *ptr, UINTVAL n)>

Moves C<ptr> C<n> characters forward.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static const utf8_t *
utf8_skip_forward(ARGIN(const utf8_t *ptr), UINTVAL n)
{
    ASSERT_ARGS(utf8_skip_forward)

    while (n-- > 0) {
        ptr += Parrot_utf8skip[*ptr];
    }

    return ptr;
}


/*

=item C<static const utf8_t * utf8_skip_backward(const utf8_t *ptr, UINTVAL n)>

Moves C<ptr> C<n> characters back.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static const utf8_t *
utf8_skip_backward(ARGIN(const utf8_t *ptr), UINTVAL n)
{
    ASSERT_ARGS(utf8_skip_backward)

    while (n-- > 0) {
        --ptr;
        while (UTF8_IS_CONTINUATION(*ptr))
            --ptr;
    }

    return ptr;
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
    const utf8_t *ptr = (utf8_t *)(str->strstart + i->bytepos);

    PARROT_ASSERT(i->charpos + offset < str->strlen);

    if (offset > 0)
        ptr = utf8_skip_forward(ptr, offset);
    else if (offset < 0)
        ptr = utf8_skip_backward(ptr, -offset);

    return utf8_decode(interp, ptr);
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
    const utf8_t *ptr = (utf8_t *)(str->strstart + i->bytepos);

    i->charpos += skip;

    PARROT_ASSERT(i->charpos <= str->strlen);

    if (skip > 0)
        ptr = utf8_skip_forward(ptr, skip);
    else if (skip < 0)
        ptr = utf8_skip_backward(ptr, -skip);

    i->bytepos = (const char *)ptr - (const char *)str->strstart;

    PARROT_ASSERT(i->bytepos <= str->bufused);
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
    const utf8_t *ptr = (utf8_t *)(str->strstart + i->bytepos);
    UINTVAL       c   = utf8_decode(interp, ptr);

    i->charpos += 1;
    i->bytepos += Parrot_utf8skip[*ptr];

    PARROT_ASSERT(i->bytepos <= str->bufused);

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
    utf8_t * const ptr = (utf8_t *)(str->strstart + i->bytepos);
    utf8_t * const end = utf8_encode(interp, ptr, c);

    i->charpos += 1;
    i->bytepos += end - ptr;

    PARROT_ASSERT(i->bytepos <= str->bufused);
}


static STR_VTABLE Parrot_utf8_encoding = {
    -1,
    "utf8",
    NULL,
    1, /* Bytes per unit */
    4, /* Max bytes per codepoint */

    utf8_to_encoding,
    unicode_chr,

    encoding_equal,
    encoding_compare,
    encoding_index,
    encoding_rindex,
    encoding_hash,

    utf8_scan,
    utf8_partial_scan,
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
    utf8_iter_set_and_advance
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
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
