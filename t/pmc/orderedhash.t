#! perl -w

use Parrot::Test tests => 4;
use Test::More;

output_is(<<'CODE', <<OUT, "init");
    new P0, .OrderedHash
    print "ok 1\n"
    set I0, P0
    eq I0, 0, ok2
    print "not "
ok2:print "ok 2\n"
    end
CODE
ok 1
ok 2
OUT


output_is(<<'CODE', <<OUT, "set keys, get idx");
    new P0, .OrderedHash
    new P1, .PerlString
    set P1, "ok 1\n"
    set P0["x"], P1
    new P1, .PerlString
    set P1, "ok 2\n"
    set P0["a"], P1
    new P1, .PerlString
    set P1, "ok 3\n"
    set P0["j"], P1

    set I0, P0
    eq I0, 3, ok
    print "not "
ok: print "ok\n"

    set P3, P0[0]
    print P3
    set P3, P0[1]
    print P3
    set P3, P0[2]
    print P3

    set P3, P0["j"]
    print P3
    set P3, P0["x"]
    print P3
    set P3, P0["a"]
    print P3
    end
CODE
ok
ok 1
ok 2
ok 3
ok 3
ok 1
ok 2
OUT

output_is(<<'CODE', <<OUT, "iterate");
    .include "iterator.pasm"
    new P0, .OrderedHash
    new P1, .PerlString
    set P1, "ok 1\n"
    set P0["x"], P1
    new P1, .PerlString
    set P1, "ok 2\n"
    set P0["a"], P1
    new P1, .PerlString
    set P1, "ok 3\n"
    set P0["j"], P1

    new P2, .Iterator, P0
    set P2, .ITERATE_FROM_START
iter_loop:
    unless P2, end_iter
    shift P3, P2
    print P3
    branch iter_loop
end_iter:

    set P2, .ITERATE_FROM_END
iter_loop2:
    unless P2, end_iter2
    pop P3, P2
    print P3
    branch iter_loop2
end_iter2:
    end
CODE
ok 1
ok 2
ok 3
ok 3
ok 2
ok 1
OUT

output_is(<<'CODE', <<OUT, "idx only");
    new P0, .OrderedHash
    new P1, .PerlString
    set P1, "ok 2\n"
    set P0[1], P1
    new P1, .PerlString
    set P1, "ok 1\n"
    set P0[0], P1

    set P2, P0[0]
    print P2
    set P2, P0[1]
    print P2
    end
CODE
ok 1
ok 2
OUT

