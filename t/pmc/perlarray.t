#! perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/perlarray.t - testing the PerlArray PMC

=head1 SYNOPSIS

    % perl -Ilib t/pmc/perlarray.t

=head1 DESCRIPTION

Tests the C<PerlArray> PMC. Checks basic and Perl-specific array behaviour.

=cut

use Parrot::Test tests => 28;
use Test::More;

my $fp_equality_macro = <<'ENDOFMACRO';
.macro fp_eq (    J, K, L )
    save    N0
    save    N1
    save    N2

    set    N0, .J
    set    N1, .K
    sub    N2, N1,N0
    abs    N2, N2
    gt    N2, 0.000001, .$FPEQNOK

    restore N2
    restore    N1
    restore    N0
    branch    .L
.local $FPEQNOK:
    restore N2
    restore    N1
    restore    N0
.endm
.macro fp_ne(    J,K,L)
    save    N0
    save    N1
    save    N2

    set    N0, .J
    set    N1, .K
    sub    N2, N1,N0
    abs    N2, N2
    lt    N2, 0.000001, .$FPNENOK

    restore    N2
    restore    N1
    restore    N0
    branch    .L
.local $FPNENOK:
    restore    N2
    restore    N1
    restore    N0
.endm
ENDOFMACRO

output_is(<<'CODE', <<'OUTPUT', "size of the array");
    new P0,.PerlArray
    set P0,0
    set I0,P0
    print I0
    print "\n"

    set P0,1
    set I0,P0
    print I0
    print "\n"

    set P0,5
    set I0,P0
    print I0
    print "\n"

    end
CODE
0
1
5
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "set/get by index");
    new P0,.PerlArray
    set P0[0],3
    set I1,P0[0]
    print I1
    print "\n"

    set P0,2
    set P0[1],3.7
    set N1,P0[1]
    print N1
    print "\n"

    set P0,3
    set P0[2],"hey"
    set S1,P0[2]
    print S1
    print "\n"

    set P0, 4
    new P1, .PerlInt
    set P1, 42
    set P0[3],P1
    set P2,P0[3]
    print P2
    print "\n"

    end
CODE
3
3.700000
hey
42
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "same, but with implicit resizing");
    new P0,.PerlArray
    set P0[0],3
    set I1,P0[0]
    print I1
    print "\n"

    set P0[1],3.7
    set N1,P0[1]
    print N1
    print "\n"

    set P0[2],"hey"
    set S1,P0[2]
    print S1
    print "\n"

    new P1, .PerlInt
    set P1, 42
    set P0[3],P1
    set P2,P0[3]
    print P2
    print "\n"

    end
CODE
3
3.700000
hey
42
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "If P");
    new P0, .PerlArray
    if P0, TR
    print "false\n"
    branch NEXT
TR:    print "true\n"

NEXT:   set P0[0], 1
    if P0, TR2
    print "false\n"
    branch NEXT2
TR2:    print "true\n"

NEXT2:  new P1, .PerlArray
    set P1, 1
    if P1, TR3
    print "false\n"
    branch NEXT3
TR3:    print "true\n"

NEXT3:  set P1, 0
    if P1, TR4
    print "false\n"
    end
TR4:    print "true\n"
    end

CODE
false
true
true
false
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Negative and Positive array accesses");
    new P0,.PerlArray

    set I0,P0
    eq I0,0,OK_1
    print "not "
OK_1:    print "ok 1\n"

    set P0[0],7

    set I0,P0
    eq I0,1,OK_2
    print "not "
OK_2:    print "ok 2\n"

    set I0,P0[0]
    eq I0,7,OK_3
    print "not "
OK_3:    print "ok 3\n"

    set I0,P0[-1]
    eq I0,7,OK_4
    print "not "
OK_4:    print "ok 4\n"

    set P0[-1],7

    set I0,P0
    eq I0,1,OK_5
    print "not "
OK_5:    print "ok 5\n"

    set I0,P0[0]
    eq I0,7,OK_6
    print "not "
OK_6:    print "ok 6\n"

    set I0,P0[-1]
    eq I0,7,OK_7
    print "not "
