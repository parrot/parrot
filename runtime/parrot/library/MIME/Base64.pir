
=head1 NAME

MIME::Base64 -  Encoding and decoding of base64 strings

=head1 SYNOPSIS

    # load this library
    load_bytecode 'MIME/Base64.pbc'

=head1 DESCRIPTION

MIME::Base64 is inspired by the Perl5 module MIME::Base64.

=head1 METHODS

This module defines the following subroutines:

=over 4

=item C<encode_base64( str )>

Encode data by calling the encode_base64() function. The first argument
is the string to encode.
The returned encoded string is broken into lines
of no more than 76 characters each.

Note: Unicode stored as MIME::Base64 is inherently endian-dependent.

=item C<decode_base64( str, ?:encoding )>

Decode a base64 string by calling the decode_base64() function.
This function takes as first argument the string to decode,
as optional second argument the encoding string for the decoded data.
It returns the decoded data.

Any character not part of the 65-character base64 subset is silently ignored.
Characters occurring after a '=' padding character are never decoded.

=back

=cut

.include "iterator.pasm"

.namespace [ "MIME"; "Base64" ]

.sub init :load

    # Base64 encoded strings are made of printable 8bit long chars,
    # of which each carries 6 bit worth of information
    .local string printables
    printables = ascii:"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

    # TODO: find saner names
    .local pmc six_to_eight, eight_to_six
    six_to_eight = new 'FixedIntegerArray'
    six_to_eight = 64      # 2 ** 6
    eight_to_six = new 'FixedIntegerArray'
    eight_to_six = 256     # 2 ** 8

    # TODO: find easier way to initialize with undef or so
    eight_to_six[0] = 0
    .local int i
    i = 1
    START_2:
    if i >= 256 goto END_2
        eight_to_six[i] = -1
	inc i
    goto START_2
    END_2:

    .local int six, eight
    .local string tmp
    six = 0
    START_1:
        tmp = substr printables, six, 1
        eight = ord tmp
        eight_to_six[eight] = six
        six_to_eight[six]   = eight
        inc six
    if six < 64 goto START_1
    set_global 'eight_to_six', eight_to_six
    set_global 'six_to_eight', six_to_eight
.end

.sub encode_base64
    .param string plain

    .local string base64
    .local pmc six_to_eight
    six_to_eight = get_global 'six_to_eight'

    .local int len, len_mod_3
    .local pmc bb
    # For unicode we cannot use chr/ord. This breaks endianness.
    # GH 813 and #814
    len = bytelength plain
    bb = new ['ByteBuffer'], len
    bb = plain

    len_mod_3 = len % 3
    # Fill up with with null bytes
    if len_mod_3 == 0 goto END_1
        push bb, 0
        if len_mod_3 == 2 goto END_1
            push bb, 0
    END_1:

    base64 = ''

    .local int    i, j
    .local int    eight_0, eight_1, eight_2
    .local int    six_0, six_1, six_2, six_3
    .local int    tmp_int_1, tmp_int_2
    .local string s_tmp_1

    i = 0
    j = 0
    START_3:
    if i >= len goto END_3

	# read 3*8 bits
        eight_0 = bb[i]
	inc i
        eight_1 = bb[i]
	inc i
        eight_2 = bb[i]
	inc i

        # d[i]>>2;
	shr six_0, eight_0, 2

        # ((d[i]&3)<<4) | (d[i+1]>>4)
	band tmp_int_1, eight_0, 3
	shl tmp_int_1, 4
	shr tmp_int_2, eight_1, 4
	bor six_1, tmp_int_1, tmp_int_2

        # ((d[i+1]&15)<<2) | (d[i+2]>>6)
	band tmp_int_1, eight_1, 15
	shl tmp_int_1, 2
	shr tmp_int_2, eight_2, 6
	bor six_2, tmp_int_1, tmp_int_2

        # d[i+2]&63
	band six_3, eight_2, 63

	# write 4*6 bits, encoded as 4*8 bits,
	# output is larger than input
	tmp_int_1 = six_to_eight[six_0]
	s_tmp_1 = chr tmp_int_1
	base64 = concat base64, s_tmp_1
	tmp_int_1 = six_to_eight[six_1]
	s_tmp_1 = chr tmp_int_1
	base64 = concat base64, s_tmp_1
	tmp_int_1 = six_to_eight[six_2]
	s_tmp_1 = chr tmp_int_1
	base64 = concat base64, s_tmp_1
	tmp_int_1 = six_to_eight[six_3]
	s_tmp_1 = chr tmp_int_1
	base64 = concat base64, s_tmp_1
	inc j

	if j == 19 goto line_split
	goto START_3
      line_split:
        base64 = concat base64, "\n"
        j = 0
        goto START_3
    END_3:

    # padding with '='
    if len_mod_3 == 0 goto END_2
        base64 = replace base64, -1, 1, ascii:"="
        if len_mod_3 == 2 goto END_2
            base64 = replace base64, -2, 1, ascii:"="
    END_2:

    .return( base64 )
