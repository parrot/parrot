#! perl -w

use Parrot::Test tests => 58;
use Test::More;

my $fp_equality_macro = <<'ENDOFMACRO';
fp_eq	macro	J,K,L
	save	N0
	save	N1
	save	N2

	set	N0, J
	set	N1, K
	sub	N2, N1,N0
	abs	N2, N2
	gt	N2, 0.000001, $FPEQNOK

	restore N2
	restore	N1
	restore	N0
	branch	L
$FPEQNOK:
	restore N2
	restore	N1
	restore	N0
endm
fp_ne	macro	J,K,L
	save	N0
	save	N1
	save	N2

	set	N0, J
	set	N1, K
	sub	N2, N1,N0
	abs	N2, N2
	lt	N2, 0.000001, $FPNENOK

	restore	N2
	restore	N1
	restore	N0
	branch	L
$FPNENOK:
	restore	N2
	restore	N1
	restore	N0
endm
ENDOFMACRO

output_is(<<'CODE', <<'OUTPUT', "newpmc");
	print "starting\n"
	new P0, PerlInt
	print "ending\n"
	end
CODE
starting
ending
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "set/print integer");
	new P0, PerlInt
	set P0, 123
	print P0
	print "\n"
	end
CODE
123
OUTPUT

#
# Let perl do the computation.
#
output_is(<<'CODE', <<OUTPUT, "add integer to self");
	new P0, PerlInt
	set P0, 123
	add P0, P0, P0
	print P0
	print "\n"
	end
CODE
246
OUTPUT

output_is(<<'CODE', <<OUTPUT, "sub integer from self");
	new P0, PerlInt
	set P0, 456
	sub P0, P0, P0
	print P0
	print "\n"
	end
CODE
0
OUTPUT

output_is(<<'CODE', <<OUTPUT, "multiply integer by self");
	new P0, PerlInt
	set P0, 124
	mul P0, P0, P0
	print P0
	print "\n"
	end
CODE
15376
OUTPUT

output_is(<<'CODE', <<OUTPUT, "divide integer by self");
	new P0, PerlInt
	set P0, 23
	div P0, P0, P0
	print P0
	print "\n"
	end
CODE
1.000000
OUTPUT

output_is(<<'CODE', <<OUTPUT, "add integer to other");
	new P0, PerlInt
	new P1, PerlInt
	set P0, 123
	set P1, 321
	add P1, P1, P0
	print P1
	print "\n"
	end
CODE
444
OUTPUT

output_is(<<'CODE', <<OUTPUT, "subtract integer from other");
	new P0, PerlInt
	new P1, PerlInt
	set P0, 123
	set P1, 321
	sub P1, P1, P0
	print P1
	print "\n"
	end
CODE
198
OUTPUT

output_is(<<'CODE', <<OUTPUT, "multiply integer by other");
	new P0, PerlInt
	new P1, PerlInt
	set P0, 123
	set P1, 321
	mul P1, P1, P0
	print P1
	print "\n"
	end
CODE
39483
OUTPUT

output_is(<<"CODE", <<OUTPUT, "divide integer by other");
@{[ $fp_equality_macro ]}
	new P0, PerlInt
	new P1, PerlInt
	set P0, 123
	set P1, 246
	div P1, P1, P0

	fp_eq P1, 2.0, EQ1
	print P1
	print "not "
EQ1:	print "ok 1"
	print "\\n"
	end
CODE
ok 1
OUTPUT

#
# Number tests
#
output_is(<<"CODE", <<OUTPUT, "add number to self");
@{[ $fp_equality_macro ]}
	new P0, PerlInt
	set P0, 123.123
	add P0, P0, P0
	fp_eq P0, 246.246, EQ1
	print P0
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "sub number from self");
@{[ $fp_equality_macro ]}
	new P0, PerlInt
	set P0, 456.456
	sub P0, P0, P0
	fp_eq P0, 0, EQ1
	print P0
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "multiply number by self");
@{[ $fp_equality_macro ]}
	new P0, PerlInt
	set P0, 124.124
	mul P0, P0, P0
	fp_eq P0, 15406.767376, EQ1
	print P0
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "divide number by self");
@{[ $fp_equality_macro ]}
	new P0, PerlInt
	set P0, 23.23
	div P0, P0, P0
	fp_eq P0, 1, EQ1
	print P0
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

