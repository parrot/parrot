=head1 NAME

punie -- A compiler for Perl 1

=head1 SYNOPSIS

  $ ../../parrot punie.pir script.p1

=head1 DESCRIPTION

Punie is a compiler for Perl version 1, running on Parrot. Its parser is
a PGE grammar (a subclass of PGE::Rule). The compilation is a series of
tree transformations using TGE: from match tree to abstract syntax tree
(AST), from AST to opcode syntax tree (OST), and finally from OST to
bytecode (actually to PIR, at first). For more on the ideas behind the
compiler, see:

http://svn.lohutok.net/nam/trunk/parrot/docs/compiler_tools.pod

Punie currently only parses and compiles a single statement to print a
single digit, in the form of:

  print 1;

=cut

.sub _main :main
    .param pmc args

    load_bytecode "lib/PunieGrammar.pir"

    .local string source
    source = _get_source(args)

    # Match against the source
    .local pmc match
    .local pmc line
    line = find_global "PunieGrammar", "line"
    match = line(source)

    # Verify the match
    $I0 = match.__get_bool()
    unless $I0 goto err_match_fail           # if match fails stop
    print "parse succeeded\n"
    print "Match tree dump:\n"
    load_bytecode "dumper.imc"
    load_bytecode "PGE/Dumper.pir"
    $P0 = find_global "_dumper"
    $P0(match, "$/")

    # "Traverse" the parse tree
    .local string tg_source
    tg_source = _slurp_file('lib/pge2past.g')

    load_bytecode "TGE.pbc"
    .local pmc grammar
    grammar = new 'TGE'
    grammar.agcompile(tg_source)

    # Construct the "AST"
    load_bytecode "lib/PAST.pir"
    .local pmc astbuilder
    astbuilder = grammar.apply(match)
    .local pmc ast
    ast = astbuilder.get('result')
    $I0 = defined ast
    unless $I0 goto err_no_ast # if AST fails stop

    print "\n\nAST tree dump:\n"
    ast.dump()
#    $P7 = getattribute $P6, 'left'
#    $P8 = getattribute $P7, 'value'

    # Compile and execute the "AST"

    end

  err_match_fail:
    print "parse failed"
    goto cleanup

  err_no_ast:
    print "Unable to construct AST.\n"

  cleanup:
    end
.end

# Read in the source either from a file or from STDIN
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
    $S1 = read filehandle, 65535
    close filehandle
    .return ($S1)
.end

=head1 LICENSE

Copyright (c) 2005 The Perl Foundation

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=head1 AUTHOR

Allison Randal <allison@perl.org>

=cut
