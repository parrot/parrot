#! perl -w

use Parrot::Test tests => 3;
use Test::More;
use Parrot::Config;
SKIP: {
    skip("no setenv", 2) unless $PConfig{"setenv"};
$ENV{"PARROT_TMP"} = "riding a ponie";
output_like(<<'CODE', <<OUT, "getenv");
    new P0, .Env
    set S0, P0["PARROT_TMP"]
    print S0
    end
CODE
/riding a ponie/i
OUT

output_like(<<'CODE', <<OUT, "setenv/getenv");
    new P0, .Env
    set P0["PARROT_TMP"], "hello polly"
    set S0, P0["PARROT_TMP"]
    print S0
    end
CODE
/hello polly/i
OUT
}

SKIP: {
    skip("no unsetenv", 1) unless $PConfig{"unsetenv"};
output_is(<<'CODE', <<OUT, "exists/delete");
    new P0, .Env
    set P0["PARROT_TMP"], "hello polly"
    exists I0, P0["PARROT_TMP"]
    if I0, ok1
    print "not "
ok1:
    print "ok 1\n"
    delete P0["PARROT_TMP"]
    exists I0, P0["PARROT_TMP"]
    unless I0, ok2
    print "not "
ok2:
    print "ok 2\n"
    end
CODE
ok 1
ok 2
OUT
}
