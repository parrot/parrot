/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

encodings/utf32.c - UTF-32 encoding

=head1 DESCRIPTION

UTF-32 is the default encoding for Unicode.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/unicode.h"

#if 0
typedef unsigned long utf32_t;
#endif

/*

=item C<static UINTVAL
utf32_characters(const void *ptr, UINTVAL bytes)>

Returns the number of characters in the C<bytes> bytes from C<*ptr>.

=cut

*/

static UINTVAL
utf32_characters(const void *ptr, UINTVAL bytes)
{
    UNUSED(ptr);

    return bytes / 4;
}

/*

=item C<static UINTVAL
utf32_decode(const void *ptr)>

Returns the integer for the UTF-32 character found at C<*ptr>.

=cut

*/

static UINTVAL
utf32_decode(const void *ptr)
{
    const utf32_t *u32ptr = ptr;

    return *u32ptr;
}

/*

=item C<static void *
utf32_encode(void *ptr, UINTVAL c)>

Returns the UTF-32 encoding of integer C<c>.

=cut

*/

static void *
utf32_encode(void *ptr, UINTVAL c)
{
    utf32_t *u32ptr = (utf32_t *)ptr;

    if (c > 0x10FFFF || UNICODE_IS_SURROGATE(c)) {
        internal_exception(INVALID_CHARACTER,
                           "Invalid character for UTF-32 encoding\n");
    }

    *u32ptr = c;

    return u32ptr + 1;
}

/*

=item C<static const void *
utf32_skip_forward(const void *ptr, UINTVAL n)>

Moves C<ptr> C<n> characters forward.

=cut

*/

static const void *
utf32_skip_forward(const void *ptr, UINTVAL n)
{
    const utf32_t *u32ptr = (const utf32_t *)ptr;

    return u32ptr + n;
}

/*

=item C<static const void *
utf32_skip_backward(const void *ptr, UINTVAL n)>

Moves C<ptr> C<n> characters back.

=cut

*/

static const void *
utf32_skip_backward(const void *ptr, UINTVAL n)
{
    const utf32_t *u32ptr = (const utf32_t *)ptr;

    return u32ptr - n;
}

/*

=back

=head2 Iterator Functions

String iteration is currently only used in C<hash_string_equal()>.

=over 4

=item C<static UINTVAL
utf32_decode_and_advance(struct string_iterator_t *i)>

The UTF-32 implementation of the string iterator's C<decode_and_advance>
function.

=cut

*/

static UINTVAL
utf32_decode_and_advance(struct string_iterator_t *i)
{
    const utf32_t *u32ptr = (utf32_t *)((char *)i->str->strstart + i->bytepos);
    i->bytepos += 4;
    i->charpos++;
    return *u32ptr;
}

/*

=item C<static void
utf32_set_position(struct string_iterator_t *i, Parrot_Int pos)>

The UTF-32 implementation of the string iterator's C<set_position>
function.

=cut

*/

static void
utf32_set_position(struct string_iterator_t *i, Parrot_Int pos)
{
    i->charpos = pos;
    i->bytepos = pos * 4;
}

const ENCODING utf32_encoding = {
    enum_encoding_utf32,
    "utf32",
    4,
    utf32_characters,
    utf32_decode,
    utf32_encode,
    utf32_skip_forward,
    utf32_skip_backward,
    utf32_decode_and_advance,
    utf32_set_position
};

/*

=back

=head1 SEE ALSO

F<encodings/dbcs.c>,
F<encodings/singlebyte.c>,
F<encodings/utf8.c>,
F<encodings/utf16.c>,
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