OK_7:    print "ok 7\n"

    set P0[0],7.2

    set I0,P0
    eq I0,1,OK_8
    print "not "
OK_8:    print "ok 8\n"

    set N0,P0[0]
    eq N0,7.2,OK_9
    print "not "
OK_9:    print "ok 9\n"

    set N0,P0[-1]
    eq N0,7.2,OK_10
    print "not "
OK_10:    print "ok 10\n"

    set P0[-1],7.2

    set I0,P0
    eq I0,1,OK_11
    print "not "
OK_11:    print "ok 11\n"

    set N0,P0[0]
    eq N0,7.2,OK_12
    print "not "
OK_12:    print "ok 12\n"

    set N0,P0[-1]
    eq N0,7.2,OK_13
    print "not "
OK_13:    print "ok 13\n"

    set P0[0],"Buckaroo"

    set I0,P0
    eq I0,1,OK_14
    print "not "
OK_14:    print "ok 14\n"

    set S0,P0[0]
    eq S0,"Buckaroo",OK_15
    print "not "
OK_15:    print "ok 15\n"

    set S0,P0[-1]
    eq S0,"Buckaroo",OK_16
    print "not "
OK_16:    print "ok 16\n"

    set P0[-1],"Buckaroo"

    set I0,P0
    eq I0,1,OK_17
    print "not "
OK_17:    print "ok 17\n"

    set S0,P0[0]
    eq S0,"Buckaroo",OK_18
    print "not "
OK_18:    print "ok 18\n"

    set S0,P0[-1]
    eq S0,"Buckaroo",OK_19
    print "not "
OK_19:    print "ok 19\n"

# Out-of-bounds accesses:
    set I0, P0
    set I2, P0[10]
    eq I2, 0, OK_20
    print "not "
OK_20:    print "ok 20\n"

    set I2, P0[-10]
    eq I2, 0, OK_21
    print "not "
OK_21:    print "ok 21\n"

# Make sure it hasn't resized the array:
    set I2, P0
    eq I2, I0, OK_22
    print "not "
OK_22:    print "ok 22\n"

# Now try this for NUM, STR and PMC:

    set N2, P0[11]
    eq N2, 0.0, OK_23
    print "not "
OK_23:  print "ok 23\n"

    set N2, P0[-11]
    eq N2, 0.0, OK_24
    print "not "
OK_24:  print "ok 24\n"

    set S2, P0[12]
    eq S2, "", OK_25
    print "not "
OK_25:  print "ok 25\n"

    set S2, P0[-12]
    eq S2, "", OK_26
    print "not "
OK_26:  print "ok 26\n"

    set P2, P0[13]
    typeof S2, P2
    eq S2, "PerlUndef", OK_27
    print "not "
OK_27:  print "ok 27\n"

    set P2, P0[-13]
    typeof S2, P2
    eq S2, "PerlUndef", OK_28
    print "not "
OK_28:  print "ok 28\n"

    end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
ok 7
ok 8
ok 9
ok 10
ok 11
ok 12
ok 13
ok 14
ok 15
ok 16
ok 17
ok 18
ok 19
ok 20
ok 21
ok 22
ok 23
ok 24
ok 25
ok 26
ok 27
ok 28
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Bracketed access test suite");
    new P0, .PerlArray

    #
    # Make sure an uninitialized PerlArray has a length of 0
    #
    set   I0, P0
    eq    I0, 0, OK_1
    print "not "
OK_1: print "ok 1\n"

#---------------------------------------------
#
# Integer constants
#

    #
    # Set index zero to 7
    #
    set   P0[0], 7

    #
    # Make sure the length is 1
    #
    set   I0, P0
    eq    I0, 1, OK_2
    print "not "
OK_2: print "ok 2\n"

    #
    # Make sure index zero is indeed 7
    set   I0, P0[0]
    eq    I0, 7, OK_3
    print "not "
OK_3: print "ok 3\n"

    #
    # Set index zero to -15
    #
    set   P0[0], -15

    #
    # Make sure the length is 1
    #
    set   I0, P0
    eq    I0, 1, OK_4
    print "not "
