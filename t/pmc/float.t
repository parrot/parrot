#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/float.t - Floating-point Numbers

=head1 SYNOPSIS

	% perl -Ilib t/pmc/float.t

=head1 DESCRIPTION

Tests the Float PMC.

=cut

use Parrot::Test tests => 44;

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

output_is(<< "CODE", << 'OUTPUT', "Basic integer arithmetic: addition");
@{[ $fp_equality_macro ]}
	new P0, .Float
	set P0, 0.001
	add P0, 1
	.fp_eq(P0, 1.001, EQ1)
	print P0
	print "not "
EQ1:	print "ok 1\\n"

	add P0, -2
	.fp_eq(P0, -0.999, EQ2)
	print P0
	print "not "
EQ2:	print "ok 2\\n"
	end
CODE
ok 1
ok 2
OUTPUT

output_is(<< "CODE", << 'OUTPUT', "Basic integer arithmetic: subtraction");
@{[ $fp_equality_macro ]}
	new P0, .Float
	set P0, 103.45
	sub P0, 77
	.fp_eq(P0, 26.45, EQ1)
	print P0
	print "not "
EQ1:	print "ok 1\\n"

	sub P0, -24 
	.fp_eq(P0, 50.45, EQ2)
	print P0
	print "not "
EQ2:	print "ok 2\\n"
	end
CODE
ok 1
ok 2
OUTPUT

output_is(<< "CODE", << 'OUTPUT', "Basic integer arithmetic: multiplication");
@{[ $fp_equality_macro ]}
	new P0, .Float
	set P0, 0.001
	mul P0, 10000
	.fp_eq(P0, 10.0, EQ1)
	print P0
	print "not "
EQ1:	print "ok 1\\n"

	mul P0, -1 
	.fp_eq(P0, -10.0, EQ2)
	print P0
	print "not "
EQ2:	print "ok 2\\n"

	mul P0, 0
	.fp_eq(P0, 0.0, EQ3)
	print P0
	print "not "
EQ3:	print "ok 3\\n"
	end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<< "CODE", << 'OUTPUT', "Basic integer arithmetic: division");
@{[ $fp_equality_macro ]}
	new P0, .Float
	set P0, 1e8
	div P0, 10000 
	.fp_eq(P0, 10000.0, EQ1)
	print P0
	print "not "
EQ1:	print "ok 1\\n"

	div P0, 1000000
	.fp_eq(P0, 0.01, EQ2)
	print P0
	print "not "
EQ2:	print "ok 2\\n"
	end
CODE
ok 1
ok 2
OUTPUT

output_is(<< "CODE", << 'OUTPUT', "Basic numeric arithmetic: addition");
@{[ $fp_equality_macro ]}
	new P0, .Float
	set P0, 0.001
	add P0, 1.2
	.fp_eq(P0, 1.201, EQ1)
	print P0
	print "not "
EQ1:	print "ok 1\\n"

	add P0, -2.4
	.fp_eq(P0, -1.199, EQ2)
	print P0
	print "not "
EQ2:	print "ok 2\\n"
	end
CODE
ok 1
ok 2
OUTPUT

output_is(<< "CODE", << 'OUTPUT', "Basic numeric arithmetic: subtraction");
@{[ $fp_equality_macro ]}
	new P0, .Float
	set P0, 103.45
	sub P0, 3.46
	.fp_eq(P0, 99.99, EQ1)
	print P0
	print "not "
EQ1:	print "ok 1\\n"

	sub P0, -0.01
	.fp_eq(P0, 100.00, EQ2)
	print P0
	print "not "
EQ2:	print "ok 2\\n"
	end
CODE
ok 1
ok 2
OUTPUT

output_is(<< "CODE", << 'OUTPUT', "Basic numeric arithmetic: multiplication");
@{[ $fp_equality_macro ]}
	new P0, .Float
	set P0, 0.001
	mul P0, 123.5
	.fp_eq(P0, 0.1235, EQ1)
	print P0
	print "not "
EQ1:	print "ok 1\\n"

	mul P0, -2.6
	.fp_eq(P0, -0.3211, EQ2)
	print P0
	print "not "
EQ2:	print "ok 2\\n"

	mul P0, 0
	.fp_eq(P0, 0.0, EQ3)
	print P0
	print "not "
