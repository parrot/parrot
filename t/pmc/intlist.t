#! perl -w

use Parrot::Test tests => 2;
use Test::More;

output_is(<<'CODE', <<'OUTPUT', "creation");
        new P0, .IntList
        set I0, P0
        print "Created IntList with "
        print I0
        print " elements to start with.\n"
        end
CODE
Created IntList with 0 elements to start with.
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "aerobics");
        new P0, .IntList
        set I10, 10000

        set I1, 0
        set I0, 0
buildup:
        ge I0, I10, postBuildUp
        push P0, I1
        add I1, 1    # Push P0, I1++
        push P0, I1
        add I1, 1    # Push P0, I1++
        push P0, I1
        add I1, 1    # Push P0, I1++

        pop I2, P0
        mul I3, I0, 3
        add I3, 2
        ne I2, I3, errFirstPop  # fail if pop != I0 * 3 + 2

        pop I2, P0
        mul I3, I0, 3
        add I3, 1
        ne I2, I3, errSecondPop  # fail if pop != I0 * 3 + 1

        set I2, P0
        add I3, I0, 1
        ne I2, I3, errBuildLen   # fail if length != I0 + 1

        add I0, 1
        branch buildup
postBuildUp:

        set I0, 0
checkBuildUpLeft:
        ge I0, I10, postCheckBuildUpLeft
        set I2, P0[I0]
        mul I3, I0, 3
        ne I2, I3, errLeftGet
        add I0, 1
        branch checkBuildUpLeft
postCheckBuildUpLeft:

        mul I0, I10, -1
checkBuildUpRight:
        ge I0, 0, postCheckBuildUpRight
        set I2, P0[I0]
        add I3, I0, I10
        mul I3, 3
        ne I2, I3, errRightGet
        add I0, 1
        branch checkBuildUpRight
postCheckBuildUpRight:

        mul I0, I10, 30
        push P0, I0

        set I0, I10
tearDown:
        le I0, 0, postTearDown
        pop I2, P0
        mul I3, I0, 30
        ne I2, I3, errTearCap

        pop I2, P0
        sub I3, I0, 1
        mul I3, 3
        ne I2, I3, errTearInner

        mul I3, 10
        push P0, I3

        set I2, P0
        ne I2, I0, errTearLength

        sub I0, 1
        branch tearDown
postTearDown:

        pop I2, P0
        ne I2, 0, errLast

        print "I need a shower.\n"
        end
errFirstPop:
        print "FAILED: first pop\n"
        bsr info
        end
errSecondPop:
        print "FAILED: second pop\n"
        bsr info
        end
errBuildLen:
        print "FAILED: buildup length\n"
        bsr info
        end
errLeftGet:
        print "FAILED: left get\n"
        bsr info
        end
errRightGet:
        print "FAILED: right get\n"
        bsr info
        end
errTearCap:
        print "FAILED: tear down cap\n"
        bsr info
        end
errTearInner:
        print "FAILED: tear down inner\n"
        bsr info
        end
errTearLength:
        print "FAILED: tear down length\n"
        bsr info
        end
errLast:
        print "FAILED: last element (zero)\n"
        set I3, 0
        bsr info
        end
info:
        print "Found: "
        print I2
        print "\nWanted: "
        print I3
        print "\n"
        ret
CODE
I need a shower.
OUTPUT