OK_4: print "ok 4\n"

    #
    # Make sure index zero is indeed -15
    set   I0, P0[0]
    eq    I0, -15, OK_5
    print "not "
OK_5: print "ok 5\n"

    #
    # Set index zero to 3.7
    #
    set   P0[0], 3.7

    #
    # Make sure the length is 1
    #
    set   I0, P0
    eq    I0, 1, OK_6
    print "not "
OK_6: print "ok 6\n"

    #
    # Make sure index zero is indeed 3.7
    #
    set   N0, P0[0]
    eq    N0, 3.700000, OK_7
    print "not "
OK_7: print "ok 7\n"

    #
    # Set index zero to "foo"
    #
    set   P0[0], "foo"

    #
    # Make sure the length is 1
    #
    set   I0, P0
    eq    I0, 1, OK_8
    print "not "
OK_8: print "ok 8\n"

    #
    # Make sure index zero is indeed "foo"
    #
    set   S0, P0[0]
    eq    S0, "foo", OK_9
    print "not "
OK_9: print "ok 9\n"

#---------------------------------------------
#
# Integer register
#
    set I31,0

    #
    # Set index zero to 7
    #
    set   P0[I31], 7

    #
    # Make sure the length is 1
    #
    set   I0, P0
    eq    I0, 1, OK_10
    print "not "
OK_10: print "ok 10\n"

    #
    # Make sure index zero is indeed 7
    #
    set   I0, P0[I31]
    eq    I0, 7, OK_11
    print "not "
OK_11: print "ok 11\n"

    #
    # Set index zero to -15
    #
    set   P0[I31], -15

    #
    # Make sure the length is 1
    #
    set   I0, P0
    eq    I0, 1, OK_12
    print "not "
OK_12: print "ok 12\n"

    #
    # Make sure index zero is indeed -15
    #
    set   I0, P0[I31]
    eq    I0, -15, OK_13
    print "not "
OK_13: print "ok 13\n"

    #
    # Set index zero to 3.7
    #
    set   P0[I31], 3.7

    #
    # Make sure the length is 1
    #
    set   I0, P0
    eq    I0, 1, OK_14
    print "not "
OK_14: print "ok 14\n"

    #
    # Make sure index zero is indeed 3.7
    #
    set   N0, P0[I31]
    eq    N0, 3.700000, OK_15
    print "not "
OK_15: print "ok 15\n"

    #
    # Set index zero to "foo"
    #
    set   P0[I31], "foo"

    #
    # Make sure the length is 1
    #
    set   I0, P0
    eq    I0, 1, OK_16
    print "not "
OK_16: print "ok 16\n"

    #
    # Make sure index zero is indeed "foo"
    #
    set   S0, P0[I31]
    eq    S0, "foo", OK_17
    print "not "
OK_17: print "ok 17\n"

    end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
ok 7
ok 8
ok 9
ok 10
ok 11
ok 12
ok 13
ok 14
ok 15
ok 16
ok 17
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "PerlArray integer access, two locations");
    new P0, .PerlArray

    set P0[0],37
    set P0[1],-15

    set I0,P0[0]
    eq I0,37,OK_1
    print "not "
OK_1: print "ok 1\n"

    set I0,P0[1]
    eq I0,-15,OK_2
    print "not "
OK_2: print "ok 2\n"

    set I1,0
    set I0,P0[I1]
    eq I0,37,OK_3
    print "not "
OK_3: print "ok 3\n"

    set I1,1
    set I0,P0[I1]
    eq I0,-15,OK_4
    print "not "
OK_4: print "ok 4\n"

    end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "PerlArray integer/register access, two locations");
    new P0, .PerlArray

    set I0,0
    set P0[I0],37
    set I0,1
    set P0[I0],-15

    set I0,P0[0]
    eq I0,37,OK_1
    print "not "
OK_1: print "ok 1\n"

    set I0,P0[1]
    eq I0,-15,OK_2
    print "not "
OK_2: print "ok 2\n"

    set I1,0
    set I0,P0[I1]
    eq I0,37,OK_3
    print "not "
