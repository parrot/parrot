/*
Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

src/string/encoding/utf16.c - UTF-16 encoding

=head1 DESCRIPTION

UTF-16 encoding

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

PARROT_WARN_UNUSED_RESULT
static UINTVAL utf16_decode(PARROT_INTERP, ARGIN(const utf16_t *p))
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static utf16_t * utf16_encode(PARROT_INTERP,
    ARGMOD(utf16_t *ptr),
    UINTVAL c)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*ptr);

static UINTVAL utf16_iter_get(PARROT_INTERP,
    ARGIN(const STRING *str),
    ARGIN(const String_iter *i),
    INTVAL offset)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
static UINTVAL utf16_iter_get_and_advance(PARROT_INTERP,
    ARGIN(const STRING *str),
    ARGMOD(String_iter *i))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*i);

static void utf16_iter_set_and_advance(PARROT_INTERP,
    ARGMOD(STRING *str),
    ARGMOD(String_iter *i),
    UINTVAL c)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*str)
        FUNC_MODIFIES(*i);

static void utf16_iter_skip(PARROT_INTERP,
    ARGIN(const STRING *str),
    ARGMOD(String_iter *i),
    INTVAL skip)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*i);

static UINTVAL utf16_ord(PARROT_INTERP,
    ARGIN(const STRING *src),
    INTVAL idx)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL utf16_partial_scan(PARROT_INTERP,
    ARGIN(const char *buf),
    ARGMOD(Parrot_String_Bounds *bounds))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*bounds);

static void utf16_scan(PARROT_INTERP, ARGMOD(STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*src);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static const utf16_t * utf16_skip_backward(
    ARGIN(const utf16_t *p),
    UINTVAL count)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static const utf16_t * utf16_skip_forward(
    ARGIN(const utf16_t *p),
    UINTVAL count)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING * utf16_to_encoding(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_utf16_decode __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(p))
#define ASSERT_ARGS_utf16_encode __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ptr))
#define ASSERT_ARGS_utf16_iter_get __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(str) \
    , PARROT_ASSERT_ARG(i))
#define ASSERT_ARGS_utf16_iter_get_and_advance __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(str) \
    , PARROT_ASSERT_ARG(i))
#define ASSERT_ARGS_utf16_iter_set_and_advance __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(str) \
    , PARROT_ASSERT_ARG(i))
#define ASSERT_ARGS_utf16_iter_skip __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(str) \
    , PARROT_ASSERT_ARG(i))
#define ASSERT_ARGS_utf16_ord __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_utf16_partial_scan __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(buf) \
    , PARROT_ASSERT_ARG(bounds))
#define ASSERT_ARGS_utf16_scan __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_utf16_skip_backward __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(p))
#define ASSERT_ARGS_utf16_skip_forward __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(p))
#define ASSERT_ARGS_utf16_to_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*

=item C<static STRING * utf16_to_encoding(PARROT_INTERP, const STRING *src)>

Converts the string C<src> to this particular encoding.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
utf16_to_encoding(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(utf16_to_encoding)
    STRING  *result;
    UINTVAL  src_len;

    src_len = STRING_length(src);

    if (STRING_max_bytes_per_codepoint(src) == 1) {
        result           = Parrot_gc_new_string_header(interp, 0);
        result->encoding = Parrot_ucs2_encoding_ptr;
        result->bufused  = 2 * src_len;
        result->strlen   = src_len;

        if (src_len) {
            UINTVAL       i;
            Parrot_UInt2 *p;

            Parrot_gc_allocate_string_storage(interp, result, 2 * src_len);
            p = (Parrot_UInt2 *)result->strstart;

            for (i = 0; i < src_len; ++i) {
                p[i] = (unsigned char)src->strstart[i];
            }
        }
    }
    else if (src->encoding == Parrot_utf16_encoding_ptr
         ||  src->encoding == Parrot_ucs2_encoding_ptr) {
        /* we have to use clone instead of copy because the Unicode upcase
         * and downcase functions assume to get an unshared buffer */
        result = Parrot_str_clone(interp, src);
    }
    else {
        result = encoding_to_encoding(interp, src, Parrot_utf16_encoding_ptr, 2.2);

        /* downgrade if possible */
        if (result->bufused == result->strlen << 1)
            result->encoding = Parrot_ucs2_encoding_ptr;
    }

    return result;
}


/*

=item C<static void utf16_scan(PARROT_INTERP, STRING *src)>

Returns the number of codepoints in string C<src> by scanning the whole
string.

=cut

*/

