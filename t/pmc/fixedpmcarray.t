#! perl -w

# Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/fixedpmcarray.t - FixedPMCArray PMC

=head1 SYNOPSIS

	% perl -Ilib t/pmc/fixedpmcarray.t

=head1 DESCRIPTION

Tests C<FixedPMCArray> PMC. Checks size, sets various elements, including
out-of-bounds test. Checks INT and PMC keys.

=cut

use Parrot::Test tests => 12;
use Test::More;

my $fp_equality_macro = <<'ENDOFMACRO';
.macro fp_eq (	J, K, L )
	save	N0
	save	N1
	save	N2

	set	N0, .J
	set	N1, .K
	sub	N2, N1,N0
	abs	N2, N2
	gt	N2, 0.000001, .$FPEQNOK

	restore N2
	restore	N1
	restore	N0
	branch	.L
.local $FPEQNOK:
	restore N2
	restore	N1
	restore	N0
.endm
.macro fp_ne(	J,K,L)
	save	N0
	save	N1
	save	N2

	set	N0, .J
	set	N1, .K
	sub	N2, N1,N0
	abs	N2, N2
	lt	N2, 0.000001, .$FPNENOK

	restore	N2
	restore	N1
	restore	N0
	branch	.L
.local $FPNENOK:
	restore	N2
	restore	N1
	restore	N0
.endm
ENDOFMACRO

output_is(<<'CODE', <<'OUTPUT', "Setting array size");
	new P0,.FixedPMCArray

	set I0,P0
	eq I0,0,OK_1
	print "not "
OK_1:	print "ok 1\n"

	set P0,1
	set I0,P0
	eq I0,1,OK_2
	print "not "
OK_2:	print "ok 2\n"

        end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Resetting array size (and getting an exception)");
	new P0, .FixedPMCArray

	set I0,P0
	set P0,1
	set P0,2
	print "Should have gotten an exception\n "


        end
CODE
FixedPMCArray: Can't resize!
OUTPUT
#VIM's syntax highlighter needs this line

output_is(<<'CODE', <<'OUTPUT', "Truth and falsehood");
        new P0, .FixedPMCArray

        set P0, 0
        if P0, NOK_1
        branch OK_1
NOK_1:  print "not "
OK_1:   print "ok 1\n"
        unless P0, OK_2
        print "not "
OK_2:   print "ok 2\n"

        set P0, 1
        unless P0, NOK_3
        branch OK_3
NOK_3:  print "not "
OK_3:   print "ok 3\n"
        if P0, OK_4
        print "not "
OK_4:   print "ok 4\n"

        end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Setting first element");
        new P0, .FixedPMCArray
        set P0, 1

	set P0[0],-7
	set I0,P0[0]
	eq I0,-7,OK_1
	print "not "
OK_1:	print "ok 1\n"

	set P0[0],3.7
	set N0,P0[0]
	eq N0,3.7,OK_2
	print "not "
OK_2:	print "ok 2\n"

	set P0[0],"muwhahaha"
	set S0,P0[0]
	eq S0,"muwhahaha",OK_3
	print "not "
OK_3:	print "ok 3\n"

	end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Setting second element");
        new P0, .FixedPMCArray
        set P0, 2

	set P0[1], -7
	set I0, P0[1]
	eq I0,-7,OK_1
	print "not "
OK_1:	print "ok 1\n"

	set P0[1], 3.7
	set N0, P0[1]
	eq N0,3.7,OK_2
	print "not "
OK_2:	print "ok 2\n"

	set P0[1],"purple"
	set S0, P0[1]
	eq S0,"purple",OK_3
	print "not "
OK_3:	print "ok 3\n"

	end
CODE
ok 1
ok 2
ok 3
OUTPUT

# TODO: Rewrite these properly when we have exceptions

output_is(<<'CODE', <<'OUTPUT', "Setting out-of-bounds elements");
        new P0, .FixedPMCArray
        set P0, 1

	set P0[1], -7

	end