#
# Number vs. number
#
output_is(<<"CODE", <<OUTPUT, "add number to other");
@{[ $fp_equality_macro ]}
	new P0, PerlInt
	new P1, PerlInt
	set P0, 123.123
	set P1, 321.321
	add P1, P1, P0
	fp_eq P1, 444.444, EQ1
	print P1
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "subtract number from other");
@{[ $fp_equality_macro ]}
	new P0, PerlInt
	new P1, PerlInt
	set P0, 123.123
	set P1, 321.321
	sub P1, P1, P0
	fp_eq P1, 198.198, EQ1
	print P1
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "multiply number by other");
@{[ $fp_equality_macro ]}
	new P0, PerlInt
	new P1, PerlInt
	set P0, 123.123
	set P1, 321.321
	mul P1, P1, P0
	fp_eq P1, 39562.005483, EQ1
	print P1
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "divide number by other");
@{[ $fp_equality_macro ]}
	new P0, PerlInt
	new P1, PerlInt
	set P0, 123.123
	set P1, 246.246
	div P1, P1, P0
	fp_eq P1, 2, EQ1
	print P1
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

#
# Number vs. integer
#
output_is(<<"CODE", <<OUTPUT, "add integer to number");
@{[ $fp_equality_macro ]}
	new P0, PerlInt
	new P1, PerlInt
	set P0, 123
	set P1, 321.321
	add P1, P1, P0
	fp_eq P1, 444.321, EQ1
	print P1
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "subtract integer from number");
@{[ $fp_equality_macro ]}
	new P0, PerlInt
	new P1, PerlInt
	set P0, 123
	set P1, 321.321
	sub P1, P1, P0
	fp_eq P1, 198.321, EQ1
	print P1
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "multiply integer by number");
@{[ $fp_equality_macro ]}
	new P0, PerlInt
	new P1, PerlInt
	set P0, 123
	set P1, 321.321
	mul P1, P1, P0
	fp_eq P1,39522.483 , EQ1
	print P1
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "divide integer by number");
@{[ $fp_equality_macro ]}
	new P0, PerlInt
	new P1, PerlInt
	set P0, 123
	set P1, 246.246
	div P1, P1, P0
	fp_eq P1, 2.002 , EQ1
	print P1
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

#
# Number vs. integer
#
output_is(<<"CODE", <<OUTPUT, "add integer to number");
@{[ $fp_equality_macro ]}
	new P0, PerlInt
	new P1, PerlInt
	set P0, 123
	set P1, 321.321
	add P1, P0, P1
	fp_eq P1, 444.321 , EQ1
	print P1
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "subtract integer from number");
@{[ $fp_equality_macro ]}
	new P0, PerlInt
	new P1, PerlInt
	set P0, 123
	set P1, 321.321
	sub P1, P0, P1
	fp_eq P1, -198.321000, EQ1
	print P1
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "multiply integer by number");
@{[ $fp_equality_macro ]}
	new P0, PerlInt
	new P1, PerlInt
	set P0, 123
	set P1, 321.321
	mul P1, P0, P1
	fp_eq P1, 39522.483, EQ1
	print P1
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "divide integer by number");
@{[ $fp_equality_macro ]}
	new P0, PerlInt
	new P1, PerlInt
	set P0, 123
	set P1, 246.246
	div P1, P0, P1
	fp_eq P1, 0.499500, EQ1
	print P1
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

#
# Concat tests
#
output_is(<<'CODE', <<OUTPUT, "concatenate integer to string");
	new P0, PerlInt
	new P1, PerlInt
	set P0, -5
	set P1, "foo"
	concat P0,P0,P1
	print P0
	print "\n"
	end
CODE
-5foo
OUTPUT

output_is(<<'CODE', <<OUTPUT, "concatenate string to integer");
	new P0, PerlInt
	new P1, PerlInt
	set P0, "foo"
	set P1, -7
	concat P0,P0,P1
	print P0
	print "\n"
	end
CODE
foo-7
OUTPUT

