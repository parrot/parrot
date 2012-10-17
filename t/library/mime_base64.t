#!./parrot
# Copyright (C) 2006-2012, Parrot Foundation.

=head1 NAME

t/library/mime_base64.t - test [ 'MIME'; 'Base64' ]

=head1 SYNOPSIS

    % prove t/library/mime_base64.t

=head1 DESCRIPTION

Test [ 'MIME'; 'Base64' ]
Test cases taken from base64.t of MIME::Base64.

=cut

.sub test :main
    load_bytecode "dumper.pbc"
    load_bytecode 'Test/More.pbc'
    load_bytecode 'MIME/Base64.pbc'
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Util.pbc'
    load_language 'data_json'

    .local pmc plan, is, ok, lives_ok
    plan     = get_hll_global [ 'Test'; 'More' ], 'plan'
    is       = get_hll_global [ 'Test'; 'More' ], 'is'
    ok       = get_hll_global [ 'Test'; 'More' ], 'ok'

    plan(551)

    .local pmc json
    json = compreg 'data_json'

    .local pmc encode_decode_tests, decode_tests
    encode_decode_tests = json.'compile'( <<'END_JSON' )
[ ["Hello, World!\n","SGVsbG8sIFdvcmxkIQo="],
  ["aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
  "YWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFh\nYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYQ=="],
  ["\u0000","AA=="],
  ["\u0001","AQ=="],
  ["\u0002","Ag=="],
  ["\u0003","Aw=="],
  ["\u0004","BA=="],
  ["\u0005","BQ=="],
  ["\u0006","Bg=="],
  ["\u0007","Bw=="],
  ["\b","CA=="],
  ["\t","CQ=="],
  ["\n","Cg=="],
  ["\u000b","Cw=="],
  ["\f","DA=="],
  ["\r","DQ=="],
  ["\u000e","Dg=="],
  ["\u000f","Dw=="],
  ["\u0010","EA=="],
  ["\u0011","EQ=="],
  ["\u0012","Eg=="],
  ["\u0013","Ew=="],
  ["\u0014","FA=="],
  ["\u0015","FQ=="],
  ["\u0016","Fg=="],
  ["\u0017","Fw=="],
  ["\u0018","GA=="],
  ["\u0019","GQ=="],
  ["\u001a","Gg=="],
  ["\u001b","Gw=="],
  ["\u001c","HA=="],
  ["\u001d","HQ=="],
  ["\u001e","Hg=="],
  ["\u001f","Hw=="],
  [" ","IA=="],
  ["!","IQ=="],
  ["\"","Ig=="],
  ["#","Iw=="],
  ["$","JA=="],
  ["%","JQ=="],
  ["&","Jg=="],
  ["'","Jw=="],
  ["(","KA=="],
  [")","KQ=="],
  ["*","Kg=="],
  ["+","Kw=="],
  [",","LA=="],
  ["-","LQ=="],
  [".","Lg=="],
  ["/","Lw=="],
  ["0","MA=="],
  ["1","MQ=="],
  ["2","Mg=="],
  ["3","Mw=="],
  ["4","NA=="],
  ["5","NQ=="],
  ["6","Ng=="],
  ["7","Nw=="],
  ["8","OA=="],
  ["9","OQ=="],
  [":","Og=="],
  [";","Ow=="],
  ["<","PA=="],
  ["=","PQ=="],
  [">","Pg=="],
  ["?","Pw=="],
  ["@","QA=="],
  ["A","QQ=="],
  ["B","Qg=="],
  ["C","Qw=="],
  ["D","RA=="],
  ["E","RQ=="],
  ["F","Rg=="],
  ["G","Rw=="],
  ["H","SA=="],
  ["I","SQ=="],
  ["J","Sg=="],
  ["K","Sw=="],
  ["L","TA=="],
  ["M","TQ=="],
  ["N","Tg=="],
  ["O","Tw=="],
  ["P","UA=="],
  ["Q","UQ=="],
  ["R","Ug=="],
  ["S","Uw=="],
  ["T","VA=="],
  ["U","VQ=="],
  ["V","Vg=="],
  ["W","Vw=="],
  ["X","WA=="],
  ["Y","WQ=="],
  ["Z","Wg=="],
  ["[","Ww=="],
  ["\\","XA=="],
  ["]","XQ=="],
  ["^","Xg=="],
  ["_","Xw=="],
  ["`","YA=="],
  ["a","YQ=="],
  ["b","Yg=="],
  ["c","Yw=="],
  ["d","ZA=="],
  ["e","ZQ=="],
  ["f","Zg=="],
  ["g","Zw=="],
  ["h","aA=="],
  ["i","aQ=="],
  ["j","ag=="],
  ["k","aw=="],
  ["l","bA=="],
  ["m","bQ=="],
  ["n","bg=="],
  ["o","bw=="],
  ["p","cA=="],
  ["q","cQ=="],
  ["r","cg=="],
  ["s","cw=="],
  ["t","dA=="],
  ["u","dQ=="],
  ["v","dg=="],
  ["w","dw=="],
  ["x","eA=="],
  ["y","eQ=="],
  ["z","eg=="],
  ["{","ew=="],
  ["|","fA=="],
  ["}","fQ=="],
  ["~","fg=="],
  ["\u007f","fw=="],
  ["\u0080","woA="],
  ["\u0081","woE="],
  ["\u0082","woI="],
  ["\u0083","woM="],
  ["\u0084","woQ="],
  ["\u0085","woU="],
  ["\u0086","woY="],
  ["\u0087","woc="],
  ["\u0088","wog="],
  ["\u0089","wok="],
  ["\u008a","woo="],
  ["\u008b","wos="],
  ["\u008c","wow="],
  ["\u008d","wo0="],
  ["\u008e","wo4="],
  ["\u008f","wo8="],
  ["\u0090","wpA="],
  ["\u0091","wpE="],
  ["\u0092","wpI="],
  ["\u0093","wpM="],
  ["\u0094","wpQ="],
  ["\u0095","wpU="],
  ["\u0096","wpY="],
  ["\u0097","wpc="],
  ["\u0098","wpg="],
  ["\u0099","wpk="],
  ["\u009a","wpo="],
  ["\u009b","wps="],
  ["\u009c","wpw="],
  ["\u009d","wp0="],
  ["\u009e","wp4="],
  ["\u009f","wp8="],
  ["\u00a0","wqA="],
  ["\u00a1","wqE="],
  ["\u00a2","wqI="],
  ["\u00a3","wqM="],
  ["\u00a4","wqQ="],
  ["\u00a5","wqU="],
  ["\u00a6","wqY="],
  ["\u00a7","wqc="],
  ["\u00a8","wqg="],
  ["\u00a9","wqk="],
  ["\u00aa","wqo="],
  ["\u00ab","wqs="],
  ["\u00ac","wqw="],
  ["\u00ad","wq0="],
  ["\u00ae","wq4="],
  ["\u00af","wq8="],
  ["\u00b0","wrA="],
  ["\u00b1","wrE="],
  ["\u00b2","wrI="],
  ["\u00b3","wrM="],
  ["\u00b4","wrQ="],
  ["\u00b5","wrU="],
  ["\u00b6","wrY="],
  ["\u00b7","wrc="],
  ["\u00b8","wrg="],
  ["\u00b9","wrk="],
  ["\u00ba","wro="],
  ["\u00bb","wrs="],
  ["\u00bc","wrw="],
  ["\u00bd","wr0="],
  ["\u00be","wr4="],
  ["\u00bf","wr8="],
  ["\u00c0","w4A="],
  ["\u00c1","w4E="],
  ["\u00c2","w4I="],
  ["\u00c3","w4M="],
  ["\u00c4","w4Q="],
  ["\u00c5","w4U="],
  ["\u00c6","w4Y="],
  ["\u00c7","w4c="],
  ["\u00c8","w4g="],
  ["\u00c9","w4k="],
  ["\u00ca","w4o="],
  ["\u00cb","w4s="],
  ["\u00cc","w4w="],
  ["\u00cd","w40="],
  ["\u00ce","w44="],
  ["\u00cf","w48="],
  ["\u00d0","w5A="],
  ["\u00d1","w5E="],
  ["\u00d2","w5I="],
  ["\u00d3","w5M="],
  ["\u00d4","w5Q="],
  ["\u00d5","w5U="],
  ["\u00d6","w5Y="],
  ["\u00d7","w5c="],
  ["\u00d8","w5g="],
  ["\u00d9","w5k="],
  ["\u00da","w5o="],
  ["\u00db","w5s="],
  ["\u00dc","w5w="],
  ["\u00dd","w50="],
  ["\u00de","w54="],
  ["\u00df","w58="],
  ["\u00e0","w6A="],
  ["\u00e1","w6E="],
  ["\u00e2","w6I="],
  ["\u00e3","w6M="],
  ["\u00e4","w6Q="],
  ["\u00e5","w6U="],
  ["\u00e6","w6Y="],
  ["\u00e7","w6c="],
  ["\u00e8","w6g="],
  ["\u00e9","w6k="],
  ["\u00ea","w6o="],
  ["\u00eb","w6s="],
  ["\u00ec","w6w="],
  ["\u00ed","w60="],
  ["\u00ee","w64="],
  ["\u00ef","w68="],
  ["\u00f0","w7A="],
  ["\u00f1","w7E="],
  ["\u00f2","w7I="],
  ["\u00f3","w7M="],
  ["\u00f4","w7Q="],
  ["\u00f5","w7U="],
  ["\u00f6","w7Y="],
  ["\u00f7","w7c="],
  ["\u00f8","w7g="],
  ["\u00f9","w7k="],
  ["\u00fa","w7o="],
  ["\u00fb","w7s="],
  ["\u00fc","w7w="],
  ["\u00fd","w70="],
  ["\u00fe","w74="],
  ["\u00ff","w78="],
  ["\u0000\u00ff","AMO/"],
  ["\u00ff\u0000","w78A"],
  ["\u0000\u0000\u0000","AAAA"],
  ["",""],
  ["a","YQ=="],
  ["aa","YWE="],
  ["aaa","YWFh"],
  ["aaa","YWFh"],
  ["aaa","YWFh"],
  ["aaa","YWFh"],
  ["Aladdin:open sesame","QWxhZGRpbjpvcGVuIHNlc2FtZQ=="],
  ["Multipurpose Internet Mail Extensions: The Base64 Content-Transfer-Encoding is designed to represent sequences of octets in a form that is not humanly readable. ",
  "TXVsdGlwdXJwb3NlIEludGVybmV0IE1haWwgRXh0ZW5zaW9uczogVGhlIEJhc2U2NCBDb250ZW50\nLVRyYW5zZmVyLUVuY29kaW5nIGlzIGRlc2lnbmVkIHRvIHJlcHJlc2VudCBzZXF1ZW5jZXMgb2Yg\nb2N0ZXRzIGluIGEgZm9ybSB0aGF0IGlzIG5vdCBodW1hbmx5IHJlYWRhYmxlLiA="]
]
END_JSON

    decode_tests = json.'compile'( <<'END_JSON' )
