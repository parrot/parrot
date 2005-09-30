=head1 NAME

punie -- A compiler for Perl 1

=head1 SYNOPSIS

  $ ../../parrot punie.pir script.p1

=head1 DESCRIPTION

Punie is a compiler for Perl version 1, running on Parrot. Its parser is
a PGE grammar (a subclass of PGE::Rule). The "compilation" is a hackish
insert of a value into a static "AST", following the stub in the ast/
directory at the top level of Parrot. This stub isn't exactly what we
want from an AST -- it's more of a fully parenthesized language than a
syntax tree. But it fills the role for the sake of demonstration, and
can be replaced later.

Punie currently only parses and compiles the single statement to print a
single digit, in the form of:

  print 1;

=cut

.sub _main @MAIN
    .param pmc argv

    load_bytecode "languages/punie/PunieGrammar.pir"

    .local string source
    source = _get_source(argv)

    # Match against the source
    .local pmc match
    .local pmc line
    line = find_global "PunieGrammar", "line"
    match = line(source)

    # Verify the match
    $I0 = match.__get_bool()
    unless $I0 goto match_fail           # if match fails stop
#    print "parse succeeded\n"
#    match.dump()

    # "Traverse" the parse tree (currently a hack)
    $P1 =  match['PunieGrammar::expr']
    $P2 = $P1['PunieGrammar::gprint']
    $P3 = $P2['PunieGrammar::expr']
    $P4 = $P3['PunieGrammar::term']

    # Construct the "AST"
    .local string past_source
    $S2 = $P4
    past_source = "Parrot_AST(Py_Module(Stmts(Py_Print(Const("
    past_source .= $S2
    past_source .= ")))))"

    # Compile and execute the "AST"
    .local pmc past_compiler
    .local pmc past_compiled
    past_compiler = compreg "PAST"
    past_compiled = past_compiler( past_source )

    past_compiled()

  match_fail:
    print "parse failed"

  cleanup:
    end
.end

# Read in the source either from a file or from STDIN
.sub _get_source
    .param pmc argv

    .local pmc filehandle
    .local string filename

    $I0 = argv
    if $I0 == 2 goto fromfile

    filehandle = getstdin
    goto grabline

  fromfile:
    # Read in the source file
    filename = argv[1]
    filehandle = open filename, "<"

  grabline:
    $S1 = readline filehandle

    if $I0 != 2 goto finished
    close filehandle

  finished:
    .return ($S1)
.end

=head1 LICENSE

Copyright (c) 2005 The Perl Foundation

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=head1 AUTHOR

Allison Randal <allison@perl.org>

=cut