output_is(<<'CODE', <<OUTPUT, "concatenate number to string");
	new P0, PerlInt
	new P1, PerlInt
	set P0, 5.43
	set P1, "bar"
	concat P0,P0,P1
	print P0
	print "\n"
	end
CODE
5.430000bar
OUTPUT

output_is(<<'CODE', <<OUTPUT, "concatenate string to number");
	new P0, PerlInt
	new P1, PerlInt
	set P0, "bar"
	set P1, 2.7
	concat P0,P0,P1
	print P0
	print "\n"
	end
CODE
bar2.700000
OUTPUT

output_is(<<'CODE', <<OUTPUT, "concatenate string to string");
	new P0, PerlInt
	new P1, PerlInt
	set P0, "foo"
	set P1, "bar"
	concat P0,P0,P1
	print P0
	print "\n"
	end
CODE
foobar
OUTPUT

#
# Basic string number conversion
#
output_is(<<CODE, <<OUTPUT, "string to int");
	new	P0, PerlInt

	set	P0, "1"
	set	I0, P0
	print	I0
	print	P0
	print	"\\n"

	set	P0, " 1"
	set	I0, P0
	print	I0
	print	P0
	print	"\\n"

	set	P0, "-1"
	set	I0, P0
	print	I0
	print	P0
	print	"\\n"

	set	P0, "dull and void"
	set	I0, P0
	print	I0
	print	"\\n"

	set	P0, ""
	set	I0, P0
	print	I0
	print	"\\n"
	end
CODE
11
1 1
-1-1
0
0
OUTPUT

SKIP: { skip("string->int not finished yet", 1);
output_is(<<CODE, <<OUTPUT, "nasty string -> int");
	new	P0, PerlInt
	set	P0, "Z1"
	set	I0, P0
	print	I0
	print	P0
	print	"\\n"

	set	P0, "\0 1"
	set	I0, P0
	print	I0
	print	"\\n"

	set	P0, "1.23e2"
	set	I0, P0
	print	I0
	print	"\\n"
       end
CODE
1Z1
1
123
OUTPUT
}

output_is(<<CODE, <<OUTPUT, "string to number conversion");
@{[ $fp_equality_macro ]}
	new	P0, PerlInt

	set	P0, "1"
	set	N0, P0
	fp_eq	N0, 1, EQ1
	print	N0
	print	"not "
EQ1:	print	"ok 1\\n"

	set	P0, "1.2"
	set	N0, P0
	fp_eq	N0, 1.2, EQ2
	print	N0
	print	"not "
EQ2:	print	"ok 2\\n"

	set	P0, "1.2e1"
	set	N0, P0
	fp_eq	N0, 12, EQ3
	print	N0
	print	"not "
EQ3:	print	"ok 3\\n"

	set	P0, "1.2e-1"
	set	N0, P0
	fp_eq	N0, 0.12, EQ4
	print	N0
	print	"not "
EQ4:	print	"ok 4\\n"

	set	P0, "1.2e2.1"
	set	N0, P0
	fp_eq	N0, 120, EQ5
	print	N0
	print	"not "
EQ5:	print	"ok 5\\n"

	set	P0, "X1.2X"
	set	N0, P0
	fp_eq	N0, 1.2, EQ6
	print	N0
	print	"not "
EQ6:	print	"ok 6\\n"

	set	P0, "E1-1.2e+2"
	set	N0, P0
	fp_eq	N0, 1, EQ7
	print	N0
	print	"not "
EQ7:	print	"ok 7\\n"

	set	P0, "++-1"
	set	N0, P0
	fp_eq	N0, -1, EQ8
	print	N0
	print	"not "
EQ8:	print	"ok 8\\n"

	set	P0, "1234.1234.5"
	set	N0, P0
	fp_eq	N0, 1234.1234, EQ9
	print	N0
	print	"not "
EQ9:	print	"ok 9\\n"

	set	P0, "this is empty!"
	set	N0, P0
	fp_eq	N0, 0.0, EQ10
	print	N0
	print	" not "
EQ10:	print	"ok 10\\n"

	set	P0, "0e123"
	set	N0, P0
	fp_eq	N0, 0, EQ11
	print	N0
	print	" not "
