/*
Copyright (C) 2010, Parrot Foundation.
$Id$

=head1 NAME

src/string/encoding/ucs4.c - UCS-4 encoding

=head1 DESCRIPTION

UCS-4 encoding with the help of the ICU library.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "shared.h"

#if !PARROT_HAS_ICU
PARROT_DOES_NOT_RETURN
static void no_ICU_lib(PARROT_INTERP) /* HEADERIZER SKIP */
{
    Parrot_ex_throw_from_c_args(interp, NULL,
        EXCEPTION_LIBRARY_ERROR,
        "no ICU lib loaded");
}
#endif

/* HEADERIZER HFILE: none */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static size_t ucs4_hash(PARROT_INTERP,
    ARGIN(const STRING *s),
    size_t hashval)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static UINTVAL ucs4_iter_get(PARROT_INTERP,
    ARGIN(const STRING *str),
    ARGIN(const String_iter *i),
    INTVAL offset)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static UINTVAL ucs4_iter_get_and_advance(PARROT_INTERP,
    ARGIN(const STRING *str),
    ARGMOD(String_iter *i))
        __attribute__nonnull__(1)
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

static void ucs4_iter_set_position(PARROT_INTERP,
    ARGIN(const STRING *str),
    ARGMOD(String_iter *i),
    UINTVAL n)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*i);

static void ucs4_iter_skip(PARROT_INTERP,
    ARGIN(const STRING *str),
    ARGMOD(String_iter *i),
    INTVAL skip)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*i);

static UINTVAL ucs4_ord(PARROT_INTERP, ARGIN(const STRING *src), INTVAL idx)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
static UINTVAL ucs4_scan(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING * ucs4_to_encoding(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_ucs4_hash __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_ucs4_iter_get __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(str) \
    , PARROT_ASSERT_ARG(i))
#define ASSERT_ARGS_ucs4_iter_get_and_advance __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(str) \
    , PARROT_ASSERT_ARG(i))
#define ASSERT_ARGS_ucs4_iter_set_and_advance __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(str) \
    , PARROT_ASSERT_ARG(i))
#define ASSERT_ARGS_ucs4_iter_set_position __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(str) \
    , PARROT_ASSERT_ARG(i))
#define ASSERT_ARGS_ucs4_iter_skip __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(str) \
    , PARROT_ASSERT_ARG(i))
#define ASSERT_ARGS_ucs4_ord __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_ucs4_scan __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_ucs4_to_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

#if PARROT_HAS_ICU
#  include <unicode/ustring.h>
#endif


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
#if PARROT_HAS_ICU
    if (src->encoding == Parrot_ucs4_encoding_ptr) {
        return Parrot_str_clone(interp, src);
    }
    else {
        UINTVAL len = Parrot_str_length(interp, src);
        STRING *res = Parrot_str_new_init(interp, NULL, len * sizeof (UChar32),
                           Parrot_ucs4_encoding_ptr, 0);
        UChar32 *buf = (UChar32 *) res->strstart;
        UINTVAL offs;
        /* TODO: use an iterator */
        for (offs = 0; offs < len; offs++){
            buf[offs] = STRING_ord(interp, src, offs);
        };
        res->strlen  = len;
        res->bufused = len * sizeof (UChar32);

        return res;
    }
#else
    UNUSED(src);
    no_ICU_lib(interp);
#endif

}


/*

=item C<static UINTVAL ucs4_scan(PARROT_INTERP, const STRING *src)>

Returns the number of codepoints in string C<src>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static UINTVAL
ucs4_scan(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(ucs4_scan)
#if PARROT_HAS_ICU
    UNUSED(interp);
    return src->bufused / sizeof (UChar32);
#else
    UNUSED(src);
    no_ICU_lib(interp);
#endif
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
#if PARROT_HAS_ICU
    const UINTVAL  len = STRING_length(src);
    const UChar32 *s;

    if (idx < 0)
        idx += len;

    if ((UINTVAL)idx >= len)
        encoding_ord_error(interp, src, idx);

    s = (const UChar32 *)src->strstart;

    return s[idx];
#else
    UNUSED(idx);
    UNUSED(src);
    no_ICU_lib(interp);
#endif
}


/*

=item C<static UINTVAL ucs4_iter_get(PARROT_INTERP, const STRING *str, const
String_iter *i, INTVAL offset)>

Get the character at C<i> + C<offset>.

=cut

*/

