#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/op/arithmetics.t - Arithmetic Ops

=head1 SYNOPSIS

	% perl -Ilib t/op/arithmetics.t

=head1 DESCRIPTION

Tests basic arithmetic on various combinations of Parrot integer and
number types.

=cut

use Parrot::Test tests => 26;
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


#
# Operations on a single INTVAL
#
output_is(<<'CODE', <<OUTPUT, "take the negative of a native integer");
	set I0, 0
	neg I0
	print I0
	print "\n"
	set I0, 1234567890
	neg I0
	print I0
	print "\n"
	set I0, -1234567890
	neg I0
	print I0
	print "\n"
	set I0, 0
	set I1, 0
	neg I1, I0
	print I1
	print "\n"
	set I0, 1234567890
	neg I1, I0
	print I1
	print "\n"
	set I0, -1234567890
	neg I1, I0
	print I1
	print "\n"
 	end
CODE
0
-1234567890
1234567890
0
-1234567890
1234567890
OUTPUT

output_is(<<'CODE', <<OUTPUT, "take the absolute of a native integer");
	set I0, 0
	abs I0
	print I0
	print "\n"
	set I0, 1234567890
	abs I0
	print I0
	print "\n"
	set I0, -1234567890
	abs I0
	print I0
	print "\n"
	set I0, 0
	set I1, 0
	abs I1, I0
	print I1
	print "\n"
	set I0, 1234567890
	abs I1, I0
	print I1
	print "\n"
	set I0, -1234567890
	abs I1, I0
	print I1
	print "\n"
	end
CODE
0
1234567890
1234567890
0
1234567890
1234567890
OUTPUT

#
# first arg is INTVAL, second arg is INTVAL
#
output_is(<<'CODE', <<OUTPUT, "add native integer to native integer");
	set I0, 4000
	set I1, -123
	add I2, I0, I1
	print I2
	print "\n"
	add I0, I0, I1
	print I0
	print "\n"
	end
CODE
3877
3877
OUTPUT

output_is(<<'CODE', <<OUTPUT, "subtract native integer from native integer");
	set I0, 4000
	set I1, -123
	sub I2, I0, I1
	print I2
	print "\n"
	sub I0, I0, I1
	print I0
	print "\n"
	end
CODE
4123
4123
OUTPUT

output_is(<<'CODE', <<OUTPUT, "multiply native integer with native integer");
	set I0, 4000
	set I1, -123
	mul I2, I0, I1
	print I2
	print "\n"
	mul I0, I0, I1
	print I0
	print "\n"
	end
CODE
-492000
-492000
OUTPUT

output_is(<<'CODE', <<OUTPUT, "divide native integer by native integer");
	set I0, 4000
	set I1, -123
	div I2, I0, I1
	print I2
	print "\n"
	div I0, I0, I1
	print I0
	print "\n"
	end
CODE
-32
-32
OUTPUT

#
# Operations on a single NUMVAL
#
output_is(<<'CODE', <<OUTPUT, "turn a native number into it's negative");
	set N0, 0
	neg N0
	print N0
	print "\n"
	set N0, -0.0
	neg N0
	print N0
	print "\n"
	set N0, 123.4567890
	neg N0
	print N0
	print "\n"
	set N0, -123.4567890
	neg N0
	print N0
	print "\n"
	set N0, 0
	set N1, 1
	neg N1, N0
	print N1
	print "\n"
	set N0, -0.0
	neg N1, N0
	print N1
	print "\n"
	set N0, 123.4567890
	neg N1, N0
	print N1
	print "\n"
	set N0, -123.4567890
	neg N1, N0
	print N1
	print "\n"
	end
CODE
0.000000
0.000000
-123.456789
123.456789
0.000000
0.000000
-123.456789
123.456789
OUTPUT

