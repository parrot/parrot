#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/intlist.t - Integer Array

=head1 SYNOPSIS

	% perl -Ilib t/pmc/intlist.t

=head1 DESCRIPTION

Tests the C<IntList> PMC.

=cut

use Parrot::Test tests => 11;
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

# This test just runs way too slowly with GC_DEBUG turned on, so lets
# turn it off for make test runs.
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

my $SPEEDUP = $ENV{RUNNING_MAKE_TEST} ? "gc_debug 0\n" : "";
output_is($SPEEDUP . <<'CODE', <<'OUTPUT', "direct access");
        new P0, .IntList
	set S0, ""
	set S1, "abcdefghijklmnopqrst"
        set I10, 100000
	set I0, 0
lp:
	set P0[I0], I0
	inc I0
	mod I9, I0, 100
	ne I9, 0, lp1
	# force GC => 142 DOD + 142 collects / 10^5 accesses
	new P1, .PerlArray
	set P1[I0], I0
	concat S0, S1, S1
	set S2, S0
	set S0, S1
	set S2, ""
lp1:
	le I0, I10, lp

	set I0, 0
lp2:
	set I1, P0[I0]
	ne I0, I1, err
	inc I0
	le I0, I10, lp2
	print "ok\n"
	end
err:
        print "err: wanted "
	print I0
	print " got "
	print I1
	print "\n"
	end
CODE
ok
OUTPUT

output_is($SPEEDUP . <<'CODE', <<'OUTPUT', "shift/unshift");
        new P0, .IntList
	set I10, 100000
	set S0, ""
	set S1, "abcdefghijklmnopqrst"
	set I0, 0
lp:
        unshift P0, I0
	inc I0
	mod I9, I0, 100
	ne I9, 0, lp1
	# force GC => 124 DOD + 124 collects / 10^5 accesses
	# need .PerlArray here - it auto extends - intlist doesnt
	new P1, .PerlArray
	set P1[I0], I0
	concat S0, S1, S1
	set S2, S0
	set S0, S1
	set S2, ""
lp1:
	ne I0, I10, lp
lp2:
	dec I0
	shift I1, P0
	ne I0, I1, err
	ne I0, 0, lp2
	print "ok 1\n"
	set I1, P0
	set I0, 0
	ne I0, 0, err
	print "ok 2\n"
	end
err:
        print "err: wanted "
	print I0
	print " got "
	print I1
	print "\n"
	end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "direct access 2");
        new P0, .IntList
	set I10, 1100000
	set I0, 1
lp1:
	add I1, I0, 5
	set P0[I0], I1
	add I3, I1, I0
	push P0, I3
	shl I0, I0, 1
	inc I0
	le I0, I10, lp1

	set I0, 1
lp2:
	add I1, I0, 5
	# check at I0
	set I2, P0[I0]
	ne I2, I1, err
	add I4, I0, 1
	# and pushed value at I0+1
	set I4, P0[I4]
	add I3, I1, I0
	ne I3, I4, err

	shl I0, I0, 1
	inc I0
	le I0, I10, lp2
	print "ok\n"
	end
err:
	print "not ok "
	print I0
	print " "
	print I1
	print " "
	print I2
	print " "
	print I3
	print " "
	print I4
	print " "
	print I5
	print " "
	print I6
	print " "
	print I7
	print "\n"

	end
CODE
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "sparse access");
        new P0, .IntList
	set I10, 110000
	set I0, 1
lp1:
	add I1, I0, 5
	set P0[I0], I1
	add I3, I1, I0
	push P0, I3
	shl I0, I0, 1
	inc I0
	le I0, I10, lp1

	set I0, 1
lp2:
	add I1, I0, 5
	# check at I0
	set I2, P0[I0]
	ne I2, I1, err
	add I4, I0, 1
	# and pushed value at I0+1
	set I4, P0[I4]
	add I3, I1, I0
	ne I3, I4, err

	shl I0, I0, 1
	inc I0
	le I0, I10, lp2
	print "ok 1\n"

	# now repeat and fill some holes

	set I0, 777
