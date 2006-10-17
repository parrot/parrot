#!./parrot 
# Copyright (C) 2006, The Perl Foundation.

=head1 NAME

t/library/mime_base64.t - test MIME::Base64

=head1 SYNOPSIS

    % prove t/library/mime_base64.t

=head1 DESCRIPTION

Test MIME::Base64. 
Test cases taken from base64.t of MIME::Base64.

=cut

.sub main :main
    load_bytecode 'Test/More.pir'
    load_bytecode 'MIME/Base64.pir'
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Util.pbc'
    load_bytecode 'compilers/json/JSON.pbc'

    .local pmc plan, is, ok
    plan = find_global "Test::More", 'plan'
    ok = find_global "Test::More", 'ok'
#    plan(552)
######################
# ETOOMANYERROS
    plan(1)
    ok(0, 'too many errors - skipped')
    end
#######################
    .local pmc JSON
    JSON = compreg "JSON"

    .local pmc encode_tests, decode_tests
    encode_tests = JSON( <<'END_JSON' )
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
  [0,"MA=="],
  [1,"MQ=="],
  [2,"Mg=="],
  [3,"Mw=="],
  [4,"NA=="],
  [5,"NQ=="],
  [6,"Ng=="],
  [7,"Nw=="],
  [8,"OA=="],
  [9,"OQ=="],
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
  ["","fw=="],
  ["Ä","gA=="],
  ["Å","gQ=="],
  ["Ç","gg=="],
  ["É","gw=="],
  ["Ñ","hA=="],
  ["Ö","hQ=="],
  ["Ü","hg=="],
  ["á","hw=="],
  ["à","iA=="],
  ["â","iQ=="],
  ["ä","ig=="],
  ["ã","iw=="],
  ["å","jA=="],
  ["ç","jQ=="],
  ["é","jg=="],
  ["è","jw=="],
  ["ê","kA=="],
  ["ë","kQ=="],
  ["í","kg=="],
  ["ì","kw=="],
  ["î","lA=="],
  ["ï","lQ=="],
  ["ñ","lg=="],
  ["ó","lw=="],
  ["ò","mA=="],
  ["ô","mQ=="],
  ["ö","mg=="],
  ["õ","mw=="],
  ["ú","nA=="],
  ["ù","nQ=="],
  ["û","ng=="],
  ["ü","nw=="],
  ["†","oA=="],
  ["°","oQ=="],
  ["¢","og=="],
  ["£","ow=="],
  ["§","pA=="],
  ["•","pQ=="],
  ["¶","pg=="],
  ["ß","pw=="],
  ["®","qA=="],
  ["©","qQ=="],
  ["™","qg=="],
  ["´","qw=="],
  ["¨","rA=="],
  ["≠","rQ=="],
  ["Æ","rg=="],
  ["Ø","rw=="],
  ["∞","sA=="],
  ["±","sQ=="],
  ["≤","sg=="],
  ["≥","sw=="],
  ["¥","tA=="],
  ["µ","tQ=="],
  ["∂","tg=="],
  ["∑","tw=="],
  ["∏","uA=="],
  ["π","uQ=="],
  ["∫","ug=="],
  ["ª","uw=="],
  ["º","vA=="],
  ["Ω","vQ=="],
  ["æ","vg=="],
  ["ø","vw=="],
  ["¿","wA=="],
  ["¡","wQ=="],
  ["¬","wg=="],
  ["√","ww=="],
  ["ƒ","xA=="],
  ["≈","xQ=="],
  ["∆","xg=="],
  ["«","xw=="],
  ["»","yA=="],
  ["…","yQ=="],
  [" ","yg=="],
  ["À","yw=="],
  ["Ã","zA=="],
  ["Õ","zQ=="],
  ["Œ","zg=="],
  ["œ","zw=="],
  ["–","0A=="],
  ["—","0Q=="],
  ["“","0g=="],
  ["”","0w=="],
  ["‘","1A=="],
  ["’","1Q=="],
  ["÷","1g=="],
  ["◊","1w=="],
  ["ÿ","2A=="],
  ["Ÿ","2Q=="],
  ["⁄","2g=="],
  ["€","2w=="],
  ["‹","3A=="],
  ["›","3Q=="],
  ["ﬁ","3g=="],
  ["ﬂ","3w=="],
  ["‡","4A=="],
  ["·","4Q=="],
  ["‚","4g=="],
  ["„","4w=="],
  ["‰","5A=="],
  ["Â","5Q=="],
  ["Ê","5g=="],
  ["Á","5w=="],
  ["Ë","6A=="],
  ["È","6Q=="],
  ["Í","6g=="],
  ["Î","6w=="],
  ["Ï","7A=="],
  ["Ì","7Q=="],
  ["Ó","7g=="],
  ["Ô","7w=="],
  ["","8A=="],
  ["Ò","8Q=="],
  ["Ú","8g=="],
  ["Û","8w=="],
  ["Ù","9A=="],
  ["ı","9Q=="],
  ["ˆ","9g=="],
  ["˜","9w=="],
  ["¯","+A=="],
  ["˘","+Q=="],
  ["˙","+g=="],
  ["˚","+w=="],
  ["¸","/A=="],
  ["˝","/Q=="],
  ["˛","/g=="],
  ["ˇ","/w=="],
  ["\u0000ˇ","AP8="],
  ["ˇ\u0000","/wA="],
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

    decode_tests = JSON( <<'END_JSON' )
[ ["YWE=","aa"],
  [" YWE=","aa"],
  ["Y WE=","aa"],
  ["YWE= ","aa"],
  ["Y\nW\r\nE=","aa"],
  ["YWE=====","aa"],
  ["YWE","aa"],
  ["YWFh====","aaa"],
  ["YQ","a"],
  ["Y",""],
  ["x==",""],
  ["",""],
  [null,""]
]
END_JSON

    .local int cnt
    cnt = 0
    .local pmc test_iterator, test_case
    .local string plain, base64, comment, comment_cnt

    test_iterator = new 'Iterator', encode_tests
    enc_loop:
        unless test_iterator goto enc_loop_end
        test_case   = shift test_iterator
        plain       = shift test_case
        base64      = shift test_case
        comment     = 'encode'
        comment_cnt = cnt
        concat comment, comment_cnt
        test_encode( plain, base64, comment )
        comment     = 'decode'
        comment_cnt = cnt
        concat comment, comment_cnt
        test_decode( plain, base64, comment )
        inc cnt
    goto enc_loop
    enc_loop_end:

    test_iterator = new 'Iterator', decode_tests
    dec_loop:
        unless test_iterator goto dec_loop_end
        test_case   = shift test_iterator
        base64      = shift test_case
        plain       = shift test_case
        comment     = 'decode'
        comment_cnt = cnt
        concat comment, comment_cnt
        test_decode( plain, base64, comment )
        inc cnt
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
    is   = find_global 'Test::More', 'is'
    
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
    
    .local pmc is
    is   = find_global 'Test::More', 'is'
    
    .local string result_decode
    result_decode = dec_sub( base64 )
    is( result_decode, plain, comment )
.end

=head1 AUTHOR

Bernhard Schmalhofer <Bernhard Schmalhofer@gmx.de>

=cut
