/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/byteorder.c - Byteordering functions

=head1 DESCRIPTION

These are assigned to a vtable when the PBC file is loaded. 

If the vtable method for conversion from the native byteorder is called,
it is a I<no op> and will work, but the caller should know if the
byteorder in the PBC file is native and skip the conversion and just map
it in.

=head2 Byte order handlers

Configure will have checked for supported word sizes.

=over 4

=cut

*/

#include "parrot/parrot.h"

/*

=item C<INTVAL fetch_iv_le(INTVAL w)>

This function converts a 4 or 8 byte C<INTVAL> into little endian
format. If the native format is already little endian, then no
conversion is done.

=cut

*/

INTVAL
fetch_iv_le(INTVAL w)
{
#if !PARROT_BIGENDIAN
    return w;
#else
#  if INTVAL_SIZE == 4
    return (w << 24) | ((w & 0xff00) << 8) | ((w & 0xff0000) >> 8) | (w >> 24);
#  else
    INTVAL r;

    r = w << 56;
    r |= (w & 0xff00) << 40;
    r |= (w & 0xff0000) << 24;
    r |= (w & 0xff000000) << 8;
    r |= (w & 0xff00000000) >> 8;
    r |= (w & 0xff0000000000) >> 24;
    r |= (w & 0xff000000000000) >> 40;
    r |= (w & 0xff00000000000000) >> 56;
    return r;
#  endif
#endif
}

/*

=item C<INTVAL fetch_iv_be(INTVAL w)>

This function converts a 4 or 8 byte C<INTVAL> into big endian format.
If the native format is already big endian, then no conversion is done.

=cut

*/

INTVAL
fetch_iv_be(INTVAL w)
{
#if PARROT_BIGENDIAN
    return w;
#else
#  if INTVAL_SIZE == 4
    return (w << 24) | ((w & 0xff00) << 8) | ((w & 0xff0000) >> 8) | (w >> 24);
#  else
    INTVAL r;
    r = w << 56;
    r |= (w & 0xff00) << 40;
    r |= (w & 0xff0000) << 24;
    r |= (w & 0xff000000) << 8;
    r |= (w & 0xff00000000) >> 8;
    r |= (w & 0xff0000000000) >> 24;
    r |= (w & 0xff000000000000) >> 40;
    r |= (w & 0xff00000000000000) >> 56;
    return r;
#  endif
#endif
}

/*

=item C<opcode_t fetch_op_be(opcode_t w)>

=item C<opcode_t fetch_op_le(opcode_t w)>

Same as above for C<opcode_t>.

=cut

*/

opcode_t
fetch_op_be(opcode_t w)
{
#if PARROT_BIGENDIAN
    return w;
#else
#  if OPCODE_T_SIZE == 4
    return (w << 24) | ((w & 0x0000ff00) << 8) | ((w & 0x00ff0000) >> 8) |
        ((w & 0xff000000) >> 24);
#  else
    opcode_t r;

    r = w << 56;
    r |= (w & 0xff00) << 40;
    r |= (w & 0xff0000) << 24;
    r |= (w & 0xff000000) << 8;
    r |= (w & 0xff00000000) >> 8;
    r |= (w & 0xff0000000000) >> 24;
    r |= (w & 0xff000000000000) >> 40;
    r |= (w & 0xff00000000000000) >> 56;
    return r;
#  endif
#endif
}

opcode_t
fetch_op_le(opcode_t w)
{
#if !PARROT_BIGENDIAN
    return w;
#else
#  if OPCODE_T_SIZE == 4
    return (w << 24) | ((w & 0x0000ff00) << 8) | ((w & 0x00ff0000) >> 8) |
        ((w & 0xff000000) >> 24);
#  else
    opcode_t r;

    r = w << 56;
    r |= (w & 0xff00) << 40;
    r |= (w & 0xff0000) << 24;
    r |= (w & 0xff000000) << 8;
    r |= (w & 0xff00000000) >> 8;
    r |= (w & 0xff0000000000) >> 24;
    r |= (w & 0xff000000000000) >> 40;
    r |= (w & 0xff00000000000000) >> 56;
    return r;
#  endif
#endif
}

