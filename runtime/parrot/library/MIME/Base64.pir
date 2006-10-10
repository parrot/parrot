# $Id$

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

=item C<decode_base64( str )>

Decode a base64 string by calling the decode_base64() function.
This function takes a single argument which is the string to decode
and returns the decoded data.

Any character not part of the 65-character base64 subset is silently ignored.
Characters occurring after a '=' padding character are never decoded.

If the length of the string to decode, after ignoring non-base64 chars,
is not a multiple of 4 or if padding occurs too early,
then a warning is generated if perl is running under -w.

=back

=cut

.include "iterator.pasm"

.namespace [ "MIME"; "Base64" ]

.sub init :load

    # printable 8bit chars for 6 bit ints 
    .local string printables
    printables = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

    # TODO: find saner names
    .local pmc six_to_eight, eight_to_six
    six_to_eight = new .FixedIntegerArray
    six_to_eight = 64      # 2 ** 6
    eight_to_six = new .FixedIntegerArray
    eight_to_six = 256     # 2 ** 8

    # TODO: find easier way to initialize
    .local int i
    i = 0
    START_2:
    if i >= 256 goto END_2
        eight_to_six[i] = 0
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
    len = length plain
    len_mod_3 = len % 3
      
    # Fill up with with null bytes
    if len_mod_3 == 0 goto END_1
        concat plain, ascii:"\0"
        if len_mod_3 == 2 goto END_1
            concat plain, ascii:"\0"
    END_1:

    base64 = ''

    .local int    i
    .local int    eight_0, eight_1, eight_2
    .local int    six_0, six_1, six_2, six_3
    .local int    tmp_int_1, tmp_int_2
    .local string s_tmp_1

    i = 0
    START_3:
    if i >= len goto END_3

	# read 3*8 bits
        eight_0 = ord plain, i  
	inc i
        eight_1 = ord plain, i  
	inc i
        eight_2 = ord plain, i  
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
	concat base64, s_tmp_1
	tmp_int_1 = six_to_eight[six_1]
	s_tmp_1 = chr tmp_int_1
	concat base64, s_tmp_1
	tmp_int_1 = six_to_eight[six_2]
	s_tmp_1 = chr tmp_int_1
	concat base64, s_tmp_1
	tmp_int_1 = six_to_eight[six_3]
	s_tmp_1 = chr tmp_int_1
	concat base64, s_tmp_1


    goto START_3
    END_3:

    # padding with '='
    if len_mod_3 == 0 goto END_2
        substr base64, -1, 1, ascii:"="
        if len_mod_3 == 2 goto END_2
            substr base64, -2, 1, ascii:"="
    END_2:

    .return( base64 )
.end

.sub decode_base64
    .param string base64

    .local string plain, base64_cleaned
    base64_cleaned = ''
    plain          = ''

    .local pmc eight_to_six
    eight_to_six = get_global 'eight_to_six'

    .local int    i, len
    .local int    tmp_int_1, tmp_int_2
    .local string s_tmp_1

    # Get rid of non-base64 chars
    len = length base64
    i = 0
    START_5:
    if i >= len goto END_5
        tmp_int_1 = ord base64, i
	inc i
	tmp_int_2 = eight_to_six[tmp_int_1]
	if tmp_int_2 == 0 goto START_5
	s_tmp_1 = chr tmp_int_1
	concat base64_cleaned, s_tmp_1
    goto START_5
    END_5:

    .local int len, len_mod_4
    len = length base64_cleaned
    len_mod_4 = len % 4

    # make sure that there are dummy bits beyond
    concat base64_cleaned, "\0\0\0"

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
	s_tmp_1 = chr eight_0
	concat plain, s_tmp_1
	s_tmp_1 = chr eight_1
	concat plain, s_tmp_1
	s_tmp_1 = chr eight_2
	concat plain, s_tmp_1

    goto START_2
    END_2:

    # cut padded '='
    if len_mod_4 == 0 goto END_3
        if len_mod_4 == 1 goto END_3
	    chopn plain, 1
            if len_mod_4 == 3 goto END_3
	        chopn plain, 1
    END_3:

    .return( plain )
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

Copyright (C) 2006, The Perl Foundation.

=cut
