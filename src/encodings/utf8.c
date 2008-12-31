/*
Copyright (C) 2001-2008, The Perl Foundation.
$Id$

=head1 NAME

src/encodings/utf8.c - UTF-8 encoding

=head1 DESCRIPTION

UTF-8 (L<http://www.utf-8.com/>).

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "../unicode.h"
#include "utf8.h"

/* HEADERIZER HFILE: src/encodings/utf8.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void become_encoding(PARROT_INTERP, SHIM(STRING *src))
        __attribute__nonnull__(1);

PARROT_PURE_FUNCTION
static UINTVAL bytes(SHIM_INTERP, ARGIN(STRING *src))
        __attribute__nonnull__(2);

static UINTVAL codepoints(PARROT_INTERP, ARGMOD(STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*src);

static UINTVAL get_byte(SHIM_INTERP,
    ARGIN(const STRING *src),
    UINTVAL offset)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING * get_bytes(PARROT_INTERP,
    ARGMOD(STRING *src),
    UINTVAL offset,
    UINTVAL count)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*src);

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

PARROT_CANNOT_RETURN_NULL
static STRING * get_codepoints(PARROT_INTERP,
    ARGIN(STRING *src),
    UINTVAL offset,
    UINTVAL count)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING * get_codepoints_inplace(PARROT_INTERP,
    ARGMOD(STRING *src),
    UINTVAL offset,
    UINTVAL count,
    ARGMOD(STRING *return_string))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*src)
        FUNC_MODIFIES(*return_string);

static void iter_init(SHIM_INTERP,
    ARGIN(const STRING *src),
    ARGOUT(String_iter *iter))
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
    SHIM(STRING *src),
    UINTVAL offset,
    UINTVAL count,
    SHIM(STRING *new_codepoints))
        __attribute__nonnull__(1);

PARROT_CAN_RETURN_NULL
static STRING * to_encoding(PARROT_INTERP,
    ARGMOD(STRING *src),
    ARGMOD_NULLOK(STRING *dest))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*src);

static UINTVAL utf8_characters(PARROT_INTERP,
    ARGIN(const utf8_t *ptr),
    UINTVAL byte_len)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static UINTVAL utf8_decode(PARROT_INTERP, ARGIN(const utf8_t *ptr))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static UINTVAL utf8_decode_and_advance(PARROT_INTERP,
    ARGMOD(String_iter *i))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*i);

PARROT_CANNOT_RETURN_NULL
static void * utf8_encode(PARROT_INTERP, ARGIN(void *ptr), UINTVAL c)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void utf8_encode_and_advance(PARROT_INTERP,
    ARGMOD(String_iter *i),
    UINTVAL c)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*i);

static void utf8_set_position(SHIM_INTERP,
    ARGMOD(String_iter *i),
    UINTVAL pos)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*i);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static const void * utf8_skip_backward(ARGIN(const void *ptr), UINTVAL n)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
static const void * utf8_skip_forward(ARGIN(const void *ptr), UINTVAL n)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_become_encoding assert(interp);
#define ASSERT_ARGS_bytes assert(src);
#define ASSERT_ARGS_codepoints assert(interp); \
                               assert(src);
#define ASSERT_ARGS_get_byte assert(src);
#define ASSERT_ARGS_get_bytes assert(interp); \
                              assert(src);
#define ASSERT_ARGS_get_bytes_inplace assert(interp);
#define ASSERT_ARGS_get_codepoint assert(interp); \
                                  assert(src);
#define ASSERT_ARGS_get_codepoints assert(interp); \
                                   assert(src);
#define ASSERT_ARGS_get_codepoints_inplace assert(interp); \
                                           assert(src); \
                                           assert(return_string);
#define ASSERT_ARGS_iter_init assert(src); \
                              assert(iter);
#define ASSERT_ARGS_set_byte assert(interp); \
                             assert(src);
#define ASSERT_ARGS_set_bytes assert(interp);
#define ASSERT_ARGS_set_codepoint assert(interp); \
                                  assert(src);
#define ASSERT_ARGS_set_codepoints assert(interp);
#define ASSERT_ARGS_to_encoding assert(interp); \
                                assert(src);
#define ASSERT_ARGS_utf8_characters assert(interp); \
                                    assert(ptr);
#define ASSERT_ARGS_utf8_decode assert(interp); \
                                assert(ptr);
#define ASSERT_ARGS_utf8_decode_and_advance assert(interp); \
                                            assert(i);
#define ASSERT_ARGS_utf8_encode assert(interp); \
                                assert(ptr);
#define ASSERT_ARGS_utf8_encode_and_advance assert(interp); \
                                            assert(i);
#define ASSERT_ARGS_utf8_set_position assert(i);
#define ASSERT_ARGS_utf8_skip_backward assert(ptr);
#define ASSERT_ARGS_utf8_skip_forward assert(ptr);
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

#if 0
typedef unsigned char utf8_t;
#endif

/*

=item C<static UINTVAL utf8_characters>

Returns the number of characters in the C<byte_len> bytes from C<*ptr>.

=cut

*/

