=head1 NAME

c99 -- A parser for c99 

=head1 SYNOPSIS

  $ ./parrot languages/c99/c99.pir code.c

=head1 DESCRIPTION

  c99 is a PGE parser running on Parrot.

=cut

.HLL 'c99', 'c99_group'
.include 'errors.pasm'
.include 'library/dumper.pir'

.sub _main :main
    .param pmc args
    
    errorson .PARROT_ERRORS_PARAM_COUNT_FLAG
    
    load_bytecode 'PGE.pbc'
    load_bytecode 'dumper.pbc'
    load_bytecode 'PGE/Dumper.pbc'
    load_bytecode 'PGE/Text.pbc'
    load_bytecode 'Getopt/Obj.pbc'
    
    print "Parrot C99 Compiler\n"

    load_bytecode 'languages/c99/src/c99_PGE.pbc'
    #load_bytecode 'languages/c99/src/PAST.pir'
    #load_bytecode 'languages/c99/src/POST.pir'
    #load_bytecode 'languages/c99/src/PGE2AST.pir'
    #load_bytecode 'languages/c99/src/AST2OST.pir'
    #load_bytecode 'languages/c99/src/OST2PIR.pir'

    .local pmc _dumper
    .local pmc getopts
    .local pmc opts
    .local string arg0
    _dumper = get_root_global [ 'parrot' ], '_dumper'
    arg0 = shift args
    getopts = new 'Getopt::Obj'
    getopts.'notOptStop'(1)
    push getopts, 'target=s'
    opts = getopts.'get_options'(args)

    $S0 = opts['help']
    if $S0 goto usage

    .local int stopafter
    .local string dump
    .local string target
    .local int dump_src_early
    .local int dump_pge
    
    .local pmc c99_compiler
    .local string filename
    .local string source

   c99_compiler = compreg 'C99'
    
    $I0 = elements args
    if $I0 > 0 goto file_arg

  stdin_arg:
    .local pmc stdin
    filename = "STDIN"
    stdin = getstdin
    push stdin, 'utf8'
    # enable interactive readline if possible
    $I0 = stdin.'set_readline_interactive'(1)

  stdin_read_loop:
    .local string stmt
    stmt = stdin.'readline'('c99> ')
    unless stmt goto end
    #bsr c99_eval
    goto stdin_read_loop

  file_arg:
    filename = args[1]
    source = slurp_file(filename)
    goto compile_it

  usage:
    print "usage: c99.pbc [-o output] [file]\n"
    end

  compile_it:
    .local pmc parse_tree
    .local pmc start_rule
    
    unless dump_src_early goto after_src_dump_early
    print "\n\nSource dump:\n"
    print source
  after_src_dump_early:

    start_rule = get_root_global [ 'parrot'; 'C99::Grammar'], 'translation_unit'
    start_rule = get_root_global [ 'parrot'; 'C99::Grammar'], 'prereprocessing_file'
    parse_tree = start_rule(source, 'grammar'=> 'C99::Grammar')

    # Verify the parse was successful
    $I0 = parse_tree.__get_bool()
    unless $I0 goto err_parse_fail

    unless dump_pge goto after_pge_dump
    print "Parse succeeded: C99 PGE parse tree dump:\n"
    _dumper(parse_tree, "C99 PGE Parse Tree Dump")
  after_pge_dump:
    eq stopafter, 1, end
    end


  err_parse_fail:
    print "Parse failed on "
    print filename
    print "\n"
    exit -1

  err_no_ast:
    print "Unable to construct AST.\n"
    exit -2

  err_no_ost:
    print "Unable to construct OST.\n"
    exit -3

  err_no_pir:
    print "Unable to construct PIR.\n"
    exit -4

  end:
    exit 0
.end

.sub pir_exec
    .param pmc code
    .local pmc pir_compiler
    .local pmc pir_compiled
    pir_compiler = compreg "PIR"
    pir_compiled = pir_compiler(code)
    pir_compiled()
.end

.sub slurp_file
    .param string filename
    .local pmc filehandle
    filehandle = open filename, "<"
    unless filehandle goto err_no_file
    $S1 = read filehandle, 65535
    close filehandle
    .return ($S1)

  err_no_file:
    print "Unable to open file "
    print filename
    print "\n"
    end
.end

.sub spew_file
    .param string filename
    .param string contents
    .local pmc filehandle
    filehandle = open filename, ">"
    unless filehandle goto err_no_file
    print filehandle, contents
    close filehandle
    .return ($S1)

  err_no_file:
    print "Unable to open file "
    print filename
    print "\n"
    end
.end

=head1 LICENSE

Copyright (c) 2005 The Perl Foundation

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=head1 AUTHOR

Kevin Tew <kevintew@tewk.com>

=cut
