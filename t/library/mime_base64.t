#!./parrot
# Copyright (C) 2006-2010, Parrot Foundation.

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

    .local pmc plan, is, ok
    plan = get_hll_global [ 'Test'; 'More' ], 'plan'
    is   = get_hll_global [ 'Test'; 'More' ], 'is'
    ok   = get_hll_global [ 'Test'; 'More' ], 'ok'

    plan(550)

    .local pmc json
    json = compreg 'data_json'

    .local pmc encode_decode_tests, decode_tests
    encode_decode_tests = json.'compile'( <<'END_JSON' )
[ ["Hello, World!\n","SGVsbG8sIFdvcmxkIQo="],
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
  ["\u0080","gA=="],
  ["\u0081","gQ=="],
  ["\u0082","gg=="],
  ["\u0083","gw=="],
  ["\u0084","hA=="],
  ["\u0085","hQ=="],
  ["\u0086","hg=="],
  ["\u0087","hw=="],
  ["\u0088","iA=="],
  ["\u0089","iQ=="],
  ["\u008a","ig=="],
  ["\u008b","iw=="],
  ["\u008c","jA=="],
  ["\u008d","jQ=="],
  ["\u008e","jg=="],
  ["\u008f","jw=="],
  ["\u0090","kA=="],
  ["\u0091","kQ=="],
  ["\u0092","kg=="],
  ["\u0093","kw=="],
  ["\u0094","lA=="],
  ["\u0095","lQ=="],
  ["\u0096","lg=="],
  ["\u0097","lw=="],
  ["\u0098","mA=="],
  ["\u0099","mQ=="],
  ["\u009a","mg=="],
  ["\u009b","mw=="],
  ["\u009c","nA=="],
  ["\u009d","nQ=="],
  ["\u009e","ng=="],
  ["\u009f","nw=="],
  ["\u00a0","oA=="],
  ["\u00a1","oQ=="],
  ["\u00a2","og=="],
  ["\u00a3","ow=="],
  ["\u00a4","pA=="],
  ["\u00a5","pQ=="],
  ["\u00a6","pg=="],
  ["\u00a7","pw=="],
  ["\u00a8","qA=="],
  ["\u00a9","qQ=="],
  ["\u00aa","qg=="],
  ["\u00ab","qw=="],
  ["\u00ac","rA=="],
  ["\u00ad","rQ=="],
  ["\u00ae","rg=="],
  ["\u00af","rw=="],
  ["\u00b0","sA=="],
  ["\u00b1","sQ=="],
  ["\u00b2","sg=="],
  ["\u00b3","sw=="],
  ["\u00b4","tA=="],
  ["\u00b5","tQ=="],
  ["\u00b6","tg=="],
  ["\u00b7","tw=="],
  ["\u00b8","uA=="],
  ["\u00b9","uQ=="],
  ["\u00ba","ug=="],
  ["\u00bb","uw=="],
  ["\u00bc","vA=="],
  ["\u00bd","vQ=="],
  ["\u00be","vg=="],
  ["\u00bf","vw=="],
  ["\u00c0","wA=="],
  ["\u00c1","wQ=="],
  ["\u00c2","wg=="],
  ["\u00c3","ww=="],
  ["\u00c4","xA=="],
  ["\u00c5","xQ=="],
  ["\u00c6","xg=="],
  ["\u00c7","xw=="],
  ["\u00c8","yA=="],
  ["\u00c9","yQ=="],
  ["\u00ca","yg=="],
  ["\u00cb","yw=="],
  ["\u00cc","zA=="],
  ["\u00cd","zQ=="],
  ["\u00ce","zg=="],
  ["\u00cf","zw=="],
  ["\u00d0","0A=="],
  ["\u00d1","0Q=="],
  ["\u00d2","0g=="],
  ["\u00d3","0w=="],
  ["\u00d4","1A=="],
  ["\u00d5","1Q=="],
  ["\u00d6","1g=="],
  ["\u00d7","1w=="],
  ["\u00d8","2A=="],
  ["\u00d9","2Q=="],
  ["\u00da","2g=="],
  ["\u00db","2w=="],
  ["\u00dc","3A=="],
  ["\u00dd","3Q=="],
  ["\u00de","3g=="],
  ["\u00df","3w=="],
  ["\u00e0","4A=="],
  ["\u00e1","4Q=="],
  ["\u00e2","4g=="],
  ["\u00e3","4w=="],
  ["\u00e4","5A=="],
  ["\u00e5","5Q=="],
  ["\u00e6","5g=="],
  ["\u00e7","5w=="],
  ["\u00e8","6A=="],
  ["\u00e9","6Q=="],
  ["\u00ea","6g=="],
  ["\u00eb","6w=="],
  ["\u00ec","7A=="],
  ["\u00ed","7Q=="],
  ["\u00ee","7g=="],
  ["\u00ef","7w=="],
  ["\u00f0","8A=="],
  ["\u00f1","8Q=="],
  ["\u00f2","8g=="],
  ["\u00f3","8w=="],
  ["\u00f4","9A=="],
  ["\u00f5","9Q=="],
  ["\u00f6","9g=="],
  ["\u00f7","9w=="],
  ["\u00f8","+A=="],
  ["\u00f9","+Q=="],
  ["\u00fa","+g=="],
  ["\u00fb","+w=="],
  ["\u00fc","/A=="],
  ["\u00fd","/Q=="],
  ["\u00fe","/g=="],
  ["\u00ff","/w=="],
  ["\u0000\u00ff","AP8="],
  ["\u00ff\u0000","/wA="],
  ["\u0000\u0000\u0000","AAAA"],
  ["",""],
  ["a","YQ=="],
  ["aa","YWE="],
  ["aaa","YWFh"],
  ["aaa","YWFh"],
  ["aaa","YWFh"],
  ["aaa","YWFh"],
  ["Aladdin:open sesame","QWxhZGRpbjpvcGVuIHNlc2FtZQ=="],
  ["aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa","YWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYQ=="],
  ["Multipurpose Internet Mail Extensions: The Base64 Content-Transfer-Encoding is designed to represent sequences of octets in a form that is not humanly readable. ","TXVsdGlwdXJwb3NlIEludGVybmV0IE1haWwgRXh0ZW5zaW9uczogVGhlIEJhc2U2NCBDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nIGlzIGRlc2lnbmVkIHRvIHJlcHJlc2VudCBzZXF1ZW5jZXMgb2Ygb2N0ZXRzIGluIGEgZm9ybSB0aGF0IGlzIG5vdCBodW1hbmx5IHJlYWRhYmxlLiA="]
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
    .local string plain, base64, comment, comment_count

    encode_decode_tests = encode_decode_tests()
    test_iterator = iter encode_decode_tests
    enc_dec_loop:
        unless test_iterator goto enc_dec_loop_end
        test_case   = shift test_iterator
        plain       = shift test_case
        base64      = shift test_case
        comment     = 'encode'
        comment_count = count
        comment = concat comment, comment_count
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

    .local string result_decode
    result_decode = dec_sub( base64 )
    is( result_decode, plain, comment )
.end

=head1 AUTHOR

Bernhard Schmalhofer <Bernhard Schmalhofer@gmx.de>

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
