.sub main :main
    load_bytecode 'MIME/Base64.pbc'

    .local pmc enc_sub
    enc_sub = get_global [ "MIME"; "Base64" ], 'encode_base64'

    .local string result_encode
    # GH 814
    result_encode = enc_sub(utf8:"\x{a2}")
    say   "encode:   utf8:\"\\x{a2}\""
    say   "expected: wqI="
    print "result:   "
    say result_encode

    # GH 813
    result_encode = enc_sub(utf8:"\x{203e}")
    say   "encode:   utf8:\"\\x{203e}\""
    say   "expected: 4oC+"
    print "result:   "
    say result_encode
    
.end