output_is(<<'CODE', <<OUTPUT, "take the absolute of a native number");
	set N0, 0
	abs N0
	print N0
	print "\n"
	set N0, -0.0
	abs N0
	print N0
	print "\n"
	set N0, 123.45678901
	abs N0
	print N0
	print "\n"
	set N0, -123.45678901
	abs N0
	print N0
	print "\n"
	set N0, 0
	set N1, 1
	abs N1, N0
	print N1
	print "\n"
	set N0, 0.0
	set N1, 1
	abs N1, N0
	print N1
	print "\n"
	set N0, 123.45678901
	set N1, 1
	abs N1, N0
	print N1
	print "\n"
	set N0, -123.45678901
	set N1, 1
	abs N1, N0
	print N1
	print "\n"
	end
CODE
0.000000
0.000000
123.456789
123.456789
0.000000
0.000000
123.456789
123.456789
OUTPUT

output_is(<<'CODE', <<OUTPUT, "ceil of a native number");
       set N0, 0
       ceil N0
       print N0
       print "\n"
       set N0, 123.45678901
       ceil N0
       print N0
       print "\n"
       set N0, -123.45678901
       ceil N0
       print N0
       print "\n"
       set N0, 0
       set N1, 1
       ceil N1, N0
       print N1
       print "\n"
       set N0, 0.0
       set N1, 1
       ceil N1, N0
       print N1
       print "\n"
       set N0, 123.45678901
       set N1, 1
       ceil N1, N0
       print N1
       print "\n"
       set N0, -123.45678901
       set N1, 1
       ceil N1, N0
       print N1
       print "\n"
       set N0, 0
       set I1, 1
       ceil I1, N0
       print I1
       print "\n"
       set N0, 0.0
       set I1, 1
       ceil I1, N0
       print I1
       print "\n"
       set N0, 123.45678901
       set I1, 1
       ceil I1, N0
       print I1
       print "\n"
       set N0, -123.45678901
       set I1, 1
       ceil I1, N0
       print I1
       print "\n"
       end
CODE
0.000000
124.000000
-123.000000
0.000000
0.000000
124.000000
-123.000000
0
0
124
-123
OUTPUT

output_is(<<'CODE', <<OUTPUT, "floor of a native number");
       set N0, 0
       floor N0
       print N0
       print "\n"
       set N0, 123.45678901
       floor N0
       print N0
       print "\n"
       set N0, -123.45678901
       floor N0
       print N0
       print "\n"
       set N0, 0
       set N1, 1
       floor N1, N0
       print N1
       print "\n"
       set N0, 0.0
       set N1, 1
       floor N1, N0
       print N1
       print "\n"
       set N0, 123.45678901
       set N1, 1
       floor N1, N0
       print N1
       print "\n"
       set N0, -123.45678901
       set N1, 1
       floor N1, N0
       print N1
       print "\n"
       set N0, 0
       set I1, 1
       floor I1, N0
       print I1
       print "\n"
       set N0, 0.0
       set I1, 1
       floor I1, N0
       print I1
       print "\n"
       set N0, 123.45678901
       set I1, 1
       floor I1, N0
       print I1
       print "\n"
       set N0, -123.45678901
       set I1, 1
       floor I1, N0
       print I1
       print "\n"
       end
CODE
0.000000
123.000000
-124.000000
0.000000
0.000000
123.000000
-124.000000
0
0
123
-124
OUTPUT

#
# FLOATVAL and INTVAL tests
#
output_is(<<'CODE', <<OUTPUT, "add native integer to native number");
	set I0, 4000
	set N0, -123.123
	add N1, N0, I0
	print N1
	print "\n"
	add N0, N0, I0
	print N0
	print "\n"
        add N0, I0
	print N0
	print "\n"
	end
CODE
3876.877000
3876.877000
7876.877000
OUTPUT

output_is(<<'CODE', <<OUTPUT, "subtract native integer from native number");
	set I0, 4000
	set N0, -123.123
	sub N1, N0, I0
	print N1
	print "\n"
	sub N0, N0, I0
	print N0
	print "\n"
        sub N0, I0
	print N0
	print "\n"
	end
CODE
-4123.123000
-4123.123000
-8123.123000
OUTPUT

