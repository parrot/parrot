#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/float.t - Floating-point Numbers

=head1 SYNOPSIS

	% perl t/pmc/float.t

=head1 DESCRIPTION

Tests the Float PMC.

=cut

use Parrot::Test tests => 15;

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


output_is(<<"CODE", <<OUTPUT, "basic assignment");
@{[ $fp_equality_macro ]}
	new P0, .Float

	set P0, 0.001
 	.fp_eq( P0, 0.001, EQ1)
	print "not "
EQ1:	print "ok 1\\n"

        set P0, 1000
        .fp_eq( P0, 1000.0, EQ2)
	print "not "
EQ2:	print "ok 2\\n"

        set P0, "12.5"
        .fp_eq( P0, 12.5, EQ3)
	print "not "
EQ3:	print "ok 3\\n"

        set P0, "Twelve point five"
        .fp_eq( P0, 0.0, EQ4)
	print "not "
EQ4:	print "ok 4\\n"

        set P0, 123.45
        set I0, P0
        eq I0, 123, EQ5
	print "not "
EQ5:	print "ok 5\\n"

        set P0, 123.45
        set N0, P0
        .fp_eq(N0, 123.45, EQ6)
	print "not "
EQ6:	print "ok 6\\n"

        set P0, 123.45
        set S0, P0
        eq S0, "123.45", EQ7
	print "not "
EQ7:	print "ok 7\\n"

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


output_is(<<"CODE", <<OUTPUT, "add number to self");
@{[ $fp_equality_macro ]}
	new P0, .Float
	set P0, 0.001
	add P0, P0, P0
	.fp_eq( P0, 0.002, EQ1)
	print P0
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "sub number from self");
@{[ $fp_equality_macro ]}
	new P0, .Float
	set P0, -1000.2
	sub P0, P0, P0
	.fp_eq( P0, 0.0, EQ1)
	print P0
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "multiply number by self");
@{[ $fp_equality_macro ]}
	new P0, .Float
	set P0, 123.4
	mul P0, P0, P0
	.fp_eq( P0, 15227.56, EQ1)
	print P0
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "divide number by self");
@{[ $fp_equality_macro ]}
	new P0, .Float
	set P0, 1829354.988
	div P0, P0, P0
	.fp_eq( P0, 1.0, EQ1)
	print P0
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "add number to other");
@{[ $fp_equality_macro ]}
	new P0, .PerlNum
	new P1, .Float
	set P0, 123.123
	set P1, 321.321
	add P1, P1, P0
	.fp_eq( P1, 444.444, EQ1)
	print P1
	print "not "
EQ1:	print "ok 1\\n"

	new P0, .PerlNum
	new P1, .Float
	set P0, 123.123
	set P1, 321.321
	add P0, P0, P1
	.fp_eq( P0, 444.444, EQ2)
	print P0
	print "not "
EQ2:	print "ok 2\\n"

        new P2, .Integer
        new P3, .Float
        set P2, 100
        set P3, 12.5
        add P2, P2, P3
        eq P2, 112, EQ3
        print P2
	print "not "
EQ3:	print "ok 3\\n"

        new P2, .Integer
        new P3, .Float
        set P2, 100
        set P3, 12.5
        add P3, P3, P2
        .fp_eq(P3, 112.5, EQ4)
        print P3
	print "not "
EQ4:	print "ok 4\\n"
	end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<<"CODE", <<OUTPUT, "subtract number from other");
@{[ $fp_equality_macro ]}
	new P0, .PerlNum
	new P1, .Float
	set P0, 111.222
	set P1, 333.444
	sub P1, P1, P0
	.fp_eq( P1, 222.222, EQ1)
	print P1
	print "not "
EQ1:	print "ok 1\\n"

	new P0, .PerlNum
	new P1, .Float
	set P0, 123.456
	set P1, 456.123
	sub P0, P0, P1
	.fp_eq( P0, -332.667, EQ2)
	print P0
	print "not "
EQ2:	print "ok 2\\n"

	new P2, .Integer
	new P3, .Float
	set P2, 21
	set P3, 321.321
	sub P3, P3, P2
	.fp_eq( P3, 300.321, EQ3)
	print P3
	print "not "
