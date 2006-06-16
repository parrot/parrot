=head1 NAME

PunieGrammar -- A grammar for parsing Perl 1

=head1 SYNOPSYS

  .sub _main :main
      load_bytecode 'PunieGrammar.pir'
      .local pmc start_rule
      .local pmc match
      .local string source
 
      # Perl 1 source code
      source = 'print 1;'

      # Retrieve the start rule
      start_rule = find_global 'PunieGrammar', 'prog'

      # Parse the source and return a match object
      match = prog(source)

      ... # Do something with the parse tree

      end
  .end

=head1 DESCRIPTION

This is a grammar to parse Perl 1 programs. It inherits the behavior
of the PGE::Grammar class. It parses a string of source code according to
its hierarchy of rules and returns a PGE::Match object (a parse tree).

=cut

.namespace [ 'PunieGrammar' ]

.sub _load :load
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Text.pbc'

    $P0 = getclass 'PGE::Grammar'
    $P1 = subclass $P0, 'PunieGrammar'

    .local pmc optable
    .local pmc term
    $I0 = find_type "PGE::OPTable"
    optable = new $I0
    store_global "PunieGrammar", "$optable", optable

    optable.newtok('infix:+', 'precedence'=>'=')
    optable.newtok("infix:-", 'equiv'=>"infix:+")
    optable.newtok("infix:.", 'equiv'=>"infix:+")
    optable.newtok("infix:*", 'tighter'=>"infix:+")
    optable.newtok("infix:/", 'equiv'=>"infix:*")
    optable.newtok("infix:%", 'equiv'=>"infix:*")
    optable.newtok("infix:x", 'equiv'=>"infix:*")

    optable.newtok("infix:<<", 'looser'=>"infix:+")
    optable.newtok("infix:>>", 'equiv'=>"infix:<<")
    optable.newtok("infix:&",  'looser'=>"infix:<<")
    optable.newtok("infix:|",  'looser'=>"infix:&")
    optable.newtok("infix:^",  'equiv'=>"infix:|")

    optable.newtok("infix:=",  'looser'=>"infix:|")

    optable.newtok("infix:<",  'looser'=>"infix:<<", 'assoc'=>'non')
    optable.newtok("infix:>",  'equiv'=>"infix:<", 'assoc'=>'non')
    optable.newtok("infix:<=", 'equiv'=>"infix:<", 'assoc'=>'non')
    optable.newtok("infix:>=", 'equiv'=>"infix:<", 'assoc'=>'non')
    optable.newtok("infix:lt", 'equiv'=>"infix:<", 'assoc'=>'non')
    optable.newtok("infix:gt", 'equiv'=>"infix:<", 'assoc'=>'non')
    optable.newtok("infix:le", 'equiv'=>"infix:<", 'assoc'=>'non')
    optable.newtok("infix:ge", 'equiv'=>"infix:<", 'assoc'=>'non')

    optable.newtok("infix:==", 'looser'=>"infix:<", 'assoc'=>'non')
    optable.newtok("infix:!=", 'equiv'=>"infix:==", 'assoc'=>'non')
    optable.newtok("infix:eq", 'equiv'=>"infix:==", 'assoc'=>'non')
    optable.newtok("infix:ne", 'equiv'=>"infix:==", 'assoc'=>'non')

    term = find_global "PunieGrammar", "term"
    optable.newtok("term:", 'tighter'=>"infix:+", 'parsed'=>term)

.end

# Pull in the compiled grammar

.include "languages/punie/lib/punie_grammar_gen.pir"

# Operator precedence parsing rule
.sub "oexpr"
    .param pmc mob
    .local pmc optable
    optable = find_global "PunieGrammar", "$optable"
    $P0 = optable."parse"(mob)
    .return ($P0)
.end

=head1 LICENSE

Copyright (C) 2005, The Perl Foundation.

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=head1 AUTHOR

Allison Randal <allison@perl.org>

=cut
