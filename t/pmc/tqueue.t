#! perl -w

use Parrot::Test tests => 1;
use Test::More;

output_is(<<'CODE', <<'OUT', "thread safe queue 1");
    new P6, .TQueue
    print "ok 1\n"
    set I0, P6
    print I0
    print "\n"
    new P7, .PerlString
    set P7, "ok 2\n"
    push P6, P7
    new P7, .PerlString
    set P7, "ok 3\n"
    push P6, P7
    set I0, P6
    print I0
    print "\n"

    shift P8, P6
    print P8
    shift P8, P6
    print P8
    end
CODE
ok 1
0
2
ok 2
ok 3
OUT