/*

=item C<void fetch_buf_be_4(unsigned char *rb, unsigned char *b)>

=item C<void fetch_buf_le_4(unsigned char *rb, unsigned char *b)>

=item C<void fetch_buf_be_8(unsigned char *rb, unsigned char *b)>

=item C<void fetch_buf_le_8(unsigned char *rb, unsigned char *b)>

=item C<void fetch_buf_le_12(unsigned char *rb, unsigned char *b)>

=item C<void fetch_buf_be_12(unsigned char *rb, unsigned char *b)>

=item C<void fetch_buf_le_16(unsigned char *rb, unsigned char *b)>

=item C<void fetch_buf_be_16(unsigned char *rb, unsigned char *b)>

Unrolled routines for swapping various sizes from 32-128 bits. These
should only be used if alignment is unknown or we are pulling something
out of a padded buffer.

=cut

*/

void
fetch_buf_be_4(unsigned char *rb, unsigned char *b)
{
#if PARROT_BIGENDIAN
    memcpy(rb, b, 4);
#else
    rb[0] = b[3];
    rb[1] = b[2];
    rb[2] = b[1];
    rb[3] = b[0];
#endif
}

void
fetch_buf_le_4(unsigned char *rb, unsigned char *b)
{
#if !PARROT_BIGENDIAN
    memcpy(rb, b, 4);
#else
    rb[0] = b[3];
    rb[1] = b[2];
    rb[2] = b[1];
    rb[3] = b[0];
#endif
}

void
fetch_buf_be_8(unsigned char *rb, unsigned char *b)
{
#if PARROT_BIGENDIAN
    memcpy(rb, b, 8);
#else
    rb[0] = b[7];
    rb[1] = b[6];
    rb[2] = b[5];
    rb[3] = b[4];
    rb[4] = b[3];
    rb[5] = b[2];
    rb[6] = b[1];
    rb[7] = b[0];
#endif
}

void
fetch_buf_le_8(unsigned char *rb, unsigned char *b)
{
#if !PARROT_BIGENDIAN
    memcpy(rb, b, 8);
#else
    rb[0] = b[7];
    rb[1] = b[6];
    rb[2] = b[5];
    rb[3] = b[4];
    rb[4] = b[3];
    rb[5] = b[2];
    rb[6] = b[1];
    rb[7] = b[0];
#endif
}

void
fetch_buf_le_12(unsigned char *rb, unsigned char *b)
{
#if !PARROT_BIGENDIAN
    memcpy(rb, b, 12);
#else
    rb[0] = b[11];
    rb[1] = b[10];
    rb[2] = b[9];
    rb[3] = b[8];
    rb[4] = b[7];
    rb[5] = b[6];
    rb[6] = b[5];
    rb[7] = b[4];
    rb[8] = b[3];
    rb[9] = b[2];
    rb[10] = b[1];
    rb[11] = b[0];
#endif
}

void
fetch_buf_be_12(unsigned char *rb, unsigned char *b)
{
#if PARROT_BIGENDIAN
    memcpy(rb, b, 12);
#else
    rb[0] = b[11];
    rb[1] = b[10];
    rb[2] = b[9];
    rb[3] = b[8];
    rb[4] = b[7];
    rb[5] = b[6];
    rb[6] = b[5];
    rb[7] = b[4];
    rb[8] = b[3];
    rb[9] = b[2];
    rb[10] = b[1];
    rb[11] = b[0];
#endif
}

void
fetch_buf_le_16(unsigned char *rb, unsigned char *b)
{
#if !PARROT_BIGENDIAN
    memcpy(rb, b, 16);
#else
    rb[0] = b[15];
    rb[1] = b[14];
    rb[2] = b[13];
    rb[3] = b[12];
    rb[4] = b[11];
    rb[5] = b[10];
    rb[6] = b[9];
    rb[7] = b[8];
    rb[8] = b[7];
    rb[9] = b[6];
    rb[10] = b[5];
    rb[11] = b[4];
    rb[12] = b[3];
    rb[13] = b[2];
    rb[14] = b[1];
    rb[15] = b[0];
#endif
}

void
fetch_buf_be_16(unsigned char *rb, unsigned char *b)
{
#if PARROT_BIGENDIAN
    memcpy(rb, b, 16);
#else
    rb[0] = b[15];
    rb[1] = b[14];
    rb[2] = b[13];
    rb[3] = b[12];
    rb[4] = b[11];
    rb[5] = b[10];
    rb[6] = b[9];
    rb[7] = b[8];
    rb[8] = b[7];
    rb[9] = b[6];
    rb[10] = b[5];
    rb[11] = b[4];
    rb[12] = b[3];
    rb[13] = b[2];
    rb[14] = b[1];
    rb[15] = b[0];
#endif
}

/*

=back

=head1 HISTORY

Initial version by Melvin on 2002/05/1

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