static void
utf16_scan(PARROT_INTERP, ARGMOD(STRING *src))
{
    ASSERT_ARGS(utf16_scan)
    Parrot_String_Bounds bounds;

    bounds.bytes = src->bufused;
    bounds.chars = -1;
    bounds.delim = -1;

    utf16_partial_scan(interp, src->strstart, &bounds);

    if (bounds.bytes != src->bufused)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_UTF16,
            "Unaligned end in UTF-16 string\n");

    src->strlen = bounds.chars;
}


/*

=item C<static INTVAL utf16_partial_scan(PARROT_INTERP, const char *buf,
Parrot_String_Bounds *bounds)>

Partial scan of UTF-16 string

=cut

*/

static INTVAL
utf16_partial_scan(PARROT_INTERP, ARGIN(const char *buf),
        ARGMOD(Parrot_String_Bounds *bounds))
{
    ASSERT_ARGS(utf16_partial_scan)
    const utf16_t * const p         = (const utf16_t *)buf;
    UINTVAL               len       = bounds->bytes >> 1;
    INTVAL                max_chars = bounds->chars;
    const INTVAL          delim     = bounds->delim;
    INTVAL                c         = -1;
    INTVAL                chars     = 0;
    INTVAL                res       = 0;
    UINTVAL               i;

    if (max_chars < 0)
        max_chars = len;

    for (i = 0; i < len && chars < max_chars; ++i) {
        c = p[i];

        if (UNICODE_IS_HIGH_SURROGATE(c)) {
            if (i + 1 >= len) {
                /* Two more bytes needed */
                res = 2;
                break;
            }

            ++i;

            if (!UNICODE_IS_LOW_SURROGATE(p[i]))
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_UTF16,
                    "Malformed UTF-16 string\n");

            c = UNICODE_DECODE_SURROGATE(c, p[i]);
        }
        else {
            if (UNICODE_IS_LOW_SURROGATE(c))
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_UTF16,
                    "Malformed UTF-16 string\n");
        }

        if (UNICODE_IS_NON_CHARACTER(c))
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_CHARACTER,
                "Non-character in UTF-16 string\n");

        ++chars;

        if (c == delim) {
            i += 1;
            break;
        }
    }

    bounds->bytes = i << 1;
    bounds->chars = chars;
    bounds->delim = c;

    return res;
}


/*

=item C<static const utf16_t * utf16_skip_forward(const utf16_t *p, UINTVAL
count)>

Skips C<count> codepoints starting from C<p>. Returns the new pointer.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static const utf16_t *
utf16_skip_forward(ARGIN(const utf16_t *p), UINTVAL count)
{
    ASSERT_ARGS(utf16_skip_forward)
    UINTVAL i;

    for (i = 0; i < count; ++i) {
        p += UTF16SKIP(*p);
    }

    return p;
}


/*

=item C<static const utf16_t * utf16_skip_backward(const utf16_t *p, UINTVAL
count)>

Skips C<count> codepoints backwards starting from C<p>. Returns the new
pointer.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static const utf16_t *
utf16_skip_backward(ARGIN(const utf16_t *p), UINTVAL count)
{
    ASSERT_ARGS(utf16_skip_backward)
    UINTVAL i;

    for (i = 0; i < count; ++i) {
        --p;
        if (UNICODE_IS_LOW_SURROGATE(*p))
            --p;
    }

    return p;
}


/*

=item C<static UINTVAL utf16_decode(PARROT_INTERP, const utf16_t *p)>

Decodes the codepoint starting at C<p>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static UINTVAL
utf16_decode(SHIM_INTERP, ARGIN(const utf16_t *p))
{
    ASSERT_ARGS(utf16_decode)
    UINTVAL c = *p;

    if (UNICODE_IS_HIGH_SURROGATE(c))
        c = UNICODE_DECODE_SURROGATE(c, p[1]);

    return c;
}


/*

=item C<static utf16_t * utf16_encode(PARROT_INTERP, utf16_t *ptr, UINTVAL c)>

Decodes the codepoint starting at C<p>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static utf16_t *
utf16_encode(PARROT_INTERP, ARGMOD(utf16_t *ptr), UINTVAL c)
{
    ASSERT_ARGS(utf16_encode)

    if (c < 0xFFFE) {
        if (UNICODE_IS_SURROGATE(c)
        || (c >= 0xFDD0 && c <= 0xFDEF))
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_CHARACTER,
                    "Invalid character for UTF-16 encoding\n");

        *ptr++ = c;
    }
    else {
        if ((c & 0xFFFE) == 0xFFFE
        ||   c > 0x10FFFF)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_CHARACTER,
                    "Invalid character for UTF-16 encoding\n");

        *ptr++ = UNICODE_HIGH_SURROGATE(c);
        *ptr++ = UNICODE_LOW_SURROGATE(c);
    }

    return ptr;
}


/*

=item C<static UINTVAL utf16_ord(PARROT_INTERP, const STRING *src, INTVAL idx)>

Returns the codepoint in string C<src> at position C<offset>.

=cut

*/