EQ3:	print "ok 3\\n"
	end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<< "CODE", << 'OUTPUT', "Basic numeric arithmetic: division");
@{[ $fp_equality_macro ]}
	new P0, .Float
	set P0, 1e8
	div P0, 0.5
	.fp_eq(P0, 2e8, EQ1)
	print P0
	print "not "
EQ1:	print "ok 1\\n"

	div P0, 4000.0
	.fp_eq(P0, 50000.0, EQ2)
	print P0
	print "not "
EQ2:	print "ok 2\\n"
	end
CODE
ok 1
ok 2
OUTPUT

output_is(<< "CODE", << 'OUTPUT', "Increment & decrement");
@{[ $fp_equality_macro ]}
	new P0, .Float
	set P0, 0.5
	inc P0
	.fp_eq(P0, 1.5, EQ1)
	print P0
	print "not "
EQ1:	print "ok 1\\n"

	dec P0
	.fp_eq(P0, 0.5, EQ2)
	print P0
	print "not "
EQ2:	print "ok 2\\n"

	dec P0
	.fp_eq(P0, -0.5, EQ3)
	print P0
	print "not "
EQ3:	print "ok 3\\n"

	inc P0
	.fp_eq(P0, 0.5, EQ4)
	print P0
	print "not "
EQ4:	print "ok 4\\n"
	end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<< "CODE", << 'OUTPUT', "Neg");
@{[ $fp_equality_macro ]}
	new P0, .Float
	set P0, 0.5
	neg P0
	.fp_eq(P0, -0.5, EQ1)
	print P0
	print "not "
EQ1:	print "ok 1\\n"

        new P1, .Float
	neg P1, P0
	.fp_eq(P1, 0.5, EQ2)
	print P1
	print "not "
EQ2:	print "ok 2\\n"
	end
CODE
ok 1
ok 2
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "Equality");
	new P0, .Float
	set P0, 1e8
        new P1, .Float
        set P1, 1e8
        new P2, .Float
        set P2, 2.4

        eq P0, P1, OK1
        print "not "
OK1:    print "ok 1\n"

        eq P0, P2, BAD2
        branch OK2
BAD2:   print "not "
OK2:    print "ok 2\n"

        ne P0, P2, OK3
        print "not "
OK3:    print "ok 3\n"

        ne P0, P1, BAD4
        branch OK4
BAD4:   print "not "
OK4:    print "ok 4\n"

        eq_num P0, P1, OK5
        print "not "
OK5:    print "ok 5\n"

        eq_num P0, P2, BAD6
        branch OK6
BAD6:   print "not "
OK6:    print "ok 6\n"

        ne_num P0, P2, OK7
        print "not "
OK7:    print "ok 7\n"

        ne_num P0, P1, BAD8
        branch OK8
BAD8:   print "not "
OK8:    print "ok 8\n"
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
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "check whether interface is done");
##PIR##
.sub _main
    .local pmc pmc1
    pmc1 = new Float
    .local int bool1
    does bool1, pmc1, "scalar"
    print bool1
    print "\n"
    does bool1, pmc1, "no_interface"
    print bool1
    print "\n"
    end
.end
CODE
1
0
OUTPUT

output_is(<< "CODE", << 'OUTPUT', "Abs");
@{[ $fp_equality_macro ]}
	new P0, .Float
	set P0, 1.0
	abs P0
        eq P0, P0, OK1
	print P0
	print "not "
OK1:	print "ok 1\\n"

        set P0, -1.0
        abs P0
	.fp_eq(P0, 1.0, OK2)
	print P0
	print "not "
OK2:	print "ok 2\\n"

        new P1, .Float
        set P0, -5.0
        abs P1, P0
        .fp_eq(P1, 5.0, OK3)
	print P1
	print "not "
OK3:	print "ok 3\\n"
	end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "comparison ops: lt");
        new P1, .Float
        set P1, 111.1
        set N1, P1

        lt P1, 111.2, OK1
        print "not "
OK1:    print "ok 1\n"

        lt P1, N1, BAD2
        branch OK2
BAD2:   print "not "
OK2:    print "ok 2\n"

        lt P1, 111.0, BAD3
        branch OK3
