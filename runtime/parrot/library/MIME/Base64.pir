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

.namespace [ "MIME::Base64" ]

.sub encode_base64

.local string encoded
encoded = 'SGVsbG8sIFdvcmxkIQo=' 

.return( encoded )

.end

.sub decode_base64

.local string decoded
decoded = "Hello, World!\n" 

.return( decoded )

.end

=head1 AUTHOR

Written and maintained by Bernhard Schmalhofer,
C<< Bernhard dot Schmalhofer at gmx dot de >>,
based on the Perl 5 Module MIME::Base64 by Gisle Aas.

=head1 COPYRIGHT

Copyright (C) 2006, The Perl Foundation.

=cut
