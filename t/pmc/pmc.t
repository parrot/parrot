#! perl -w

use Parrot::Test tests => 40;

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
	new P0, 0
	print "ending\n"
	end
CODE
starting
ending
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "set/print integer");
	new P0, 0
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
	new P0, 0
	set P0, 123
	add P0, P0, P0
	print P0
	print "\n"
	end
CODE
246
OUTPUT

output_is(<<'CODE', <<OUTPUT, "sub integer from self");
	new P0, 0
	set P0, 456
	sub P0, P0, P0
	print P0
	print "\n"
	end
CODE
0
OUTPUT

output_is(<<'CODE', <<OUTPUT, "multiply integer by self");
	new P0, 0
	set P0, 124
	mul P0, P0, P0
	print P0
	print "\n"
	end
CODE
15376
OUTPUT

output_is(<<'CODE', <<OUTPUT, "divide integer by self");
	new P0, 0
	set P0, 23
	div P0, P0, P0
	print P0
	print "\n"
	end
CODE
1
OUTPUT

output_is(<<'CODE', <<OUTPUT, "add integer to other");
	new P0, 0
	new P1, 0
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
	new P0, 0
	new P1, 0
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
	new P0, 0
	new P1, 0
	set P0, 123
	set P1, 321
	mul P1, P1, P0
	print P1
	print "\n"
	end
CODE
39483
OUTPUT

output_is(<<'CODE', <<OUTPUT, "divide integer by other");
	new P0, 0
	new P1, 0
	set P0, 123
	set P1, 246
	div P1, P1, P0
	print P1
	print "\n"
	end
CODE
2
OUTPUT

#
# Number tests
#
output_is(<<"CODE", <<OUTPUT, "add number to self");
@{[ $fp_equality_macro ]}
	new P0, 0
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
	new P0, 0
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
	new P0, 0
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
	new P0, 0
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
	new P0, 0
	new P1, 0
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
	new P0, 0
	new P1, 0
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
	new P0, 0
	new P1, 0
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
	new P0, 0
	new P1, 0
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
	new P0, 0
	new P1, 0
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
	new P0, 0
	new P1, 0
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
	new P0, 0
	new P1, 0
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
	new P0, 0
	new P1, 0
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
	new P0, 0
	new P1, 0
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
	new P0, 0
	new P1, 0
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
	new P0, 0
	new P1, 0
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
	new P0, 0
	new P1, 0
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
	new P0, 0
	new P1, 0
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
	new P0, 0
	new P1, 0
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
	new P0, 0
	new P1, 0
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
	new P0, 0
	new P1, 0
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
	new P0, 0
	new P1, 0
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
	new	P0, 0

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

	end
CODE
11
1 1
-1-1
OUTPUT

SKIP: { skip("sting->num not finished yet", 1);
output_is(<<CODE, <<OUTPUT, "nasty string -> int");
	new	P0, 0
	set	P0, "Z1"
	set	I0, P0
	print	I0
	print	P0
	print	"\\n"

	set	P0, "\0 1"
	set	I0, P0
	print	I0
	print	"\\n"
CODE
1Z1
1
OUTPUT
}
#
# Arithmetic operators
#
output_is(<<'CODE', <<OUTPUT, "add integer to string integer");
	new P0, 0
	new P1, 0
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
	new P0, 0
	new P1, 0
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
	new P0, 0
	new P1, 0
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
	new P0, 0
	new P1, 0
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
	new P0, 0
	new P1, 0
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
	new P0, 0
	new P1, 0
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
	new 	P0, 0
	new	P1, 0
	new	P2, 0
	set	P0, 11
	set	P1, 10
	mod	P2, P0, P1
	print	P2
	print	"\\n"
	end
CODE
1
OUTPUT

1;