static UINTVAL
utf16_ord(PARROT_INTERP, ARGIN(const STRING *src), INTVAL idx)
{
    ASSERT_ARGS(utf16_ord)
    const UINTVAL  len = STRING_length(src);
    const utf16_t *start;

    if (idx < 0)
        idx += len;

    if ((UINTVAL)idx >= len)
        encoding_ord_error(interp, src, idx);

    start = utf16_skip_forward((const utf16_t *)src->strstart, idx);

    return utf16_decode(interp, start);
}


/*

=item C<static UINTVAL utf16_iter_get(PARROT_INTERP, const STRING *str, const
String_iter *i, INTVAL offset)>

Get the character at C<i> plus C<offset>.

=cut

*/

static UINTVAL
utf16_iter_get(PARROT_INTERP,
    ARGIN(const STRING *str), ARGIN(const String_iter *i), INTVAL offset)
{
    ASSERT_ARGS(utf16_iter_get)
    const utf16_t *ptr = (utf16_t *)(str->strstart + i->bytepos);

    PARROT_ASSERT((UINTVAL)(i->charpos + offset) <= str->strlen);

    if (offset > 0)
        ptr = utf16_skip_forward(ptr, offset);
    else if (offset < 0)
        ptr = utf16_skip_backward(ptr, -offset);

    return utf16_decode(interp, ptr);
}

/*

=item C<static void utf16_iter_skip(PARROT_INTERP, const STRING *str,
String_iter *i, INTVAL skip)>

Moves the string iterator C<i> by C<skip> characters.

=cut

*/

static void
utf16_iter_skip(SHIM_INTERP,
    ARGIN(const STRING *str), ARGMOD(String_iter *i), INTVAL skip)
{
    ASSERT_ARGS(utf16_iter_skip)
    const utf16_t *ptr = (utf16_t *)(str->strstart + i->bytepos);

    i->charpos += skip;

    PARROT_ASSERT(i->charpos <= str->strlen);

    if (skip > 0)
        ptr = utf16_skip_forward(ptr, skip);
    else if (skip < 0)
        ptr = utf16_skip_backward(ptr, -skip);

    i->bytepos = (const char *)ptr - (const char *)str->strstart;

    PARROT_ASSERT(i->bytepos <= str->bufused);
}

/*

=item C<static UINTVAL utf16_iter_get_and_advance(PARROT_INTERP, const STRING
*str, String_iter *i)>

Moves the string iterator C<i> to the next UTF-16 codepoint.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static UINTVAL
utf16_iter_get_and_advance(PARROT_INTERP,
    ARGIN(const STRING *str), ARGMOD(String_iter *i))
{
    ASSERT_ARGS(utf16_iter_get_and_advance)
    const utf16_t *ptr = (utf16_t *)(str->strstart + i->bytepos);
    UINTVAL        c   = utf16_decode(interp, ptr);

    i->charpos += 1;

    if (UNICODE_IS_HIGH_SURROGATE(*ptr))
        i->bytepos += 4;
    else
        i->bytepos += 2;

    PARROT_ASSERT(i->bytepos <= str->bufused);

    return c;
}

/*

=item C<static void utf16_iter_set_and_advance(PARROT_INTERP, STRING *str,
String_iter *i, UINTVAL c)>

With the string iterator C<i>, appends the codepoint C<c> and advances to the
next position in the string.

=cut

*/

static void
utf16_iter_set_and_advance(PARROT_INTERP,
    ARGMOD(STRING *str), ARGMOD(String_iter *i), UINTVAL c)
{
    ASSERT_ARGS(utf16_iter_set_and_advance)
    utf16_t * const ptr = (utf16_t *)(str->strstart + i->bytepos);
    utf16_t * const end = utf16_encode(interp, ptr, c);

    i->charpos += 1;
    i->bytepos += (char *)end - (char *)ptr;

    PARROT_ASSERT(i->bytepos <= str->bufused);
}


static STR_VTABLE Parrot_utf16_encoding = {
    -1,
    "utf16",
    NULL,
    2, /* Bytes per unit */
    4, /* Max bytes per codepoint */

    utf16_to_encoding,
    unicode_chr,

    encoding_equal,
    encoding_compare,
    encoding_index,
    encoding_rindex,
    encoding_hash,

    utf16_scan,
    utf16_partial_scan,
    utf16_ord,
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

    utf16_iter_get,
    utf16_iter_skip,
    utf16_iter_get_and_advance,
    utf16_iter_set_and_advance
};

STR_VTABLE *Parrot_utf16_encoding_ptr = &Parrot_utf16_encoding;


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
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
