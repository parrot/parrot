#!./parrot
# Copyright (C) 2006-2012, Parrot Foundation.

=head1 NAME

t/library/mime_base64u.t - test unicode [ 'MIME'; 'Base64' ]

=head1 SYNOPSIS

    % prove t/library/mime_base64u.t

=head1 DESCRIPTION

Test non-ascii encoded MIME::Base64, without JSON.

perl -MMIME::Base64 -e'for ([qq(a2)],[qq(c2a2)],[qw(203e)],[qw(3e 20)],[qw(1000)],[qw(00c7)],[qw(00ff 0000)])
{ $s=pack "H*",@{$_}; printf "0x%s\t=> %s",join("",@{$_}),encode_base64($s) }'

=cut

.sub test :main
    load_bytecode 'Test/More.pbc'
    load_bytecode 'MIME/Base64.pir'

    .local pmc plan, is, ok
    plan = get_hll_global [ 'Test'; 'More' ], 'plan'
    is   = get_hll_global [ 'Test'; 'More' ], 'is'
    ok   = get_hll_global [ 'Test'; 'More' ], 'ok'

    plan(20)

    .local pmc encode_decode_tests, decode_tests
    .local int i, size
    i = 0
    size = 9
    encode_decode_tests = new 'FixedPMCArray', size

    $P0 = new 'FixedStringArray', 2
    $P0[0] = binary:"\x3e\x20"  # same as 0x203e bswapped
    $P0[1] = "PiA="
    encode_decode_tests[i] = $P0
    inc i
    $P0 = new 'FixedStringArray', 2
    $P0[0] = ucs2:"\x{203e}"  # OVERLINE ‾ 0x203e
    # TODO on big endian we'll get ID4=
    $P0[1] = "PiA="
    encode_decode_tests[i] = $P0
    inc i
    $P0 = new 'FixedStringArray', 2
    $P0[0] = utf8:"\u203e"  # OVERLINE ‾ 0xe280be in utf8
    $P0[1] = "4oC+"
    encode_decode_tests[i] = $P0
    inc i
    $P0 = new 'FixedStringArray', 2
    $P0[0] = iso-8859-1:"\x{a2}" # ¢
    $P0[1] = "og=="
    encode_decode_tests[i] = $P0
    inc i
    $P0 = new 'FixedStringArray', 2
    $P0[0] = utf8:"\x{a2}"   # ¢ 0xc2a2 in utf8
    $P0[1] = "wqI="
    encode_decode_tests[i] = $P0
    inc i
    $P0 = new 'FixedStringArray', 2
    $P0[0] = ucs2:"\x{0100}" # Ā 0xc480 in utf8
    $P0[1] = "AAE="
    encode_decode_tests[i] = $P0
    inc i
    $P0 = new 'FixedStringArray', 2
    $P0[0] = utf8:"\u0100"    # Ā
    $P0[1] = "xIA="
    encode_decode_tests[i] = $P0
    inc i
    $P0 = new 'FixedStringArray', 2
    $P0[0] = utf16:"\x{00c7}" # Ç
    $P0[1] = "xwA="
    encode_decode_tests[i] = $P0
    inc i
    $P0 = new 'FixedStringArray', 2
    $P0[0] = ucs2:"\x{00ff}\x{0000}" # "ÿ\0"
    $P0[1] = "/wAAAA=="
    encode_decode_tests[i] = $P0
    inc i

    decode_tests = new 'FixedPMCArray', 2
    $P0 = new 'FixedStringArray', 2
    $P0[0] = "YWE="
    $P0[1] = "aa"
    decode_tests[0] = $P0
    $P0 = new 'FixedStringArray', 2
    $P0[0] = "YQ"
    $P0[1] = "a"
    decode_tests[1] = $P0

    .local int count, enc_num, hex_cnt, bufused, len
    count = 0
    .local pmc test_iterator, test_case
    .local string plain, base64, comment, comment_count, enc, esc_plain, hex_str
    hex_str = ''

    .include "iglobals.pasm"
    .local pmc interp
    interp = getinterp
    .local pmc config
    config = interp[.IGLOBALS_CONFIG_HASH]
    .local int bigendian
    bigendian  = config['bigendian']

    unless bigendian goto BE_INIT
        .local pmc be_result
        be_result = new 'FixedStringArray', size
	test_iterator = iter encode_decode_tests
      be_loop:
        unless test_iterator goto be_loop_end
        test_case   = shift test_iterator
        base64      = test_case[1]
	be_result[count] = base64
        inc count
        goto be_loop
    be_loop_end:
    be_result[1] = 'ID4='
    be_result[5] = 'AQA='
    be_result[7] = 'AMc='
    be_result[8] = 'AP8AAA=='

  BE_INIT:
    count = 0
    test_iterator = iter encode_decode_tests
    enc_dec_loop:
        unless test_iterator goto enc_dec_loop_end
        test_case   = shift test_iterator
        plain       = test_case[0]
        base64      = test_case[1]
        enc_num = encoding plain
        enc = encodingname enc_num
        esc_plain = escape plain
        bufused = bytelength plain
        len = length plain
        hex_str = hex_chars( plain, enc )
        $P0 = new 'FixedPMCArray', 6
        $P0[0] = count
        $P0[1] = enc
        $P0[2] = esc_plain
        $P0[3] = hex_str
        $P0[4] = bufused
        $P0[5] = len
        comment = sprintf "encode%d %s:\"%s\" %s(size=%d,len=%d)", $P0

	unless bigendian goto BE_SWAP
	    base64 = be_result[count]
      BE_SWAP:
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
        $I0 = encoding plain
        enc = encodingname $I0
        esc_plain = escape plain
        $P0 = new 'ResizablePMCArray'
        push $P0, comment_count
        push $P0, enc
        push $P0, esc_plain
        push $P0, $I0
        comment = sprintf "decode%d %s:\"%s\"(enc=%d)", $P0
        test_decode( plain, base64, comment )
        inc count
    goto dec_loop
    dec_loop_end:
