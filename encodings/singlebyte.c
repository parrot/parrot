/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

encodings/singlebyte.c - Single byte encoding

=head1 DESCRIPTION

This is the default encoding for US-ASCII.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

typedef unsigned char byte_t;

/*

=item C<static UINTVAL
singlebyte_characters(const void *ptr, UINTVAL bytes)>

This function simply returns C<bytes>, i.e. the number of characters in
the C<bytes> bytes from C<*ptr>.

=cut

*/

static UINTVAL
singlebyte_characters(const void *ptr, UINTVAL bytes)
{
    UNUSED(ptr);

    return bytes;
}

/*

=item C<static UINTVAL
singlebyte_decode(const void *ptr)>

This simply returns the integer value of C<*ptr>.

=cut

*/

static UINTVAL
singlebyte_decode(const void *ptr)
{
    return *(const byte_t *)ptr;
}

/*

=item C<static void *
singlebyte_encode(void *ptr, UINTVAL c)>

Returns the single byte encoding of integer C<c>.

=cut

*/

static void *
singlebyte_encode(void *ptr, UINTVAL c)
{
    byte_t *bptr = (byte_t *)ptr;

    if (c > 255) {
        internal_exception(INVALID_CHARACTER,
                           "Invalid character for single byte encoding\n");
    }

    *bptr = (byte_t)c;

    return bptr + 1;
}

/*

=item C<static const void *
singlebyte_skip_forward(const void *ptr, UINTVAL n)>

Moves C<ptr> C<n> characters forward.

=cut

*/

static const void *
singlebyte_skip_forward(const void *ptr, UINTVAL n)
{
    const byte_t *bptr = (const byte_t *)ptr;

    return bptr + n;
}

/*

=item C<static const void *
singlebyte_skip_backward(const void *ptr, UINTVAL n)>

Moves C<ptr> C<n> characters back.

=cut

*/

static const void *
singlebyte_skip_backward(const void *ptr, UINTVAL n)
{
    const byte_t *bptr = (const byte_t *)ptr;

    return bptr - n;
}

/*

=back

=head2 Iterator Functions

String iteration is currently only used in C<hash_string_equal()>.

=over 4

=item C<static UINTVAL
singlebyte_decode_and_advance(struct string_iterator_t *i)>

The singlebyte implementation of the string iterator's
C<decode_and_advance> function.

=cut

*/

static UINTVAL
singlebyte_decode_and_advance(struct string_iterator_t *i)
{
    const byte_t *ptr = (byte_t *)i->str->strstart + i->bytepos;
    i->bytepos++;
    i->charpos++;
    return *ptr;
}

/*

=item C<static void
singlebyte_set_position(struct string_iterator_t *i, Parrot_Int pos)>

The DBCS implementation of the string iterator's C<set_position>
function.

=cut

*/

static void
singlebyte_set_position(struct string_iterator_t *i, Parrot_Int pos)
{
    i->bytepos = i->charpos = pos;
}

const ENCODING singlebyte_encoding = {
    enum_encoding_singlebyte,
    "singlebyte",
    1,
    singlebyte_characters,
    singlebyte_decode,
    singlebyte_encode,
    singlebyte_skip_forward,
    singlebyte_skip_backward,
    singlebyte_decode_and_advance,
    singlebyte_set_position
};

/*

=back

=head1 SEE ALSO

F<encodings/dbcs.c>,
F<encodings/singlebyte.c>,
F<encodings/utf8.c>,
F<encodings/utf16.c>,
F<encodings/utf32.c>,
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