CODE
FixedPMCArray: index out of bounds!
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Getting out-of-bounds elements");
        new P0, .FixedPMCArray
        set P0, 1

	set I0, P0[1]
	end
CODE
FixedPMCArray: index out of bounds!
OUTPUT


output_is(<<"CODE", <<'OUTPUT', "Set via PMC keys, access via INTs");
@{[ $fp_equality_macro ]}
     new P0, .FixedPMCArray
     set P0, 3
     new P1, .Key

     set P1, 0
     set P0[P1], 25

     set P1, 1
     set P0[P1], 2.5

     set P1, 2
     set P0[P1], "bleep"

     set I0, P0[0]
     eq I0, 25, OK1
     print "not "
OK1: print "ok 1\\n"

     set N0, P0[1]
     .fp_eq(N0, 2.5, OK2)
     print "not "
OK2: print "ok 2\\n"

     set S0, P0[2]
     eq S0, "bleep", OK3
     print "not "
OK3: print "ok 3\\n"

     end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<"CODE", <<'OUTPUT', "Set via INTs, access via PMC Keys");
@{[ $fp_equality_macro ]}
     new P0, .FixedPMCArray
     set P0, 1024

     set P0[25], 125
     set P0[128], 10.2
     set P0[513], "cow"
     new P1, .PerlInt
     set P1, 123456
     set P0[1023], P1

     new P2, .Key
     set P2, 25
     set I0, P0[P2]
     eq I0, 125, OK1
     print "not "
OK1: print "ok 1\\n"

     set P2, 128
     set N0, P0[P2]
     .fp_eq(N0, 10.2, OK2)
     print "not "
OK2: print "ok 2\\n"

     set P2, 513
     set S0, P0[P2]
     eq S0, "cow", OK3
     print "not "
OK3: print "ok 3\\n"

     set P2, 1023
     set P3, P0[P2]
     set I1, P3
     eq I1, 123456, OK4
     print "not "
OK4: print "ok 4\\n"

     end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_like(<<'CODE',
##PIR##
.sub main @MAIN
     .local pmc compares
     # XXX doesnt work wit prederef of JIT
     bounds 1
     compares = new .PerlInt
     compares = 0
     global "compares" = compares
     sort_ar()
     sort_ar(1)
.end
.sub sort_ar prototyped
    .local pmc cmp_fun
    .local pmc compares
    compares = global "compares"
    compares = 0
    if argcI goto s1
       .local pmc none
       null none
       cmp_fun = none
       goto sort_it
s1:
    cmp_fun = global "cmp_fun"
sort_it:

    .local pmc ar
    new ar, .FixedPMCArray
    ar = 5
    ar[0] = 10
    ar[1] = 2
    ar[2] = 5
    ar[3] = 9
    ar[4] = 1
    ar."sort"(cmp_fun)
    print "ok 1\n"

    .local pmc it
    iter it, ar
lp:
    unless it goto done
    $P0 = shift it
    print $P0
    print " "
    goto lp
done:
    print "x\n"
     print "compares: "
     print compares
     print "\n"
.end

.sub cmp_fun prototyped
    .param pmc a
    .param pmc b
    $I0 = cmp a, b
    .local pmc compares
    compares = global "compares"
    inc compares
    .pcc_begin_return
    .return $I0
    .pcc_end_return
.end
CODE

qr/ok 1
1 2 5 9 10 x
compares: 0
ok 1
1 2 5 9 10 x
compares: [1-9]\d*/, "sort");

output_is(<< 'CODE', << 'OUTPUT', "check whether interface is done");
##PIR##
.sub _main
    .local pmc pmc1
    pmc1 = new FixedPMCArray
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

output_is(<<'CODE', <<'OUTPUT', "Getting unitialized elements");
##PIR##
.sub main @MAIN
    .local pmc arr1
    arr1 = new FixedPMCArray
    arr1 = 2005
    .local pmc elem_1956
    elem_1956 = arr1[1956]
    .local string type_1956
    type_1956 = typeof elem_1956
    print type_1956
.end
CODE
Null PMC access in name()
OUTPUT
