/*
Copyright (C) 2010, Parrot Foundation.

=head1 NAME

src/string/encoding/ucs4.c - UCS-4 encoding

=head1 DESCRIPTION

UCS-4 encoding

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

static size_t ucs4_hash(PARROT_INTERP,
    ARGIN(const STRING *src),
    size_t hashval)
        __attribute__nonnull__(2);

static UINTVAL ucs4_iter_get(PARROT_INTERP,
    ARGIN(const STRING *str),
    ARGIN(const String_iter *i),
    INTVAL offset)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static UINTVAL ucs4_iter_get_and_advance(PARROT_INTERP,
    ARGIN(const STRING *str),
    ARGMOD(String_iter *i))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*i);

static void ucs4_iter_set_and_advance(PARROT_INTERP,
    ARGMOD(STRING *str),
    ARGMOD(String_iter *i),
    UINTVAL c)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*str)
        FUNC_MODIFIES(*i);

static void ucs4_iter_skip(PARROT_INTERP,
    const STRING *str,
    ARGMOD(String_iter *i),
    INTVAL skip)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*i);

static UINTVAL ucs4_ord(PARROT_INTERP, ARGIN(const STRING *src), INTVAL idx)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL ucs4_partial_scan(PARROT_INTERP,
    ARGIN(const char *buf),
    ARGMOD(Parrot_String_Bounds *bounds))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*bounds);

static void ucs4_scan(PARROT_INTERP, ARGMOD(STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*src);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING * ucs4_to_encoding(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_ucs4_hash __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_ucs4_iter_get __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(str) \
    , PARROT_ASSERT_ARG(i))
#define ASSERT_ARGS_ucs4_iter_get_and_advance __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(str) \
    , PARROT_ASSERT_ARG(i))
#define ASSERT_ARGS_ucs4_iter_set_and_advance __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(str) \
    , PARROT_ASSERT_ARG(i))
#define ASSERT_ARGS_ucs4_iter_skip __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(i))
#define ASSERT_ARGS_ucs4_ord __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_ucs4_partial_scan __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(buf) \
    , PARROT_ASSERT_ARG(bounds))
#define ASSERT_ARGS_ucs4_scan __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_ucs4_to_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*

=item C<static STRING * ucs4_to_encoding(PARROT_INTERP, const STRING *src)>

Converts the string C<src> to this particular encoding.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
ucs4_to_encoding(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(ucs4_to_encoding)
    const UINTVAL  len = src->strlen;
    UINTVAL        i;
    STRING        *res;
    utf32_t       *ptr;

    if (src->encoding == Parrot_ucs4_encoding_ptr)
        return Parrot_str_copy(interp, src);

    res = Parrot_str_new_init(interp, NULL, len * 4,
            Parrot_ucs4_encoding_ptr, 0);
    ptr = (utf32_t *)res->strstart;

    if (STRING_max_bytes_per_codepoint(src) == 1) {
        const unsigned char *s = (unsigned char *)src->strstart;

        for (i = 0; i < len; i++) {
            ptr[i] = s[i];
        }
    }
    else {
        String_iter iter;

        STRING_ITER_INIT(interp, &iter);

        while (iter.charpos < len) {
            i      = iter.charpos;
            ptr[i] = STRING_iter_get_and_advance(interp, src, &iter);
        }
    }

    res->strlen  = len;
    res->bufused = len * 4;

    return res;
}


/*

=item C<static void ucs4_scan(PARROT_INTERP, STRING *src)>

Returns the number of codepoints in string C<src>.

=cut

*/

static void
ucs4_scan(PARROT_INTERP, ARGMOD(STRING *src))
{
    ASSERT_ARGS(ucs4_scan)
    const utf32_t * const ptr = (utf32_t *)src->strstart;
    const UINTVAL         len = src->bufused >> 2;
    UINTVAL               i;

    if (src->bufused & 3)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_CHARACTER,
            "Unaligned end in UCS-4 string\n");

    for (i = 0; i < len; ++i) {
        UINTVAL c = ptr[i];

        if (UNICODE_IS_INVALID(c))
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_CHARACTER,
                    "Invalid character in UCS-4 string\n");
    }

    src->strlen = len;
}


/*

=item C<static INTVAL ucs4_partial_scan(PARROT_INTERP, const char *buf,
Parrot_String_Bounds *bounds)>

Partial scan of UCS-4 string

=cut

*/

static INTVAL
ucs4_partial_scan(PARROT_INTERP, ARGIN(const char *buf),
        ARGMOD(Parrot_String_Bounds *bounds))
{
    ASSERT_ARGS(ucs4_partial_scan)
    const utf32_t * const ptr = (const utf32_t *)buf;
    UINTVAL               len   = bounds->bytes >> 1;
    const INTVAL          chars = bounds->chars;
    const INTVAL          delim = bounds->delim;
    INTVAL                c     = -1;
    UINTVAL               i;

    if (chars >= 0 && (UINTVAL)chars < len)
        len = chars;

    for (i = 0; i < len; ++i) {
        c = ptr[i];

        if (UNICODE_IS_INVALID(c))
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_CHARACTER,
                    "Invalid character in UCS-4 string\n");

        if (c == delim) {
            len = i + 1;
            break;
        }
    }

    bounds->bytes = len << 2;
    bounds->chars = len;
    bounds->delim = c;

    return 0;
}


