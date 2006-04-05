=head1 NAME

ASTGrammar -- A grammar for transforming the output of a PGE parse into
an abstract syntax tree.

=head1 SYNOPSYS

  .sub _main :main
      load_bytecode 'ASTGrammar.pir'
      .local pmc grammar
       grammar = new 'ASTGrammar'

      # Construct the "AST"
      load_bytecode "languages/punie/lib/PAST.pir"
      .local pmc astbuilder
      astbuilder = grammar.apply(match)
      .local pmc ast
      ast = astbuilder.get('result')

      end
  .end

=head1 DESCRIPTION


=cut

.namespace [ 'ASTGrammar' ]

.sub _load :load
    load_bytecode 'TGE.pbc'

    $P0 = getclass 'TGE'
    $P1 = subclass $P0, 'ASTGrammar'

.end

# Pull in the compiled grammar

.include 'languages/punie/lib/pge2past_gen.pir'

=cut

=head1 LICENSE

Copyright (c) 2006 The Perl Foundation

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=head1 AUTHOR

Allison Randal <allison@perl.org>

=cut