.end

.sub decode_base64
    .param string base64
    .param string enc     :optional
    .param int    has_enc :opt_flag

    .local string result, base64_cleaned
    .local int    enc_num
    base64_cleaned = ''
    if has_enc goto HAS_ENC
      enc = 'ascii'
  HAS_ENC:

    .local pmc eight_to_six, bb
    eight_to_six = get_global 'eight_to_six'

    .local int    i, len
    .local int    tmp_int_1, tmp_int_2

    # Get rid of non-base64 chars
    len = length base64
    i = 0
  START_5:
    .local string s_tmp_1
    if i >= len goto END_5
        tmp_int_1 = ord base64, i
        inc i
        tmp_int_2 = eight_to_six[tmp_int_1]
        if tmp_int_2 == -1 goto START_5
        s_tmp_1 = chr tmp_int_1
        base64_cleaned = concat base64_cleaned, s_tmp_1
    goto START_5

  END_5:
    .local int len_mod_4
    len = length base64_cleaned
    len_mod_4 = len % 4

    # make sure that there are dummy bits beyond
    base64_cleaned = concat base64_cleaned, ascii:"\0\0\0"

    bb = new ['ByteBuffer']
    .local int    eight_0, eight_1, eight_2
    .local int    six_0, six_1, six_2, six_3

    i = 0
  START_2:
    if i >= len goto END_2

	# read 4*6 bits
        tmp_int_1 = ord base64_cleaned, i
        six_0 = eight_to_six[tmp_int_1]
        inc i
        tmp_int_1 = ord base64_cleaned, i
        six_1 = eight_to_six[tmp_int_1]
        inc i
        tmp_int_1 = ord base64_cleaned, i
        six_2 = eight_to_six[tmp_int_1]
        inc i
        tmp_int_1 = ord base64_cleaned, i
        six_3 = eight_to_six[tmp_int_1]
        inc i

        # (f64[t.charAt(i)]<<2) | (f64[t.charAt(i+1)]>>4)
        shl tmp_int_1, six_0, 2
	shr tmp_int_2, six_1, 4
	bor eight_0, tmp_int_1, tmp_int_2

        # (f64[t.charAt(i+1)]&15)<<4) | (f64[t.charAt(i+2)]>>2)
        band tmp_int_1, six_1, 15
	shl tmp_int_1, 4
	shr tmp_int_2, six_2, 2
	bor eight_1, tmp_int_1, tmp_int_2

        # (f64[t.charAt(i+2)]&3)<<6) | (f64[t.charAt(i+3)])
        band tmp_int_1, six_2, 3
	shl tmp_int_1, 6
	bor eight_2, tmp_int_1, six_3

	# write 3*8 bits
	# output is larger than input
        push bb, eight_0
        push bb, eight_1
        push bb, eight_2
    goto START_2

  END_2:
    # cut padded '='
    if len_mod_4 == 0 goto END_3
        if len_mod_4 == 1 goto END_3
            len = elements bb
	    dec len
	    bb = len
            if len_mod_4 == 3 goto END_3
	        dec len
	        bb = len

  END_3:
    result = bb.'get_string'(enc)
    .return( result )
.end

=head1 SEE ALSO

L<http://aktuell.de.selfhtml.org/artikel/javascript/utf8b64/base64.htm>
L<http://en.wikipedia.org/wiki/Base64>

=head1 AUTHOR

Written and maintained by Bernhard Schmalhofer,
C<< Bernhard dot Schmalhofer at gmx dot de >>,
based on the Perl 5 Module MIME::Base64 by Gisle Aas
and on the article on de.selfhtml.org.

=head1 COPYRIGHT

Copyright (C) 2006-2012, Parrot Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
