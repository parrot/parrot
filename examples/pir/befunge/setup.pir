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
    $P0['name'] = 'befunge'
    $P0['abstract'] = 'This is a Befunge interpreter written in PIR'
    $P0['description'] = 'This is a Befunge interpreter written in PIR'
    $P0['license_type'] = 'Artistic License 2.0'
    $P0['license_uri'] = 'http://www.perlfoundation.org/artistic_license_2_0'
    $P0['copyright_holder'] = 'Parrot Foundation'
    $P0['checkout_uri'] = 'https://github.com/parrot/parrot/tree/master/examples/pir/befunge'
    $P0['browser_uri'] = 'http://trac.parrot.org/parrot/browser/trunk/examples/pir/befunge'
    $P0['project_uri'] = 'http://trac.parrot.org/parrot/browser/trunk/examples/pir/befunge'

    # build
    $P1 = new 'Hash'
    $P2 = split "\n", <<'SOURCES'
befunge.pir
debug.pir
flow.pir
io.pir
load.pir
maths.pir
stack.pir
SOURCES
    $P1['befunge.pbc'] = $P2
    $P0['pbc_pir'] = $P1

    $P3 = new 'Hash'
    $P3['parrot-befunge'] = 'befunge.pbc'
    $P0['exe_pbc'] = $P3
    $P0['installable_pbc'] = $P3

    # test
    $P0['test_exec'] = 'perl'

    # dist
    $P4 = glob('*.bef')
    $P0['manifest_includes'] = $P4
    $P5 = split ' ', 'Changes MAINTAINER README'
    $P0['doc_files'] = $P5

    .tailcall setup(args :flat, $P0 :flat :named)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
