=head1 NAME

C99::Grammar -- A grammar for parsing C99

=head1 SYNOPSYS

=head1 DESCRIPTION

This is a grammar to parse c99 programs. It inherits the behavior
of the PGE::Grammar class. It parses a string of source code according to
its hierarchy of rules and returns a PGE::Match object (a parse tree).

=cut

#.HLL 'C99', 'c99y_group'
#.namespace [ 'C99'; 'Grammar' ]
.namespace [ 'C99::Grammar' ]

.sub _load :load
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Text.pbc'
.end

# Pull in the compiled grammar
.include "languages/c99/src/c99_grammar_gen.pir"
.sub '__onload' :load
    $P0 = get_hll_global ['C99::Grammar'], '$optable'
    $P1 = get_hll_global ['C99::Grammar'], 'ws'
    setattribute $P0, '&!ws', $P1
    $P0 = new .Hash
.end

# Operator precedence parsing rule
.sub "operator_precedence_parser"
  .param pmc match_object
  .local pmc optable
  #optable = get_hll_namespace ['C99'; 'Grammar']
  optable = get_root_global [ 'parrot'; 'C99::Grammar'], '$optable'
  $P0 = optable."parse"(match_object)
  .return ($P0)
.end

=head1 LICENSE

Copyright (c) 2005 The Perl Foundation

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=head1 AUTHOR

Kevin Tew <kevintew@tewk.com>

=cut
