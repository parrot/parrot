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
 
    .local pmc plan, is
    plan = find_global "Test::More", 'plan'
    
    plan(4)

    test_pair( "Hello, World!\n", "SGVsbG8sIFdvcmxkIQo=", 'hello' )
    test_pair( '', '', 'empty string' )

.end

.sub test_pair
    .param string plain
    .param string base64
    .param string comment

    .local pmc enc_sub, dec_sub
    enc_sub = get_global [ "MIME"; "Base64" ], 'encode_base64'
    dec_sub = get_global [ "MIME"; "Base64" ], 'decode_base64'
    
    .local pmc plan, is
    is   = find_global 'Test::More', 'is'
    
    .local string result_encode, comment_encode
    result_encode = enc_sub( plain )
    comment_encode = 'encode: ' . comment 
    is( result_encode, base64, comment_encode )

    .local string result_decode, comment_decode
    result_decode = dec_sub( base64 )
    comment_decode = 'decode: ' . comment 
    is( result_decode, plain, comment_decode )
.end

=head1 AUTHOR

Bernhard Schmalhofer <Bernhard Schmalhofer@gmx.de>

=cut