OK_3: print "ok 3\n"

    set I1,1
    set I0,P0[I1]
    eq I0,-15,OK_4
    print "not "
OK_4: print "ok 4\n"

    end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "PerlArray string register/access, two locations");
    new P0, .PerlArray

    set I0,0
    set P0[I0],"foo"
    set I0,1
    set P0[I0],"bar"

    set S0,P0[0]
    eq S0,"foo",OK_1
    print "not "
OK_1: print "ok 1\n"

    set S0,P0[1]
    eq S0,"bar",OK_2
    print "not "
OK_2: print "ok 2\n"

    set I1,0
    set S0,P0[I1]
    eq S0,"foo",OK_3
    print "not "
OK_3: print "ok 3\n"

    set I1,1
    set S0,P0[I1]
    eq S0,"bar",OK_4
    print "not "
OK_4: print "ok 4\n"

    end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "PerlArray string access, two locations");
    new P0, .PerlArray

    set P0[0],"foo"
    set P0[1],"bar"

    set S0,P0[0]
    eq S0,"foo",OK_1
    print "not "
OK_1: print "ok 1\n"

    set S0,P0[1]
    eq S0,"bar",OK_2
    print "not "
OK_2: print "ok 2\n"

    set I1,0
    set S0,P0[I1]
    eq S0,"foo",OK_3
    print "not "
OK_3: print "ok 3\n"

    set I1,1
    set S0,P0[I1]
    eq S0,"bar",OK_4
    print "not "
OK_4: print "ok 4\n"

    end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "PerlArray numeric access, two locations");
    new P0, .PerlArray

    set P0[0],3.100000
    set P0[1],-7.200000

    set N0,P0[0]
    eq N0,3.100000,OK_1
    print "not "
OK_1: print "ok 1\n"

    set N0,P0[1]
    eq N0,-7.200000,OK_2
    print "not "
OK_2: print "ok 2\n"

    set I1,0
    set N0,P0[I1]
    eq N0,3.100000,OK_3
    print "not "
OK_3: print "ok 3\n"

    set I1,1
    set N0,P0[I1]
    eq N0,-7.200000,OK_4
    print "not "
OK_4: print "ok 4\n"

    end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "PerlArray numeric/register access, two locations");
    new P0, .PerlArray

    set I0,0
    set P0[I0],3.100000
    set I0,1
    set P0[I0],-7.200000

    set N0,P0[0]
    eq N0,3.100000,OK_1
    print "not "
OK_1: print "ok 1\n"

    set N0,P0[1]
    eq N0,-7.200000,OK_2
    print "not "
OK_2: print "ok 2\n"

    set I1,0
    set N0,P0[I1]
    eq N0,3.100000,OK_3
    print "not "
OK_3: print "ok 3\n"

    set I1,1
    set N0,P0[I1]
    eq N0,-7.200000,OK_4
    print "not "
OK_4: print "ok 4\n"

    end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<<'CODE', <<OUTPUT, "Resize negative index");
    new P0, .PerlArray
    set P0[-1], 55
    set I0, P0[0]
    eq I0,55,ok1
    print "not "
ok1:
    print "ok 1\n"
    set I0, P0
    eq I0,1,ok2
    print "not "
ok2:
    print "ok 2\n"
    end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<OUTPUT, "Testing clone");
    new P0, .PerlArray
    set P0[0], 1
    set P0[1], 2

    clone P1, P0
    set P1[0], 3
    set P0[2], 4
    set P1[3], 5

    set I0, P0[0]
    eq I0, 1, ok1
    print "not "
ok1:
    print "ok 1\n"

    set I0, P1[0]
    eq I0, 3, ok2
    print "not "
ok2:
    print "ok 2\n"

    set P2, P1[2]
    unless P2, ok3
    print "not "
ok3:
    print "ok 3\n"

    set P2, P0[3]
    unless P2, ok4
    print "not "
ok4:
    print "ok 4\n"
    end

CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<<'CODE', <<OUTPUT, "Testing multi-level fetch");
    new P0, .PerlArray
    new P1, .PerlArray
    set P1[0], "0;0"
    set P1[1], "0;1"
    set P0[0], P1
    new P1, .PerlArray
    set P1[0], "1;0"
    set P1[1], "1;1"
    set P0[1], P1
    set S0, P0[0;0]
    print S0
    print "\n"
    set S0, P0[0;1]
    print S0
    print "\n"
    set S0, P0[1;0]
    print S0
    print "\n"
    set S0, P0[1;1]
    print S0
    print "\n"
    set I0, 0
loop1:
    set S0, P0[I0;0]
    print S0
    print "\n"
    set S0, P0[I0;1]
    print S0
    print "\n"
    inc I0
    lt I0, 2, loop1
    set I0, 0
    set I1, 0
loop2:
    set S0, P0[I0;I1]
    print S0
    print "\n"
    inc I1
    lt I1, 2, loop2
    set I1, 0
    inc I0
    lt I0, 2, loop2
    end
CODE
0;0
0;1
1;0
1;1
0;0
0;1
1;0
1;1
0;0
0;1
1;0
1;1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "push/pop");
    new P0, .PerlArray
    new P1, .PerlInt
    set P1, 42
    push P0, P1
    set I0, 43
    push P0, I0
    set S0, "44"
    push P0, S0
    set N0, 45.4711
    push P0, N0

    pop N2, P0
    eq N2, 45.4711, ok_1
    print "pop num failed "
ok_1:
    pop S2, P0
    eq S2, "44", ok_2
    print "pop str failed "
ok_2:
    pop I2, P0
    eq I2, 43, ok_3
    print "pop int failed "
ok_3:
    pop P2, P0
    set I2, P2
    eq I2, 42, ok_4
    print "pop perlint failed "
ok_4:
    set I0, P0
    eq I0, 0, ok_5
    print "len != 0 "

    print "\n"
    end
ok_5:
    print "ok\n"
    end
CODE
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "unshift/shift");
    new P0, .PerlArray
    new P1, .PerlInt
    set P1, 42
    unshift P0, P1
    set I0, 43
    unshift P0, I0
    set S0, "44"
    unshift P0, S0
    set N0, 45.4711
    unshift P0, N0

    shift N2, P0
    eq N2, 45.4711, ok_1
    print "shift num failed "
ok_1:
    shift S2, P0
    eq S2, "44", ok_2
    print "shift str failed "
ok_2:
    shift I2, P0
    eq I2, 43, ok_3
    print "shift int failed "
ok_3:
    shift P2, P0
    set I2, P2
    eq I2, 42, ok_4
    print "shift perlint failed "
ok_4:
    set I0, P0
    eq I0, 0, ok_5
    print "len != 0 "

    print "\n"
    end
ok_5:
    print "ok\n"
    end
CODE
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "set intial size");
    new P1, .PerlArray
    set P1[0], 0    # size key
    set I1, 100000    # value
    set P1[1], I1
    new P0, .PerlArray, P1
    set I0, P0
    eq I0, I1, ok
    print "nok: "
    print I0
    print "\n"
ok:
    print "ok\n"
    end
CODE
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "splice");
    new P0, .PerlArray
    new P1, .PerlArray
    push P0, 100
    push P1, 200
    push P1, 300
    # append i.e. push 2 elements
    splice P0, P1, 1, 0
    set I0, P0[0]
    eq I0, 100, ok_1
    print "nok 11\n"
ok_1:
    set I0, P0[1]
    eq I0, 200, ok_2
    print "nok 12\n"
ok_2:
    set I0, P0[2]
    eq I0, 300, ok_3
    print "nok 13\n"
ok_3:
    set I0, P0
    eq I0, 3, ok_4
    print "nok 14\n"
ok_4:
    print "ok 1\n"
    # pop one value
    set P1, 0
    splice P0, P1, -1, 1
    set I0, P0
    eq I0, 2, ok_5
    print "nok 2\n"
ok_5:
    print "ok 2\n"
    # shift one value
    splice P0, P1, 0, 1
    set I0, P0
    eq I0, 1, ok_6
    print "nok 31\n"
ok_6:
    set I0, P0[0]
    eq I0, 200, ok_7
    print "nok 32\n"
