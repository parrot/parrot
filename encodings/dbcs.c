/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

encodings/dbcs.c - DBCS

=head1 DESCRIPTION

A I<double-byte character set> (DBCS) is a character set that uses two-byte
(16-bit) characters.

DBCS characters are composed of one or two bytes. A lead byte specifies
that it and the following I<trail byte> form a single two-byte-wide
character.

Note that currently all byte values above 127 are assumed to be I<lead
bytes>, therefore C<skip_backward()> cannot be implemented.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

typedef unsigned char byte_t;

/*

=item C<static UINTVAL
dbcs_characters(const void *ptr, UINTVAL bytes)>

Returns the number of characters in the C<bytes> bytes from C<*ptr>.

=cut

*/

static UINTVAL
dbcs_characters(const void *ptr, UINTVAL bytes)
{
    const byte_t *bptr = ptr;
    const byte_t *end = bptr + bytes;
    UINTVAL characters = 0;

    while (bptr < end) {
        if (*bptr > 127) 
            bptr += 2;
        else
            bptr++;
        characters++;
    }

    return characters;
}

/*

=item C<static UINTVAL
dbcs_decode(const void *ptr)>

Returns the integer for the one or two byte character found at C<*ptr>.

=cut

*/

static UINTVAL
dbcs_decode(const void *ptr)
{
    byte_t byte1 = *(const byte_t *)ptr;
    if (byte1 < 128)
        return byte1;
    else {
        byte_t byte2 = *((const byte_t *)ptr+1);
        return (byte1 << 8) | byte2;
    }
}

/*

=item C<static void *
dbcs_encode(void *ptr, UINTVAL c)>

Returns the one or two byte encoding of integer C<c>.

=cut

*/

static void *
dbcs_encode(void *ptr, UINTVAL c)
{
    byte_t *bptr = (byte_t *)ptr;

    if (c < 128)
        *bptr++ = (byte_t)c;
    else {
        if (c >> 8 > 255 || c >> 8 < 128) {
            internal_exception(INVALID_CHARACTER,
                               "Invalid character for DBCS encoding\n");
        }
        else {
            *bptr++ = c >> 8;
            *bptr++ = c & 0xFF;
        }
    }

    return bptr;
}

/*

=item C<static const void *
dbcs_skip_forward(const void *ptr, UINTVAL n)>

Moves C<ptr> C<n> characters forward.

=cut

*/

static const void *
dbcs_skip_forward(const void *ptr, UINTVAL n)
{
    const byte_t *bptr = (const byte_t *)ptr;

    while (n--) {
        if (*bptr > 127)
            bptr += 2;
        else
            bptr++;
    }

    return bptr;
}

/*

=item C<static const void *
dbcs_skip_backward(const void *ptr, UINTVAL n)>

Raises an exception indicating the C<skip_backwards> is an undefined
operation for DBCS.

=cut

*/

static const void *
dbcs_skip_backward(const void *ptr, UINTVAL n)
{
    internal_exception(INVALID_OPERATION,
                       "Undefined operation for DBCS encoding\n");
    return ptr;
}

/*

=back

=head2 Iterator Functions

String iteration is currently only used in C<hash_string_equal()>.

=over 4

=item C<static UINTVAL
dbcs_decode_and_advance(struct string_iterator_t *i)>

The DBCS implementation of the string iterator's C<decode_and_advance>
function.

=cut

*/

static UINTVAL
dbcs_decode_and_advance(struct string_iterator_t *i)
{
    const byte_t *ptr = (byte_t *)i->str->strstart + i->bytepos;
    if (*ptr < 128) {
        i->bytepos++;
        i->charpos++;
        return *ptr;
    }
    else {
        i->bytepos += 2;
        i->charpos++;
        return (*ptr << 8) | *(ptr+1);
    }
}

/*

=item C<static void
dbcs_set_position(struct string_iterator_t *i, Parrot_Int pos)>

The DBCS implementation of the string iterator's C<set_position>
function.

=cut

*/

static void
dbcs_set_position(struct string_iterator_t *i, Parrot_Int pos)
{
    const byte_t *bptr = (byte_t *)i->str->strstart;

    i->charpos = pos;
    while (pos--) {
        if (*bptr > 127)
            bptr += 2;
        else
            bptr++;
    }
    i->bytepos = (const char *)bptr - (const char *)i->str->strstart;
}

const ENCODING dbcs_encoding = {
    enum_encoding_dbcs,
    "dbcs",
    2,
    dbcs_characters,
    dbcs_decode,
    dbcs_encode,
    dbcs_skip_forward,
    dbcs_skip_backward,
    dbcs_decode_and_advance,
    dbcs_set_position
};

/*

=back

=head1 SEE ALSO

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