BAD3:   print "not "
OK3:    print "ok 3\n"
        end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "comparison ops: lt_num");
        new P1, .Float
        set P1, 1.1
        new P2, .Float
        set P2, 1.2
        new P3, .Float
        set P3, 1.0
        new P4, .Float
        set P4, P1

        lt_num P1, P2, OK1
        print "not "
OK1:    print "ok 1\n"

        lt_num P1, P4, BAD2
        branch OK2
BAD2:   print "not "
OK2:    print "ok 2\n"

        lt_num P1, P3, BAD3
        branch OK3
BAD3:   print "not "
OK3:    print "ok 3\n"
        end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "comparison ops: le");
        new P1, .Float
        set P1, 111.1
        set N1, P1

        le P1, 111.2, OK1
        print "not "
OK1:    print "ok 1\n"

        le P1, N1, OK2
        print "not "
OK2:    print "ok 2\n"

        le P1, 111.0, BAD3
        branch OK3
BAD3:   print "not "
OK3:    print "ok 3\n"
        end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "comparison ops: le_num");
        new P1, .Float
        set P1, 1.1
        new P2, .Float
        set P2, 1.2
        new P3, .Float
        set P3, 1.0
        new P4, .Float
        set P4, P1

        le_num P1, P2, OK1
        print "not "
OK1:    print "ok 1\n"

        le_num P1, P4, OK2
        print "not "
OK2:    print "ok 2\n"

        le_num P1, P3, BAD3
        branch OK3
BAD3:   print "not "
OK3:    print "ok 3\n"
        end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "comparison ops: gt");
        new P1, .Float
        set P1, 111.1
        set N1, P1

        gt P1, 111.2, BAD1
        branch OK1
BAD1:   print "not "
OK1:    print "ok 1\n"

        gt P1, N1, OK2
        branch OK2
BAD2:   print "not "
OK2:    print "ok 2\n"

        gt P1, 111.0, OK3
        print "not "
OK3:    print "ok 3\n"
        end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "comparison ops: gt_num");
        new P1, .Float
        set P1, 1.1
        new P2, .Float
        set P2, 1.2
        new P3, .Float
        set P3, 1.0
        new P4, .Float
        set P4, P1

        gt_num P1, P2, BAD1
        branch OK1
BAD1:   print "not "
OK1:    print "ok 1\n"

        gt_num P1, P4, OK2
        branch OK2
BAD2:   print "not "
OK2:    print "ok 2\n"

        gt_num P1, P3, OK3
        print "not "
OK3:    print "ok 3\n"
        end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "comparison ops: ge");
        new P1, .Float
        set P1, 111.1
        set N1, P1

        ge P1, 111.2, BAD1
        branch OK1
BAD1:   print "not "
OK1:    print "ok 1\n"

        ge P1, N1, OK2
        print "not "
OK2:    print "ok 2\n"

        ge P1, 111.0, OK3
        print "not "
OK3:    print "ok 3\n"
        end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "comparison ops: ge_num");
        new P1, .Float
        set P1, 1.1
        new P2, .Float
        set P2, 1.2
        new P3, .Float
        set P3, 1.0
        new P4, .Float
        set P4, P1

        ge_num P1, P2, BAD1
        branch OK1
BAD1:   print "not "
OK1:    print "ok 1\n"

        ge_num P1, P4, OK2
        print "not "
OK2:    print "ok 2\n"

        ge_num P1, P3, OK3
        print "not "
OK3:    print "ok 3\n"
        end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "comparison ops: cmp_p_n");
        new P1, .Float
        set P1, 123.45
        set N1, 123.45
        set N2, -1.0
        set N3, 123.54

        cmp I0, P1, N1
        print I0
        print "\n"
        cmp I0, P1, N2
        print I0
        print "\n"
        cmp I0, P1, N3
        print I0
        print "\n"
        end
CODE
0
1
-1
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "comparison ops: cmp_num");
        new P1, .Float
        set P1, 1.1
        new P2, .Float
        set P2, 1.2
        new P3, .Float
        set P3, 1.0
        new P4, .PerlNum
        set P4, 1.1
        new P5, .PerlNum
        set P5, 1.2
        new P6, .PerlNum
        set P6, 1.0
        new P7, .Float
        set P7, P1

        cmp_num I0, P1, P1
        print I0
        print "\n"
        cmp_num I0, P1, P2
        print I0
        print "\n"
        cmp_num I0, P1, P3
        print I0
        print "\n"
        cmp_num I0, P1, P4
        print I0
        print "\n"
        cmp_num I0, P1, P5
        print I0
        print "\n"
        cmp_num I0, P1, P6
        print I0
        print "\n"
        cmp_num I0, P1, P7
        print I0
        print "\n"
        end
