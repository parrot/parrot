#! ../../../parrot
# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 NAME

setup.pir - Python distutils style

=head1 DESCRIPTION

No Configure step, no Makefile generated.

See F<runtime/library/distutils.pir>.

=head1 USAGE

    $ parrot setup.pir
    $ parrot setup.pir test
    $ sudo parrot setup.pir install

=cut

.sub 'main' :main
    .param pmc args
    $S0 = shift args
    load_bytecode 'distutils.pbc'

    $P0 = new 'Hash'
    $P0['name'] = 'Squaak'
    $P0['abstract'] = 'Squaak is a case-study language'
    $P0['description'] = 'Squaak is a case-study language'
    $P0['license_type'] = 'Artistic License 2.0'
    $P0['license_uri'] = 'http://www.perlfoundation.org/artistic_license_2_0'
    $P0['copyright_holder'] = 'Parrot Foundation'
    $P0['checkout_uri'] = 'https://svn.parrot.org/parrot/trunk/examples/languages/squaak'
    $P0['browser_uri'] = 'http://trac.parrot.org/parrot/browser/trunk/examples/languages/squaak'
    $P0['project_uri'] = 'http://trac.parrot.org/parrot/browser/trunk/examples/languages/squaak'

    # build
    $P1 = new 'Hash'
    $P1['src/gen_grammar.pir'] = 'src/parser/grammar.pg'
    $P0['pir_pge'] = $P1

    $P2 = new 'Hash'
    $P2['src/gen_actions.pir'] = 'src/parser/actions.pm'
    $P0['pir_nqprx'] = $P2

    $P3 = new 'Hash'
    $P4 = split "\n", <<'SOURCES'
squaak.pir
src/gen_actions.pir
src/gen_grammar.pir
src/builtins/say.pir
SOURCES
    $S0 = pop $P4
    $P3['squaak.pbc'] = $P4
    $P0['pbc_pir'] = $P3

    $P5 = new 'Hash'
    $P5['parrot-squaak'] = 'squaak.pbc'
    $P0['exe_pbc'] = $P5
    $P0['installable_pbc'] = $P5

    # test
    $S0 = get_parrot()
    $S0 .= ' squaak.pbc'
    $P0['prove_exec'] = $S0

    # dist
    $P6 = glob('doc/*.pod examples/*.sq')
    $P0['manifest_includes'] = $P6
    $P5 = split ' ', 'MAINTAINER README'
    $P0['doc_files'] = $P5

    .tailcall setup(args :flat, $P0 :flat :named)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
