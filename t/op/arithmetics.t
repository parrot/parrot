#! perl -w

use Parrot::Test tests => 30;
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


# PerlInt and PerlNum will be used as example PMCs
output_is(<<'CODE', <<'OUTPUT', "availability of PerlInt");
	print "starting\n"
	new P0, .PerlInt
	print "ending\n"
	end
CODE
starting
ending
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "availability of PerlNum");
	print "starting\n"
	new P0, .PerlNum
	print "ending\n"
	end
CODE
starting
ending
OUTPUT

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
	end
CODE
3876.877000
3876.877000
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
	end
CODE
-4123.123000
-4123.123000
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
	end
CODE
-492492.000000
-492492.000000
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
	end
CODE
-0.030781
-0.030781
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

#
# PerlInt and INTVAL tests
#
output_is(<<'CODE', <<OUTPUT, "add native integer to PerlInt");
	new P0, .PerlInt
	new P1, .PerlInt
	set I0, 4000
	set P0, 123
	add P1, P0, I0
	print P1
	print "\n"
	add P0, P0, I0
	print P0
	print "\n"
	end
CODE
4123
4123
OUTPUT

output_is(<<'CODE', <<OUTPUT, "subtract native integer from PerlInt");
	new P0, .PerlInt
	new P1, .PerlInt
	set I0, 4000
	set P0, 123
	sub P1, P0, I0
	print P1
	print "\n"
	sub P0, P0, I0
	print P0
	print "\n"
	end
CODE
-3877
-3877
OUTPUT

output_is(<<'CODE', <<OUTPUT, "multiply PerlInt with native integer");
	new P0, .PerlInt
	new P1, .PerlInt
	set I0, 4000
	set P0, 123
	mul P1, P0, I0
	print P1
	print "\n"
	mul P0, P0, I0
	print P0
	print "\n"
	end
CODE
492000
492000
OUTPUT

output_is(<<"CODE", <<OUTPUT, "divide PerlInt by native integer");
@{[ $fp_equality_macro ]}
	new P0, .PerlInt
	set I0, 4000
	set P0, 123
	div P0, P0, I0
	.fp_eq( P0, 0.03075, EQ1)
	print P0
	print "not "
EQ1:	print "ok 1"
	print "\\n"
	end
CODE
ok 1
OUTPUT

#
# PerlInt and FLOATVAL, tests
#
output_is(<<'CODE', <<OUTPUT, "add native number to integer");
	new P0, .PerlInt
	new P1, .PerlInt
	set N0, 4000.04
	set P0, 123
	add P1, P0, N0
	print P1
	print "\n"
	add P0, P0, N0
	print P1
	print "\n"
	end
CODE
4123.040000
4123.040000
OUTPUT

output_is(<<'CODE', <<OUTPUT, "subtract native number from integer");
	new P0, .PerlInt
	new P1, .PerlInt
	set N0, 4000.04
	set P0, 123
	sub P1, P0, N0
	print P1
	print "\n"
	sub P0, P0, N0
	print P0
	print "\n"
	end
CODE
-3877.040000
-3877.040000
OUTPUT

output_is(<<'CODE', <<OUTPUT, "multiply integer with native number");
	new P0, .PerlInt
	new P1, .PerlInt
	set N0, 4000.04
	set P0, 123
	mul P1, P0, N0
	print P1
	print "\n"
	mul P0, P0, N0
	print P0
	print "\n"
	end
CODE
492004.920000
492004.920000
OUTPUT

output_is(<<"CODE", <<OUTPUT, "divide integer by native number");
@{[ $fp_equality_macro ]}
	new P0, .PerlInt
	set N0, 4000
	set P0, 123
	div P0, P0, N0

	.fp_eq( P0, 0.03074969250307496925, EQ1)
	print P0
	print "not "
EQ1:	print "ok 1"
	print "\\n"
	end
CODE
ok 1
OUTPUT

#
# PerlNum and PerlNum, tests
#
output_is(<<'CODE', <<OUTPUT, "add PerlNum to PerlNum");
	new P0, .PerlNum
	new P1, .PerlNum
	set P1, 4000.04
	set P0, 123
	add P0, P0, P1
	print P0
	print "\n"
	end
CODE
4123.040000
OUTPUT

output_is(<<'CODE', <<OUTPUT, "subtract PerlNum from PerlNum");
	new P0, .PerlNum
	new P1, .PerlNum
	set P1, 4000.04
	set P0, 123
	sub P0, P0, P1
	print P0
	print "\n"
	end
CODE
-3877.040000
OUTPUT

output_is(<<'CODE', <<OUTPUT, "multiply PerlNum with PerlNum");
	new P0, .PerlNum
	new P1, .PerlNum
	set P1, 4000.04
	set P0, 123
	mul P0, P0, P1
	print P0
	print "\n"
	end
CODE
492004.920000
OUTPUT

output_is(<<"CODE", <<OUTPUT, "divide PerlNum by PerlNum");
@{[ $fp_equality_macro ]}
	new P0, .PerlNum
	new P1, .PerlNum
	set P1, 4000
	set P0, 123
	div P0, P0, P1

	.fp_eq( P0, 0.03074969250307496925, EQ1)
	print P0
	print "not "
EQ1:	print "ok 1"
	print "\\n"
	end
CODE
ok 1
OUTPUT