[ ["YWE=","aa"],
  [" YWE=","aa"],
  ["Y WE=","aa"],
  ["YWE= ","aa"],
  ["Y\nW\r\nE=","aa"],
  ["YWE=====","aa"],
  ["YWE","aa"],
  ["YWFh====","aaa"],
  ["YQ","a"],
  ["",""]
]
END_JSON

# TODO: These decoding tests seem to cause weird output
# ["Y",""],
# ["x==",""],

    .local int count
    count = 0
    .local pmc test_iterator, test_case
    .local string plain, base64, comment, comment_count, enc, esc_plain

    encode_decode_tests = encode_decode_tests()
    test_iterator = iter encode_decode_tests
    enc_dec_loop:
        unless test_iterator goto enc_dec_loop_end
        test_case   = shift test_iterator
        plain       = shift test_case
        base64      = shift test_case
        comment     = 'encode'
        comment_count = count
        $I0 = encoding plain
        enc = encodingname $I0
        esc_plain = escape plain
        comment = concat comment, comment_count
        comment = concat comment, " "
        comment = concat comment, enc
        comment = concat comment, ":\""
        comment = concat comment, esc_plain
        comment = concat comment, "\""
        test_encode( plain, base64, comment )
        comment     = 'decode'
        comment_count = count
        comment = concat comment, comment_count
        test_decode( plain, base64, comment )
        inc count
    goto enc_dec_loop
    enc_dec_loop_end:

    decode_tests = decode_tests()
    test_iterator = iter decode_tests
    dec_loop:
        unless test_iterator goto dec_loop_end
        test_case   = shift test_iterator
        base64      = shift test_case
        plain       = shift test_case
        comment     = 'decode'
        comment_count = count
        comment = concat comment, comment_count
        test_decode( plain, base64, comment )
        inc count
    goto dec_loop
    dec_loop_end:

    gh813_base64_utf8()

