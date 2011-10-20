# Copyright (C) 2007-2008, Parrot Foundation.

=head1 NAME

examples/past/blocktype_immediate.pir - Evaluating a PAST::Block immediately

=head1 SYNOPSIS

    % ./parrot examples/past/blocktype_immediate.pir

=head1 DESCRIPTION

Create and evaluate a PAST::Block with blocktype 'immediate'.
'immediate' means the block is evaluated and the last value
is returned.

Beware that this doesn't work yet as expected:

'_block10' isn't a closure (no :outer)
current instr.: 'anon' pc 3 (EVAL_1:5)
called from Sub 'parrot;PCT::HLLCompiler;eval' pc 609 (src/HLLCompiler.pir:368)
called from Sub 'main' pc 70 (examples/past/blocktype_immediate.pir:52)

=head1 SEE ALSO

F<docs/pdds/pdd26_ast.pod>

=cut

.namespace []

.sub '__onload' :init
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Text.pbc'
    load_bytecode 'PGE/Util.pbc'
    load_bytecode 'PGE/Dumper.pbc'
    load_bytecode 'PCT.pbc'
.end

.sub main :main

    # content of the block
    .local pmc val_x
    val_x = new ['PAST';'Val']
    val_x.'init'( 'value' => '-536870912', 'returns' => 'Integer' )

    # wrap the content in a block
    .local pmc var_block
    var_block = new ['PAST';'Block']
    var_block."init"( val_x, 'blocktype' => 'immediate' )

    # set up compiler
    .local pmc astcompiler
    astcompiler = new [ 'PCT';'HLLCompiler' ]
    astcompiler.'removestage'('parse')
    astcompiler.'removestage'('past')

    # evaluate
    .local pmc result
    ( result ) = astcompiler.'eval'(var_block)
    _dumper( result, 'result' )

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