lp3:
	add I1, I0, 5
	set P0[I0], I1
	add I0, I0, 666
	le I0, I10, lp3

	set I0, 777
lp4:
	add I1, I0, 5
	# check at I0
	set I2, P0[I0]
	ne I2, I1, err

	add I0, I0, 666
	le I0, I10, lp4
	print "ok 2\n"
	end
err:
	print "not ok "
	print I0
	print " "
	print I1
	print " "
	print I2
	print " "
	print I3
	print " "
	print I4
	print "\n"

	end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "pop into sparse");
        new P0, .IntList
	set I10, 100
	set I0, 0
	# push some values at start
lp1:
	push P0, I0
	inc I0
	lt I0, I10, lp1

	# create sparse
	set I0, 100000
	set I1, 1000
	set P0[I0], I1
	inc I1
lp2:
	# push some values after hole
	push P0, I1
	inc I1
	le I1, 1100, lp2
	dec I1

	set I3, P0
lp3:
	set I4, P0
	ne I3, I4, err1
	pop I2, P0
	dec I3
	ne I2, I1, err2
	gt I3, I0, cont1
	lt I3, I10, cont1
	set I1, 0

	gt I3, I10, lp3
	set I1, I10

cont1:
	dec I1
	eq I1, 0, ok
	branch lp3
ok:
	print "ok\n"
	end
err1:   set S0, "len"
	branch err
err2:
	set S0, "val"
err:
	print "nok "
	print S0
	print " "
	print I0
	print " "
	print I1
	print " "
	print I2
	print " "
	print I3
	print " "
	print I4
	end
CODE
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "clone");
        new P0, .IntList
	set P0[0], 100
	set P0[5000], 200
	clone P1, P0

	set I0, P0[5000]
	eq I0, 200, ok_1
	print "nok 1 "
ok_1:
	pop I0, P0
	eq I0, 200, ok_2
	print "nok 2 "
ok_2:
	set I0, P0
	eq I0, 5000, ok_3
	print "nok 3 "
ok_3:
	set I0, P1[5000]
	eq I0, 200, ok_4
	print "nok 4 "
ok_4:
	pop I0, P1
	eq I0, 200, ok_5
	print "nok 5 "
ok_5:
	set I0, P1
	eq I0, 5000, ok_6
	print "nok 6 "
	end
ok_6:
	print "ok\n"
	end
CODE
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "access via a PMC key");
        new P0, .IntList
        new P1, .Key
        set I0, 0

L1:     set P1, I0
        mul I1, I0, 2
        set P0[P1], I1
        inc I0
        lt I0, 1025, L1

        set I2, 0
L2:     set I3, P0[I2]
        mul I4, I2, 2
        ne I3, I4, BAD1
        inc I2
        lt I2, 1025, L2
        print "ok 1\n"

GET:
        new P2, .IntList
        new P3, .Key

        set I0, 0
L3:     set P2[I0], I0
        inc I0
        lt I0, 260, L3

        set I1, 0
L4:     set P3, I1
        set I2, P2[P3]
        ne I1, I2, BAD2
        inc I1
        lt I1, 260, L4
        print "ok 2\n"
        end

BAD1:   print "not ok 1\n"
        branch GET
BAD2:   print "not ok 2\n"
        end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "intlist mul = repeat");
    new P0, .IntList
    set P0[0], 1
    mul P0, 100
    set I0, P0
    print I0
    print "\n"
    set I0, P0[99]
    print I0
    print "\n"
    end
CODE
100
1
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check whether interface is done");

.sub _main
    .local pmc pmc1
    pmc1 = new IntList
    .local int bool1
    does bool1, pmc1, "scalar"
    print bool1
    print "\n"
    does bool1, pmc1, "array"
    print bool1
    print "\n"
    does bool1, pmc1, "no_interface"
    print bool1
    print "\n"
    end
.end
CODE
0
1
0
OUTPUT

