=head1 NAME

cardinal -- A compiler for Ruby 1.8.4

=head1 SYNOPSIS

  $ ./parrot languages/cardinal/cardinal.pir script.rb

=head1 DESCRIPTION

Ruby is a compiler for Ruby version 1.8, running on Parrot. Its parser is
a PGE grammar (a subclass of PGE::Grammar). The compilation is a series of
tree transformations using TGE: from match tree to abstract syntax tree
(AST), from AST to opcode syntax tree (OST), and finally from OST to
bytecode (actually to PIR, at first). For more on the ideas behind the
compiler, see:

=cut

.include "errors.pasm"
.include "library/dumper.pir"

.sub _main :main
    .param pmc args
    
    errorson .PARROT_ERRORS_PARAM_COUNT_FLAG
    
    load_bytecode "languages/cardinal/src/CardinalGrammar.pbc"
    load_bytecode 'dumper.pbc'
    load_bytecode 'PGE/Dumper.pbc'
    load_bytecode 'PGE/Text.pbc'
    load_bytecode 'Getopt/Obj.pbc'

    .local pmc getopts, opts
    .local string arg0
    arg0 = shift args
    getopts = new 'Getopt::Obj'
    getopts.'notOptStop'(1)
    push getopts, 'target=s'
    push getopts, 'dump-optable'
    push getopts, 'dump-pge-parse|p'
    push getopts, 'dump-tge-AST|a'
    push getopts, 'dump-tge-OST|o'
    push getopts, 'dump-tge-PIR|i'
    push getopts, 'dump-all|x'
    push getopts, 'dump|d'
    push getopts, 'help|h'
    push getopts, 'trace|t'
    opts = getopts.'get_options'(args)

    $S0 = opts['dump-optable']
    if $S0 goto dump_optable
    $S0 = opts['help']
    if $S0 goto usage

    .local int stopafter
    stopafter = 0
    .local string dump
    dump = opts['dump']
    .local string target
    target = opts['target']
    .local int istrace
    $S0 = opts['trace']
    istrace = isne $S0, ''

    .local int dump_pge
    $S0 = opts['dump-pge-parse']
    dump_pge = isne $S0, ''
    unless $S0 goto a1
    stopafter = 1
  a1:

    .local int dump_ast
    $S0 = opts['dump-tge-AST']
    dump_ast = isne $S0, ''
    unless $S0 goto a2
    stopafter = 2
  a2:

    .local int dump_ost
    $S0 = opts['dump-tge-OST']
    dump_ost = isne $S0, ''
    unless $S0 goto a3
    stopafter = 3
  a3:

    .local int dump_pir
    $S0 = opts['dump-tge-PIR']
    dump_pir = isne $S0, ''
    unless $S0 goto a4
    stopafter = 4
  a4:

    .local int istrace
    $S0 = opts['dump-all']
    if $S0 goto dump_all
    $S0 = dump
    unless $S0 goto after_dump_all
  dump_all:
    dump_pge = 1
    dump_ast = 1
    dump_ost = 1
    dump_pir = 1
    stopafter = 0
  after_dump_all:
    
    .local pmc cardinal
    .local string filename
    cardinal = compreg 'Cardinal'
    
    .local string source

    $I0 = elements args
    if $I0 > 0 goto file_arg
    filename = "STDIN"

    .local pmc stdin
    stdin = getstdin
    push stdin, 'utf8'
    # enable interactive readline if possible
    $I0 = stdin.'set_readline_interactive'(1)

  stmt_loop:
    .local string stmt
    stmt = stdin.'readline'('cardinal> ')
    unless stmt goto end
    bsr cardinal_irb_eval
    goto stmt_loop

  file_arg:
    filename = args[1]
    source = _get_source(filename)
    goto compile_it

  cardinal_irb_eval:
    $I0 = find_charset 'iso-8859-1'                # XXX: Note 2006-04-14
    trans_charset stmt, $I0
    #$P0 = perl6(stmt, 'target' => target, 'dump' => dump)
    null $P0 
    if target == 'PIR' goto dump_pir_output
    if target goto dump_object
    trace istrace
    $P0()
    trace 0
    ret
  dump_pir_output:
    print $P0
    ret
  dump_object:
    '_dumper'($P0, target)
    ret

  dump_optable:
    $P0 = find_global "Cardinal::Grammar", "$optable"
    "_dumper"($P0, "Cardinal::Grammar::optable")
    goto end

  usage:
    print "usage: cardinal.pbc [--dump-optable] [--target=OUT] [file]\n"
    end

  compile_it:
    # Match against the source
    .local pmc match
    .local pmc start_rule
    #start_rule = get_namespace [ 'Cardinal'; 'Grammar'; 'program' ]
    start_rule = get_namespace [ 'Cardinal::Grammar'; 'program' ]
    match = start_rule(source, 'grammar'=> 'Cardinal::Grammar')

    # Verify the match
    $I0 = match.__get_bool()
    unless $I0 goto err_match_fail # if match fails stop

    unless dump_pge goto after_pge_dump
    print "parse succeeded\n"
    print "Match tree dump:\n"
    $P0 = find_global "_dumper"
    $P0(match, "PGE Dump")
  after_pge_dump:
    eq stopafter, 1, end

    # "Traverse" the parse tree
    load_bytecode "languages/cardinal/src/ASTGrammar.pbc"
    .local pmc grammar
     grammar = new 'ASTGrammar'

    # Construct the "AST"
    load_bytecode "PAST.pbc"
    .local pmc astbuilder
    astbuilder = grammar.apply(match)
    .local pmc ast
    ast = astbuilder.get('result')
    $I0 = defined ast
    unless $I0 goto err_no_ast # if AST fails stop

    unless dump_ast goto after_ast_dump
    print "\n\nAST tree dump:\n"
    ast.'dump'()
  after_ast_dump:
    eq stopafter, 2, end

    # Compile the abstract syntax tree down to an opcode syntax tree
    load_bytecode "languages/cardinal/src/POST.pir"
    load_bytecode 'languages/cardinal/src/CardinalOpLookup.pir'
    load_bytecode "languages/cardinal/src/OSTGrammar.pbc"
    .local pmc ostgrammar
    ostgrammar = new 'OSTGrammar'
    .local pmc ostbuilder
    ostbuilder = ostgrammar.apply(ast)
    .local pmc ost
    ost = ostbuilder.get('result')
    $I0 = defined ost
    unless $I0 goto err_no_ost # if OST fails stop

    unless dump_ost goto after_ost_dump
    print "\n\nOST tree dump:\n"
    ost.'dump'()
  after_ost_dump:
    eq stopafter, 3, end

    # Compile the OST down to PIR
    load_bytecode "languages/cardinal/src/PIRGrammar.pbc"
    .local pmc pirgrammar
    pirgrammar = new 'PIRGrammar'
    .local pmc pirbuilder
    pirbuilder = pirgrammar.apply(ost)
    .local pmc pir
    pir = pirbuilder.get('result')
    unless pir goto err_no_pir # if PIR not generated, stop

    unless dump_ast goto after_pir_dump
    print "\n\nPIR dump:\n"
    print pir
  after_pir_dump:
    eq stopafter, 4, end

    # Execute
    .local pmc pir_compiler
    .local pmc pir_compiled
    pir_compiler = compreg "PIR"
    pir_compiled = pir_compiler( pir )
    pir_compiled()
    end

  err_match_fail:
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

# Read in the source from a file
.sub _get_source
    .param string filename

    $S1 = _slurp_file(filename)
    .return ($S1)

  err_no_file:
    print "You must supply a Ruby file to parse.\n"
    end
.end

.sub _slurp_file
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

=head1 LICENSE

Copyright (c) 2005 The Perl Foundation

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=head1 AUTHOR

Kevin Tew <kevintew@tewk.com>

=cut
