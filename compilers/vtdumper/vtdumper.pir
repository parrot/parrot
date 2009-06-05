# Copyright (C) 2009, Parrot Foundation.
# $Id$

.namespace [ 'VTable';'Compiler' ]

.sub '__onload' :load :init
    load_bytecode 'PCT.pbc'
    load_bytecode 'compilers/nqp/nqp.pbc'

    .local pmc p6meta
    p6meta = new 'P6metaclass'

    p6meta.'new_class'('VTable::Compiler', 'parent'=>'PCT::HLLCompiler')

    # Register grammar and action
    $P0 = new [ 'VTable';'Compiler' ]
    $P0.'language'('VTable')
    $P0.'parsegrammar'('VTable::Grammar')
    $P0.'parseactions'('VTable::Grammar::Actions')

    #these stages aren't currently used, although generate_files exits before
    #they can be called anyway
    $P0.'removestage'('post')
    $P0.'removestage'('pir')
    $P0.'removestage'('evalpmc')

    #add an extra stage to generate the c, h and dump files
    $P0.'addstage'('generate_dump', 'after'=>'past')

.end


.sub 'generate_dump' :method
    .param pmc past
    .param pmc adverbs :slurpy :named

    .local string frozen

    frozen = freeze past
    'write_file'("vtable.frozen", frozen)

    exit 0
.end


.sub 'write_file'
    .param string name
    .param string contents

    .local pmc fh
    fh = new ['FileHandle']
    fh.'open'(name, 'w')
    print fh, contents
    fh.'close'()
    print "wrote output to "
    say name
    .return ()

  cant_write:
    .local pmc ex
    .local string msg
    .get_results (ex)
    msg = ex
    print "ERROR: couldn't open "
    print name
    print " for writing: "
    say ex
    .return ()

.end


.sub 'main' :main
    .param pmc args
    $P0 = compreg 'VTable'
    .tailcall $P0.'command_line'(args, 'encoding'=>'utf8', 'transcode'=>'ascii')
.end


.include 'src/function.pir'
.include 'src/parser/gen_grammar.pir'
.include 'src/parser/gen_actions.pir'

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