static UINTVAL
ucs4_iter_get(PARROT_INTERP,
    ARGIN(const STRING *str), ARGIN(const String_iter *i), INTVAL offset)
{
    ASSERT_ARGS(ucs4_iter_get)
    return ucs4_ord(interp, str, i->charpos + offset);
}


/*

=item C<static void ucs4_iter_skip(PARROT_INTERP, const STRING *str, String_iter
*i, INTVAL skip)>

Moves the string iterator C<i> by C<skip> characters.

=cut

*/

static void
ucs4_iter_skip(PARROT_INTERP,
    ARGIN(const STRING *str), ARGMOD(String_iter *i), INTVAL skip)
{
    ASSERT_ARGS(ucs4_iter_skip)
    UNUSED(str);

#if PARROT_HAS_ICU
    i->charpos += skip;
    i->bytepos += skip * sizeof (UChar32);
#else
    UNUSED(i);
    UNUSED(skip);
    no_ICU_lib(interp);
#endif
}


/*

=item C<static UINTVAL ucs4_iter_get_and_advance(PARROT_INTERP, const STRING
*str, String_iter *i)>

Moves the string iterator C<i> to the next codepoint.

=cut

*/

static UINTVAL
ucs4_iter_get_and_advance(PARROT_INTERP,
    ARGIN(const STRING *str), ARGMOD(String_iter *i))
{
    ASSERT_ARGS(ucs4_iter_get_and_advance)

#if PARROT_HAS_ICU
    const UChar32 * const s = (const UChar32*) str->strstart;
    const UChar32 c = s[i->charpos++];
    i->bytepos += sizeof (UChar32);
    return c;
#else
    UNUSED(str);
    UNUSED(i);
    no_ICU_lib(interp);
    return (UINTVAL)0; /* Stop the static analyzers from panicing */
#endif
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

#if PARROT_HAS_ICU
    UChar32 * const s = (UChar32*) str->strstart;
    s[i->charpos++] = (UChar32)c;
    i->bytepos += sizeof (UChar32);
#else
    UNUSED(str);
    UNUSED(i);
    UNUSED(c);
    no_ICU_lib(interp);
#endif
}


/*

=item C<static void ucs4_iter_set_position(PARROT_INTERP, const STRING *str,
String_iter *i, UINTVAL n)>

Moves the string iterator C<i> to the position C<n> in the string.

=cut

*/

static void
ucs4_iter_set_position(PARROT_INTERP,
    ARGIN(const STRING *str), ARGMOD(String_iter *i), UINTVAL n)
{
    ASSERT_ARGS(ucs4_iter_set_position)
    UNUSED(str);

#if PARROT_HAS_ICU
    i->charpos = n;
    i->bytepos = n * sizeof (UChar32);
#else
    UNUSED(i);
    UNUSED(n);
    no_ICU_lib(interp);
#endif
}


/*

=item C<static size_t ucs4_hash(PARROT_INTERP, const STRING *s, size_t hashval)>

Returns the hashed value of the string, given a seed in hashval.

=cut

*/

static size_t
ucs4_hash(PARROT_INTERP, ARGIN(const STRING *s), size_t hashval)
{
    ASSERT_ARGS(ucs4_hash)
    const Parrot_UInt4 *pos = (const Parrot_UInt4 *) s->strstart;
    UINTVAL len = s->strlen;
    UNUSED(interp);

    while (len--) {
        hashval += hashval << 5;
        hashval += *(pos++);
    }

    return hashval;
}


static STR_VTABLE Parrot_ucs4_encoding = {
    0,
    "ucs4",
    NULL,
    4, /* Max bytes per codepoint */

    ucs4_to_encoding,
    unicode_chr,

    encoding_equal,
    encoding_compare,
    encoding_index,
    encoding_rindex,
    ucs4_hash,
    unicode_validate,

    ucs4_scan,
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
    ucs4_iter_set_and_advance,
    ucs4_iter_set_position
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
 * vim: expandtab shiftwidth=4:
 */
