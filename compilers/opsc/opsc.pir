#! parrot
# Copyright (C) 2009-2010, Parrot Foundation.

.namespace [ 'Ops';'Compiler' ]

.include 'compilers/opsc/src/builtins.pir'
.include 'compilers/opsc/gen/Ops/Compiler/Grammar.pir'
.include 'compilers/opsc/gen/Ops/Compiler/Actions.pir'
.include 'compilers/opsc/gen/Ops/Compiler.pir'

.include 'compilers/opsc/gen/Ops/Emitter.pir'
.include 'compilers/opsc/gen/Ops/Trans.pir'
.include 'compilers/opsc/gen/Ops/Trans/C.pir'

.include 'compilers/opsc/gen/Ops/Op.pir'
.include 'compilers/opsc/gen/Ops/OpLib.pir'
.include 'compilers/opsc/gen/Ops/File.pir'

.namespace []
.sub 'main' :main
    .param pmc args

    $P0 = compreg 'Ops'
    $P0.'command_line'(args)
    exit 0
.end



# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
