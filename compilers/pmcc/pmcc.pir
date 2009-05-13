# Copyright (C) 2009, Parrot Foundation.
# $Id$

.namespace [ 'PMC';'Compiler' ]

.sub '__onload' :load :init
    load_bytecode 'PCT.pbc'

    .local pmc p6meta
    p6meta = new 'P6metaclass'

    p6meta.'new_class'('PMC::Compiler', 'parent'=>'PCT::HLLCompiler')

    # Register grammar and action
    $P0 = new [ 'PMC';'Compiler' ]
    $P0.'language'('PMC')
    $P0.'parsegrammar'('PMC::Grammar')
    $P0.'parseactions'('PMC::Grammar::Actions')

    #these stages aren't currently used
    $P0.'removestage'('post')
    $P0.'removestage'('pir')
    $P0.'removestage'('evalpmc')

    #add an extra stage to generate the c, h and dump files
    $P0.'addstage'('generate_files', 'after'=>'past')

    $P1 = split ' ', 'e=s pmc_path|p=s help|h target=s dumper=s trace|t=s encoding=s output|o=s combine version|v'
    setattribute $P0, '@cmdoptions', $P1

.end


.sub 'generate_files' :method
    .param pmc past
    .param pmc adverbs :slurpy :named

    .local pmc pmc_filename
    pmc_filename = get_hll_global ['PMC';'Compiler'], '$filename'

    .local string base_filename, dump_filename, c_filename, h_filename
    .local string dump_contents, c_contents, h_contents
    base_filename = pmc_filename.'replace'('.pmc', '')

    dump_filename = concat base_filename, '.dump'
    c_filename    = concat base_filename, '.c'
    h_filename    = concat base_filename, '.h'

    #XXX: do something interesting here


.end

.sub 'evalfiles' :method
    .param pmc files
    .param pmc args      :slurpy
    .param pmc adverbs   :slurpy :named

    .local string filename

    $S0 = adverbs['pmc_path']
    $P0 = split ',', $S0
    set_hll_global ['PMC';'Compiler'], '@pmc_path', $P0

    #TODO: DTRT if files is an array of filenames, although this isn't an expected use case
    $P0 = clone files
    set_hll_global ['PMC';'Compiler'], '$filename', $P0

    .local pmc super_evalfiles
    super_evalfiles = get_hll_global ['PCT';'HLLCompiler'], 'evalfiles'
    .tailcall self.super_evalfiles(files, args, adverbs)
.end


.sub 'main' :main
    .param pmc args
    $P0 = compreg 'PMC'
    .tailcall $P0.'command_line'(args, 'encoding'=>'utf8', 'transcode'=>'ascii')
.end

.include 'src/nodes.pir'
.include 'src/vtable_info.pir'
.include 'src/emitter/pmc.pir'
.include 'src/emitter/c.pir'

.include 'src/gen_emitter.pir'
.include 'src/emitter/gen_pmc.pir'
.include 'src/emitter/gen_c.pir'
.include 'src/emitter/pmc/default.pir'
.include 'src/emitter/pmc/gen_default.pir'
.include 'src/gen_vtable_info.pir'
.include 'src/parser/gen_grammar.pir'
.include 'src/parser/gen_actions.pir'
.include 'src/builtins.pir'

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
