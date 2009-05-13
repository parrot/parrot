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

    #these stages aren't currently used, although generate_files exits before
    #they can be called anyway
    $P0.'removestage'('post')
    $P0.'removestage'('pir')
    $P0.'removestage'('evalpmc')

    #add an extra stage to generate the c, h and dump files
    $P0.'addstage'('generate_files', 'after'=>'past')

    $P1 = split ' ', 'e=s pmc_path|p=s help|h target=s dumper=s trace|t=s encoding=s output|o=s combine version|v'
    setattribute $P0, '@cmdoptions', $P1

.end


# override HLLCompiler's default evalfiles in order to store the name of the file being compiled
.sub 'evalfiles' :method
    .param pmc files
    .param pmc args      :slurpy
    .param pmc adverbs   :slurpy :named

    .local pmc it, files_clone, pmc_paths, file_path

    #TODO: DTRT if files is an array of filenames, although this isn't an expected use case
    files_clone = clone files
    set_hll_global ['PMC';'Emitter'], '$?filename', files_clone

    $S0 = adverbs['pmc_path']
    pmc_paths = split ',', $S0

    # 'foo/bar/baz/buz.pmc' -> 'foo/bar/baz'
    $S0 = files
    $P1 = split '/', $S0
    $I0 = $P1
    delete $P1[$I0]
    $S0 = join '/', $P1
    unshift pmc_paths, $S0

    set_hll_global ['PMC';'Emitter'], '@?pmc_path', pmc_paths

    .local pmc super_evalfiles
    super_evalfiles = get_hll_global ['PCT';'HLLCompiler'], 'evalfiles'
    .tailcall self.super_evalfiles(files, args :flat, adverbs :flat :named)
.end


.sub 'generate_files' :method
    .param pmc past
    .param pmc adverbs :slurpy :named

    .local pmc pmc_filename, emitter
    pmc_filename = get_hll_global ['PMC';'Emitter'], '$?filename'

    .local string base_filename, dump_filename, c_filename, header_filename
    .local string dump_contents, c_contents, header_contents
    pmc_filename.'replace'('.pmc', '')
    base_filename = pmc_filename 

    emitter  = new ['PMC';'Emitter']

    c_filename = concat base_filename, '.c'
    c_contents = emitter.'generate_c_code'(past)
    write_file(c_filename, c_contents)

    header_filename = concat base_filename, '.h'
    header_contents = emitter.'generate_header'(past)
    write_file(header_filename, header_contents)

    dump_filename = concat base_filename, '.dump'
    dump_contents = emitter.'generate_dump'(past)
    write_file(dump_filename, dump_contents)

    #there's nothing left to do, so exit and avoid any extra output
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
    print " for reading: "
    say ex
    .return ()

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
