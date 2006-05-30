=head1 NAME

OSTGrammar -- A grammar for transforming an abstract syntax tree to an
opcode syntax tree.

=head1 SYNOPSYS

  .sub _main :main
      load_bytecode 'OSTGrammar.pir'
      .local pmc grammar
       grammar = new 'OSTGrammar'

      # Construct the "OST"
      load_bytecode "languages/punie/lib/POST.pir"
      .local pmc ostbuilder
      ostbuilder = grammar.apply(match)
      .local pmc ost
      ost = ostbuilder.get('result')

      end
  .end

=head1 DESCRIPTION


=cut

.namespace [ 'OSTGrammar' ]

.sub _load :load
    load_bytecode 'TGE.pbc'

    $P0 = getclass 'TGE::Grammar'
    $P1 = subclass $P0, 'OSTGrammar'

.end

# Pull in the compiled grammar

.include 'languages/punie/lib/past2post_gen.pir'


=head1 LICENSE

Copyright (c) 2006 The Perl Foundation

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=head1 AUTHOR

Allison Randal <allison@perl.org>

=cut
