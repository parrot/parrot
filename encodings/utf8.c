/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

encodings/utf8.c - UTF-8 encoding

=head1 DESCRIPTION

UTF-8 (L<http://www.utf-8.com/>).

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/unicode.h"
#include "utf8.h"

#define UNIMPL internal_exception(UNIMPLEMENTED, "unimpl utf8")

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

static void iter_init(Interp *, String *src, String_iter *iter);
/*

=item C<static UINTVAL
utf8_characters(const void *ptr, UINTVAL bytes)>

Returns the number of characters in the C<byte_len> bytes from C<*ptr>.

=cut

*/

static UINTVAL
utf8_characters(const void *ptr, UINTVAL byte_len)
{
    const utf8_t *u8ptr = ptr;
    const utf8_t *u8end = u8ptr + byte_len;
    UINTVAL characters = 0;

    while (u8ptr < u8end) {
        u8ptr += UTF8SKIP(u8ptr);
        characters++;
    }

    if (u8ptr > u8end) {
        internal_exception(MALFORMED_UTF8, "Unaligned end in UTF-8 string\n");
    }

    return characters;
}

/*

=item C<static UINTVAL
utf8_decode(const void *ptr)>

Returns the integer for the UTF-8 character found at C<*ptr>.

=cut

*/

static UINTVAL
utf8_decode(const void *ptr)
{
    const utf8_t *u8ptr = ptr;
    UINTVAL c = *u8ptr;

    if (UTF8_IS_START(c)) {
        UINTVAL len = UTF8SKIP(u8ptr);
        UINTVAL count;

        c &= UTF8_START_MASK(len);
        for (count = 1; count < len; count++) {
            u8ptr++;
            if (!UTF8_IS_CONTINUATION(*u8ptr)) {
                internal_exception(MALFORMED_UTF8, "Malformed UTF-8 string\n");
            }
            c = UTF8_ACCUMULATE(c, *u8ptr);
        }

        if (UNICODE_IS_SURROGATE(c)) {
            internal_exception(MALFORMED_UTF8, "Surrogate in UTF-8 string\n");
        }
    }
    else if (!UNICODE_IS_INVARIANT(c)) {
        internal_exception(MALFORMED_UTF8, "Malformed UTF-8 string\n");
    }

    return c;
}

/*

=item C<static void *
utf8_encode(void *ptr, UINTVAL c)>

Returns the UTF-8 encoding of integer C<c>.

=cut

*/

static void *
utf8_encode(void *ptr, UINTVAL c)
{
    utf8_t *u8ptr = (utf8_t *)ptr;
    UINTVAL len = UNISKIP(c);
    utf8_t *u8end = u8ptr + len - 1;

    if (c > 0x10FFFF || UNICODE_IS_SURROGATE(c)) {
        internal_exception(INVALID_CHARACTER,
                           "Invalid character for UTF-8 encoding\n");
    }

    while (u8end > u8ptr) {
        *u8end-- =
            (utf8_t)((c & UTF8_CONTINUATION_MASK) | UTF8_CONTINUATION_MARK);
        c >>= UTF8_ACCUMULATION_SHIFT;
    }
    *u8end = (utf8_t)((c & UTF8_START_MASK(len)) | UTF8_START_MARK(len));

    return u8ptr + len;
}

/* temporary */
void * Parrot_utf8_encode(void *ptr, UINTVAL c);

void *
Parrot_utf8_encode(void *ptr, UINTVAL c)
{
	return utf8_encode(ptr, c);
}


/*

=item C<static const void *
utf8_skip_forward(const void *ptr, UINTVAL n)>

Moves C<ptr> C<n> characters forward.

=cut

*/

static const void *
utf8_skip_forward(const void *ptr, UINTVAL n)
{
    const utf8_t *u8ptr = (const utf8_t *)ptr;

    while (n-- > 0) {
        u8ptr += UTF8SKIP(u8ptr);
    }

    return u8ptr;
}

/*

=item C<static const void *
utf8_skip_backward(const void *ptr, UINTVAL n)>

Moves C<ptr> C<n> characters back.

=cut

*/

static const void *
utf8_skip_backward(const void *ptr, UINTVAL n)
{
    const utf8_t *u8ptr = (const utf8_t *)ptr;

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

=item C<static UINTVAL
utf8_decode_and_advance(Interp *, String_iter *i)>

The UTF-8 implementation of the string iterator's C<get_and_advance>
function.

=item C<static void
utf8_encode_and_advance(Interp *, String_iter *i, UINTVAL c)>

The UTF-8 implementation of the string iterator's C<set_and_advance>
function.

=cut

*/

static UINTVAL
utf8_decode_and_advance(Interp *interpreter, String_iter *i)
{
    const utf8_t *u8ptr = (utf8_t *)((char *)i->str->strstart + i->bytepos);
    UINTVAL c = *u8ptr;

    if (UTF8_IS_START(c)) {
        UINTVAL len = UTF8SKIP(u8ptr);

        c &= UTF8_START_MASK(len);
        i->bytepos += len;
        for (len--; len; len--) {
            u8ptr++;
            if (!UTF8_IS_CONTINUATION(*u8ptr)) {
                internal_exception(MALFORMED_UTF8, "Malformed UTF-8 string\n");
            }
            c = UTF8_ACCUMULATE(c, *u8ptr);
        }

        if (UNICODE_IS_SURROGATE(c)) {
            internal_exception(MALFORMED_UTF8, "Surrogate in UTF-8 string\n");
        }
    }
    else if (!UNICODE_IS_INVARIANT(c)) {
        internal_exception(MALFORMED_UTF8, "Malformed UTF-8 string\n");
    }
    else {
        i->bytepos++;
    }

    i->charpos++;
    return c;
}

static void
utf8_encode_and_advance(Interp *interpreter, String_iter *i, UINTVAL c)
{
    const STRING *s = i->str;
    unsigned char *new_pos, *pos;

    pos = (unsigned char *)s->strstart + i->bytepos;
    new_pos = utf8_encode(pos, c);
    i->bytepos += (new_pos - pos);
    /* XXX possible buffer overrun exception? */
    assert(i->bytepos < PObj_buflen(s));
    i->charpos++;
}

/*

=item C<func>

The UTF-8 implementation of the string iterator's C<set_position>
function.

=cut

*/

/* XXX Should use quickest direction */
static void
utf8_set_position(Interp *interpreter, String_iter *i, UINTVAL pos)
{
    const utf8_t *u8ptr = (utf8_t *)i->str->strstart;

    i->charpos = pos;
    while (pos-- > 0) {
        u8ptr += UTF8SKIP(u8ptr);
    }
    i->bytepos = (const char *)u8ptr - (const char *)i->str->strstart;
}


/* This function needs to go through and get all the code points one
   by one and turn them into a utf8 sequence */
static void
to_encoding(Interp *interpreter, STRING *src)
{
    if (src->encoding == Parrot_utf8_encoding_ptr)
        return;
    UNIMPL;
}

static STRING *
copy_to_encoding(Interp *interpreter, STRING *src)
{
    STRING *dest;
    String_iter src_iter, dest_iter;
    UINTVAL offs, c;

    if (src->encoding == Parrot_utf8_encoding_ptr)
        return string_copy(interpreter, src);

    /*
     * TODO adapt string creation functions
     */
    dest = string_make_empty(interpreter, enum_stringrep_one, src->strlen);
    dest->charset  = Parrot_unicode_charset_ptr;
    dest->encoding = Parrot_utf8_encoding_ptr;
    dest->strlen   = src->strlen;

    if (!src->strlen)
        return dest;

    ENCODING_ITER_INIT(interpreter, src, &src_iter);
    ENCODING_ITER_INIT(interpreter, dest, &dest_iter);

    for (offs = 0; offs < src->strlen; ++offs) {
        c = src_iter.get_and_advance(interpreter, &src_iter);
        if (dest_iter.bytepos >= PObj_buflen(dest) - 4) {
            UINTVAL need = (src->strlen - offs) * 1.5;
            if (need < 16)
                need = 16;
            Parrot_reallocate_string(interpreter, dest,
                    PObj_buflen(dest) + need);
        }
        dest_iter.set_and_advance(interpreter, &dest_iter, c);
    }
    assert(dest->strlen  == dest_iter.charpos);
    dest->bufused = dest_iter.bytepos;
    return dest;
}

static UINTVAL
get_codepoint(Interp *interpreter, const STRING *src, UINTVAL offset)
{
    const void *start;

    start = utf8_skip_forward(src->strstart, offset);
    return utf8_decode(start);
}

static void
set_codepoint(Interp *interpreter, STRING *src,
	UINTVAL offset, UINTVAL codepoint)
{
    const void *start;
    void *p;
    union {
        const void * __c_ptr;
        void * __ptr;
    } __ptr_u;

    start = utf8_skip_forward(src->strstart, offset);
    p = const_cast(start);
    utf8_encode(p, codepoint);
}

static UINTVAL
get_byte(Interp *interpreter, const STRING *src, UINTVAL offset)
{
    unsigned char *contents = src->strstart;
    if (offset >= src->bufused) {
	internal_exception(0,
		"get_byte past the end of the buffer (%i of %i)",
		offset, src->bufused);
    }
    return contents[offset];
}

static void
set_byte(Interp *interpreter, const STRING *src,
	UINTVAL offset, UINTVAL byte)
{
    unsigned char *contents;
    if (offset >= src->bufused) {
	internal_exception(0, "set_byte past the end of the buffer");
    }
    contents = src->strstart;
    contents[offset] = byte;
}

static STRING *
get_codepoints(Interp *interpreter, STRING *src,
	UINTVAL offset, UINTVAL count)
{
    STRING *return_string = NULL;
    UNIMPL;
    return return_string;
}

static STRING *
get_bytes(Interp *interpreter, STRING *src,
	UINTVAL offset, UINTVAL count)
{
    STRING *return_string = Parrot_make_COW_reference(interpreter,
	    src);
    return_string->encoding = src->encoding;    /* XXX */
    return_string->charset = src->charset;

    return_string->strstart = (char *)return_string->strstart + offset ;
    return_string->bufused = count;

    return_string->strlen = count;
    return_string->hashval = 0;

    return return_string;
}


static STRING *
get_codepoints_inplace(Interp *interpreter, STRING *src,
	UINTVAL offset, UINTVAL count, STRING *dest_string)
{

    UNIMPL;
    return NULL;
}

static STRING *
get_bytes_inplace(Interp *interpreter, STRING *src,
	UINTVAL offset, UINTVAL count, STRING *return_string)
{
    UNIMPL;
    return NULL;
}

static void
set_codepoints(Interp *interpreter, STRING *src,
	UINTVAL offset, UINTVAL count, STRING *new_codepoints)
{
    UNIMPL;
}

static void
set_bytes(Interp *interpreter, STRING *src,
	UINTVAL offset, UINTVAL count, STRING *new_bytes)
{
    UNIMPL;
}

/* Unconditionally makes the string be in this encoding, if that's
   valid */
static void
become_encoding(Interp *interpreter, STRING *src)
{
    UNIMPL;
}


static UINTVAL
codepoints(Interp *interpreter, STRING *src)
{
    String_iter iter;
    /*
     * this is used to initially calculate src->strlen,
     * therefore we must scan the whole string
     */
    iter_init(interpreter, src, &iter);
    while (iter.bytepos < src->bufused)
        iter.get_and_advance(interpreter, &iter);
    return iter.charpos;
}

static UINTVAL
bytes(Interp *interpreter, STRING *src)
{
    return src->bufused;
}

static void
iter_init(Interp *interpreter, String *src, String_iter *iter)
{
    iter->str = src;
    iter->bytepos = iter->charpos = 0;
    iter->get_and_advance = utf8_decode_and_advance;
    iter->set_and_advance = utf8_encode_and_advance;
    iter->set_position =    utf8_set_position;
}

ENCODING *
Parrot_encoding_utf8_init(Interp *interpreter)
{
    ENCODING *return_encoding = Parrot_new_encoding(interpreter);

    static const ENCODING base_encoding = {
	"utf8",
	4, /* Max bytes per codepoint 0 .. 0x10ffff */
	to_encoding,
	copy_to_encoding,
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
    memcpy(return_encoding, &base_encoding, sizeof(ENCODING));
    Parrot_register_encoding(interpreter, "utf8", return_encoding);
    return return_encoding;
}

/*

=back

=head1 SEE ALSO

F<encodings/fixed_8.c>,
F<src/string.c>,
F<include/parrot/string.h>,
F<docs/string.pod>.

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