static UINTVAL
utf8_characters(PARROT_INTERP, ARGIN(const utf8_t *ptr), UINTVAL byte_len)
{
    const utf8_t *u8ptr = ptr;
    const utf8_t *u8end = u8ptr + byte_len;
    UINTVAL characters = 0;
    ASSERT_ARGS(utf8_characters);

    while (u8ptr < u8end) {
        u8ptr += UTF8SKIP(u8ptr);
        characters++;
    }

    if (u8ptr > u8end)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_UTF8,
            "Unaligned end in UTF-8 string\n");

    return characters;
}

/*

=item C<static UINTVAL utf8_decode>

Returns the integer for the UTF-8 character found at C<*ptr>.

=cut

*/

static UINTVAL
utf8_decode(PARROT_INTERP, ARGIN(const utf8_t *ptr))
{
    const utf8_t *u8ptr = ptr;
    UINTVAL c = *u8ptr;
    ASSERT_ARGS(utf8_decode);

    if (UTF8_IS_START(c)) {
        UINTVAL len = UTF8SKIP(u8ptr);
        UINTVAL count;

        c &= UTF8_START_MASK(len);
        for (count = 1; count < len; count++) {
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

    return c;
}

/*

=item C<static void * utf8_encode>

Returns the UTF-8 encoding of integer C<c>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static void *
utf8_encode(PARROT_INTERP, ARGIN(void *ptr), UINTVAL c)
{
    const UINTVAL        len   = UNISKIP(c);

    /* the const is good on u8ptr, but using ptr on other variables avoids the
     * need to do a yucky cast to remove constness */
    const utf8_t * const u8ptr = (utf8_t *)ptr;
    utf8_t              *u8end = (utf8_t *)ptr + len - 1;
    ASSERT_ARGS(utf8_encode);

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

=item C<static const void * utf8_skip_forward>

Moves C<ptr> C<n> characters forward.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static const void *
utf8_skip_forward(ARGIN(const void *ptr), UINTVAL n)
{
    const utf8_t *u8ptr = (const utf8_t *)ptr;
    ASSERT_ARGS(utf8_skip_forward);

    while (n-- > 0) {
        u8ptr += UTF8SKIP(u8ptr);
    }

    return u8ptr;
}

/*

=item C<static const void * utf8_skip_backward>

Moves C<ptr> C<n> characters back.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static const void *
utf8_skip_backward(ARGIN(const void *ptr), UINTVAL n)
{
    const utf8_t *u8ptr = (const utf8_t *)ptr;
    ASSERT_ARGS(utf8_skip_backward);

    while (n-- > 0) {
        u8ptr--;
        while (UTF8_IS_CONTINUATION(*u8ptr))
            u8ptr--;
    }

    return u8ptr;
}

/*

=back

=head2 Iterator Functions

=over 4

=cut

*/

/*

=item C<static UINTVAL utf8_decode_and_advance>

The UTF-8 implementation of the string iterator's C<get_and_advance>
function.

=cut

*/

static UINTVAL
utf8_decode_and_advance(PARROT_INTERP, ARGMOD(String_iter *i))
{
    const utf8_t *u8ptr = (utf8_t *)((char *)i->str->strstart + i->bytepos);
    UINTVAL c = *u8ptr;
    ASSERT_ARGS(utf8_decode_and_advance);

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

=item C<static void utf8_encode_and_advance>

The UTF-8 implementation of the string iterator's C<set_and_advance>
function.

=cut

*/

static void
utf8_encode_and_advance(PARROT_INTERP, ARGMOD(String_iter *i), UINTVAL c)
{
    const STRING * const s = i->str;
    unsigned char * const pos = (unsigned char *)s->strstart + i->bytepos;
    unsigned char * const new_pos = (unsigned char *)utf8_encode(interp, pos, c);
    ASSERT_ARGS(utf8_encode_and_advance);

    i->bytepos += (new_pos - pos);
    /* XXX possible buffer overrun exception? */
    PARROT_ASSERT(i->bytepos <= PObj_buflen(s));
    i->charpos++;
}

/*

=item C<static void utf8_set_position>

The UTF-8 implementation of the string iterator's C<set_position>
function.

=cut

*/

static void
utf8_set_position(SHIM_INTERP, ARGMOD(String_iter *i), UINTVAL pos)
{
    const utf8_t *u8ptr = (const utf8_t *)i->str->strstart;
    ASSERT_ARGS(utf8_set_position);

    /* start from last known charpos, if we can */
    if (i->charpos <= pos) {
        const UINTVAL old_pos = pos;
        pos       -= i->charpos;
        u8ptr     += i->bytepos;
        i->charpos = old_pos;
    }
    else
        i->charpos = pos;

    while (pos-- > 0)
        u8ptr += UTF8SKIP(u8ptr);

    i->bytepos = (const char *)u8ptr - (const char *)i->str->strstart;
}


/*

=item C<static STRING * to_encoding>

Converts the string C<src> to this particular encoding.  If C<dest> is
provided, it will contain the result.  Otherwise this function operates in
place.

=cut

*/

PARROT_CAN_RETURN_NULL
static STRING *
to_encoding(PARROT_INTERP, ARGMOD(STRING *src), ARGMOD_NULLOK(STRING *dest))
{
    STRING *result;
    String_iter src_iter;
    UINTVAL offs, dest_len, dest_pos, src_len;
    const int in_place = (dest == NULL);
    unsigned char *new_pos, *pos, *p;
    ASSERT_ARGS(to_encoding);

    if (src->encoding == Parrot_utf8_encoding_ptr)
        return in_place ? src : string_copy(interp, src);
    src_len = src->strlen;
    if (in_place) {
        result = src;
    }
    else {
        result = dest;
    }

    /* init iter before possilby changing encoding */
    ENCODING_ITER_INIT(interp, src, &src_iter);
    result->charset  = Parrot_unicode_charset_ptr;
    result->encoding = Parrot_utf8_encoding_ptr;
    result->strlen   = src_len;

    if (!src->strlen)
        return dest;

    if (in_place) {
        /* need intermediate memory */
        p = (unsigned char *)mem_sys_allocate(src_len);
    }
    else {
        Parrot_reallocate_string(interp, dest, src_len);
        p = (unsigned char *)dest->strstart;
    }
    if (src->charset == Parrot_ascii_charset_ptr) {
        for (dest_len = 0; dest_len < src_len; ++dest_len) {
            p[dest_len] = ((unsigned char*)src->strstart)[dest_len];
        }
        result->bufused = dest_len;
    }
    else {
        dest_len = src_len;
        dest_pos = 0;
        for (offs = 0; offs < src_len; ++offs) {
            const UINTVAL c = src_iter.get_and_advance(interp, &src_iter);
            if (dest_len - dest_pos < 6) {
                UINTVAL need = (UINTVAL)((src->strlen - offs) * 1.5);
                if (need < 16)
                    need = 16;
                dest_len += need;
                if (in_place)
                    p = (unsigned char *)mem_sys_realloc(p, dest_len);
                else {
                    result->bufused = dest_pos;
                    Parrot_reallocate_string(interp, dest, dest_len);
                    p = (unsigned char *)dest->strstart;
                }
            }

            pos = p + dest_pos;
            new_pos = (unsigned char *)utf8_encode(interp, pos, c);
            dest_pos += (new_pos - pos);
        }
        result->bufused = dest_pos;
    }
    if (in_place) {
        Parrot_reallocate_string(interp, src, src->bufused);
        memcpy(src->strstart, p, src->bufused);
        mem_sys_free(p);
    }
    return result;
}

/*

=item C<static UINTVAL get_codepoint>

Returns the codepoint in string C<src> at position C<offset>.

=cut

*/

static UINTVAL
get_codepoint(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset)
{
    const utf8_t * const start = (const utf8_t *)utf8_skip_forward(src->strstart, offset);
    ASSERT_ARGS(get_codepoint);
    return utf8_decode(interp, start);
}

/*

=item C<static void set_codepoint>

Sets, in string C<src> at position C<offset>, the codepoint C<codepoint>.

=cut

*/

static void
set_codepoint(PARROT_INTERP, ARGIN(STRING *src), UINTVAL offset, UINTVAL codepoint)
{
    const void *start;
    void *p;
    DECL_CONST_CAST;
    ASSERT_ARGS(set_codepoint);

    start = utf8_skip_forward(src->strstart, offset);
    p = PARROT_const_cast(void *, start);
    utf8_encode(interp, p, codepoint);
}

/*

=item C<static UINTVAL get_byte>

Returns the byte in string C<src> at position C<offset>.

=cut

*/

static UINTVAL
get_byte(SHIM_INTERP, ARGIN(const STRING *src), UINTVAL offset)
{
    unsigned char *contents = (unsigned char *)src->strstart;
    ASSERT_ARGS(get_byte);
    if (offset >= src->bufused) {
/*        Parrot_ex_throw_from_c_args(interp, NULL, 0,
                "get_byte past the end of the buffer (%i of %i)",
                offset, src->bufused); */
        return 0;
    }
    return contents[offset];
}

/*

=item C<static void set_byte>

Sets, in string C<src> at position C<offset>, the byte C<byte>.

=cut

*/

static void
set_byte(PARROT_INTERP, ARGIN(const STRING *src),
        UINTVAL offset, UINTVAL byte)
{
    unsigned char *contents;
    ASSERT_ARGS(set_byte);

    if (offset >= src->bufused)
        Parrot_ex_throw_from_c_args(interp, NULL, 0,
            "set_byte past the end of the buffer");

    contents = (unsigned char *)src->strstart;
    contents[offset] = (unsigned char)byte;
}

/*

=item C<static STRING * get_codepoints>

Returns the codepoints in string C<src> at position C<offset> and length
C<count>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING *
get_codepoints(PARROT_INTERP, ARGIN(STRING *src), UINTVAL offset, UINTVAL count)
{

    STRING * const return_string = Parrot_make_COW_reference(interp, src);
    String_iter    iter;
    UINTVAL        start;
    ASSERT_ARGS(get_codepoints);

    iter_init(interp, src, &iter);

    if (offset)
        iter.set_position(interp, &iter, offset);

    start                   = iter.bytepos;
    return_string->strstart = (char *)return_string->strstart + start;

    if (count)
        iter.set_position(interp, &iter, offset + count);

    return_string->bufused  = iter.bytepos - start;
    return_string->strlen   = count;
    return_string->hashval  = 0;

    return return_string;
}

/*

=item C<static STRING * get_bytes>

Returns the bytes in string C<src> at position C<offset> and length C<count>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING *
get_bytes(PARROT_INTERP, ARGMOD(STRING *src), UINTVAL offset, UINTVAL count)
{
    STRING * const return_string = Parrot_make_COW_reference(interp, src);
    ASSERT_ARGS(get_bytes);

    return_string->encoding = src->encoding;    /* XXX */
    return_string->charset = src->charset;

    return_string->strstart = (char *)return_string->strstart + offset ;
    return_string->bufused = count;

    return_string->strlen = count;
    return_string->hashval = 0;

    return return_string;
}

/*

=item C<static STRING * get_codepoints_inplace>

Gets from string C<src> at position C<offset> C<count> codepoints and returns
them in C<return_string>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING *
get_codepoints_inplace(PARROT_INTERP, ARGMOD(STRING *src),
        UINTVAL offset, UINTVAL count, ARGMOD(STRING *return_string))
{
    String_iter iter;
    UINTVAL start;
    ASSERT_ARGS(get_codepoints_inplace);

    Parrot_reuse_COW_reference(interp, src, return_string);
    iter_init(interp, src, &iter);
    iter.set_position(interp, &iter, offset);

    start = iter.bytepos;

    return_string->strstart = (char *)return_string->strstart + start;
    iter.set_position(interp, &iter, offset + count);

    return_string->bufused = iter.bytepos - start;
    return_string->strlen  = count;
    return_string->hashval = 0;

    return return_string;
}

/*

=item C<static STRING * get_bytes_inplace>

Gets from string C<src> at position C<offset> C<count> bytes and returns them
in C<return_string>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING *
get_bytes_inplace(PARROT_INTERP, SHIM(STRING *src),
        UINTVAL offset, UINTVAL count, SHIM(STRING *return_string))
{
    ASSERT_ARGS(get_bytes_inplace);
    UNIMPL;
}

/*

=item C<static void set_codepoints>

Replaces in string C<src> at position C<offset> for C<count> codepoints with
the contents of string C<new_codepoints>.

=cut

*/

static void
set_codepoints(PARROT_INTERP, SHIM(STRING *src),
        UINTVAL offset, UINTVAL count, SHIM(STRING *new_codepoints))
{
    ASSERT_ARGS(set_codepoints);
    UNIMPL;
}

/*

=item C<static void set_bytes>

Replaces in string C<src> at position C<offset> for C<count> bytes with the
contents of string C<new_bytes>.

=cut

*/

static void
set_bytes(PARROT_INTERP, SHIM(STRING *src),
        UINTVAL offset, UINTVAL count, SHIM(STRING *new_bytes))
{
    ASSERT_ARGS(set_bytes);
    UNIMPL;
}

/*

=item C<static void become_encoding>

Unconditionally makes the string be in this encoding, if that's valid

=cut

*/

static void
become_encoding(PARROT_INTERP, SHIM(STRING *src))
{
    ASSERT_ARGS(become_encoding);
    UNIMPL;
}


/*

=item C<static UINTVAL codepoints>

Returns the number of codepoints in string C<src>.

=cut

*/

static UINTVAL
codepoints(PARROT_INTERP, ARGMOD(STRING *src))
{
    String_iter iter;
    ASSERT_ARGS(codepoints);
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

Returns the number of bytes in string C<src>.

=cut

*/

PARROT_PURE_FUNCTION
static UINTVAL
bytes(SHIM_INTERP, ARGIN(STRING *src))
{
    ASSERT_ARGS(bytes);
    return src->bufused;
}

/*

=item C<static void iter_init>

Initializes for string C<src> the string iterator C<iter>.

=cut

*/

static void
iter_init(SHIM_INTERP, ARGIN(const STRING *src), ARGOUT(String_iter *iter))
{
    ASSERT_ARGS(iter_init);
    iter->str             = src;
    iter->bytepos         = 0;
    iter->charpos         = 0;
    iter->get_and_advance = utf8_decode_and_advance;
    iter->set_and_advance = utf8_encode_and_advance;
    iter->set_position    = utf8_set_position;
}

/*

=item C<ENCODING * Parrot_encoding_utf8_init>

Initializes the UTF-8 encoding.

=cut

*/

PARROT_CANNOT_RETURN_NULL
ENCODING *
Parrot_encoding_utf8_init(PARROT_INTERP)
{
    ENCODING * const return_encoding = Parrot_new_encoding(interp);

    static const ENCODING base_encoding = {
        "utf8",
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
    ASSERT_ARGS(Parrot_encoding_utf8_init);
    STRUCT_COPY_FROM_STRUCT(return_encoding, base_encoding);
    Parrot_register_encoding(interp, "utf8", return_encoding);
    return return_encoding;
}

/*

=back

=head1 SEE ALSO

F<src/encodings/fixed_8.c>,
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
