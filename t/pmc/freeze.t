#! perl -w

use Parrot::Test tests => 5;
use Test::More;

output_is(<<'CODE', <<'OUTPUT', "freeze/thaw a PerlInt");
    new P1, .PerlInt
    set P1, 777
    freeze S0, P1

    thaw P10, S0
    typeof S10, P10
    print S10
    print " "
    print P10
    print "\n"
    end
CODE
PerlInt 777
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "freeze/thaw a PerlArray");
    new P0, .PerlArray
    new P1, .PerlInt
    set P1, 666
    push P0, P1
    new P1, .PerlInt
    set P1, 777
    push P0, P1
    freeze S0, P0

    thaw P10, S0
    typeof S10, P10	# type
    print S10
    print " "
    set I11, P10	# elements
    print I11
    print "\n"
    set P12, P10[0]
    print P12
    print "\n"
    set P12, P10[1]
    print P12
    print "\n"
    end
CODE
PerlArray 2
666
777
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "freeze PerlArray self-ref");
    new P0, .PerlArray
    new P1, .PerlInt
    set P1, 666
    push P0, P1
    push P0, P0
    freeze S0, P0
    print "ok\n"
    end
CODE
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "freeze/thaw PerlArray self-ref");
    new P1, .PerlInt
    set P1, 666
    new P0, .PerlArray
    push P0, P1
    new P1, .PerlInt
    set P1, 777
    push P0, P1
    push P0, P0
    freeze S0, P0

    thaw P10, S0
    typeof S10, P10
    print S10
    print " "
    set I11, P10
    print I11
    print "\n"
    set P12, P10[0]
    print P12
    print "\n"
    set P12, P10[1]
    print P12
    print "\n"
    set P12, P10[2]
    set P13, P12[0]
    print P13
    print "\n"
    end
CODE
PerlArray 3
666
777
666
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "freeze/thaw PerlArray self-ref, contained Arrray");
    new P1, .PerlInt
    set P1, 666
    new P0, .PerlArray
    push P0, P1
    new P1, .PerlInt
    set P1, 777
    push P0, P1

    new P2, .PerlArray
    new P4, .PerlInt
    set P4, 4
    push P2, P4
    push P2, P0

    push P0, P2
    push P0, P1
    freeze S0, P0

    thaw P10, S0
    typeof S10, P10
    print S10
    print " "
    set I11, P10
    print I11
    print "\n"
    set P12, P10[0]
    print P12
    print "\n"
    set P12, P10[1]
    print P12
    print "\n"
    set P12, P10[2]
    set P13, P12[0]
    print P13
    print "\n"
    set P13, P12[1]
    set P14, P13[0]
    print P14
    print "\n"
    set P12, P10[3]
    print P12
    print "\n"
    end
CODE
PerlArray 4
666
777
4
666
777
OUTPUT
