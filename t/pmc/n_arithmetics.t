#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id: arithmetics.t 7810 2005-04-12 10:09:05Z leo $

=head1 NAME

t/pmc/n_arithmetics.t - n_* Arithmetic Ops

=head1 SYNOPSIS

	% perl -Ilib t/pmc/n_arithmetics.t

=head1 DESCRIPTION

Tests basic arithmetic ops that construct a new return value on
various combinations of Parrot integer and number types.

=cut

use Parrot::Test tests => 19;
use Test::More;

###
### Operations on a single INTVAL
###
pir_output_is(<<'CODE', <<OUTPUT, "take the negative of an Integer");
.sub _main @MAIN
	P0 = new Integer
	## negate zero.
	set P0, 0
	n_neg P1, P0
	print P1
	print "\n"
	P30 = P1
	## negate a positive number.
	set P0, 1234567890
	n_neg P1, P0
	print P1
	print "\n"
	## check that we are not reusing P1.
	ne_addr P30, P1, not_broken
	print "Broken!\n"
not_broken:
	## negate a negative number.
	set P0, -1234567890
	P1 = n_neg P0
	print P1
	print "\n"
.end
CODE
0
-1234567890
1234567890
OUTPUT

pir_output_is(<<'CODE', <<OUTPUT, "take the absolute value of an Integer");
.sub _main @MAIN
	P0 = new Integer
	## find absolute zero (so to speak).
	set P0, 0
	P1 = n_abs P0
	print P1
	print "\n"
	P30 = P1
	## find the absolute value of a positive Integer.
	set P0, 1234567890
	n_abs P1, P0
	print P1
	print "\n"
	## check that we are not reusing P1.
	ne_addr P30, P1, not_broken
	print "Broken!\n"
not_broken:
	## find the absolute value of a negative number.
	set P0, -1234567890
	n_abs P1, P0
	print P1
	print "\n"
.end
CODE
0
1234567890
1234567890
OUTPUT

###
### first arg is Integer, second arg is Integer
###
pir_output_is(<<'CODE', <<OUTPUT, "add Integer to Integer");
.sub _main @MAIN
	P0 = new Integer
	set P0, 4000
	P1 = new Integer
	set P1, -123
	P2 = new Integer
	set P2, 666
	n_add P2, P0, P1
	print P2
	print "\n"
	P30 = P2
	P2 = n_add P0, P1
	print P2
	print "\n"
	## check that we are not reusing P2.
	ne_addr P30, P2, not_broken
	print "Broken!\n"
not_broken:
	## check adding constants.
	P2 = n_add P0, 11
	print P2
	print "\n"
	P0 = n_add P0, 11
	print P0
	print "\n"
.end
CODE
3877
3877
4011
4011
OUTPUT

pir_output_is(<<'CODE', <<OUTPUT, "subtract Integer from Integer");
.sub _main @MAIN
	P0 = new Integer
	set P0, 4000
	P1 = new Integer
	set P1, -123
	P2 = new Integer
	set P2, 666
	n_sub P2, P0, P1
	print P2
	print "\n"
	P30 = P2
	P2 = n_sub P0, P1
	print P2
	print "\n"
	## check that we are not reusing P2.
	ne_addr P30, P2, not_broken
	print "Broken!\n"
not_broken:
	## check subtracting constants.
	P2 = n_sub P0, 11
	print P2
	print "\n"
	P0 = n_sub P0, 11
	print P0
	print "\n"
.end
CODE
4123
4123
3989
3989
OUTPUT

pir_output_is(<<'CODE', <<OUTPUT, "multiply Integer with Integer");
.sub _main @MAIN
	P0 = new Integer
	set P0, 4000
	P1 = new Integer
	set P1, -123
	P2 = new Integer
	set P2, 666
	n_mul P2, P0, P1
	print P2
	print "\n"
	P3 = n_mul P0, P1
	print P3
	print "\n"
	## check multiplying constants.
	P2 = n_mul P0, 11
	print P2
	print "\n"
	P0 = n_mul P0, 11
	print P0
	print "\n"
.end
CODE
-492000
-492000
44000
44000
OUTPUT

