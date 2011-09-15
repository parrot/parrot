#! perl
# Copyright (C) 2001-2008, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 9;
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
.pcc_sub :main main:
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

    # ensure destroy() is called.
    null P0
    sweep 1
    end
CODE
ok 1
ok 2
ok 3
OUT

pasm_output_is( <<'CODE', <<'OUT', "Timer param test/invoke" );
.include "timer.pasm"

.pcc_sub :main main:

    new P0, ['Timer']

    set P0[.PARROT_TIMER_INTERVAL], 2.2
    set P0[.PARROT_TIMER_INTERVAL], 2

    set I0, P0[.PARROT_TIMER_INTERVAL]
    say I0

    set I0, P0[99999]
    say I0

    set N0, P0[99999]
    say N0

    get_global P1, "_timer_sub"
    set P0[.PARROT_TIMER_HANDLER], P1
    null P1

    set P1, P0[.PARROT_TIMER_HANDLER]
    unless_null P1, ok1
    print "not "
ok1:say "ok 1"

    set P1, P0[99999]
    if_null P1, ok2
    print "not "
ok2:say "ok 2"

    push_eh ok3
    set P0[99999], 2
    print "no "
ok3:pop_eh
    say "exception 1"

    push_eh ok4
    set P0[99999], 2.2
    print "no "
ok4:pop_eh
    say "exception 2"

    invokecc P0
    end

.pcc_sub _timer_sub:
    say "hello world"
    returncc
CODE
2
-1
-1
ok 1
ok 2
exception 1
exception 2
hello world
OUT

pasm_output_is( <<'CODE', <<'OUT', "Timer setup - initializer" );
.pcc_sub :main main:
.include "timer.pasm"
    new P1, ['FixedPMCArray']
    set P1, 5
    set P1[0], .PARROT_TIMER_SEC
    set P1[1], 8
    set P1[2], .PARROT_TIMER_USEC
    set P1[3], 400000
    set P1[4], 24829375976 # test default case

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
    skip( "No thread enabled", 3 ) unless ( $PConfig{HAS_THREADS} );

    pasm_output_like( <<'CODE', <<'OUT', "Timer setup - initializer/start" );
    .pcc_sub :main main:
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
    .pcc_sub :main main:
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
    .pcc_sub :main main:
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
    timer[.PARROT_TIMER_NSEC] = 0.1
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

pir_output_is( << 'CODE', << 'OUTPUT', "check whether interface is done" );

.sub _main :main
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

pir_output_is( << 'CODE', << 'OUTPUT', "Timer - many repetitions" );

.include 'timer.pasm'

.sub expired
    $P0 = get_global "expired_count"
    inc $P0
.end

.sub main :main
    $P2 = new 'Integer'
    set_global "expired_count", $P2

    $P0 = new 'Timer'
    $P1 = get_global "expired"

    $P0[.PARROT_TIMER_HANDLER]  = $P1
    $P0[.PARROT_TIMER_SEC]      = 0
    $P0[.PARROT_TIMER_REPEAT]   = 9999
    $P0[.PARROT_TIMER_RUNNING]  = 1

loop:
    sleep 0
    if $P2 < 10000 goto loop

    sleep 0.5
    say $P2
.end
CODE
10000
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
