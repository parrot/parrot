#!./parrot
# Copyright (C) 2006-2012, Parrot Foundation.

=head1 NAME

t/library/mime_base64u.t - test unicode [ 'MIME'; 'Base64' ]

=head1 SYNOPSIS

    % prove t/library/mime_base64u.t

=head1 DESCRIPTION

Test utf8 encoded [ 'MIME'; 'Base64' ]

=cut

.sub test :main
    load_bytecode 'Test/More.pbc'
    load_bytecode 'MIME/Base64.pbc'

    .local pmc plan, is, ok
    plan = get_hll_global [ 'Test'; 'More' ], 'plan'
    is   = get_hll_global [ 'Test'; 'More' ], 'is'
    ok   = get_hll_global [ 'Test'; 'More' ], 'ok'

    plan(5)

    .local pmc encode_decode_tests, decode_tests
    encode_decode_tests = new 'FixedPMCArray', 2
    $P0 = new 'FixedStringArray', 2
    $P0[0] = utf8:"\x{a2}"
    $P0[1] = "wqI="
    encode_decode_tests[0] = $P0
    $P0 = new 'FixedStringArray', 2
    $P0[0] = utf8:"\x{203e}"
    $P0[1] = "4oC+"
    encode_decode_tests[1] = $P0

    decode_tests = new 'FixedPMCArray', 2
    $P0 = new 'FixedStringArray', 2
    $P0[0] = "YWE="
    $P0[1] = "aa"
    decode_tests[0] = $P0
    $P0 = new 'FixedStringArray', 2
    $P0[0] = "YQ"
    $P0[1] = "a"
    decode_tests[1] = $P0
    
    .local int count
    count = 0
    .local pmc test_iterator, test_case
    .local string plain, base64, comment, comment_count

    test_iterator = iter encode_decode_tests
    enc_dec_loop:
        unless test_iterator goto enc_dec_loop_end
        test_case   = shift test_iterator
        plain       = test_case[0]
        base64      = test_case[1]
        comment     = 'encode'
        comment_count = count
        comment = concat comment, comment_count
        comment = concat comment, " "
        comment = concat comment, plain
        test_encode( plain, base64, comment )
        comment     = 'decode'
        comment_count = count
        comment = concat comment, comment_count
        test_decode( plain, base64, comment )
        inc count
    goto enc_dec_loop
    enc_dec_loop_end:

    test_iterator = iter decode_tests
    dec_loop:
        unless test_iterator goto dec_loop_end
        test_case   = shift test_iterator
        base64      = test_case[0]
        plain       = test_case[1]
        comment     = 'decode'
        comment_count = count
        comment = concat comment, comment_count
        comment = concat comment, " "
        comment = concat comment, plain
        test_decode( plain, base64, comment )
        inc count
    goto dec_loop
    dec_loop_end:
.end

.sub test_encode
    .param string plain
    .param string base64
    .param string comment

    .local pmc enc_sub
    enc_sub = get_global [ "MIME"; "Base64" ], 'encode_base64'

    .local pmc is
    is   = get_hll_global [ 'Test'; 'More' ], 'is'

    .local string result_encode
    result_encode = enc_sub( plain )
    is( result_encode, base64, comment )
.end


.sub test_decode
    .param string plain
    .param string base64
    .param string comment

    .local pmc dec_sub
    dec_sub = get_global [ "MIME"; "Base64" ], 'decode_base64'

    .local pmc eight_to_six
    eight_to_six = get_global 'eight_to_six'

    .local pmc is
    is   = get_hll_global [ 'Test'; 'More' ], 'is'

    .local string decode, result_decode
    .local string enc
    $I0 = encoding plain
    enc = encodingname $I0
    decode = dec_sub( base64 )
    result_decode = trans_encoding decode, $I0
    comment = concat comment, " <-"
    comment = concat comment, enc
    is( result_decode, plain, comment )
.end

=head1 AUTHOR

Bernhard Schmalhofer <Bernhard Schmalhofer@gmx.de> and others.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