pir_output_is(<<'CODE', <<OUTPUT, "divide Integer by Integer");
.sub _main @MAIN
	P0 = new Integer
	set P0, 4000
	P1 = new Integer
	set P1, -123
	P2 = new Integer
	set P2, 666
	n_div P2, P0, P1
	print P2
	print "\n"
	P3 = n_div P0, P1
	print P3
	print "\n"
	## check dividing by constants.
	P2 = n_div P0, 11
	print P2
	print "\n"
	P0 = n_div P0, 11
	print P0
	print "\n"
.end
CODE
-32.5203
-32.5203
363.636
363.636
OUTPUT

###
### Operations on a single NUMVAL
###
pir_output_is(<<'CODE', <<OUTPUT, "negate a Float");
.sub _main @MAIN
	P0 = new Float
	set P0, 0
	P1 = n_neg P0
	print P1
	print "\n"
	set P0, -0.0
	n_neg P1, P0
	print P1
	print "\n"
	set P0, 123.4567890
	P1 = n_neg P0
	print P1
	print "\n"
	set P0, -123.4567890
	n_neg P1, P0
	print P1
	print "\n"
.end
CODE
0
0
-123.457
123.457
OUTPUT

pir_output_is(<<'CODE', <<OUTPUT, "take the absolute value of a Float");
.sub _main @MAIN
	P0 = new Integer
	set P0, 0
	P1 = n_abs P0
	print P1
	print "\n"
	set P0, -0.0
	n_abs P1, P0
	print P1
	print "\n"
	set P0, 123.45678901
	n_abs P1, P0
	print P1
	print "\n"
	set P0, -123.45678901
	P1 = n_abs P0
	print P1
	print "\n"
.end
CODE
0
0
123.457
123.457
OUTPUT

###
### FLOATVAL and INTVAL tests
###
pir_output_is(<<'CODE', <<OUTPUT, "add Integer to Float");
.sub _main @MAIN
	P10 = new Integer
	set P10, 4000
	P0 = new Float
	set P0, -123.123
	n_add P1, P0, P10
	print P1
	print "\n"
	P30 = P1
	P1 = n_add P0, P10
	print P1
	print "\n"
	## check that we are not reusing P1.
	ne_addr P30, P1, not_broken
	print "Broken!\n"
not_broken:
	P2 = n_add P10, P0
	print P2
	print "\n"
        P1 = n_add P1, P10
	print P1
	print "\n"
.end
CODE
3876.88
3876.88
3876.88
7876.88
OUTPUT

pir_output_is(<<'CODE', <<OUTPUT, "subtract Integer from Float");
.sub _main @MAIN
	P10 = new Integer
	set P10, 4000
	P0 = new Float
	set P0, -123.123
	n_sub P1, P0, P10
	print P1
	print "\n"
	P30 = P1
	P1 = n_sub P0, P10
	print P1
	print "\n"
	## check that we are not reusing P1.
	ne_addr P30, P1, not_broken
	print "Broken!\n"
not_broken:
	P2 = n_sub P10, P0
	print P2
	print "\n"
        P1 = n_sub P1, P10
	print P1
	print "\n"
.end
CODE
-4123.12
-4123.12
4123.12
-8123.12
OUTPUT

pir_output_is(<<'CODE', <<OUTPUT, "multiply Float with Integer");
.sub _main @MAIN
	P10 = new Integer
	set P10, 4000
	P0 = new Float
	set P0, -123.123
	n_mul P1, P0, P10
	print P1
	print "\n"
	P30 = P1
	P1 = n_mul P0, P10
	print P1
	print "\n"
	## check that we are not reusing P1.
	ne_addr P30, P1, not_broken
	print "Broken!\n"
not_broken:
	P1 = n_mul P10, P0
	print P1
	print "\n"
        P1 = n_mul P1, -2
	print P1
	print "\n"
.end
CODE
-492492
-492492
-492492
984984
OUTPUT

pir_output_is(<<'CODE', <<OUTPUT, "divide Float by Integer");
.sub _main @MAIN
	P10 = new Integer
	set P10, 4000
	P0 = new Float
	set P0, -123.123
	n_div P1, P0, P10
	print P1
	print "\n"
	P30 = P1
	P1 = n_div P0, P10
	print P1
	print "\n"
	## check that we are not reusing P1.
	ne_addr P30, P1, not_broken
	print "Broken!\n"
