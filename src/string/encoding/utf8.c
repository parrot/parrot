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
#include "utf8.h"

/* HEADERIZER HFILE: src/string/encoding/utf8.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_PURE_FUNCTION
static UINTVAL bytes(SHIM_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(2);

static UINTVAL codepoints(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
static UINTVAL find_cclass(PARROT_INTERP,
    SHIM(const STRING *s),
    SHIM(const INTVAL *typetable),
    SHIM(INTVAL flags),
    SHIM(UINTVAL pos),
    SHIM(UINTVAL end))
        __attribute__nonnull__(1);

static UINTVAL get_byte(SHIM_INTERP,
    ARGIN(const STRING *src),
    UINTVAL offset)
        __attribute__nonnull__(2);

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

PARROT_CANNOT_RETURN_NULL
static STRING * get_codepoints(PARROT_INTERP,
    ARGIN(const STRING *src),
    UINTVAL offset,
    UINTVAL count)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

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

PARROT_CAN_RETURN_NULL
static STRING * to_encoding(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

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

#define ASSERT_ARGS_bytes __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_codepoints __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_find_cclass __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
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
       PARROT_ASSERT_ARG(src) \
    , PARROT_ASSERT_ARG(iter))
#define ASSERT_ARGS_set_byte __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_to_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_utf8_characters __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ptr))
#define ASSERT_ARGS_utf8_decode __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ptr))
#define ASSERT_ARGS_utf8_decode_and_advance __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(i))
#define ASSERT_ARGS_utf8_encode __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ptr))
#define ASSERT_ARGS_utf8_encode_and_advance __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(i))
#define ASSERT_ARGS_utf8_set_position __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(i))
#define ASSERT_ARGS_utf8_skip_backward __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ptr))
#define ASSERT_ARGS_utf8_skip_forward __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ptr))
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

=item C<static UINTVAL utf8_characters(PARROT_INTERP, const utf8_t *ptr, UINTVAL
byte_len)>

Returns the number of characters in the C<byte_len> bytes from C<*ptr>.

XXX This function is unused.

=cut

*/

