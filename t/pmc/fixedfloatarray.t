#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/fixedfloatarray.t - FixedFloatArray PMC

=head1 SYNOPSIS

	% perl t/pmc/fixedfloatarray.t

=head1 DESCRIPTION

Tests C<FixedFloatArray> PMC. Checks size, sets various elements, including
out-of-bounds test. Checks INT and PMC keys.

=cut

use Parrot::Test tests => 11;
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
	new P0,.FixedFloatArray

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
	new P0, .FixedFloatArray

	set I0,P0
	set P0,1
	set P0,2
	print "Should have gotten an exception\n "


        end
CODE
FixedFloatArray: Can't resize!
OUTPUT
#VIM's syntax highlighter needs this line

output_is(<<'CODE', <<'OUTPUT', "Setting first element");
        new P0, .FixedFloatArray
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

	set P0[0],"17.2"
	set S0,P0[0]
	eq S0,"17.2",OK_3
	print "not "
OK_3:	print "ok 3\n"

	end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Setting second element");
        new P0, .FixedFloatArray
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

	set P0[1],"17.1"
	set S0, P0[1]
	eq S0,"17.1",OK_3
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
        new P0, .FixedFloatArray
        set P0, 1

	set P0[1], -7

	end
CODE
FixedFloatArray: index out of bounds!
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Getting out-of-bounds elements");
        new P0, .FixedFloatArray
        set P0, 1

	set I0, P0[1]
	end
CODE
FixedFloatArray: index out of bounds!
OUTPUT


output_is(<<"CODE", <<'OUTPUT', "Set via PMC keys, access via INTs");
@{[ $fp_equality_macro ]}
     new P0, .FixedFloatArray
     set P0, 3
     new P1, .Key

     set P1, 0
     set P0[P1], 25

     set P1, 1
     set P0[P1], 2.5

     set P1, 2
     set P0[P1], "17.32"

     set I0, P0[0]
     eq I0, 25, OK1
     print "not "
OK1: print "ok 1\\n"

     set N0, P0[1]
     .fp_eq(N0, 2.5, OK2)
     print "not "
OK2: print "ok 2\\n"

     set S0, P0[2]
     eq S0, "17.32", OK3
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
     new P0, .FixedFloatArray
     set P0, 1024

     set P0[25], 125
     set P0[128], 10.2
     set P0[513], "17.3"
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
     eq S0, "17.3", OK3
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


output_is(<<"CODE", <<'OUTPUT', "Clone");
@{[ $fp_equality_macro ]}
     set I30, 2000
     new P0, .FixedFloatArray
     set P0, I30
     set I0, 0
L1:  set N0, I0
     set P0[I0], N0
     inc I0
     lt I0, I30, L1

     clone P1, P0

L2:  dec I0
     set N0, I0
     set N1, P0[I0]
     .fp_ne(N0, N1, BAD)
     gt I0, 0, L2
     print "ok\\n" 
     end

BAD: print "not ok\\n"
     print N0
     print "\\n"
     print N1
     print "\\n"
     end
CODE
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Truth");
	new P0, .FixedFloatArray
        unless P0, OK1
	print "not "
OK1:	print "ok 1\n"
        set P0, 1
        if P0, OK2        
	print "not "
OK2:	print "ok 2\n"
        end
CODE
ok 1
ok 2
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "check wether interface is done");
##PIR##
.sub _main
    .local pmc pmc1
    pmc1 = new FixedFloatArray
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


1;
