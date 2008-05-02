# $Id$

# The dynamics PMCs used by Eclectus are loaded
.loadlib 'eclectus_group'

# for devel
.include 'library/dumper.pir'
.include 'gen_past.pir'

.namespace

.sub '__onload' :init
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Text.pbc'
    load_bytecode 'PGE/Util.pbc'
    load_bytecode 'PGE/Dumper.pbc'
    load_bytecode 'PCT.pbc'

    load_bytecode 'languages/eclectus/src/builtins/all.pbc'
.end


.sub drive :main

    .local pmc stmts
    ( stmts ) = scheme_entry()
    # _dumper( stmts, 'stmts' )

    # compile and evaluate
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
