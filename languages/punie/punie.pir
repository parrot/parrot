=head1 NAME

punie -- A compiler for Perl 1

=head1 SYNOPSIS

  $ ./parrot languages/punie/punie.pir script.p1

=head1 DESCRIPTION

Punie is a compiler for Perl version 1, running on Parrot. Its parser is
a PGE grammar (a subclass of PGE::Grammar). The compilation is a series of
tree transformations using TGE: from match tree to abstract syntax tree
(AST), from AST to opcode syntax tree (OST), and finally from OST to
bytecode (actually to PIR, at first). For more on the ideas behind the
compiler, see:

http://svn.lohutok.net/nam/trunk/parrot/docs/compiler_tools.pod

So far, Punie handles constants (strings, integers, floats), print
statements, conditionals, do blocks, comma lists, and some basic math
and logic ops.

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

    $P0 = new [ 'PCT::HLLCompiler' ]
    $P0.'language'('Punie')
    $P0.'parsegrammar'('Punie::Grammar')
    $P1 = split '::', 'Punie::Grammar::Actions'
    $P0.'parseactions'($P1)
.end

.sub 'main' :main
    .param pmc args
    $P0 = compreg 'Punie'
    .return $P0.'command_line'(args)
.end

.include 'lib/builtins.pir'
.include 'lib/gen_punie.pir'
.include 'lib/gen_punie-actions.pir'

=head1 LICENSE

Copyright (C) 2005-2007, The Perl Foundation.

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=head1 AUTHOR

Allison Randal <allison@perl.org>

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