.end

.sub gh813_base64_utf8
    .local pmc lives_ok
    lives_ok = get_hll_global [ 'Test'; 'More' ], 'lives_ok'

    lives_ok(<<'CODE', 'enc_sub("\x{203e}") # Github issue #813')
.sub foo
    .local pmc enc_sub
    enc_sub = get_global [ "MIME"; "Base64" ], 'encode_base64'

    .local string result_encode
    result_encode = enc_sub(utf8:"\x{203e}")
.end
CODE

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

    .local pmc is, skip
    is   = get_hll_global [ 'Test'; 'More' ], 'is'
    skip = get_hll_global [ 'Test'; 'More' ], 'skip'

    $S0 = 'AAAA'
    ne base64, $S0, CONT_TEST
        ## Note: also fails on solaris little-endian
        skip(1, '\0\0\0 fails to compare for unknown reasons GH #855')
        goto END
        unless bigendian goto CONT_TEST
            skip(1, 'multi-byte codepoint test in big-endian')
            goto END
  CONT_TEST:
    .local string decode, result_decode
    .local string enc, enc1
    $I0 = encoding plain
    enc = encodingname $I0
    if $I0 > 2 goto DEC_ENC
        # ascii, latin1
        decode = dec_sub( base64 )
        decode = trans_encoding decode, $I0
        goto DEC_2
  DEC_ENC:
    decode = dec_sub( base64, enc )
  DEC_2:
    $I1 = encoding decode
    enc1 = encodingname $I1
    comment = concat comment, " "
    comment = concat comment, enc1
    comment = concat comment, " <-"
    comment = concat comment, enc

    .local string plain_norm, result_norm
    if has_icu goto HAS_ICU
        is( decode, plain, comment )
	goto END
  HAS_ICU:
    result_norm = compose decode
    plain_norm  = compose plain
    is( result_norm, plain_norm, comment )
  END:
.end


=head1 AUTHOR

Bernhard Schmalhofer <Bernhard Schmalhofer@gmx.de> and Reini Urban.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
