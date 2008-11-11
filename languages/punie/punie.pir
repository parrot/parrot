=head1 NAME

punie -- A compiler for Perl 1

=head1 SYNOPSIS

  $ ./parrot languages/punie/punie.pir script.p1

=head1 DESCRIPTION

Punie is a compiler for Perl version 1, running on Parrot. Its parser is
a PGE grammar (a subclass of PGE::Grammar). The compilation is a series of
tree transformations using the Parrot compiler toolkit.

  print 1;
  print 45.5;
  print "ok 1\n";
  print 1 + 2, "\n", 2 + 3, "\n";
  unless (1 - 1) {
    print "a sum of nothing\n";
  }

=cut

.namespace [ 'Punie' ]

.include "errors.pasm"

.sub 'onload' :load :init :anon
    load_bytecode 'PCT.pbc'

    $P0 = new [ 'PCT';'HLLCompiler' ]
    $P0.'language'('Punie')
    $P0.'parsegrammar'('Punie::Grammar')
    $P1 = split '::', 'Punie::Grammar::Actions'
    $P0.'parseactions'($P1)
.end

.sub 'main' :main
    .param pmc args
    $P0 = compreg 'Punie'
    .tailcall $P0.'command_line'(args)
.end

.include 'src/builtins/builtins.pir'
.include 'src/gen_punie.pir'
.include 'src/gen_punie-actions.pir'

=head1 LICENSE

Copyright (C) 2005-2008, The Perl Foundation.

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
