=head1 NAME

PIRGrammar -- A grammar for transforming an opcode syntax tree to PIR.

=head1 SYNOPSYS

  .sub _main :main
      load_bytecode 'PIRGrammar.pir'
      .local pmc grammar
       grammar = new 'PIRGrammar'

      # Build the PIR output
      .local pmc pirbuilder
      pirbuilder = grammar.apply(match)
      .local pmc pir
      pir = pirbuilder.get('result')

      end
  .end

=head1 DESCRIPTION


=cut

.namespace [ 'PIRGrammar' ]

.sub _load :load
    load_bytecode 'TGE.pbc'

    $P0 = getclass 'TGE::Grammar'
    $P1 = subclass $P0, 'PIRGrammar'

.end

# Pull in the compiled grammar

.include 'languages/punie/lib/post2pir_gen.pir'


=head1 LICENSE

Copyright (c) 2006 The Perl Foundation

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=head1 AUTHOR

Allison Randal <allison@perl.org>

=cut