ok_7:
    print "ok 3\n"
    # unshift 2 values
    set P1[0], 50
    set P1[1], 100
    splice P0, P1, 0, 0
    set I0, P0
    eq I0, 3, ok_8
    print "nok 41\n"
ok_8:
    set I0, P0[0]
    eq I0, 50, ok_9
    print "nok 42\n"
ok_9:
    set I0, P0[1]
    eq I0, 100, ok_10
    print "nok 43\n"
ok_10:
    set I0, P0[2]
    eq I0, 200, ok_11
    print "nok 44\n"
ok_11:
    print "ok 4\n"
    push P0, 300
    # replace 3 values
    splice P0, P1, 1, 3
    set I0, P0
    eq I0, 3, ok_12
    print "nok 51\n"
ok_12:
    set I0, P0[0]
    eq I0, 50, ok_13
    print "nok 52\n"
ok_13:
    set I0, P0[1]
    eq I0, 50, ok_14
    print "nok 53\n"
ok_14:
    set I0, P0[2]
    eq I0, 100, ok_15
    print "nok 54\n"
ok_15:
    print "ok 5\n"
    # replace 3 values with nothing
    set P1, 0
    splice P0, P1, 0, 3
    set I0, P0
    eq I0, 0, ok_16
    print "nok 6\n"
ok_16:
    print "ok 6\n"
    # append 2 values at offset 1
    set P1[0], 50
    set P1[1], 100
    splice P0, P1, 1, 0
    set I0, P0
    eq I0, 3, ok_17
    print "nok 71\n"
ok_17:
    set P0[0], 25
    pop I0, P0
    eq I0, 100, ok_18
    print "nok 72\n"
ok_18:
    # replace last 2 values
    splice P0, P1, -2, 2
    set I0, P0
    eq I0, 2, ok_19
    print "nok 73\n"
ok_19:
    set I0, P0[0]
    eq I0, 50, ok_20
    print "nok 74\n"
ok_20:
    set I0, P0[1]
    eq I0, 100, ok_21
    print "nok 75\n"
ok_21:
    print "ok 7\n"
    end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
ok 7
OUTPUT

output_is(<<'CODE', <<OUTPUT, "defined");
    new P0, .PerlArray
    defined I0, P0
    print I0
    print "\n"
    defined I0, P1
    print I0
    print "\n"
    set P0, 5
    set P0[0], 1
    defined I0, P0[0]
    print I0
    print "\n"
    defined I0, P0[1]
    print I0
    print "\n"
    defined I0, P0[100]
    print I0
    print "\n"
    new P1, .PerlUndef
    set P0[2], P1
    defined I0, P0[2]
    print I0
    print "\n"
    end

CODE
1
0
1
0
0
0
OUTPUT

output_is(<<'CODE', <<OUTPUT, "exists");
    new P0, .PerlArray
    set P0, 5
    set P0[0], 1
    exists I0, P0[0]
    print I0
    print "\n"
    exists I0, P0[1]
    print I0
    print "\n"
    exists I0, P0[100]
    print I0
    print "\n"
    new P1, .PerlUndef
    set P0[2], P1
    exists I0, P0[2]
    print I0
    print "\n"
    end

CODE
1
0
0
1
OUTPUT

output_is(<<'CODE', <<OUTPUT, "set_integer_keyed - nested #19328");
    new P0, .PerlArray
    new P1, .PerlArray
    push P1, 9
    push P1, 8
    push P1, 7
    push P1, 6
    push P1, 5
    push P0, P1
    new P1, .PerlArray
    push P1, 4
    push P1, 3
    push P1, 2
    push P1, 1
    push P1, 0
    push P0, P1
    bsr DUMP
    print "---\n"
    set P0[1;3], 9
    bsr DUMP
    end
DUMP:
    set I0, 0
LOOP0:
    set I1, 0
LOOP1:
    set I2, P0[I0;I1]
    print I2
    print " "
    inc I1
    lt I1, 5, LOOP1
    inc I0
    print "-\n"
    lt I0, 2, LOOP0
    ret
