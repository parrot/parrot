#! perl -w

use Parrot::Test tests => 3;
use Test::More;

output_is(<<'CODE', <<'OUT', "Timer setup");
.include "timer.pasm"
    new P0, .Timer
    set P0[.TIMER_SEC], 7
    set I0, P0[.TIMER_SEC]
    eq I0, 7, ok1
    print "not "
ok1:
    print "ok 1\n"
    set I0, P0[.TIMER_USEC]
    eq I0, 0, ok2
    print "not "
ok2:
    print "ok 2\n"

    set I0, P0[.TIMER_RUNNING]
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
    set P1[0], .TIMER_SEC
    set P1[1], 8
    set P1[2], .TIMER_USEC
    set P1[3], 400000

    new P0, .Timer, P1
    set I0, P0[.TIMER_SEC]
    eq I0, 8, ok1
    print "not "
ok1:
    print "ok 1\n"
    set I0, P0[.TIMER_USEC]
    eq I0, 400000, ok2
    print "not "
ok2:
    print "ok 2\n"

    set I0, P0[.TIMER_RUNNING]
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

output_is(<<'CODE', <<'OUT', "Timer setup - initializer/start");
.include "timer.pasm"
    new P1, .SArray
    set P1, 6
    set P1[0], .TIMER_SEC
    set P1[1], 8
    set P1[2], .TIMER_USEC
    set P1[3], 400000
    set P1[4], .TIMER_RUNNING
    set P1[5], 1

    new P0, .Timer, P1
    set I0, P0[.TIMER_SEC]
    eq I0, 8, ok1
    print "not "
ok1:
    print "ok 1\n"
    set I0, P0[.TIMER_USEC]
    eq I0, 400000, ok2
    print "not "
ok2:
    print "ok 2\n"

    set I0, P0[.TIMER_RUNNING]
    eq I0, 1, ok3
    print "not "
ok3:
    print "ok 3\n"
    end
CODE
ok 1
ok 2
ok 3
OUT