EQ11:	print	"ok 11\\n"

	set	P0, "000000000000000000000000000000000000000001e-0"
	set	N0, P0
	fp_eq	N0, 1, EQ12
	print	N0
	print	" not "
EQ12:	print	"ok 12\\n"

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
OUTPUT

#
# Arithmetic operators
#
output_is(<<'CODE', <<OUTPUT, "add integer to string integer");
	new P0, PerlInt
	new P1, PerlInt
	set P0, 6
	set P1, "7"
	add P0,P0,P1
	print P0
	print "\n"
	end
CODE
13
OUTPUT

output_is(<<'CODE', <<OUTPUT, "add integer to string");
	new P0, PerlInt
	new P1, PerlInt
	set P0, 6
	set P1, "ab"
	add P0,P0,P1
	print P0
	print "\n"
	end
CODE
6
OUTPUT

output_is(<<"CODE", <<OUTPUT, "add integer to string number");
@{[ $fp_equality_macro ]}
	new P0, PerlInt
	new P1, PerlInt
	set P0, 6
	set P1, "7.5"
	add P0,P0,P1
	fp_eq P0, 13.5, EQ1
	print P0
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "add number to string integer");
@{[ $fp_equality_macro ]}
	new P0, PerlInt
	new P1, PerlInt
	set P0, 6.1
	set P1, "7"
	add P0,P0,P1
	fp_eq P0, 13.1, EQ1
	print P0
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "add number to string");
@{[ $fp_equality_macro ]}
	new P0, PerlInt
	new P1, PerlInt
	set P0, 6.1
	set P1, "ab"
	add P0,P0,P1
	fp_eq P0, 6.1, EQ1
	print P0
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "add number to string number");
@{[ $fp_equality_macro ]}
	new P0, PerlInt
	new P1, PerlInt
	set P0, 6.1
	set P1, "7.5"
	add P0,P0,P1
	fp_eq P0, 13.6, EQ1
	print P0
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<CODE, <<OUTPUT, "p =  p % p (int % int)");
	new 	P0, PerlInt
	new	P1, PerlInt
	new	P2, PerlInt
	set	P0, 11
	set	P1, 10
	mod	P2, P0, P1
	print	P2
	print	"\\n"
	end
CODE
1
OUTPUT

output_is(<<CODE, <<OUTPUT, "(int / int) -> float");
@{[ $fp_equality_macro ]}
	new 	P0, PerlInt
	new	P1, PerlInt
	new	P2, PerlInt
	set	P0, 1
	set	P1, 2
	div		P2, P0, P1
	fp_eq	P2, 0.5, EQ1
	print 	P2
	print	" not "
EQ1:	print 	"ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "copy");
	new P0, PerlInt
	new P1, PerlInt
	set P0, -3
	clone P1, P0
	print P1
	print "\n"
	set P0, 3.6
	clone P1, P0
	print P1
	print "\n"
	set P0, "foo"
	clone P1, P0
	print P1
	print "\n"
	end
CODE
-3
3.600000
foo
OUTPUT



output_is(<<CODE, <<OUTPUT, "if (P) - Int");
	new	P0, PerlInt

	set	P0, 1
	if	P0, OK1
	print	"not "
OK1:	print	"ok 1\\n"

	set	P0, 0
	if	P0, BAD2
	branch OK2
BAD2:	print	"not "
OK2:	print	"ok 2\\n"

	end
CODE
ok 1
ok 2
OUTPUT

output_is(<<CODE, <<OUTPUT, "if (P) - Num");
	new	P0, PerlInt

	set	P0, 1.1
	if	P0, OK1
	print	"not "
OK1:	print	"ok 1\\n"

	set	P0, 0.0
	if	P0, BAD2
	branch OK2
BAD2:	print	"not "
OK2:	print	"ok 2\\n"

	end
CODE
ok 1
ok 2
OUTPUT

output_is(<<CODE, <<OUTPUT, "if (P) - String");
	new	P0, PerlString

	set	P0, "I've told you once, I've told you twice..."
	if	P0, OK1
	print	"not "
OK1:	print	"ok 1\\n"

	set	P0, "0.0"
	if	P0, OK2
	print	"not "
