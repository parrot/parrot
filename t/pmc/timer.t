#! perl -w

use Parrot::Test tests => 3;
use Test::More;

output_is(<<'CODE', <<'OUT', "Timer setup");
.include "timer.pasm"
    new P0, .Timer
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

output_is(<<'CODE', <<'OUT', "Timer setup - initializer");
.include "timer.pasm"
    new P1, .SArray
    set P1, 4
    set P1[0], .PARROT_TIMER_SEC
    set P1[1], 8
    set P1[2], .PARROT_TIMER_USEC
    set P1[3], 400000

    new P0, .Timer, P1
    set I0, P0[.PARROT_TIMER_SEC]
    eq I0, 8, ok1
    print "not "
ok1:
    print "ok 1\n"
    set I0, P0[.PARROT_TIMER_USEC]
    eq I0, 400000, ok2
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
  skip("No thread config yet", 1) unless ($^O eq 'linux' or $^O eq 'darwin');

output_is(<<'CODE', <<'OUT', "Timer setup - initializer/start");
.include "timer.pasm"
    bounds 1	# cant run with JIT core yet
    new P1, .SArray
    set P1, 6
    set P1[0], .PARROT_TIMER_NSEC
    set P1[1], 0.5
    set P1[2], .PARROT_TIMER_HANDLER
    find_global P2, "_timer_sub"
    set P1[3], P2
    set P1[4], .PARROT_TIMER_RUNNING
    set P1[5], 1

    new P0, .Timer, P1
    print "ok 1\n"
    sleep 1
    print "ok 3\n"
    end
.pcc_sub _timer_sub:
    print "ok 2\n"
    invoke P1
CODE
ok 1
ok 2
ok 3
OUT

}

