#! perl
# Copyright (C) 2001-2008, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 6;

=head1 NAME

t/pmc/timer.t - Timer PMCs

=head1 SYNOPSIS

    % prove t/pmc/timer.t

=head1 DESCRIPTION

Tests the Timer PMC.

=cut

$ENV{TEST_PROG_ARGS} ||= '';

my %platforms = map { $_ => 1 } qw/
    aix
    cygwin
    darwin
    dec_osf
    freebsd
    hpux
    irix
    linux
    openbsd
    MSWin32
/;

pasm_output_is( <<'CODE', <<'OUT', "Timer setup" );
.include "timer.pasm"
    new P0, ['Timer']
    set P0[.PARROT_TIMER_SEC], 7
    set I0, P0[.PARROT_TIMER_SEC]
    eq I0, 7, ok1
    print "not "
ok1:
    print "ok 1\n"
    set I0, P0[.PARROT_TIMER_USEC]
    eq I0, 0, ok2
    print "not "
ok2:
    print "ok 2\n"

    set I0, P0[.PARROT_TIMER_RUNNING]
    eq I0, 0, ok3
    print "not "
ok3:
    print "ok 3\n"
    end
CODE
ok 1
ok 2
ok 3
OUT

pasm_output_is( <<'CODE', <<'OUT', "Timer setup - initializer" );
.include "timer.pasm"
    new P1, ['FixedPMCArray']
    set P1, 4
    set P1[0], .PARROT_TIMER_SEC
    set P1[1], 8
    set P1[2], .PARROT_TIMER_USEC
    set P1[3], 400000

    new P0, ['Timer'], P1
    set I0, P0[.PARROT_TIMER_SEC]
    eq I0, 8, ok1
    print "not "
ok1:
    print "ok 1\n"
    set I0, P0[.PARROT_TIMER_USEC]
    eq I0, 400000, ok2
    eq I0, 400001, ok2
    eq I0, 399999, ok2
    print "not "
ok2:
    print "ok 2\n"

    set I0, P0[.PARROT_TIMER_RUNNING]
    eq I0, 0, ok3
    print "not "
ok3:
    print "ok 3\n"
    end
CODE
ok 1
ok 2
ok 3
OUT

SKIP: {
    skip( "No thread config yet", 3 ) unless ( $platforms{$^O} );

    pasm_output_like( <<'CODE', <<'OUT', "Timer setup - initializer/start" );
.include "timer.pasm"
    new P1, ['FixedPMCArray']
    set P1, 6
    set P1[0], .PARROT_TIMER_NSEC
    set P1[1], 0.5
    set P1[2], .PARROT_TIMER_HANDLER
    get_global P2, "_timer_sub"
    set P1[3], P2
    set P1[4], .PARROT_TIMER_RUNNING
    set P1[5], 1

    new P0, ['Timer'], P1
    print "ok 1\n"
    sleep 1
    print "ok 3\n"
    end
.pcc_sub _timer_sub:
    print "ok 2\n"
    returncc
CODE
/ok 2/
OUT

    pasm_output_is( <<'CODE', <<'OUT', "Timer setup - initializer/start/stop" );
.include "timer.pasm"
    new P1, ['FixedPMCArray']
    set P1, 6
    set P1[0], .PARROT_TIMER_NSEC
    set P1[1], 0.5
    set P1[2], .PARROT_TIMER_HANDLER
    get_global P2, "_timer_sub"
    set P1[3], P2
    set P1[4], .PARROT_TIMER_RUNNING
    set P1[5], 1

    new P0, ['Timer'], P1
    print "ok 1\n"
    # stop the timer
    set P0[.PARROT_TIMER_RUNNING], 0
    sleep 1
    print "ok 2\n"
    end
.pcc_sub _timer_sub:
    print "never\n"
    returncc
CODE
ok 1
ok 2
OUT

    my @todo = $ENV{TEST_PROG_ARGS} =~ /--runcore=jit/ ?
       ( todo => 'RT #49718, add scheduler features to JIT' ) : ();
    pasm_output_is( <<'CODE', <<'OUT', "Timer setup - initializer/start/repeat" , @todo );
.include "timer.pasm"
    new P1, ['FixedPMCArray']
    set P1, 8
    set P1[0], .PARROT_TIMER_NSEC
    set P1[1], 0.2
    set P1[2], .PARROT_TIMER_HANDLER
    get_global P2, "_timer_sub"
    set P1[3], P2
    set P1[4], .PARROT_TIMER_REPEAT
    set P1[5], 2
    set P1[6], .PARROT_TIMER_RUNNING
    set P1[7], 1

    new P0, ['Timer'], P1
    print "ok 1\n"
    sleep 1
    sleep 1
    sleep 1
    sleep 1
    print "ok 3\n"
    end
.pcc_sub _timer_sub:
    print "ok 2\n"
    returncc
CODE
ok 1
ok 2
ok 2
ok 2
ok 3
OUT
}

pir_output_is( << 'CODE', << 'OUTPUT', "check whether interface is done" );

.sub _main
    .local pmc pmc1
    pmc1 = new ['Timer']
    .local int bool1
    does bool1, pmc1, "scalar"
    print bool1
    print "\n"
    does bool1, pmc1, "event"
    print bool1
    print "\n"
    does bool1, pmc1, "no_interface"
    print bool1
    print "\n"
    end
.end
CODE
0
1
0
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