OK2:	print	"ok 2\\n"

	set	P0, ""
	if	P0, BAD3
	branch OK3
BAD3:	print	"not "
OK3:	print	"ok 3\\n"

	set	P0, "0"
	if	P0, BAD4
	branch OK4
BAD4:	print	"not "
OK4:	print	"ok 4\\n"

	set	P0, "0e0"
	if	P0, OK5
	print	"not "
OK5:	print	"ok 5\\n"

	set	P0, "x"
	if	P0, OK6
	print	"not "
OK6:	print	"ok 6\\n"

	set	P0, "\0"
	if	P0, OK7
	print	"not "
OK7:	print	"ok 7\\n"

	set	P0, "\\n"
	if	P0, OK8
	print	"not "
OK8:	print	"ok 8\\n"

	set	P0, " "
	if	P0, OK9
	print	"not "
OK9:	print	"ok 9\\n"


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
OUTPUT

output_is(<<"CODE", <<'OUTPUT', "undef-logical");
	new P0, PerlUndef
	new P1, PerlUndef
	new P2, PerlInt

# undef or undef = 0
	or P0, P1, P1
	print P0

# undef and undef = 0
	and P0, P1, P1
	print P0

# undef or 1 = 1
	set P2, 349
	or P0, P1, P2
	print P0

# undef and 1 = 0
	and P0, P1, P2
	print P0

# not undef = 1
	not P0, P1
	print "x"
	print P1
	print "y"
	print P0
	print "z"
	print "\\n" 
	end
CODE
0010xy1z
OUTPUT

output_is(<<"CODE", <<'OUTPUT', "undef-add");
@{[ $fp_equality_macro ]}
	new P1, PerlUndef

# undef + perlundef 
	new P0, PerlUndef
	add P0, P1, P1
	print P0
	print "\\n" 

# undef + perlint 

	new P0, PerlUndef
	new P2, PerlInt
	set P2, 947
	add P0, P1, P2
	print P0
	print "\\n" 

# undef + perlnum 

	new P0, PerlUndef
	new P2, PerlNum
	set P2, 385.623
	add P0, P1, P2
	fp_eq P0, 385.623, OK

	print "not" 
OK:	print "ok"
	print "\\n"

	end
CODE
0
947
ok
OUTPUT

output_is(<<"CODE", <<'OUTPUT', "undef-subtract");
@{[ $fp_equality_macro ]}
	new P0, PerlUndef
	new P1, PerlUndef

# undef - undef
	sub P0, P1, P1
	print P0
	print "\\n"

# undef - perlint 
	new P2, PerlInt
	set P2, 947
	sub P0, P1, P2
	print P0
	print "\\n" 

# undef - perlnum 

	new P2, PerlNum
	set P2, 385.623
	sub P0, P1, P2
	fp_eq P0, -385.623, OK2

	print "not" 
OK2:	print "ok"
	print "\\n"


	end
CODE
0
-947
ok
OUTPUT

output_is(<<"CODE", <<'OUTPUT', "undef-multiply");
@{[ $fp_equality_macro ]}

	new P0, PerlUndef
	new P1, PerlUndef
	new P2, PerlInt

# Undef * Undef
	mul P0, P1, P1
	print P0
	print "\\n"

# Undef * PerlInt
	set P2, 983
	mul P0, P1, P2
	print P0
	print "\\n"

# Undef * PerlNum
	new P2, PerlNum
	set P2, 983.3
	mul P0, P1, P2
	print P0
	print "\\n"

	end
CODE
0
0
0
OUTPUT

output_is(<<"CODE", <<'OUTPUT', "undef-divide");
@{[ $fp_equality_macro ]}

	new P0, PerlUndef
	new P1, PerlUndef
	new P2, PerlInt

# Undef / PerlInt
	set P2, 19
	div P0, P1, P2
	print P0
	print "\\n"

# Undef / PerlNum
	new P2, PerlNum
	set P2, 343.8
	div P0, P1, P2
	print P0
	print "\\n"

	end
CODE
0
0
OUTPUT

output_is(<<"CODE", <<'OUTPUT', "undef-logical");
	new P0, PerlUndef
	new P1, PerlUndef
	new P2, PerlInt

