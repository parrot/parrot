#! perl -w

use lib '../../../lib';
use Parrot::Test tests => 1;
use Test::More;


output_is(<<'CODE', <<'OUTPUT', "Testing the empty list");
    .include "../plot.pasm"
    find_global P5, "()"
    set S16, P5[0]
    eq S16, "*nil*", OK_1
    print "not "
OK_1:   print "ok 1\n"

    find_lex P0, "eval"
    invokecc
    set S17, P5[0]
    eq S17, "*nil*", OK_2
    print "not"
OK_2:   print "ok 2\n"
    nilp P5, OK_3
    print "not "
OK_3:    print "ok 3\n"
CODE
ok 1
ok 2
OUTPUT

