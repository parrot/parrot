# $Id$

# The dynamics PMCs used by Eclectus are loaded
.loadlib 'eclectus_group'

# for devel
.include 'library/dumper.pir'

.namespace []

.sub '__onload' :init
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Text.pbc'
    load_bytecode 'PGE/Util.pbc'
    load_bytecode 'PGE/Dumper.pbc'
    load_bytecode 'PCT.pbc'

    load_bytecode 'languages/eclectus/src/builtins/all.pbc'
.end


.sub drive :main

    .param pmc argv

    .local string program_name, nqp_fn
    program_name = shift argv
    nqp_fn       = shift argv

    # compile NQP to PIR
    .local string pir_fn, cmd
    .local int ret
    clone pir_fn, nqp_fn
    substr pir_fn, -3, 3, 'pir'
    cmd = "../../parrot ../../compilers/nqp/nqp.pbc --target=pir --output="
    concat cmd, pir_fn
    concat cmd, " "
    concat cmd, nqp_fn
    # say cmd
    ret = spawnw cmd

    # load the generated PIR
    $S1 = concat "languages/eclectus/", pir_fn
    load_bytecode $S1

    .local pmc stmts
    ( stmts ) = scheme_entry()

    # compile and evaluate the PAST returned from scheme_entry()
    .local pmc past_compiler
    past_compiler = new [ 'PCT';'HLLCompiler' ]
    $P0 = split ' ', 'post pir'
    past_compiler.'stages'( $P0 )
    $P1 = past_compiler.'eval'(stmts)
    #_dumper ($P1)
    $P0 = split ' ', 'evalpmc'
    past_compiler.'stages'( $P0 )
    past_compiler.'eval'( $P1 )
.end


.sub '__initconst' :init
    $P0 = new 'EclectusBoolean'
    $P0 = 1
    set_root_global ['_eclectus'], '#t', $P0
    $P0 = new 'EclectusBoolean'
    set_root_global ['_eclectus'], '#f', $P0
    $P0 = new 'EclectusEmptyList'
    set_root_global ['_eclectus'], '()', $P0
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
