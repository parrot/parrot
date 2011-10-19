#!./parrot
# Copyright (C) 2010-2011, Parrot Foundation.

=head1 NAME

t/dynpmc/select.t - tests the Select PMC

=head1 SYNOPSIS

    % prove t/dynpmc/select.t

=head1 DESCRIPTION

Tests the Select PMC: a PMC for monitoring multiple file handles, waiting for
it to become ready for an I/O operation.

=cut

.sub main :main
    .include 'test_more.pir'
    .include 'iglobals.pasm'

    load_bytecode 'osutils.pbc'

    plan(13)

    .local pmc interp
    interp = getinterp

    .local pmc config
    config = interp[.IGLOBALS_CONFIG_HASH]

    .local string osname
    osname = config['osname']

    if osname == 'MSWin32' goto todo_all
    if osname == 'msys'    goto todo_all
    goto tests

  todo_all:
    skip(13, 'Behavior of select() is undefined on Windows')
    goto end

  tests:
    test_load()
    test_update()
    test_read()
    test_write()
    test_select()
  end:
.end

.sub 'test_load'
    $P0 = loadlib 'select'
    $I0 = defined $P0
    ok($I0, "Loaded 'select' library")
.end

.sub 'test_update'
    $P9 = new 'String'
    $P9 = 'FH1'

    $P0 = new ['FileHandle']
    $P0.'open'('README')

    $P1 = new ['Select']
    $P1.'update'($P0, $P9, 5)

    $P3 = new ['FileHandle']
    $P3.'open'('README')

    $P9 = new 'String'
    $P9 = 'FH2'

    $P1.'update'($P3, $P9, 5)

    $I1 = $P0.'handle'()
    $I2 = $P3.'handle'()

    if $I1 > $I2 goto a
    $I1 = $I2

  a:
    $I0 = $P1.'max_fd'()
    is($I0, $I1, 'Check maximum number of file handles')

    $P2 = $P1.'fd_map'()
    $I3 = $P2
    is($I3, 2, 'Two file handles in Select PMC')

    $I0 = $P0.'handle'()
    $S0 = $P2[$I0]
    is($S0, 'FH1', 'Check fd_map() for FH1')

    $I0 = $P3.'handle'()
    $S0 = $P2[$I0]
    is($S0, 'FH2', 'Check fd_map for FH2')

    $P1.'remove'($P0)
    $I3 = $P2
    is($I3, 1, 'One file handle in Select PMC')

    $P6 = $P1.'can_read'(1)
.end

.sub 'test_read'
    $P9 = new 'String'
    $P9 = 'FH1'

    $P0 = new ['FileHandle']
    $P0.'open'('README')

    $P1 = new ['Select']
    $P1.'update'($P0, $P9, 5)

    $P6 = $P1.'can_read'(1)
    $I0 = $P6
    is($I0, 1, 'Test can_read() for README')

    $P6 = $P1.'can_write'(0)
    $I0 = $P6
    is($I0, 0, 'Test can_write() for README')
.end

.sub 'test_write'
    $S0 = 'README2'

    $P9 = new 'String'
    $P9 = 'FH1'

    $P0 = new ['FileHandle']
    $P0.'open'($S0, 'w')

    $P1 = new ['Select']
    $P1.'update'($P0, $P9, 2)
    sweep 1
    $P9 = new 'String'
    $P9 = 'FH2'

    $P6 = $P1.'can_write'(1)
    $I0 = $P6
    is($I0, 1, 'Test can_write() for README2')
    $P2 = $P6[0]
    is($P2, "FH1", 'can_write() returned the correct payload')

    $P6 = $P1.'can_read'(0)
    $I0 = $P6
    is($I0, 0, 'Test can_read() for README2')

    unlink($S0)
.end

.sub 'test_select'
    $S0 = 'README2'
    $P9 = new 'String'
    $P9 = 'FH1'

    $P0 = new ['FileHandle']
    $P0.'open'('README', 'r')

    $P1 = new ['Select']
    $P1.'update'($P0, $P9, 5)

    $P9 = new 'String'
    $P9 = 'FH2'

    $P0 = new ['FileHandle']
    $P0.'open'($S0, 'w')

    $P1.'update'($P0, $P9, 6)

    $P6 = $P1.'select'(1)
    $P7 = $P6[0]
    $I0 = $P7
    is($I0, 1, 'Test can_read() for README2 (array index)')

    $P7 = $P6[1]
    $I0 = $P7
    is($I0, 1, 'Test can_write() for README2 (array index)')

    $P7 = $P6[2]
    $I0 = $P7
    is($I0, 0, 'Test has_exception() for README2 (array index)', 'varies across OSes' :named('todo'))

    unlink($S0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
