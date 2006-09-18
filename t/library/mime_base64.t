#!./parrot 
# Copyright (C) 2006, The Perl Foundation.

=head1 NAME

t/library/mime_base64.t - test MIME::Base64

=head1 SYNOPSIS

    % prove t/library/mime_base64.t

=head1 DESCRIPTION

Test MIME::Base64.

=cut

.sub main :main
    load_bytecode 'Test/More.pir'
    load_bytecode 'MIME/Base64.pir'
 
    .local pmc enc_sub, dec_sub
    enc_sub = find_global "MIME::Base64", 'encode_base64'
    dec_sub = find_global "MIME::Base64", 'decode_base64'
    
    .local pmc plan, is
    plan = find_global "Test::More", 'plan'
    is   = find_global "Test::More", 'is'
    
    plan(2)

    .local string encoded, decoded, expected_encoded, expected_decoded
    expected_decoded = "Hello, World!\n"
    expected_encoded = "SGVsbG8sIFdvcmxkIQo="

    encoded = enc_sub( expected_decoded )
    decoded = dec_sub( expected_encoded )

    is( encoded, expected_encoded, 'encode_base64()' )
    is( decoded, expected_decoded, 'decode_base64()' )

.end

=head1 AUTHOR

Bernhard Schmalhofer <Bernhard Schmalhofer@gmx.de>

=cut
