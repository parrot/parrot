#! perl
# Copyright (C) 2001-2008, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 6;
use Parrot::Config;

=head1 NAME

t/pmc/timer.t - Timer PMCs

=head1 SYNOPSIS

    % prove t/pmc/timer.t

=head1 DESCRIPTION

Tests the Timer PMC.

=cut

$ENV{TEST_PROG_ARGS} ||= '';

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
    # skip( "No thread enabled", 4 ) unless ( $PConfig{HAS_THREADS} );
    # TESTING fix_sleep branch
    # The current fix should work in most platforms.

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
       ( todo => 'TT #1316, add scheduler features to JIT' ) : ();
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

pir_output_is( <<'CODE', <<'OUT', "Timer start/repeat/stop");
.include "timer.pasm"
.sub tick
    get_global $P0, 'counter'
    inc $P0
.end
.sub main :main
    .local pmc timer
    .local int t1, t2, r
    .const 'Sub' tick = 'tick'
    $P0 = new 'Integer'
    set_global 'counter', $P0
    timer = new ['Timer']
    timer[.PARROT_TIMER_HANDLER] = tick
    timer[.PARROT_TIMER_INTERVAL] = 0.1
    timer[.PARROT_TIMER_REPEAT] = -1
    timer[.PARROT_TIMER_RUNNING] = 1
    # Allow at least two ticks
    sleep 0.2
    sleep 0.2
    timer[.PARROT_TIMER_RUNNING] = 0
    # Give a chance to run a possible pending tick
    sleep 0.2
    get_global $P0, 'counter'
    t1 = $P0
    r = isgt t1, 1
    say r
    # Give a chance to tick to verify that is stopped
    sleep 0.2
    sleep 0.2
    get_global $P0, 'counter'
    t2 = $P0
    r = iseq t1, t2
    say r
.end
CODE
1
1
OUT
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

