#! perl -w

use Parrot::Test tests => 20;

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

output_is(<<"CODE", <<OUTPUT, "add number to self");
@{[ $fp_equality_macro ]}
	new P0, .PerlNum
	set P0, 123.123
	add P0, P0, P0
	.fp_eq( P0, 246.246, EQ1)
	print P0
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "sub number from self");
@{[ $fp_equality_macro ]}
	new P0, .PerlNum
	set P0, 456.456
	sub P0, P0, P0
	.fp_eq( P0, 0, EQ1)
	print P0
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "multiply number by self");
@{[ $fp_equality_macro ]}
	new P0, .PerlNum
	set P0, 124.124
	mul P0, P0, P0
	.fp_eq( P0, 15406.767376, EQ1)
	print P0
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "divide number by self");
@{[ $fp_equality_macro ]}
	new P0, .PerlNum
	set P0, 23.23
	div P0, P0, P0
	.fp_eq( P0, 1, EQ1)
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
	new P0, .PerlNum
	new P1, .PerlNum
	set P0, 123.123
	set P1, 321.321
	add P1, P1, P0
	.fp_eq( P1, 444.444, EQ1)
	print P1
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "subtract number from other");
@{[ $fp_equality_macro ]}
	new P0, .PerlNum
	new P1, .PerlNum
	set P0, 123.123
	set P1, 321.321
	sub P1, P1, P0
	.fp_eq( P1, 198.198, EQ1)
	print P1
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "multiply number by other");
@{[ $fp_equality_macro ]}
	new P0, .PerlNum
	new P1, .PerlNum
	set P0, 123.123
	set P1, 321.321
	mul P1, P1, P0
	.fp_eq( P1, 39562.005483, EQ1)
	print P1
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "divide number by other");
@{[ $fp_equality_macro ]}
	new P0, .PerlNum
	new P1, .PerlNum
	set P0, 123.123
	set P1, 246.246
	div P1, P1, P0
	.fp_eq( P1, 2, EQ1)
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
	new P0, .PerlInt
	new P1, .PerlNum
	set P0, 123
	set P1, 321.321
	add P1, P1, P0
	.fp_eq( P1, 444.321, EQ1)
	print P1
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "subtract integer from number");
@{[ $fp_equality_macro ]}
	new P0, .PerlInt
	new P1, .PerlNum
	set P0, 123
	set P1, 321.321
	sub P1, P1, P0
	.fp_eq( P1, 198.321, EQ1)
	print P1
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "multiply integer by number");
@{[ $fp_equality_macro ]}
	new P0, .PerlInt
	new P1, .PerlNum
	set P0, 123
	set P1, 321.321
	mul P1, P1, P0
	.fp_eq( P1,39522.483 , EQ1)
	print P1
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "divide integer by number");
@{[ $fp_equality_macro ]}
	new P0, .PerlInt
	new P1, .PerlNum
	set P0, 123
	set P1, 246.246
	div P1, P1, P0
	.fp_eq( P1, 2.002 , EQ1)
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
	new P0, .PerlInt
	new P1, .PerlNum
	set P0, 123
	set P1, 321.321
	add P1, P0, P1
	.fp_eq( P1, 444.321 , EQ1)
	print P1
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "subtract integer from number");
@{[ $fp_equality_macro ]}
	new P0, .PerlInt
	new P1, .PerlNum
	set P0, 123
	set P1, 321.321
	sub P1, P0, P1
	.fp_eq( P1, -198.321000, EQ1)
	print P1
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "multiply integer by number");
@{[ $fp_equality_macro ]}
	new P0, .PerlInt
	new P1, .PerlNum
	set P0, 123
	set P1, 321.321
	mul P1, P0, P1
	.fp_eq( P1, 39522.483, EQ1)
	print P1
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "divide integer by number");
@{[ $fp_equality_macro ]}
	new P0, .PerlInt
	new P1, .PerlNum
	set P0, 123
	set P1, 246.246
	div P1, P0, P1
	.fp_eq( P1, 0.499500, EQ1)
	print P1
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<OUTPUT, "add number  number gives int");
	new P0, .PerlNum
	new P1, .PerlNum
	set P0, 4.2
	set P1, 2.8
	add P0, P1
	print P0
	print "\n"
	end
CODE
7
OUTPUT

output_is(<<'CODE', <<OUTPUT, "sub number  number gives int");
	new P0, .PerlNum
	new P1, .PerlNum
	set P0, 4.2
	set P1, 2.2
	sub P0, P1
	print P0
	print "\n"
	end
CODE
2
OUTPUT

output_is(<<'CODE', <<OUTPUT, "mul number  number gives int");
	new P0, .PerlNum
	new P1, .PerlNum
	set P0, 4.5
	set P1, 2.0
	mul P0, P1
	print P0
	print "\n"
	end
CODE
9
OUTPUT

output_is(<<'CODE', <<OUTPUT, "divide number by number gives int");
	new P0, .PerlNum
	new P1, .PerlNum
	set P0, 4.2
	set P1, 2.1
	div P0, P1
	print P0
	print "\n"
	end
CODE
2
OUTPUT
