=head1 NAME

PunieGrammar -- A grammar for parsing Perl 1

=head1 SYNOPSYS

  .sub _main @MAIN
      load_bytecode "PunieGrammar.pir"
      .local pmc line
      .local pmc match
      .local string source
 
      # Perl 1 source code
      source = "print 1;"

      # Retrieve the start rule
      line = find_global "PunieGrammar", "line"

      # Parse the source and return a match object
      match = line(source)

      ... # Do something with the parse tree

      end
  .end

=head1 DESCRIPTION

This is a grammar to parse Perl 1 programs. It inherits the behavior
of the PGE::Rule class. It parses a string of source code according to
its hierarchy of rules and returns a PGE::Match object (a parse tree).

Currently, all it can parse is a single statement printing a single
digit, in the form of "print 1;".

=cut

.namespace [ "PunieGrammar" ]

.sub _load @LOAD
    load_bytecode "../../runtime/parrot/library/PGE.pbc"

    $P0 = getclass "PGE::Rule"
    $P1 = subclass $P0, "PunieGrammar"

    # Construct the grammar
    .local pmc p6rule
    find_global p6rule, "PGE", "p6rule"

    p6rule("\d", "PunieGrammar", "term")
    p6rule("print \s* <PunieGrammar::expr>", "PunieGrammar", "gprint")
    p6rule("<PunieGrammar::gprint> | <PunieGrammar::term>", "PunieGrammar", "expr")
    p6rule("<PunieGrammar::expr>;", "PunieGrammar", "line")
.end

=head1 LICENSE

Copyright (c) 2005 The Perl Foundation

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=head1 AUTHOR

Allison Randal <allison@perl.org>

=cut
