#! perl -w

use Parrot::Test tests => 3;
use Test::More;
use Parrot::Config;

SKIP: {
skip("no setjmp header", Test::Builder->expected_tests())
    unless ($PConfig{'i_setjmp'});

output_is(<<'CODE', <<OUT, "die_hard");
    newsub P0, .Exception_Handler, _handler
    set_eh P0
    die_hard 3, 100
    print "not reached\n"
    end
_handler:
    print "catched it\n"
    end
CODE
catched it
OUT

output_is(<<'CODE', <<OUT, "die_hard, error, severity");
    newsub P0, .Exception_Handler, _handler
    set_eh P0
    die_hard 3, 100
    print "not reached\n"
    end
_handler:
    print "catched it\n"
    set I0, P5["_type"]
    print "error "
    print I0
    print "\n"
    set I0, P5["_severity"]
    print "severity "
    print I0
    print "\n"
    end
CODE
catched it
error 100
severity 3
OUT

output_is(<<'CODE', <<OUT, "die_hard - no handler");
    die_hard 3, 100
    print "not reached\n"
    end
_handler:
    print "catched it\n"
    end
CODE
No exception handler and no message
OUT

}

1; # HONK
