#! perl -w

use Parrot::Test tests => 2;
use Test::More;

output_is(<<'CODE', <<'OUT', "thread safe queue 1");
    new P10, .TQueue
    print "ok 1\n"
    set I0, P10
    print I0
    print "\n"
    new P7, .PerlString
    set P7, "ok 2\n"
    push P10, P7
    new P7, .PerlString
    set P7, "ok 3\n"
    push P10, P7
    set I0, P10
    print I0
    print "\n"

    shift P8, P10
    print P8
    shift P8, P10
    print P8
    end
CODE
ok 1
0
2
ok 2
ok 3
OUT

output_is(<<'CODE', <<'OUT', "multi-threaded");
    new P10, .TQueue
    new P7, .PerlString
    set P7, "ok 1\n"
    push P10, P7
    new P7, .PerlString
    set P7, "ok 2\n"
    push P10, P7
    new P7, .PerlString
    set P7, "ok 3\n"
    push P10, P7

    new P5, .ParrotThread
    find_global P6, "_foo"
    find_method P0, P5, "thread"
    invoke	# start the thread
    set I5, P5
    getinterp P2
    find_method P0, P2, "join"
    invoke	# join the thread
    print "done main\n"
    end

.pcc_sub _foo:
    set I0, P10
    print I0
    print "\n"
loop:
    set I0, P10
    unless I0, ex
    shift P8, P10
    print P8
    branch loop
ex:
    print "done thread\n"
    invoke P1
CODE
3
ok 1
ok 2
ok 3
done thread
done main
OUT
