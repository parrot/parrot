#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/resizablefloatarray.t - ResizableFloatArray PMC

=head1 SYNOPSIS

	% perl t/pmc/resizablefloatarray.t

=head1 DESCRIPTION

Tests C<ResizableFloatArray> PMC. Checks size, sets various elements, including
out-of-bounds test. Checks INT and PMC keys.

=cut

use Parrot::Test tests => 16;
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

output_is(<<'CODE', <<'OUTPUT', 'creation');
    new P0, .ResizableFloatArray
    print "ok\n"
    end
CODE
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Setting array size");
	new P0,.ResizableFloatArray

	set I0,P0
	eq I0,0,OK_1
	print "not "
OK_1:	print "ok 1\n"

	set P0,1
	set I0,P0
	eq I0,1,OK_2
	print "not "
OK_2:	print "ok 2\n"

	set P0,5
	set I0,P0
	eq I0,5,OK_3
	print "not "
OK_3:	print "ok 3\n"

	set P0,9
	set I0,P0
	eq I0,9,OK_4
	print "not "
OK_4:	print "ok 4\n"

	set P0,7
	set I0,P0
	eq I0,7,OK_5
	print "not "
OK_5:	print "ok 5\n"

        end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "Setting negative array size");
	new P0, .ResizableFloatArray
        set P0, -100
        end
CODE
/ResizableFloatArray: Can't resize to negative value!/
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Setting first element");
        new P0, .ResizableFloatArray
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
        new P0, .ResizableFloatArray

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
        new P0, .ResizableFloatArray
        set P0, 1

	set P0[1], -7
	print "ok 1\n"

	end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Getting out-of-bounds elements");
        new P0, .ResizableFloatArray
        set P0, 1

	set I0, P0[1]
	print "ok 1\n"
	end
CODE
ok 1
OUTPUT


output_is(<<"CODE", <<'OUTPUT', "Set via PMC keys, access via INTs");
@{[ $fp_equality_macro ]}
     new P0, .ResizableFloatArray
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
     new P0, .ResizableFloatArray
     set P0, 1

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

output_is(<<"CODE", <<'OUTPUT', 'basic push');
@{[ $fp_equality_macro ]}
     new P0, .ResizableFloatArray
     push P0, 1.0
     push P0, 2.0
     push P0, 3.0
     set N0, P0[0]
     .fp_eq(N0, 1.0, OK1)
     print "not "
OK1: print "ok 1\\n"

     set N0, P0[1]
     .fp_eq(N0, 2.0, OK2)
     print "not "
OK2: print "ok 2\\n"

     set N0, P0[2]
     .fp_eq(N0, 3.0, OK3)
     print "not "
OK3: print "ok 3\\n"
     end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<"CODE", <<'OUTPUT', 'push many values');
@{[ $fp_equality_macro ]}
     new P0, .ResizableFloatArray
     set I0, 0
L1:  set N0, I0
     push P0, N0
     inc I0
     lt I0, 100000, L1
     
     set N0, P0[99999]
     .fp_eq(N0, 99999.0, OK1)
     print N0
     print "not "
OK1: print "ok 1\\n"
     end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<'OUTPUT', 'basic pop');
@{[ $fp_equality_macro ]}
     new P0, .ResizableFloatArray
     set P0[0], 1.0
     set P0[1], 2.0
     set P0[2], 3.0
     pop N0, P0
     .fp_eq(N0, 3.0, OK1)
     print "not "
OK1: print "ok 1\\n"

     pop N0, P0
     .fp_eq(N0, 2.0, OK2)
     print "not "
OK2: print "ok 2\\n"

     pop N0, P0
     .fp_eq(N0, 1.0, OK3)
     print "not "
OK3: print "ok 3\\n"
     end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<"CODE", <<'OUTPUT', 'pop many values');
@{[ $fp_equality_macro ]}
     new P0, .ResizableFloatArray
     set I0, 0
L1:  set N0, I0
     set P0[I0], N0
     inc I0
     lt I0, 100000, L1
     
L2:  dec I0
     set N1, I0
     pop N0, P0
     .fp_eq(N0, N1, OK)
     branch NOT_OK
OK:  gt I0, 0, L2
     print "ok\\n"
     end

NOT_OK:
     print N0
     print "\\n"
     print N1
     print "\\n"
     end
CODE
ok
OUTPUT

output_is(<<"CODE", <<'OUTPUT', 'push/pop');
@{[ $fp_equality_macro ]}
     new P0, .ResizableFloatArray
     push P0, 1.0
     push P0, 2.0
     push P0, 3.0
     pop N0, P0
     .fp_eq(N0, 3.0, OK1)
     print "not "
OK1: print "ok 1\\n"
     end
CODE
ok 1
OUTPUT

output_like(<<'CODE', <<'OUTPUT', 'pop from empty array');
     new P0, .ResizableFloatArray
     pop N0, P0
     end
CODE
/ResizableFloatArray: Can't pop from an empty array!/
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "check wether interface is done");
##PIR##
.sub _main
    .local pmc pmc1
    pmc1 = new ResizableFloatArray
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
