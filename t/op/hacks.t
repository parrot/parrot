#! perl -w

use Parrot::Test tests => 5;
use Test::More;
use Parrot::Config;

SKIP: {
skip("no setjmp header", 3) unless ($PConfig{'i_setjmp'});

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

SKIP: {
skip("no setjmp header or OS not linux", 2)
    unless ($PConfig{'i_setjmp'} && $^O eq 'linux');
output_is(<<'CODE', <<OUT, "catch a SIGFPE");
    newsub P0, .Exception_Handler, _handler
    set_eh P0
    div I10, 0
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
# SIGFPE = 8
CODE
catched it
error -8
severity 0
OUT

output_is(<<'CODE', <<OUT, "catch a SIGFPE 2");
    newsub P0, .Exception_Handler, _handler
    set_eh P0
    div I10, 0
    print "not reached\n"
    end
_handler:
.include "signal.pasm"
    print "catched it\n"
    set I0, P5["_type"]
    neg I0, I0
    ne I0, .SIGFPE, nok
    print "ok\n"
nok:
    end
CODE
catched it
ok
OUT
}

1; # HONK
