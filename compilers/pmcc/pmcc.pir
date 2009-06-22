# Copyright (C) 2009, Parrot Foundation.
# $Id$

.namespace [ 'PMC';'Compiler' ]

.sub '__onload' :load :init
    load_bytecode 'PCT.pbc'
    load_bytecode 'compilers/nqp/nqp.pbc'

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
    #$P0.'addstage'('read_dump', 'before'=>'parse')

    $P1 = split ' ', 'e=s vtdump|d=s pmc_path|p=s help|h target=s dumper=s trace|t=s encoding=s output|o=s combine version|v'
    setattribute $P0, '@cmdoptions', $P1

.end


# override HLLCompiler's default evalfiles in order to store the name of the file being compiled
.sub 'evalfiles' :method
    .param pmc files
    .param pmc args      :slurpy
    .param pmc adverbs   :slurpy :named

    .local pmc it, files_clone, pmc_paths, file_path, pmc_name

    pmc_name = new ['String']
    #TODO: DTRT if files is an array of filenames, although this isn't an expected use case
    #TRT probably means complain and exit
    files_clone = clone files
    set_hll_global ['PMC';'Emitter'], '$?filename', files_clone

    $S0 = adverbs['pmc_path']
    pmc_paths = split ',', $S0

    # 'foo/bar/baz/buz.pmc' -> 'foo/bar/baz'
    $S0 = files
    $P1 = split '/', $S0
    $I0 = $P1
    dec $I0
    pmc_name = $P1[$I0]
    delete $P1[$I0]
    $S0 = join '/', $P1
    unshift pmc_paths, $S0

    pmc_name.'replace'('.pmc','')

    set_hll_global ['PMC';'Emitter'], '@?pmc_path', pmc_paths
    set_hll_global ['PMC';'Emitter'], '$?pmc_name', pmc_name

    .local pmc super_evalfiles
    super_evalfiles = get_hll_global ['PCT';'HLLCompiler'], 'evalfiles'
    .tailcall self.super_evalfiles(files, args :flat, adverbs :flat :named)
.end


.sub 'read_dump' :method
    .param pmc past
    .param pmc adverbs :slurpy :named

    .local string vtdump_filename, vtdump_str
    .local pmc vtdump

    vtdump_filename = '../../vtable.frozen'
    #$P0 = getstderr
    #print $P0, "Error: no vtable.freeze specified."
    $P0 = new ['FileHandle']
    vtdump_str = $P0.'readall'(vtdump_filename)
    vtdump = thaw vtdump_str

    set_global ['PMC';'Class'], '%vtdump', vtdump

    load_bytecode 'JSON.pbc'
    #$S0 = _json(vtdump,1)
    #say $S0

    .return (past, adverbs :flat :named)
.end


.sub 'generate_files' :method
    .param pmc past
    .param pmc adverbs :slurpy :named

    .local string pmc_dir, pmc_name, vtdump_str, vtdump_filename
    .local pmc pmc_filename, emitter, vtdump

    vtdump_filename = adverbs['vtdump']
    if vtdump_filename != '' goto read_dump
    #temporary code to make manually running pmcc simpler
    vtdump_filename = '../../vtable.frozen'
    #$P0 = getstderr
    #print $P0, "Error: no vtable.freeze specified."
  read_dump:
    $P0 = new ['FileHandle']
    vtdump_str = $P0.'readall'(vtdump_filename)
    vtdump = thaw vtdump_str

    pmc_filename = get_hll_global ['PMC';'Emitter'], '$?filename'
    $P0          = get_hll_global ['PMC';'Emitter'], '$?pmc_name'
    pmc_name = $P0

    #XXX: Splitting paths based on '/' is too simplistic.
    pmc_dir = pmc_filename
    $P1 = split '/', pmc_dir
    $I0 = $P1
    delete $P1[$I0]
    pmc_dir = join '/', $P1

    unless pmc_dir == '' goto emit_files
    pmc_dir = '.'

  emit_files:
    .local string dump_filename, c_filename, header_filename
    .local string dump_contents, c_contents, header_contents

    emitter = new ['PMC';'Emitter']
    emitter.'set_vtable_info'(vtdump)

    c_filename = concat pmc_dir, '/'
    c_filename = concat c_filename, pmc_name
    c_filename = concat c_filename, '.c'
    c_contents = emitter.'generate_c_code'(past)
    write_file(c_filename, c_contents)

    header_filename = concat pmc_dir, '/pmc_'
    header_filename = concat header_filename, pmc_name
    header_filename = concat header_filename, '.h'
    header_contents = emitter.'generate_header'(past)
    write_file(header_filename, header_contents)

    dump_filename = concat pmc_dir, '/'
    dump_filename = concat dump_filename, pmc_name
    dump_filename = concat dump_filename, '.dump'
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
    print " for writing: "
    say ex
    .return ()

.end


.sub 'main' :main
    .param pmc args
    $P0 = compreg 'PMC'
    .tailcall $P0.'command_line'(args, 'encoding'=>'utf8', 'transcode'=>'ascii')
.end

.include 'src/nodes.pir'
.include 'src/gen_nodes.pir'
.include '../vtdumper/src/function.pir'
.include 'src/emitter/pmc.pir'
.include 'src/emitter/c.pir'

.include 'src/gen_emitter.pir'
.include 'src/emitter/gen_pmc.pir'
.include 'src/emitter/gen_c.pir'
.include 'src/emitter/pmc/default.pir'
.include 'src/emitter/pmc/gen_default.pir'
.include 'src/parser/gen_grammar.pir'
.include 'src/parser/gen_actions.pir'
.include 'src/builtins.pir'

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
