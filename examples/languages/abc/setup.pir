#! ../../../parrot
# Copyright (C) 2009-2011, Parrot Foundation.

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
    $P0['name'] = 'abc'
    $P0['abstract'] = 'a basic calculator'
    $P0['description'] = 'This is an implementation of the basic calculator using the Parrot compiler tools.'
    $P0['license_type'] = 'Artistic License 2.0'
    $P0['license_uri'] = 'http://www.perlfoundation.org/artistic_license_2_0'
    $P0['copyright_holder'] = 'Parrot Foundation'
    $P0['checkout_uri'] = 'https://github.com/parrot/parrot/tree/master/examples/languages/abc'
    $P0['browser_uri'] = 'http://trac.parrot.org/parrot/browser/trunk/examples/languages/abc'
    $P0['project_uri'] = 'http://trac.parrot.org/parrot/browser/trunk/examples/languages/abc'

    # build
    $P1 = new 'Hash'
    $P1['src/gen_grammar.pir'] = 'src/parser/grammar.nqp'
    $P1['src/gen_actions.pir'] = 'src/parser/actions.nqp'
    $P0['pir_nqprx'] = $P1

    $P2 = new 'Hash'
    $P3 = split "\n", <<'SOURCES'
abc.pir
src/gen_actions.pir
src/gen_grammar.pir
src/builtins/all.pir
SOURCES
    $S0 = pop $P3
    $P2['abc.pbc'] = $P3
    $P0['pbc_pir'] = $P2

    $P4 = new 'Hash'
    $P4['parrot-abc'] = 'abc.pbc'
    $P0['exe_pbc'] = $P4
    $P0['installable_pbc'] = $P4

    # test
    $P0['test_exec'] = 'perl'

    # dist
    $P4 = glob('t/abc_*')
    $P0['manifest_includes'] = $P4
    $P5 = split ' ', 'MAINTAINER README TODO'
    $P0['doc_files'] = $P5

    .tailcall setup(args :flat, $P0 :flat :named)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
