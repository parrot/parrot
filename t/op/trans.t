#!/usr/local/bin/perl -w

use Parrot::Test tests => 18;
use Math::Trig qw( tan sec atan asin acos asec cosh sinh tanh sech );

# This defines two macros:
# fp_eq N, N, LABEL
# fp_ne N, N, LABEL
# which will conditionally branch
# to LABEL if abs(n,n) < epsilon

my $fp_equality_macro = <<'ENDOFMACRO';
fp_eq	macro	J,K,L
	save	J
	save	K
	pushn
	restore	N1
	restore	N0
	sub	N2, N1,N0
	abs	N2, N2
	gt	N2, 0.000001, $FPEQNOK
	popn
	branch	L
$FPEQNOK:	
	popn
endm
fp_ne	macro	J,K,L
	save	J
	save	K
	pushn
	restore	N1
	restore	N0
	sub	N2, N1,N0
	abs	N2, N2
	lt	N2, 0.000001, $FPNENOK
	popn
	branch	L
$FPNENOK:	
	popn
endm
ENDOFMACRO

output_is( <<"CODE", <<OUTPUT, "sin" );
@{[ $fp_equality_macro ]}
	set	N1, 1.0
	sin	N2, N1
	fp_eq	N2, 0.841471, EQ1
	print	"not "
EQ1:	print	"ok 1\\n"

	set 	I1, 1
	sin	N2, I1
	fp_eq	N2, 0.841471, EQ2
	print	"not "
EQ2:	print	"ok 2\\n"

	end
CODE
ok 1
ok 2
OUTPUT

output_is( <<"CODE", <<OUTPUT, "cos" );
@{[ $fp_equality_macro ]}
	set	N1, 1.0
	cos	N2, N1
	fp_eq	N2, 0.540302, EQ1
	print	"not "
EQ1:	print	"ok 1\\n"

	set	I1, 1
	cos	N2, I1
	fp_eq	N2, 0.540302, EQ2
	print	"not "
EQ2:	print	"ok 2\\n"
	end
CODE
ok 1
ok 2
OUTPUT

output_is( <<"CODE", <<OUTPUT, "tan" );
@{[ $fp_equality_macro ]}
    	set	N1, 1.0
    	tan	N2, N1
	fp_eq	N2, 1.557408, EQ1
	print	"not "
EQ1:	print	"ok 1\\n"

	set	I1, 1
	tan	N2, I1
	fp_eq	N2, 1.557408, EQ2
	print	"not "
EQ2:	print	"ok 2\\n"
	end
CODE
ok 1
ok 2
OUTPUT

output_is( <<"CODE", <<OUTPUT, "sec" );
@{[ $fp_equality_macro ]}
	set N1, 1.0
	sec N2, N1
	fp_eq	N2, 1.850816, EQ1
	print "not "
EQ1:	print "ok 1\\n"

	set I1, 1
	sec N2, I1
	fp_eq	N2, 1.850816, EQ2
	print "not "
EQ2:	print "ok 2\\n"
	end
CODE
ok 1
ok 2
OUTPUT

output_is( <<"CODE", <<OUTPUT, "atan" );
@{[ $fp_equality_macro ]}
	set N1, 1.0
	atan N2, N1
	fp_eq	N2, 0.785398, EQ1
	print "not "
EQ1:	print "ok 1\\n"

	set I1, 1
	atan N2, I1
	fp_eq	N2,0.785398 , EQ2
	print "not "
EQ2:	print "ok 2\\n"
	end
CODE
ok 1
ok 2
OUTPUT

output_is( <<"CODE", <<OUTPUT, "asin" );
@{[ $fp_equality_macro ]}
	set N1, 1.0
	asin N2, N1
	fp_eq	N2, 1.570796, EQ1
	print "not "
EQ1:	print "ok 1\\n"

	set I1, 1
	asin N2, I1
	fp_eq	N2, 1.570796 , EQ2
	print "not "
EQ2:	print "ok 2\\n"

	end
CODE
ok 1
ok 2
OUTPUT

output_is( <<"CODE", <<OUTPUT, "acos" );
@{[ $fp_equality_macro ]}
	set N1, 1.0
	acos N2, N1
	fp_eq	N2, 0.000000, EQ1
	print "not "
EQ1:	print "ok 1\\n"

	set I1, 1
	acos N2, I1
	fp_eq	N2, 0.000000, EQ2
	print "not "
EQ2:	print "ok 2\\n"

	end
CODE
ok 1
ok 2
OUTPUT

output_is( <<"CODE", <<OUTPUT, "asec" );
@{[ $fp_equality_macro ]}
	set N1, 1.0
	asec N2, N1
	fp_eq	N2, 0.000000, EQ1
	print "not "
EQ1:	print "ok 1\\n"

	set I1, 1
	asec N2, I1
	fp_eq	N2, 0.000000, EQ2
	print "not "
EQ2:	print "ok 2\\n"

	end
CODE
ok 1
ok 2
OUTPUT

output_is( <<"CODE", <<OUTPUT, "cosh" );
@{[ $fp_equality_macro ]}
	set N1, 1.0
	cosh N2, N1
	fp_eq	N2, 1.543081, EQ1
	print "not "