.end

.sub hex_chars
    .param string chars
    .param string enc

    .local string s
    .local pmc bb
    .local int len
    bb = new 'ByteBuffer'
    s = clone chars
    bb = s
    s = bb.'get_string'(enc)
    len = length s
    $P0 = new 'FixedPMCArray', 2
    $I1 = 0
    $S0 = ''
loop_1:
    $I0 = ord s, $I1
    $P0[0] = $S0
    $P0[1] = $I0
    $S0 = sprintf '%s\x%x', $P0
    inc $I1
    if $I1 < len goto loop_1
    ## $S0 = chopn $S0, 2
    .return ($S0)
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

    .include "iglobals.pasm"
    .local pmc interp
    interp = getinterp
    .local pmc config
    config = interp[.IGLOBALS_CONFIG_HASH]
    .local int has_icu
    has_icu = config['has_icu']
    .local int bigendian
    bigendian  = config['bigendian']

    .local pmc dec_sub
    dec_sub = get_global [ "MIME"; "Base64" ], 'decode_base64'

    .local pmc is
    is   = get_hll_global [ 'Test'; 'More' ], 'is'

    .local string decode, result_norm, plain_norm
    .local string enc, enc1
    $I0 = encoding plain
    enc = encodingname $I0

    decode = dec_sub( base64, enc )

    $I1 = encoding decode
    enc1 = encodingname $I1
    $P0 = new 'ResizablePMCArray'
    push $P0, comment
    push $P0, enc1
    push $P0, enc
    push $P0, $I0
    comment = sprintf "%s %s<-%s(enc=%d)", $P0
    if enc == 'binary' goto HEX_C
        if has_icu goto HAS_ICU
            is( decode, plain, comment )
            goto END
  HAS_ICU:
        result_norm = compose decode
        plain_norm  = compose plain
        is( result_norm, plain_norm, comment )
        goto END
  HEX_C:
    $S0 = hex_chars(decode, enc1)
    $S1 = hex_chars(plain, enc)
    is( $S0, $S1, comment )
  END:
.end

=head1 AUTHOR

Reini Urban, Bernhard Schmalhofer <Bernhard Schmalhofer@gmx.de> and others.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
