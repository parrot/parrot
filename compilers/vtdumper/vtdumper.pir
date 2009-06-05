# Copyright (C) 2009, Parrot Foundation.
# $Id$

.namespace [ 'VTable';'Compiler' ]

.sub '__onload' :load :init
    load_bytecode 'PCT.pbc'
    load_bytecode 'JSON.pbc'
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
    $P0.'addstage'('generate_json', 'after'=>'past')

.end


.sub 'generate_json' :method
    .param pmc past
    .param pmc adverbs :slurpy :named

    .local pmc node, spast, snode, sattrs, sargs, sarg
    .local pmc it, key
    .local int i, j, elems

    spast = new ['ResizablePMCArray']

    #PAST::Block doesn't support iteration or even get_integer, so this is the
    #easiest way to get all elements
    i = 0
  loop_start:
    node = past[i]
    i += 1
    if_null node, loop_end

    snode = new ['Hash']

    $S0 = node['name']
    snode['name'] = $S0

    $S0 = node['returns']
    snode['returns'] = $S0

    $S0 = node['section']
    snode['section'] = $S0

    $P0 = node['arguments']
    sargs = new ['ResizablePMCArray']
    j = 0
    elems = elements $P0

  args_loop_start:
    if j == elems goto args_loop_end

    $P1 = new ['Hash']

    $S0 = node['arguments';j;'type']
    $P1['type'] = $S0

    $S0 = node['arguments';j;'identifier']
    $P1['identifier'] = $S0

    push sargs, $P1

    j += 1
    goto args_loop_start

  args_loop_end:

    snode['arguments'] = sargs

    sattrs = node['attributes']
    snode['attributes'] = sattrs
    push spast, snode

    goto loop_start

  loop_end:

    .local string json
    json = _json(spast, 1)
    'write_file'("vtable.json", json)

    #exit to avoid confusing HLLCompiler
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