CODE
0
-1
1
0
-1
1
0
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "comparison ops: isgt");
        new P1, .Float
        new P2, .Float
        new P3, .Float
        new P4, .Integer
        new P5, .Integer
        new P6, .Float

        set P1, 10.0
        set P2, 20.0
        set P3, 5.0
        set P4, 3
        set P5, 12
        set P6, 10.0

        isgt I0, P1, P2
        print I0
        print "\n"
        isgt I0, P1, P1
        print I0
        print "\n"
        isgt I0, P1, P3
        print I0
        print "\n"
        isgt I0, P1, P4
        print I0
        print "\n"
        isgt I0, P1, P5
        print I0
        print "\n"
        isgt I0, P1, P6
        print I0
        print "\n"
        end
CODE
0
0
1
1
0
0
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "comparison ops: isge");
        new P1, .Float
        new P2, .Float
        new P3, .Float
        new P4, .Integer
        new P5, .Integer
        new P6, .Float

        set P1, 10.0
        set P2, 20.0
        set P3, 5.0
        set P4, 3
        set P5, 12
        set P6, 10.0

        isge I0, P1, P2
        print I0
        print "\n"
        isge I0, P1, P1
        print I0
        print "\n"
        isge I0, P1, P3
        print I0
        print "\n"
        isge I0, P1, P4
        print I0
        print "\n"
        isge I0, P1, P5
        print I0
        print "\n"
        isge I0, P1, P6
        print I0
        print "\n"
        end
CODE
0
1
1
1
0
1
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "comparison ops: islt");
        new P1, .Float
        new P2, .Float
        new P3, .Float
        new P4, .Integer
        new P5, .Integer
        new P6, .Float

        set P1, 10.0
        set P2, 20.0
        set P3, 5.0
        set P4, 3
        set P5, 12
        set P6, 10.0

        islt I0, P1, P2
        print I0
        print "\n"
        islt I0, P1, P1
        print I0
        print "\n"
        islt I0, P1, P3
        print I0
        print "\n"
        islt I0, P1, P4
        print I0
        print "\n"
        islt I0, P1, P5
        print I0
        print "\n"
        islt I0, P1, P6
        print I0
        print "\n"
        end
CODE
1
0
0
0
1
0
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "comparison ops: isle");
        new P1, .Float
        new P2, .Float
        new P3, .Float
        new P4, .Integer
        new P5, .Integer
        new P6, .Float

        set P1, 10.0
        set P2, 20.0
        set P3, 5.0
        set P4, 3
        set P5, 12
        set P6, 10.0

        isle I0, P1, P2
        print I0
        print "\n"
        isle I0, P1, P1
        print I0
        print "\n"
        isle I0, P1, P3
        print I0
        print "\n"
        isle I0, P1, P4
        print I0
        print "\n"
        isle I0, P1, P5
        print I0
        print "\n"
        isle I0, P1, P6
        print I0
        print "\n"
        end
CODE
1
1
0
0
1
1
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "comparison ops: iseq");
        new P1, .Float
        new P2, .Float
        new P3, .Float
        new P4, .Integer

        set P1, 2.5
        set P2, 2.6
        set P3, 2.5
        set P4, 2

        iseq I0, P1, P1
        print I0
        print "\n"
        iseq I0, P1, P2
        print I0
        print "\n"
        iseq I0, P1, P3
        print I0
        print "\n"
        iseq I0, P1, P4
        print I0
        print "\n"
        end
CODE
1
0
1
0
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "comparison ops: isne");
        new P1, .Float
        new P2, .Float
        new P3, .Float
        new P4, .Integer

        set P1, 2.5
        set P2, 2.6
        set P3, 2.5
        set P4, 2

        isne I0, P1, P1
        print I0
        print "\n"
        isne I0, P1, P2
        print I0
        print "\n"
        isne I0, P1, P3
        print I0
        print "\n"
        isne I0, P1, P4
        print I0
        print "\n"
        end
CODE
0
1
0
1
OUTPUT


