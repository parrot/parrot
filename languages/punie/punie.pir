=head1 NAME

punie -- A compiler for Perl 1

=head1 SYNOPSIS

  $ ./parrot languages/punie/punie.pir script.p1

=head1 DESCRIPTION

Punie is a compiler for Perl version 1, running on Parrot. Its parser is
a PGE grammar (a subclass of PGE::Grammar). The compilation is a series of
tree transformations using TGE: from match tree to abstract syntax tree
(AST), from AST to opcode syntax tree (OST), and finally from OST to
bytecode (actually to PIR, at first). For more on the ideas behind the
compiler, see:

http://svn.lohutok.net/nam/trunk/parrot/docs/compiler_tools.pod

So far, Punie handles constants (strings, integers, floats), print
statements, conditionals, do blocks, comma lists, and some basic math
and logic ops.

  print 1;
  print 45.5;
  print "ok 1\n";
  print 1 + 2, "\n", 2 + 3, "\n";
  unless (1 - 1) {
    print "a sum of nothing\n";
  }

=cut

.include "errors.pasm"

.sub _main :main
    .param pmc args

    errorson .PARROT_ERRORS_PARAM_COUNT_FLAG

    load_bytecode "languages/punie/lib/PunieGrammar.pbc"

    .local string source
    source = _get_source(args)

    # Match against the source
    .local pmc match
    .local pmc start_rule
    start_rule = find_global "PunieGrammar", "prog"
    match = start_rule(source)

    # Verify the match
    $I0 = match.__get_bool()
    unless $I0 goto err_match_fail           # if match fails stop
#    print "parse succeeded\n"
#    print "Match tree dump:\n"
#    load_bytecode "dumper.pbc"
#    load_bytecode "PGE/Dumper.pbc"
#    $P0 = find_global "_dumper"
#    $P0(match, "$/")

    # "Traverse" the parse tree
    load_bytecode "languages/punie/lib/ASTGrammar.pbc"
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

#    print "\n\nAST tree dump:\n"
#    ast.dump()

    # Compile the abstract syntax tree down to an opcode syntax tree
    load_bytecode "languages/punie/lib/POST.pir"
    load_bytecode 'languages/punie/lib/PunieOpLookup.pir'
    load_bytecode "languages/punie/lib/OSTGrammar.pbc"
    .local pmc ostgrammar
    ostgrammar = new 'OSTGrammar'
    .local pmc ostbuilder
    ostbuilder = ostgrammar.apply(ast)
    .local pmc ost
    ost = ostbuilder.get('result')
    $I0 = defined ost
    unless $I0 goto err_no_ost # if OST fails stop

#    print "\n\nOST tree dump:\n"
#    ost.dump()

    # Compile the OST down to PIR
    load_bytecode "languages/punie/lib/PIRGrammar.pbc"
    .local pmc pirgrammar
    pirgrammar = new 'PIRGrammar'
    .local pmc pirbuilder
    pirbuilder = pirgrammar.apply(ost)
    .local pmc pir
    pir = pirbuilder.get('result')
    unless pir goto err_no_pir # if PIR not generated, stop

#    print "\n\nPIR dump:\n"
#    print pir

    # Execute
    .local pmc pir_compiler
    .local pmc pir_compiled
    pir_compiler = compreg "PIR"
    pir_compiled = pir_compiler( pir )

    pir_compiled()

    end

  err_match_fail:
    print "parse failed\n"
    goto cleanup

  err_no_ast:
    print "Unable to construct AST.\n"

  err_no_ost:
    print "Unable to construct OST.\n"

  err_no_pir:
    print "Unable to construct PIR.\n"

  cleanup:
    end
.end

# Read in the source from a file
.sub _get_source
    .param pmc argv
    .local string filename

    $I0 = argv
    if $I0 != 2 goto err_no_file

    # Read in the source file
    filename = argv[1]
    $S1 = _slurp_file(filename)
    .return ($S1)

  err_no_file:
    print "You must supply a punie file to parse.\n"
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

Copyright (C) 2005, The Perl Foundation.

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=head1 AUTHOR

Allison Randal <allison@perl.org>

=cut
