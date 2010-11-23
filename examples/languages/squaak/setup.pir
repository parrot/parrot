#!/usr/bin/env parrot
# Copyright (C) 2010, Parrot Foundation.

=head1 NAME

setup.pir - Python distutils style

=head1 DESCRIPTION

No Configure step, no Makefile generated.

=head1 USAGE

    $ parrot setup.pir build
    $ parrot setup.pir test
    $ sudo parrot setup.pir install

=cut

.sub 'main' :main
    .param pmc args
    $S0 = shift args
    load_bytecode 'distutils.pbc'

    $P0 = new 'Hash'
    $P0['name'] = 'Squaak'
    $P0['abstract'] = 'the Squaak compiler'
    $P0['description'] = 'the Squaak for Parrot VM.'

    # build
#    $P1 = new 'Hash'
#    $P1['squaak_ops'] = 'src/ops/squaak.ops'
#    $P0['dynops'] = $P1

#    $P2 = new 'Hash'
#    $P3 = split ' ', 'src/pmc/squaak.pmc'
#    $P2['squaak_group'] = $P3
#    $P0['dynpmc'] = $P2

    $P4 = new 'Hash'
    $P4['src/gen_actions.pir'] = 'src/Squaak/Actions.pm'
    $P4['src/gen_compiler.pir'] = 'src/Squaak/Compiler.pm'
    $P4['src/gen_grammar.pir'] = 'src/Squaak/Grammar.pm'
    $P4['src/gen_runtime.pir'] = 'src/Squaak/Runtime.pm'
    $P0['pir_nqp-rx'] = $P4

    $P5 = new 'Hash'
    $P6 = split "\n", <<'SOURCES'
src/squaak.pir
src/gen_actions.pir
src/gen_compiler.pir
src/gen_grammar.pir
src/gen_runtime.pir
SOURCES
    $S0 = pop $P6
    $P5['squaak/squaak.pbc'] = $P6
    $P5['squaak.pbc'] = 'squaak.pir'
    $P0['pbc_pir'] = $P5

    $P7 = new 'Hash'
    $P7['parrot-squaak'] = 'squaak.pbc'
    $P0['installable_pbc'] = $P7

    # test
    $S0 = get_parrot()
    $S0 .= ' squaak.pbc'
    $P0['prove_exec'] = $S0

    # install
    $P0['inst_lang'] = 'squaak/squaak.pbc'

    # dist
    $P0['doc_files'] = 'README'

    .tailcall setup(args :flat, $P0 :flat :named)
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

