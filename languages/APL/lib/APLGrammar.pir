=head1 NAME

APLGrammar -- A grammar for parsing APL

=head1 SYNOPSYS

  .sub _main :main
      load_bytecode 'APLGrammar.pbc'
      .local pmc start_rule
      .local pmc match
      .local string source
 
      # APL source code
      # Assign a 2 element vector to a variable..
      source = 'FOO ← 1  2'

      # Retrieve the start rule
      start_rule = find_global 'APLGrammar', 'prog'

      # Parse the source and return a match object
      match = prog(source)

      ... # Do something with the parse tree

      end
  .end

=head1 DESCRIPTION

This is a grammar to parse APL programs. It inherits the behavior
of the PGE::Rule class. It parses a string of source code according to
its hierarchy of rules and returns a PGE::Match object (a parse tree).

=cut

.namespace [ 'APLGrammar' ]

.sub _load :load
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Text.pbc'

    $P0 = getclass 'PGE::Rule'
    $P1 = subclass $P0, 'APLGrammar'

    .local pmc optable
    .local pmc term
    $I0 = find_type "PGE::OPTable"
    optable = new $I0
    store_global "APLGrammar", "$optable", optable

    optable.addtok("infix:+")
    optable.addtok("infix:-", "infix:+")
    optable.addtok("infix:.", "infix:+")
    optable.addtok("infix:*", ">infix:+")
    optable.addtok("infix:/", "infix:*")
    optable.addtok("infix:%", "infix:*")
    optable.addtok("infix:x", "infix:*")
    optable.addtok(unicode:"infix:\u00d7", 'infix:*') # multiplication

    optable.addtok("infix:<<", "<infix:+")
    optable.addtok("infix:>>", "infix:<<")
    optable.addtok("infix:&", "<infix:<<")
    optable.addtok("infix:|", "<infix:&")
    optable.addtok("infix:^", "infix:|")

    term = find_global "APLGrammar", "term"
    optable.addtok("term:", ">infix:+", "left", term)

.end

# Pull in the compiled grammar

.include "languages/APL/lib/generated_APL_grammar.pir"

# Operator precedence parsing rule
.sub "oexpr"
    .param pmc mob
    .local pmc optable
    optable = find_global "APLGrammar", "$optable"
    $P0 = optable."parse"(mob)
    .return ($P0)
.end

=head1 LICENSE

Copyright (c) 2005 The Perl Foundation

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=head1 AUTHOR

Allison Randal <allison@perl.org>

=cut
