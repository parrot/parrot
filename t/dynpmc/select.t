#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/select.t - test the Select PMC


=head1 SYNOPSIS

    % prove t/dynpmc/select.t

=head1 DESCRIPTION

Tests the Select PMC.

=cut

.sub main :main
    .include 'test_more.pir'
    .include "iglobals.pasm"
    plan(13)
    .local pmc interp
    interp = getinterp
    .local pmc config
    config = interp[.IGLOBALS_CONFIG_HASH]
    .local string osname
    osname = config['osname']
    if osname == 'MSWin32' goto todo_all
    if osname == 'msys' goto todo_all
    goto tests
todo_all:
    skip(13, 'busted on Win32')
    goto end
tests:
    'test_load'()
    'test_update'()
    'test_read'()
    'test_write'()
    'test_select'()
end:
.end


.sub 'test_load'
    $P0 = loadlib 'select'
    $I0 = defined $P0
    ok($I0, 'select library loaded')
.end


.sub 'test_update'
    $P9 = new 'String'
    $P9 = "FH1"
    $P0 = new ['FileHandle']
    $P0.'open'('README')
    $P1 = new ['Select']
    $P1."update"($P0, $P9, 5)

    $P3 = new ['FileHandle']
    $P3.'open'('README')
    $P9 = new 'String'
    $P9 = "FH2"
    $P1."update"($P3, $P9, 5)

    $I1 = $P0.'handle'()
    $I2 = $P3.'handle'()

    if $I1 > $I2 goto a
    $I1 = $I2
a:

    $I0 = $P1.'max_fd'()

    is($I0, $I1, 'maxid = max(fd1 fd2)')

    $P2 = $P1.'fd_map'()
    $I3 = $P2
    is($I3, 2, 'two items in select PMC')

    $I0 = $P0.'handle'()
    $S0 = $P2[$I0]
    is($S0, "FH1", 'fd_map[x] = FH1')

    $I0 = $P3.'handle'()
    $S0 = $P2[$I0]
    is($S0, "FH2", 'fd_map[x] = FH2')

    $P1.'remove'($P0)
    $I3 = $P2
    is($I3, 1, 'one item in select PMC')
    $P6 = $P1.'can_read'(1)
#    $S0 = get_repr $P6
#    say $S0
.end

.sub 'test_read'
    $P9 = new 'String'
    $P9 = "FH1"
    $P0 = new ['FileHandle']
    $P0.'open'('README')
    $P1 = new ['Select']
    $P1."update"($P0, $P9, 5)

    $P6 = $P1.'can_read'(1)
    $I0 = $P6
    is($I0, 1, 'can_read')

    $P6 = $P1.'can_write'(0)
    $I0 = $P6
    is($I0, 0, 'cant_read')
.end

.sub 'test_write'
    $P9 = new 'String'
    $P9 = "FH1"
    $P0 = new ['FileHandle']
    $P0.'open'('README2', "w")
    $P1 = new ['Select']
    $P1."update"($P0, $P9, 2)

    $P6 = $P1.'can_write'(1)
    $I0 = $P6
    is($I0, 1, 'can_write')

    $P6 = $P1.'can_read'(0)
    $I0 = $P6
    is($I0, 0, 'cant_read')
.end

.sub 'test_select'
    $P9 = new 'String'
    $P9 = "FH1"
    $P0 = new ['FileHandle']
    $P0.'open'('README', 'r')
    $P1 = new ['Select']
    $P1."update"($P0, $P9, 5)

    $P9 = new 'String'
    $P9 = "FH2"
    $P0 = new ['FileHandle']
    $P0.'open'('README2', "w")
    $P1."update"($P0, $P9, 6)

    $P6 = $P1.'select'(1)
    $P7 = $P6[0]
    $I0 = $P7
    is($I0, 1, 'can_read')
    $P7 = $P6[1]
    $I0 = $P7
    is($I0, 1, 'can_write')
    $P7 = $P6[2]
    $I0 = $P7
    is($I0, 0, 'no error')
#    $S0 = get_repr $P6
#    say $S0
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