static UINTVAL
utf8_characters(PARROT_INTERP, ARGIN(const utf8_t *ptr), UINTVAL byte_len)
{
    ASSERT_ARGS(utf8_characters)
    const utf8_t *u8ptr = ptr;
    const utf8_t *u8end = u8ptr + byte_len;
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

=item C<static const void * utf8_skip_forward(const void *ptr, UINTVAL n)>

Moves C<ptr> C<n> characters forward.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static const void *
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

=item C<static const void * utf8_skip_backward(const void *ptr, UINTVAL n)>

Moves C<ptr> C<n> characters back.

XXX This function is unused.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static const void *
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

=back

=head2 Iterator Functions

=over 4

=cut

*/

/*

=item C<static UINTVAL utf8_decode_and_advance(PARROT_INTERP, String_iter *i)>

The UTF-8 implementation of the string iterator's C<get_and_advance>
function.

=cut

*/

static UINTVAL
utf8_decode_and_advance(PARROT_INTERP, ARGMOD(String_iter *i))
{
    ASSERT_ARGS(utf8_decode_and_advance)
    const utf8_t *u8ptr = (utf8_t *)((char *)i->str->strstart + i->bytepos);
    UINTVAL c = *u8ptr;

    if (UTF8_IS_START(c)) {
        UINTVAL len = UTF8SKIP(u8ptr);

        c &= UTF8_START_MASK(len);
        i->bytepos += len;
        for (--len; len; --len) {
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
    else {
        ++i->bytepos;
    }

    ++i->charpos;
    return c;
}

/*

=item C<static void utf8_encode_and_advance(PARROT_INTERP, String_iter *i,
UINTVAL c)>

The UTF-8 implementation of the string iterator's C<set_and_advance>
function.

=cut

*/

static void
utf8_encode_and_advance(PARROT_INTERP, ARGMOD(String_iter *i), UINTVAL c)
{
    ASSERT_ARGS(utf8_encode_and_advance)
    const STRING * const s = i->str;
    unsigned char * const pos = (unsigned char *)s->strstart + i->bytepos;
    unsigned char * const new_pos = (unsigned char *)utf8_encode(interp, pos, c);

    i->bytepos += (new_pos - pos);
    /* XXX possible buffer overrun exception? */
    PARROT_ASSERT(i->bytepos <= Buffer_buflen(s));
    ++i->charpos;
}

/*

=item C<static void utf8_set_position(PARROT_INTERP, String_iter *i, UINTVAL
pos)>

The UTF-8 implementation of the string iterator's C<set_position>
function.

=cut

*/

static void
utf8_set_position(SHIM_INTERP, ARGMOD(String_iter *i), UINTVAL pos)
{
    ASSERT_ARGS(utf8_set_position)
    const utf8_t *u8ptr = (const utf8_t *)i->str->strstart;

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

=item C<static STRING * to_encoding(PARROT_INTERP, const STRING *src)>

Converts the string C<src> to this particular encoding.  If C<dest> is
provided, it will contain the result.  Otherwise this function operates in
place.

=cut

*/

PARROT_CAN_RETURN_NULL
static STRING *
to_encoding(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(to_encoding)
    STRING *result;
    String_iter src_iter;
    UINTVAL offs, dest_len, dest_pos, src_len;
    unsigned char *p;

    if (src->encoding == Parrot_utf8_encoding_ptr)
        return Parrot_str_clone(interp, src);

    result = Parrot_gc_new_string_header(interp, 0);
    src_len = src->strlen;

    /* init iter before possilby changing encoding */
    ENCODING_ITER_INIT(interp, src, &src_iter);
    result->charset  = Parrot_unicode_charset_ptr;
    result->encoding = Parrot_utf8_encoding_ptr;
    result->strlen   = src_len;
    result->extra    = NULL;

    if (!src->strlen)
        return result;

    Parrot_gc_allocate_string_storage(interp, result, src_len);
    p = (unsigned char *)result->strstart;

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
            unsigned char *new_pos;
            unsigned char *pos;

            if (dest_len - dest_pos < 6) {
                UINTVAL need = (UINTVAL)((src->strlen - offs) * 1.5);
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

=item C<static UINTVAL get_codepoint(PARROT_INTERP, const STRING *src, UINTVAL
offset)>

Returns the codepoint in string C<src> at position C<offset>.

=cut

*/

static UINTVAL
get_codepoint(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset)
{
    ASSERT_ARGS(get_codepoint)
    const utf8_t * const start = (const utf8_t *)utf8_skip_forward(src->strstart, offset);
    return utf8_decode(interp, start);
}


/*

=item C<static UINTVAL find_cclass(PARROT_INTERP, const STRING *s, const INTVAL
*typetable, INTVAL flags, UINTVAL pos, UINTVAL end)>

Stub, the charset level handles this for unicode strings.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static UINTVAL
find_cclass(PARROT_INTERP, SHIM(const STRING *s), SHIM(const INTVAL *typetable),
SHIM(INTVAL flags), SHIM(UINTVAL pos), SHIM(UINTVAL end))
{
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
    unsigned char *contents = (unsigned char *)src->strstart;
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
set_byte(PARROT_INTERP, ARGIN(const STRING *src),
        UINTVAL offset, UINTVAL byte)
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

PARROT_CANNOT_RETURN_NULL
static STRING *
get_codepoints(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(get_codepoints)

    STRING * const return_string = Parrot_str_copy(interp, src);
    String_iter    iter;
    UINTVAL        start;

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

=item C<static STRING * get_bytes(PARROT_INTERP, const STRING *src, UINTVAL
offset, UINTVAL count)>

Returns the bytes in string C<src> at position C<offset> and length C<count>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING *
get_bytes(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(get_bytes)
    STRING * const return_string = Parrot_str_copy(interp, src);

    return_string->strstart = (char *)return_string->strstart + offset ;
    return_string->bufused = count;

    return_string->strlen = count;
    return_string->hashval = 0;

    return return_string;
}



/*

=item C<static UINTVAL codepoints(PARROT_INTERP, const STRING *src)>

Returns the number of codepoints in string C<src>.

=cut

*/

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

PARROT_PURE_FUNCTION
static UINTVAL
bytes(SHIM_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(bytes)
    return src->bufused;
}

/*

=item C<static void iter_init(PARROT_INTERP, const STRING *src, String_iter
*iter)>

Initializes for string C<src> the string iterator C<iter>.

=cut

*/

static void
iter_init(SHIM_INTERP, ARGIN(const STRING *src), ARGOUT(String_iter *iter))
{
    ASSERT_ARGS(iter_init)
    iter->str             = src;
    iter->bytepos         = 0;
    iter->charpos         = 0;
    iter->get_and_advance = utf8_decode_and_advance;
    iter->set_and_advance = utf8_encode_and_advance;
    iter->set_position    = utf8_set_position;
}

/*

=item C<void Parrot_encoding_utf8_init(PARROT_INTERP)>

Initializes the UTF-8 encoding.

=cut

*/

void
Parrot_encoding_utf8_init(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_encoding_utf8_init)
    ENCODING * const return_encoding = Parrot_new_encoding(interp);

    static const ENCODING base_encoding = {
        "utf8",
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
    Parrot_register_encoding(interp, "utf8", return_encoding);

    return;
}

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