output_is(<<'CODE', <<OUTPUT, "multiply native number with native integer");
	set I0, 4000
	set N0, -123.123
	mul N1, N0, I0
	print N1
	print "\n"
	mul N0, N0, I0
	print N0
	print "\n"
        mul N0, -2
	print N0
	print "\n"
	end
CODE
-492492.000000
-492492.000000
984984.000000
OUTPUT

output_is(<<'CODE', <<OUTPUT, "divide native number by native integer");
	set I0, 4000
	set N0, -123.123
	div N1, N0, I0
	print N1
	print "\n"
	div N0, N0, I0
	print N0
	print "\n"
        div N0, 1
	print N0
	print "\n"
        set N0, 100.000
        div N0, 100
	print N0
	print "\n"
        div N0, 0.01
	print N0
	print "\n"
	end
CODE
-0.030781
-0.030781
-0.030781
1.000000
100.000000
OUTPUT

#
# FLOATVAL and FLOATVAL tests
#
output_is(<<'CODE', <<OUTPUT, "add native number to native number");
	set N2, 4000.246
	set N0, -123.123
	add N1, N0, N2
	print N1
	print "\n"
	add N0, N0, N2
	print N0
	print "\n"
	end
CODE
3877.123000
3877.123000
OUTPUT

output_is(<<'CODE', <<OUTPUT, "subtract native number from native number");
	set N2, 4000.246
	set N0, -123.123
	sub N1, N0, N2
	print N1
	print "\n"
	sub N0, N0, N2
	print N0
	print "\n"
	end
CODE
-4123.369000
-4123.369000
OUTPUT

output_is(<<'CODE', <<OUTPUT, "multiply native number with native number");
	set N2, 4000.246
	set N0, -123.123
	mul N1, N0, N2
	print N1
	print "\n"
	mul N0, N0, N2
	print N0
	print "\n"
	end
CODE
-492522.288258
-492522.288258
OUTPUT

output_is(<<'CODE', <<OUTPUT, "divide native number by native number");
	set N2, 4000.246
	set N0, -123.123
	div N1, N0, N2
	print N1
	print "\n"
	div N0, N0, N2
	print N0
	print "\n"
	end
CODE
-0.030779
-0.030779
OUTPUT



output_is(<<'CODE', <<OUTPUT, "lcm_I_I_I");
        set I0, 10
        set I1, 10
        lcm I2, I1, I0
        eq I2, 10, OK1
        print "not "
OK1:    print "ok 1\n"

        set I1, 17
        lcm I2, I1, I0
        eq I2, 170, OK2
        print I2
        print "not "
OK2:    print "ok 2\n"

        set I0, 17
        set I1, 10
        lcm I2, I1, I0
        eq I2, 170, OK3
        print "not "
OK3:    print "ok 3\n"

        set I0, 10
        set I1, 0
        lcm I2, I1, I0
        eq I2, 0, OK4
        print "not "
OK4:    print "ok 4\n"

        set I0, 0
        set I1, 10
        lcm I2, I1, I0
        eq I2, 0, OK5
        print "not "
OK5:    print "ok 5\n"

        end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
OUTPUT

output_is(<<'CODE', <<OUTPUT, "gcd(int,int,int)");
        set I0, 125
        set I1, 15
        gcd I2, I1, I0
        eq I2, 5, OK1
        print "not "
OK1:    print "ok 1\n"
        end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<OUTPUT, "is gcd(int,int,int) transitive?");
        set I0, 125
        set I1, 15
        gcd I2, I1, I0

	neg I0
        gcd I3, I1, I0
        eq I2, I3, OK1
	print I2
        print " not "
	print I3
OK1:    print "ok 1\n"

	neg I1
        gcd I3, I1, I0
        eq I2, I3, OK2
	print I2
        print " not "
	print I3
OK2:    print "ok 2\n"

	neg I0
	neg I1
        gcd I3, I1, I0
        eq I2, I3, OK3
	print I2
        print " not "
	print I3
OK3:    print "ok 3\n"
	end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<'CODE', <<OUTPUT, "gcd num (with whole numbers)");
        set N0, 125.0
        set N1, 15.0
        gcd I0, N1, N0
        eq I0, 5, OK1
        print "not "
