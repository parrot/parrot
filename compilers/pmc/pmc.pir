# Copyright (C) 2009, Parrot Foundation.
# $Id$

.namespace [ 'PMC';'Compiler' ]

.sub 'main' :main
    .param pmc args
    $P0 = compreg 'PMC'
    .tailcall $P0.'command_line'(args, 'encoding'=>'utf8', 'transcode'=>'ascii')
.end

.include 'src/compiler.pir'
.include 'src/nodes.pir'
.include 'src/parser/gen_grammar.pir'
.include 'src/parser/gen_actions.pir'
.include 'src/builtins.pir'

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