# undef or undef = 0
	or P0, P1, P1
	print P0

# undef and undef = 0
	and P0, P1, P1
	print P0

# undef or 1 = 1
	set P2, 349
	or P0, P1, P2
	print P0

# undef and 1 = 0
	and P0, P1, P2
	print P0

# not undef = 1
	not P0, P1
	print "x"
	print P1
	print "y"
	print P0
	print "z"
	print "\\n" 
	end
CODE
0010xy1z
OUTPUT

output_is(<<"CODE", <<'OUTPUT', "undef-add");
@{[ $fp_equality_macro ]}
	new P1, PerlUndef

# undef + perlundef 
	new P0, PerlUndef
	add P0, P1, P1
	print P0
	print "\\n" 

# undef + perlint 

	new P0, PerlUndef
	new P2, PerlInt
	set P2, 947
	add P0, P1, P2
	print P0
	print "\\n" 

# undef + perlnum 

	new P0, PerlUndef
	new P2, PerlNum
	set P2, 385.623
	add P0, P1, P2
	fp_eq P0, 385.623, OK

	print "not" 
OK:	print "ok"
	print "\\n"

	end
CODE
0
947
ok
OUTPUT

output_is(<<"CODE", <<'OUTPUT', "undef-subtract");
@{[ $fp_equality_macro ]}
	new P0, PerlUndef
	new P1, PerlUndef

# undef - undef
	sub P0, P1, P1
	print P0
	print "\\n"

# undef - perlint 
	new P2, PerlInt
	set P2, 947
	sub P0, P1, P2
	print P0
	print "\\n" 

# undef - perlnum 

	new P2, PerlNum
	set P2, 385.623
	sub P0, P1, P2
	fp_eq P0, -385.623, OK2

	print "not" 
OK2:	print "ok"
	print "\\n"


	end
CODE
0
-947
ok
OUTPUT

output_is(<<"CODE", <<'OUTPUT', "undef-multiply");
@{[ $fp_equality_macro ]}

	new P0, PerlUndef
	new P1, PerlUndef
	new P2, PerlInt

# Undef * Undef
	mul P0, P1, P1
	print P0
	print "\\n"

# Undef * PerlInt
	set P2, 983
	mul P0, P1, P2
	print P0
	print "\\n"

# Undef * PerlNum
	new P2, PerlNum
	set P2, 983.3
	mul P0, P1, P2
	print P0
	print "\\n"

	end
CODE
0
0
0
OUTPUT

output_is(<<"CODE", <<'OUTPUT', "undef-divide");
@{[ $fp_equality_macro ]}

	new P0, PerlUndef
	new P1, PerlUndef
	new P2, PerlInt

# Undef / PerlInt
	set P2, 19
	div P0, P1, P2
	print P0
	print "\\n"

# Undef / PerlNum
	new P2, PerlNum
	set P2, 343.8
	div P0, P1, P2
	print P0
	print "\\n"

	end
CODE
0
0
OUTPUT

output_is(<<CODE, <<OUTPUT, "IntQueue test");
	new P0,IntQueue
	set P0,32
	set P0,-7

	set I0,P0
	eq I0,32,OK_1
	print "not "
OK_1:	print "ok 1\\n"

	if P0,OK_2
	print "not "
OK_2:	print "ok 2\\n"

	set I0,P0
	eq I0,-7,OK_3
	print "not "
OK_3:	print "ok 3\\n"

		if P0,NOT_OK_4
		print "ok 4\\n"
		branch DONE
NOT_OK_4:	print "not ok 4\\n"
DONE:

	end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<<CODE, <<OUTPUT, "IntQueue test");
	new P0,IntQueue
	set P0,32
	set P0,-7

	set I0,P0
	eq I0,32,OK_1
	print "not "
OK_1:	print "ok 1\\n"

	if P0,OK_2
	print "not "
OK_2:	print "ok 2\\n"

	set I0,P0
	eq I0,-7,OK_3
	print "not "
OK_3:	print "ok 3\\n"

		if P0,NOT_OK_4
		print "ok 4\\n"
		branch DONE
NOT_OK_4:	print "not ok 4\\n"
DONE:

	end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

1;
