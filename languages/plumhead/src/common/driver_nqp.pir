#!/usr/bin/env parrot

.sub 'php_init' :load :init

    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Text.pbc'
    load_bytecode 'PGE/Util.pbc'
    load_bytecode 'PGE/Dumper.pbc'
    load_bytecode 'PCT.pbc'

    load_bytecode 'languages/plumhead/src/common/plumheadlib.pbc'
    load_bytecode 'MIME/Base64.pbc'
    load_bytecode 'CGI/QueryHash.pbc'

.end


.sub plumhead :main

    .param pmc argv

    .local string program_name, nqp_fn
    program_name = shift argv
    nqp_fn       = shift argv

    # look for subs in other namespaces
    .local pmc decode_base64_sub, parse_get_sub, parse_post_sub
    decode_base64_sub = get_global [ 'MIME'; 'Base64' ], 'decode_base64'
    parse_get_sub     = get_global [ 'CGI'; 'QueryHash' ], 'parse_get'
    parse_post_sub    = get_global [ 'CGI'; 'QueryHash' ], 'parse_post'

    # the superglobals
    .local pmc superglobal_GET
    ( superglobal_GET ) = parse_get_sub()
    set_global '_GET', superglobal_GET

    .local pmc superglobal_POST
    ( superglobal_POST ) = parse_post_sub()
    set_global '_POST', superglobal_POST

    # compile NQP to PIR
    .local string pir_fn, cmd
    .local int ret
    clone pir_fn, nqp_fn
    substr pir_fn, -3, 3, 'pir'
    cmd = "./parrot ./compilers/nqp/nqp.pbc --target=pir --output="
    concat cmd, pir_fn
    concat cmd, " "
    concat cmd, nqp_fn
    # say cmd
    ret = spawnw cmd

    # load the generated PIR
    #$S1 = concat "languages/eclectus/", pir_fn
    $S1 = concat "", pir_fn
    load_bytecode $S1

    .local pmc stmts
    ( stmts ) = php_entry()

    # compile and evaluate the PAST returned from scheme_entry()
    .local pmc past_compiler
    past_compiler = new [ 'PCT::HLLCompiler' ]
    $P0 = split ' ', 'post pir'
    past_compiler.'stages'( $P0 )
    $P1 = past_compiler.'eval'(stmts)
    #_dumper ($P1)
    $P0 = split ' ', 'evalpmc'
    past_compiler.'stages'( $P0 )
    past_compiler.'eval'( $P1 )

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