CODE
9 8 7 6 5 -
4 3 2 1 0 -
---
9 8 7 6 5 -
4 3 2 9 0 -
OUTPUT


output_is(<<'CODE', <<OUT, "multikeyed access I arg");
    new P0, .PerlArray
    new P1, .PerlArray
    set P0[10], P1
    set P0[10;10], 20
    set P2, P0[10]
    typeof S0, P2
    print S0
    print "\n"
    set I2, P0[10;10]
    print I2
    set I3, 10
    set I2, P0[I3;10]
    print I2
    set I2, P0[10;I3]
    print I2
    set I2, P0[I3;I3]
    print I2
    print "\n"
    end
CODE
PerlArray
20202020
OUT

output_is(<<'CODE', <<OUT, "multikeyed access P arg");
    new P0, .PerlArray
    new P1, .PerlArray
    new P3, .PerlInt
    set P3, 20
    set P0[10], P1
    set P0[10;10], P3
    set P2, P0[10]
    typeof S0, P2
    print S0
    print "\n"
    set I2, P0[10;10]
    print I2
    set I3, 10
    set I2, P0[I3;10]
    print I2
    set I2, P0[10;I3]
    print I2
    set I2, P0[I3;I3]
    print I2
    print "\n"
    end
CODE
PerlArray
20202020
OUT


output_is(<<"CODE", <<OUTPUT, "Fetching undefined values (no warnings)");
@{[ $fp_equality_macro ]}
    warningsoff 1
    new P0, .PerlArray
    set I0, P0[0]
    eq I0, 0, OK1
    print "not "
OK1:  print "ok 1\\n"
    set N0, P0[1]
    .fp_eq(N0, 0.0, OK2)
    print "not "
OK2:  print "ok 2\\n"
    set S0, P0[2]
    eq S0, "", OK3
    print "not "
OK3:  print "ok 3\\n"
    set P1, P0[3]
    typeof S1, P1
    eq S1, "PerlUndef", OK4
    print "not "
OK4:  print "ok 4\\n"
    end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_like(<<"CODE", <<'OUTPUT', "Fetching undefined values (with warnings)");
@{[ $fp_equality_macro ]}
    warningson 1
    new P0, .PerlArray
    set I0, P0[0]
    eq I0, 0, OK1
    print "not "
OK1:  print "ok 1\\n"
    set N0, P0[1]
    .fp_eq(N0, 0.0, OK2)
    print "not "
OK2:  print "ok 2\\n"
    set S0, P0[2]
    eq S0, "", OK3
    print "not "
OK3:  print "ok 3\\n"
    set P1, P0[3]
    typeof S1, P1
    eq S1, "PerlUndef", OK4
    print "not "
OK4:  print "ok 4\\n"
    end
CODE
/^Use of uninitialized value
current instr\.: '\(null\)' pc (\d+|-1) .*?
ok 1
Use of uninitialized value
current instr\.: '\(null\)' pc (\d+|-1) .*?
ok 2
Use of uninitialized value
current instr\.: '\(null\)' pc (\d+|-1) .*?
ok 3
Use of uninitialized value
current instr\.: '\(null\)' pc (\d+|-1) .*?
ok 4
$/
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check whether interface is done");
.sub _main
    .local pmc pmc1
    pmc1 = new PerlArray
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

output_is(<< "CODE", << 'OUTPUT', "Keyed access");
@{[ $fp_equality_macro ]}
    new P0, .PerlArray
    new P1, .Key
    set P1, 10
    set P0[P1], 2
    new P2, .Key
    set P2, 20
    set P0[P2], 4.0
    new P3, .Key
    set P3, 30
    set P0[P3], "six"

    set P10, P0[10]
    eq P10, 2, OK1
    print "not "
OK1: print "ok 1\\n"
    set P10, P0[20]
    .fp_eq(P10, 4.0, OK2)
    print "not "
OK2: print "ok 2\\n"
    set P10, P0[30]
    eq P10, "six", OK3
    print "not "
OK3: print "ok 3\\n"
    end
CODE
ok 1
ok 2
ok 3
OUTPUT


1;