EQ1:	print "ok 1\\n"

	set I1, 1
	cosh N2, I1
	fp_eq	N2, 1.543081, EQ2
	print "not "
EQ2:	print "ok 2\\n"

	end
CODE
ok 1
ok 2
OUTPUT

output_is( <<"CODE", <<OUTPUT, "sinh" );
@{[ $fp_equality_macro ]}
	set N1, 1.0
	sinh N2, N1
	fp_eq	N2, 1.175201, EQ1
	print "not "
EQ1:	print "ok 1\\n"

	set I1, 1
	sinh N2, I1
	fp_eq	N2, 1.175201, EQ2
	print "not "
EQ2:	print "ok 2\\n"

	end
CODE
ok 1
ok 2
OUTPUT

output_is( <<"CODE", <<OUTPUT, "tanh" );
@{[ $fp_equality_macro ]}
	set N1, 1.0
	tanh N2, N1
	fp_eq	N2, 0.761594, EQ1
	print "not "
EQ1:	print "ok 1\\n"

	set I1, 1
	tanh N2, I1
	fp_eq	N2, 0.761594, EQ2
	print "not "
EQ2:	print "ok 2\\n"

	end
CODE
ok 1
ok 2
OUTPUT

output_is( <<"CODE", <<OUTPUT, "sech" );
@{[ $fp_equality_macro ]}
	set N1, 1.0
	sech N2, N1
	fp_eq	N2, 0.648054, EQ1
	print "not "
EQ1:	print "ok 1\\n"

	set I1, 1
	sech N2, I1
	fp_eq	N2, 0.648054, EQ2
	print "not "
EQ2:	print "ok 2\\n"

	end
CODE
ok 1
ok 2
OUTPUT

output_is( <<"CODE", <<OUTPUT, "atan" );
@{[ $fp_equality_macro]}
	set N1, 1.0
	set I1, 1
	set N2, 1.0
	set I2, 1
	atan N3, N1, N2
	fp_eq	N3, 0.785398, EQ1
	print "not "
EQ1:	print "ok 1\\n"

	atan N3, N1, I2
	fp_eq	N3, 0.785398, EQ2
	print "not "
EQ2:	print "ok 2\\n"

	atan N3, I1, N2
	fp_eq	N3, 0.785398, EQ3
	print "not "
EQ3:	print "ok 3\\n"

	atan N3, I1, I2
	fp_eq	N3, 0.785398, EQ4
	print "not "
EQ4:	print "ok 4\\n"
	end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is( <<"CODE", <<OUTPUT, "log2" );
@{[ $fp_equality_macro ]}
	set N1, 10.0
	log2 N2, N1
	fp_eq	N2, 3.321928, EQ1
	print "not "
EQ1:	print "ok 1\\n"

	set I1, 10
	log2 N2, I1
	fp_eq	N2, 3.321928, EQ2
	print "not "
EQ2:	print "ok 2\\n"

	end
CODE
ok 1
ok 2
OUTPUT

output_is( <<"CODE", <<OUTPUT, "log10" );
@{[ $fp_equality_macro ]}
	set N1, 15.0
	log10 N2, N1
	fp_eq	N2, 1.176091, EQ1
	print "not "
EQ1:	print "ok 1\\n"

	set I1, 15
	log10 N2, I1
	fp_eq	N2, 1.176091, EQ2
	print "not "
EQ2:	print "ok 2\\n"

	end
CODE
ok 1
ok 2
OUTPUT

output_is( <<"CODE", <<OUTPUT, "ln" );
@{[ $fp_equality_macro ]}
	set N1, 10.0
	ln N2, N1
	fp_eq	N2, 2.302585, EQ1
	print "not "
EQ1:	print "ok 1\\n"

	set I1, 10
	ln N2, I1
	fp_eq	N2, 2.302585, EQ2
	print "not "
EQ2:	print "ok 2\\n"
	end
CODE
ok 1
ok 2
OUTPUT

output_is( <<"CODE", <<OUTPUT, "exp" );
@{[ $fp_equality_macro ]}
	set N1, 10.0
	exp N2, N1
	fp_eq	N2, 22026.465795, EQ1
	print "not "
EQ1:	print "ok 1\\n"

	set I1, 10
	exp N2, I1
	fp_eq N2, 22026.465795, EQ2
	print "not "
EQ2:	print "ok 2\\n"
	end
CODE
ok 1
ok 2
OUTPUT

output_is( <<"CODE", <<OUTPUT, "pow" );
@{[ $fp_equality_macro ]}
	set N1, 3.0
	set I1, 3
	set N2, 5.0
	set I2, 5
	pow_n_n_n N3, N1, N2
	fp_eq	N3, 243.0, EQ1
	print "not "
EQ1:	print "ok 1\\n"

	pow_n_n_i N3, N1, I2
	fp_eq	N3, 243.0, EQ2
	print "not "
EQ2:	print "ok 2\\n"

	pow_n_i_n N3, I1, N2
	fp_eq	N3, 243.0, EQ3
	print "not "
EQ3:	print "ok 3\\n"

	pow_n_i_i N3, I1, I2
	fp_eq	N3, 243.0, EQ4
	print "not "
EQ4:	print "ok 4\\n"

	end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

1;