not_broken:
        P1 = n_div P0, 1
	print P1
	print "\n"
        set P0, 100.000
        P1 = n_div P0, 100
	print P1
	print "\n"
        P1 = n_div P1, 0.01
	print P1
	print "\n"
.end
CODE
-0.0307808
-0.0307808
-123.123
1
100
OUTPUT

###
### FLOATVAL and FLOATVAL tests
###
pir_output_is(<<'CODE', <<OUTPUT, "add Float to Float");
.sub _main @MAIN
	P0 = new Float
	set P0, 4000.246
	P1 = new Float
	set P1, -123.123
	P2 = new Float
	set P2, 6.66
	n_add P2, P0, P1
	print P2
	print "\n"
	P30 = P2
	P2 = n_add P0, P1
	print P2
	print "\n"
	## check that we are not reusing P2.
	ne_addr P30, P2, not_broken
	print "Broken!\n"
not_broken:
.end
CODE
3877.12
3877.12
OUTPUT

## This tests n_infix_ic_p_p_nc for n_add, n_sub, n_mul, and n_div.  Note that
## there is no n_infix_ic_p_nc_p op; the PMC argument always comes first.
pir_output_is(<<'CODE', <<OUTPUT, "add/sub/mul/div of Float with constants");
.sub _main @MAIN
	P0 = new Float
	set P0, 4000.246
	P1 = new Float
	set P1, -123.123
	P2 = n_add P1, 6.78
	print P2
	print "\n"
	P2 = n_add P0, 6.78
	print P2
	print "\n"
	P2 = n_mul P1, 6.78
	print P2
	print "\n"
	P2 = n_div P0, 6.78
	print P2
	print "\n"
.end
CODE
-116.343
4007.03
-834.774
590.007
OUTPUT

pir_output_is(<<'CODE', <<OUTPUT, "subtract Float from Float");
.sub _main @MAIN
	P0 = new Float
	set P0, 4000.246
	P1 = new Float
	set P1, -123.123
	P2 = new Float
	set P2, 6.66
	n_sub P2, P0, P1
	print P2
	print "\n"
	P30 = P2
	P2 = n_sub P1, P0
	print P2
	print "\n"
	## check that we are not reusing P2.
	ne_addr P30, P2, not_broken
	print "Broken!\n"
not_broken:
.end
CODE
4123.37
-4123.37
OUTPUT

pir_output_is(<<'CODE', <<OUTPUT, "multiply Float with Float");
.sub _main @MAIN
	P0 = new Float
	set P0, 400.0246
	P1 = new Float
	set P1, -123.123
	P2 = new Float
	set P2, 6.66
	n_mul P2, P0, P1
	print P2
	print "\n"
	P30 = P2
	P2 = n_mul P0, P1
	print P2
	print "\n"
	## check that we are not reusing P2.
	ne_addr P30, P2, not_broken
	print "Broken!\n"
not_broken:
.end
CODE
-49252.2
-49252.2
OUTPUT

pir_output_is(<<'CODE', <<OUTPUT, "divide Float by Float");
.sub _main @MAIN
	P0 = new Float
	set P0, 4000.246
	P1 = new Float
	set P1, -123.123
	P2 = new Float
	set P2, 6.66
	n_div P2, P1, P0
	print P2
	print "\n"
	P30 = P2
	P2 = n_div P0, P1
	print P2
	print "\n"
	## check that we are not reusing P2.
	ne_addr P30, P2, not_broken
	print "Broken!\n"
not_broken:
.end
CODE
-0.0307789
-32.4898
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "verify new PMC");
.sub main @MAIN
    P0 = new Integer
    P1 = P0
    P0 = n_add P0, 1
    print P0
    print "\n"
    eq_addr P0, P1, nok
    print "ok\n"
    end
nok:
    print "not ok\n"
.end
CODE
1
ok
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', ".pragma n_operators");
.pragma n_operators 1

.sub main @MAIN
    P0 = new Integer
    P1 = P0
    P0 = P0 + 1
    print P0
    print "\n"
    eq_addr P0, P1, nok
    print "ok\n"
    end
nok:
    print "not ok\n"
.end
CODE
1
ok
OUTPUT