OK1:    print "ok 1\n"
        end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<OUTPUT, "gcd num (2)");
        set N0, 12.3
        set N1, 24.6
        gcd I0, N1, N0
        eq I0, 12, OK1
	print I0
        print " not "
OK1:    print "ok 1\n"
        end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<OUTPUT, "is gcd(int,num,num) transitive?");
        set N0, 125
        set N1, 15
        gcd I2, N1, N0

	neg N0
        gcd I3, N1, N0
        eq I2, I3, OK1
	print I2
        print " not "
	print I3
OK1:    print "ok 1\n"

	neg N1
        gcd I3, N1, N0
        eq I2, I3, OK2
	print I2
        print " not "
	print I3
OK2:    print "ok 2\n"

	neg N0
	neg N1
        gcd I3, N1, N0
        eq I2, I3, OK3
	print I2
        print " not "
	print I3
OK3:    print "ok 3\n"
	end
CODE
ok 1
ok 2
ok 3
OUTPUT


output_is(<<'CODE', <<OUTPUT, "gcd - 5 args version");
        set I3, +100
        set I4,  +35
        gcd I0, I1, I2, I3, I4
	bsr output

        set I3, +100
        set I4,  -35
        gcd I0, I1, I2, I3, I4
	bsr output

        set I3, -100
        set I4,  -35
        gcd I0, I1, I2, I3, I4
	bsr output

        set I3, -100
        set I4,  +35
        gcd I0, I1, I2, I3, I4
	bsr output

        set I4, +100
        set I3,  +35
        gcd I0, I1, I2, I3, I4
	bsr output

        set I4, +100
        set I3,  -35
        gcd I0, I1, I2, I3, I4
	bsr output

        set I4, -100
        set I3,  -35
        gcd I0, I1, I2, I3, I4
	bsr output

        set I4, -100
        set I3,  +35
        gcd I0, I1, I2, I3, I4
	bsr output

	print "done\n"
	end

output:
	#I5 = I1*I3 + I2*I4
	mul I5, I1, I3
	mul I6, I2, I4
	add I5, I6

	print I0
        print " = "
	print I5
        print " = "
	print I1
        print "*"
	print I3
        print " + "
	print I2
        print "*"
	print I4
        print "\n"
        ret
CODE
5 = 5 = -1*100 + 3*35
5 = 5 = -1*100 + -3*-35
5 = 5 = 1*-100 + -3*-35
5 = 5 = 1*-100 + 3*35
5 = 5 = 3*35 + -1*100
5 = 5 = -3*-35 + -1*100
5 = 5 = -3*-35 + 1*-100
5 = 5 = 3*35 + 1*-100
done
OUTPUT

output_is(<<'CODE', <<OUTPUT, "is gcd(int,int,int,int,int) transitive?");
        set I0, 130
        set I1, -35
	gcd I7, I0, I1

	# +, +
        gcd I2, I3, I4, I0, I1
	mul I5, I3, I0
	mul I6, I4, I1
	add I5, I5, I6
	ne I2, I5, NOK1
        eq I2, I7, OK1
NOK1:
        print " not "
OK1:    print "ok 1\n"

	# -, +
	neg I0
        gcd I2, I3, I4, I0, I1
	mul I5, I3, I0
	mul I6, I4, I1
	add I5, I5, I6
	ne I2, I5, NOK2
        eq I2, I7, OK2
NOK2:
        print " not "
OK2:    print "ok 2\n"

	# -, -
	neg I1
        gcd I2, I3, I4, I0, I1
	mul I5, I3, I0
	mul I6, I4, I1
	add I5, I5, I6
	ne I2, I5, NOK3
        eq I2, I7, OK3
NOK3:
        print " not "
OK3:    print "ok 3\n"

	# +, -
	neg I0
        gcd I2, I3, I4, I0, I1
	mul I5, I3, I0
	mul I6, I4, I1
	add I5, I5, I6
	ne I2, I5, NOK4
        eq I2, I7, OK4
NOK4:
        print " not "
OK4:    print "ok 4\n"
	end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT
