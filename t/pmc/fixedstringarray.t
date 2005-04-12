#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/fixedstringarray.t - FixedStringArray PMC

=head1 SYNOPSIS

	% perl -Ilib t/pmc/FixedStringArray.t

=head1 DESCRIPTION

Tests C<FixedStringArray> PMC. Checks size, sets various elements, including
out-of-bounds test. Checks INT and PMC keys.

=cut

use Parrot::Test tests => 13;
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
	new P0,.FixedStringArray

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
	new P0, .FixedStringArray

	set I0,P0
	set P0,1
	set P0,2
	print "Should have gotten an exception\n "


        end
CODE
FixedStringArray: Can't resize!
OUTPUT
#VIM's syntax highlighter needs this line

output_is(<<'CODE', <<'OUTPUT', "Setting first element");
        new P0, .FixedStringArray
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
        new P0, .FixedStringArray
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
        new P0, .FixedStringArray
        set P0, 1

	set P0[1], -7

	end
CODE
FixedStringArray: index out of bounds!
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Getting out-of-bounds elements");
        new P0, .FixedStringArray
        set P0, 1

	set I0, P0[1]
	end
CODE
FixedStringArray: index out of bounds!
OUTPUT


output_is(<<"CODE", <<'OUTPUT', "Set via PMC keys, access via INTs");
@{[ $fp_equality_macro ]}
     new P0, .FixedStringArray
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
     new P0, .FixedStringArray
     set P0, 1024

     set P0[25], 125
     set P0[128], 10.2
     set P0[513], "cow"
     new P1, .Integer
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

pir_output_is(<< 'CODE', << 'OUTPUT', "check whether interface is done");

.sub _main
    .local pmc pmc1
    pmc1 = new FixedStringArray
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

output_is(<<'CODE', <<'OUTPUT', "Clone");
     new P0, .FixedStringArray
     set P0, 3
     set P0[0], "abcde"
     set P0[1], "fghi"
     set P0[2], "jkl"
     clone P1, P0
     set P0[0], ""
     set P0[1], ""
     set P0[2], ""
     set S0, P1[0]
     print S0
     set S0, P1[1]
     print S0
     set S0, P1[2]
     print S0
     print "\n"
     end
CODE
abcdefghijkl
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Cloning before size is set");
     new P0, .FixedStringArray
     clone P1, P0
     set P0, 10
     set P1, 20
     print "ok\n"
     clone P2, P0
     set P2, 30
     end
CODE
ok
FixedStringArray: Can't resize!
OUTPUT
#VIM's syntax highlighter needs this line

output_is(<<'CODE', <<'OUTPUT', "Truth");
     new P0, .FixedStringArray
     unless P0, OK1
     print "not "
OK1: print "ok 1\n"
     set P0, 10
     if P0, OK2
     print "not "
OK2: print "ok 2\n"
     end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Garbage collection");
     new P0, .FixedStringArray
     set P0, 8192
     set I0, 0
L1:  set P0[I0], I0     
     inc I0
     lt I0, 8192, L1
     sweep 1
     set S0, P0[1000]
     print S0
     print "\n"
     set S0, P0[2000]
     print S0
     print "\n"
     set S0, P0[4000]
     print S0
     print "\n"
     set S0, P0[8000]
     print S0
     print "\n"
     end
CODE
1000
2000
4000
8000
OUTPUT

1;