EQ3:	print "ok 3\\n"

	new P2, .Integer
	new P3, .Float
	set P2, 21
	set P3, 321.321
	sub P2, P2, P3
	eq P2, -300, EQ4
	print P2
	print "not "
EQ4:	print "ok 4\\n"

	end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<<"CODE", <<OUTPUT, "multiply number by other");
@{[ $fp_equality_macro ]}
	new P0, .PerlNum
	new P1, .Float
	set P0, 123.123
	set P1, 321.321
	mul P1, P1, P0
	.fp_eq( P1, 39562.005483, EQ1)
	print P1
	print "not "
EQ1:	print "ok 1\\n"

	new P0, .PerlNum
	new P1, .Float
	set P0, 123.123
	set P1, 321.321
	mul P0, P0, P1
	.fp_eq( P0, 39562.005483, EQ2)
	print P0
	print "not "
EQ2:	print "ok 2\\n"

	new P2, .Integer
	new P3, .Float
	set P2, 5
	set P3, 321.321
	mul P3, P3, P2
	.fp_eq( P3, 1606.605, EQ3)
	print P3
	print "not "
EQ3:	print "ok 3\\n"

	new P2, .PerlNum
	new P3, .Float
	set P2, 5
	set P3, 1010.0101
	mul P2, P2, P3
	eq P2, 5050, EQ4
	print P2
	print "not "
EQ4:	print "ok 4\\n"

	end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<<"CODE", <<OUTPUT, "divide number by other");
@{[ $fp_equality_macro ]}
	new P0, .PerlNum
	new P1, .Float
	set P0, 123.123
	set P1, 246.246
	div P1, P1, P0
	.fp_eq( P1, 2.0, EQ1)
	print P1
	print "not "
EQ1:	print "ok 1\\n"

	new P0, .PerlNum
	new P1, .Float
	set P0, 123.123
	set P1, 246.246
	div P0, P0, P1
	.fp_eq( P0, 0.5, EQ2)
	print P0
	print "not "
EQ2:	print "ok 2\\n"

	new P2, .Integer
	new P3, .Float
	set P2, 10
	set P3, 246.246
	div P3, P3, P2
	.fp_eq( P3, 24.6246, EQ3)
	print P3
	print "not "
EQ3:	print "ok 3\\n"
	
	new P2, .Integer
	new P3, .Float
	set P2, 300
	set P3, 246.246
	div P2, P2, P3
	eq P2, 1, EQ4
	print P2
	print "not "
EQ4:	print "ok 4\\n"

        end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "Truth of a positive float");
##PIR##
.sub _main
    .local pmc float_1
    float_1 = new Float
    float_1 = 123.123
    print float_1
    if float_1 goto IS_TRUE
      print " is false\n"
    end
    IS_TRUE:
      print " is true\n"
    end
.end
CODE
123.123 is true
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "Truth of a negative float");
##PIR##
.sub _main
    .local pmc float_1
    float_1 = new Float
    float_1 = -123.123
    print float_1
    if float_1 goto IS_TRUE
      print " is false\n"
    end
    IS_TRUE:
      print " is true\n"
    end
.end
CODE
-123.123 is true
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "Truth of a positive integer");
##PIR##
.sub _main
    .local pmc float_1
    float_1 = new Float
    float_1 = 1
    print float_1
    if float_1 goto IS_TRUE
      print " is false\n"
    end
    IS_TRUE:
      print " is true\n"
    end
.end
CODE
1 is true
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "Truth of a negative integer");
##PIR##
.sub _main
    .local pmc float_1
    float_1 = new Float
    float_1 = -1
    print float_1
    if float_1 goto IS_TRUE
      print " is false\n"
    end
    IS_TRUE:
      print " is true\n"
    end
.end
CODE
-1 is true
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "Falseness of 0");
##PIR##
.sub _main
    .local pmc float_1
    float_1 = new Float
    float_1 = 0
    print float_1
    if float_1 goto IS_TRUE
      print " is false\n"
    end
    IS_TRUE:
      print " is true\n"
    end
.end
CODE
0 is false
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "Falseness of 0.000");
##PIR##
.sub _main
    .local pmc float_1
    float_1 = new Float
    float_1 = 0.000
    print float_1
    if float_1 goto IS_TRUE
      print " is false\n"
    end
    IS_TRUE:
      print " is true\n"
    end
.end
CODE
0 is false
OUTPUT
