# Copyright (C) 2009, Parrot Foundation.
# $Id$

.namespace [ 'PMC';'Compiler' ]

.sub '__onload' :load :init
    load_bytecode 'PGE.pbc'
    load_bytecode 'PCT.pbc'
    load_bytecode 'compilers/nqp/nqp.pbc'

    $P0 = new [ 'PCT';'HLLCompiler' ]
    $P0.'language'('PMC')
    $P0.'parsegrammar'('PMC::Grammar')
    $P0.'parseactions'('PMC::Grammar::Actions')

.end

.sub 'main' :main
    .param pmc args
    $P0 = compreg 'PMC'
    .tailcall $P0.'command_line'(args, 'encoding'=>'utf8', 'transcode'=>'ascii')
.end

.include 'src/parser/gen_grammar.pir'
.include 'src/parser/gen_actions.pir'
.include 'src/builtins.pir'

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
