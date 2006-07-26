=head1 NAME

Cardinal::Grammar -- A grammar for parsing Ruby 1.8.4

=head1 SYNOPSYS

  .sub _main :main
      load_bytecode 'CardinalGrammar.pir'
      .local pmc start_rule
      .local pmc match
      .local string source
 
      # Ruby 1 source code
      source = 'puts 1;'

      # Retrieve the start rule
      start_rule = get_hll_namespace [ 'Cardinal'; 'Grammar', 'prog' ]

      # Parse the source and return a match object
      match = start_rule(source)

      ... # Do something with the parse tree

      end
  .end

=head1 DESCRIPTION

This is a grammar to parse Cardinal programs. It inherits the behavior
of the PGE::Grammar class. It parses a string of source code according to
its hierarchy of rules and returns a PGE::Match object (a parse tree).

=cut

#.HLL 'Ruby', 'ruby_group'
#.namespace [ 'Cardinal'; 'Grammar' ]
.namespace [ 'Cardinal::Grammar' ]

.sub _load :load
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Text.pbc'
.end

# Pull in the compiled grammar

.include "languages/cardinal/src/cardinal_grammar_gen.pir"

# Operator precedence parsing rule
.sub "operator_precedence_parser"
  .param pmc mob
  .local pmc optable
  #optable = get_hll_namespace ['Cardinal'; 'Grammar']
  optable = get_root_global [ 'parrot'; 'Cardinal::Grammar'], '$optable'
  $P0 = optable."parse"(mob)
  .return ($P0)
.end

=head1 LICENSE

Copyright (c) 2005 The Perl Foundation

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=head1 AUTHOR

Kevin Tew <kevintew@tewk.com>

=cut