/*

=item C<static UINTVAL ucs4_ord(PARROT_INTERP, const STRING *src, INTVAL idx)>

Returns the codepoint in string C<src> at position C<offset>.

=cut

*/

static UINTVAL
ucs4_ord(PARROT_INTERP, ARGIN(const STRING *src), INTVAL idx)
{
    ASSERT_ARGS(ucs4_ord)
    const utf32_t * const ptr = (utf32_t *)src->strstart;
    const UINTVAL         len = src->strlen;

    if (idx < 0)
        idx += len;

    if ((UINTVAL)idx >= len)
        encoding_ord_error(interp, src, idx);

    return ptr[idx];
}


/*

=item C<static UINTVAL ucs4_iter_get(PARROT_INTERP, const STRING *str, const
String_iter *i, INTVAL offset)>

Get the character at C<i> + C<offset>.

=cut

*/

static UINTVAL
ucs4_iter_get(SHIM_INTERP,
    ARGIN(const STRING *str), ARGIN(const String_iter *i), INTVAL offset)
{
    ASSERT_ARGS(ucs4_iter_get)
    const utf32_t * const ptr = (utf32_t *)str->strstart;

    return ptr[i->charpos + offset];
}


/*

=item C<static void ucs4_iter_skip(PARROT_INTERP, const STRING *str, String_iter
*i, INTVAL skip)>

Moves the string iterator C<i> by C<skip> characters.

=cut

*/

static void
ucs4_iter_skip(SHIM_INTERP,
    SHIM(const STRING *str), ARGMOD(String_iter *i), INTVAL skip)
{
    ASSERT_ARGS(ucs4_iter_skip)

    i->charpos += skip;
    i->bytepos += skip * 4;
}


/*

=item C<static UINTVAL ucs4_iter_get_and_advance(PARROT_INTERP, const STRING
*str, String_iter *i)>

Moves the string iterator C<i> to the next codepoint.

=cut

*/

static UINTVAL
ucs4_iter_get_and_advance(SHIM_INTERP,
    ARGIN(const STRING *str), ARGMOD(String_iter *i))
{
    ASSERT_ARGS(ucs4_iter_get_and_advance)
    const utf32_t * const ptr = (utf32_t *)str->strstart;
    const UINTVAL         c   = ptr[i->charpos];

    i->charpos += 1;
    i->bytepos += 4;

    return c;
}


/*

=item C<static void ucs4_iter_set_and_advance(PARROT_INTERP, STRING *str,
String_iter *i, UINTVAL c)>

With the string iterator C<i>, appends the codepoint C<c> and advances to the
next position in the string.

=cut

*/

static void
ucs4_iter_set_and_advance(PARROT_INTERP,
    ARGMOD(STRING *str), ARGMOD(String_iter *i), UINTVAL c)
{
    ASSERT_ARGS(ucs4_iter_set_and_advance)
    utf32_t * const ptr = (utf32_t *)str->strstart;

    if (UNICODE_IS_INVALID(c))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_CHARACTER,
                "Invalid character in UCS-4 string\n");

    ptr[i->charpos] = c;

    i->charpos += 1;
    i->bytepos += 4;
}


/*

=item C<static size_t ucs4_hash(PARROT_INTERP, const STRING *src, size_t
hashval)>

Returns the hashed value of the string, given a seed in hashval.

=cut

*/

static size_t
ucs4_hash(SHIM_INTERP, ARGIN(const STRING *src), size_t hashval)
{
    ASSERT_ARGS(ucs4_hash)
    DECL_CONST_CAST;
    STRING * const  s   = PARROT_const_cast(STRING *, src);
    const utf32_t  *ptr = (utf32_t *)s->strstart;
    UINTVAL         len = s->strlen;

    while (len--) {
        hashval += hashval << 5;
        hashval += *(ptr++);
    }

    s->hashval = hashval;

    return hashval;
}


static STR_VTABLE Parrot_ucs4_encoding = {
    -1,
    "ucs4",
    NULL,
    4, /* Bytes per unit */
    4, /* Max bytes per codepoint */

    ucs4_to_encoding,
    unicode_chr,

    encoding_equal,
    encoding_compare,
    encoding_index,
    encoding_rindex,
    ucs4_hash,

    ucs4_scan,
    ucs4_partial_scan,
    ucs4_ord,
    fixed_substr,

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

    ucs4_iter_get,
    ucs4_iter_skip,
    ucs4_iter_get_and_advance,
    ucs4_iter_set_and_advance
};

STR_VTABLE *Parrot_ucs4_encoding_ptr = &Parrot_ucs4_encoding;


/*

=back

=head1 SEE ALSO

F<src/string/encoding/fixed_8.c>,
F<src/string/encoding/utf8.c>,
F<src/string/encoding/utf16.c>,
F<src/string/encoding/ucs2.c>,
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
