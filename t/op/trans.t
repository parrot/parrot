#!perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/op/trans.t - Transcendental Mathematical Ops

=head1 SYNOPSIS

	% perl t/op/trans.t

=head1 DECSRIPTION

Tests the transcendental mathematical operations.

=cut

use Parrot::Test tests => 18;
use Math::Trig qw( tan sec atan asin acos asec cosh sinh tanh sech );

# This defines two macros:
# fp_eq N, N, LABEL
# fp_ne N, N, LABEL
# which will conditionally branch
# to LABEL if abs(n,n) < epsilon

my $fp_equality_macro = <<'ENDOFMACRO';
.macro fp_eq(J,K,L)
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
.macro fp_ne ( J,K,L )
	save	N0
	save	N1
	save	N2

	set	N0, .J
	set	N1, .K
	sub	N2, N1,N0
	abs	N2, N2
	lt	N2, 0.000001, $FPNENOK

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

output_is( <<"CODE", <<OUTPUT, "sin" );
@{[ $fp_equality_macro ]}
	set	N1, 1.0
	sin	N2, N1
	.fp_eq	(N2, 0.841471, EQ1)
	print	"not "
EQ1:	print	"ok 1\\n"

	set 	I1, 1
	sin	N2, I1
	.fp_eq	(N2, 0.841471, EQ2)
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
	.fp_eq	(N2, 0.540302, EQ1)
	print	"not "
EQ1:	print	"ok 1\\n"

	set	I1, 1
	cos	N2, I1
	.fp_eq	(N2, 0.540302, EQ2)
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
	.fp_eq	(N2, 1.557408, EQ1)
	print	"not "
EQ1:	print	"ok 1\\n"

	set	I1, 1
	tan	N2, I1
	.fp_eq	(N2, 1.557408, EQ2)
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
	.fp_eq	(N2, 1.850816, EQ1)
	print "not "
EQ1:	print "ok 1\\n"

	set I1, 1
	sec N2, I1
	.fp_eq	(N2, 1.850816, EQ2)
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
	.fp_eq	(N2, 0.785398, EQ1)
	print "not "
EQ1:	print "ok 1\\n"

	set I1, 1
	atan N2, I1
	.fp_eq	(N2,0.785398 , EQ2)
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
	.fp_eq	(N2, 1.570796, EQ1)
	print "not "
EQ1:	print "ok 1\\n"

	set I1, 1
	asin N2, I1
	.fp_eq	(N2, 1.570796 , EQ2)
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
	.fp_eq	(N2, 0.000000, EQ1)
	print "not "
EQ1:	print "ok 1\\n"

	set I1, 1
	acos N2, I1
	.fp_eq	(N2, 0.000000, EQ2)
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
	.fp_eq	(N2, 0.000000, EQ1)
	print "not "
EQ1:	print "ok 1\\n"

	set I1, 1
	asec N2, I1
	.fp_eq	(N2, 0.000000, EQ2)
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
	.fp_eq	(N2, 1.543081, EQ1)
	print "not "
EQ1:	print "ok 1\\n"

	set I1, 1
	cosh N2, I1
	.fp_eq	(N2, 1.543081, EQ2)
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
	.fp_eq	(N2, 1.175201, EQ1)
	print "not "
EQ1:	print "ok 1\\n"

	set I1, 1
	sinh N2, I1
	.fp_eq	(N2, 1.175201, EQ2)
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
	.fp_eq	(N2, 0.761594, EQ1)
	print "not "
EQ1:	print "ok 1\\n"

	set I1, 1
	tanh N2, I1
	.fp_eq	(N2, 0.761594, EQ2)
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
	.fp_eq	(N2, 0.648054, EQ1)
	print "not "
EQ1:	print "ok 1\\n"

	set I1, 1
	sech N2, I1
	.fp_eq	(N2, 0.648054, EQ2)
	print "not "
EQ2:	print "ok 2\\n"

	end
CODE
ok 1
ok 2
OUTPUT

output_is( <<"CODE", <<OUTPUT, "atan2" );
@{[ $fp_equality_macro]}
        set N0, 0.0
        set I0, 0
	set N1, 1.0
	set I1, 1
	set N2, 1.0
	set I2, 1
        set I3, -1
        set N3, -1.0

	atan N4, N1, N2
	.fp_eq	(N4, 0.785398, EQ1)
	print "not "
EQ1:	print "ok 1\\n"

	atan N4, N1, I2
	.fp_eq	(N4, 0.785398, EQ2)
	print "not "
EQ2:	print "ok 2\\n"

	atan N4, I1, N2
	.fp_eq	(N4, 0.785398, EQ3)
	print "not "
EQ3:	print "ok 3\\n"

	atan N4, I1, I2
	.fp_eq	(N4, 0.785398, EQ4)
	print "not "
EQ4:	print "ok 4\\n"
	
        atan N4, N3, 1.0
        .fp_eq   (N4, -0.785398, EQ5)
	print "not "
EQ5:	print "ok 5\\n"

        atan N4, N1, 0
        .fp_eq   (N4, 1.570796, EQ6)
	print "not "
EQ6:	print "ok 6\\n"

        atan N4, I3, 0.0
        .fp_eq   (N4, -1.570796, EQ7)
	print "not "
EQ7:	print "ok 7\\n"

        atan N4, I3, -1
        .fp_eq   (N4, -2.356194, EQ8)
	print "not "
EQ8:	print "ok 8\\n"

        atan N4, 1.0, N3
        .fp_eq   (N4, 2.356194, EQ9)
	print "not "
EQ9:	print "ok 9\\n"
        
        atan N4, 1.0, I0
        .fp_eq   (N4, 1.570796, EQ10)
	print "not "
EQ10:	print "ok 10\\n"

        atan N4, 1, N1
        .fp_eq   (N4, 0.785398, EQ11)
	print "not "
EQ11:	print "ok 11\\n"

        atan N4, 1, I1
        .fp_eq   (N4, 0.785398, EQ12)
	print "not "
EQ12:	print "ok 12\\n"

        atan N4, 0.0, 1.0
        .fp_eq   (N4, 0.000000, EQ13)
	print "not "
EQ13:	print "ok 13\\n"

        atan N4, -1.0, 0
        .fp_eq   (N4, -1.570796, EQ14)
	print "not "
EQ14:	print "ok 14\\n"

        atan N4, 1, -1.0
        .fp_eq   (N4, 2.356194, EQ15)
	print "not "
EQ15:	print "ok 15\\n"

        atan N4, 0, 1
        .fp_eq   (N4, 0.000000, EQ16)
	print "not "
EQ16:	print "ok 16\\n"
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
ok 13
ok 14
ok 15
ok 16
OUTPUT

output_is( <<"CODE", <<OUTPUT, "log2" );
@{[ $fp_equality_macro ]}
	set N1, 10.0
	log2 N2, N1
	.fp_eq	(N2, 3.321928, EQ1)
	print "not "
EQ1:	print "ok 1\\n"

	set I1, 10
	log2 N2, I1
	.fp_eq	(N2, 3.321928, EQ2)
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
	.fp_eq	(N2, 1.176091, EQ1)
	print "not "
EQ1:	print "ok 1\\n"

	set I1, 15
	log10 N2, I1
	.fp_eq	(N2, 1.176091, EQ2)
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
	.fp_eq	(N2, 2.302585, EQ1)
	print "not "
EQ1:	print "ok 1\\n"

	set I1, 10
	ln N2, I1
	.fp_eq	(N2, 2.302585, EQ2)
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
	.fp_eq	(N2, 22026.465795, EQ1)
	print "not "
EQ1:	print "ok 1\\n"

	set I1, 10
	exp N2, I1
	.fp_eq (N2, 22026.465795, EQ2)
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
	pow N3, N1, N2
	.fp_eq	(N3, 243.0, EQ1)
	print "not "
EQ1:	print "ok 1\\n"

	pow N3, N1, I2
	.fp_eq	(N3, 243.0, EQ2)
	print "not "
EQ2:	print "ok 2\\n"

	pow N3, I1, N2
	.fp_eq	(N3, 243.0, EQ3)
	print "not "
EQ3:	print "ok 3\\n"

	pow N3, I1, I2
	.fp_eq	(N3, 243.0, EQ4)
	print "not "
EQ4:	print "ok 4\\n"

        set N0, 0.0
        set I0, 0
        set N1, 1.0
        set I1, 1
        set N2, 4.0
        set I2, 4
	pow N3, N2, 2.5 
	.fp_eq	(N3, 32.0, EQ5)
	print "not "
EQ5:	print "ok 5\\n"

	pow N3, N2, -2
	.fp_eq	(N3, 0.0625, EQ6)
	print "not "
EQ6:	print "ok 6\\n"

	pow N3, I2, 0.5
	.fp_eq	(N3, 2.0, EQ7)
	print "not "
EQ7:	print "ok 7\\n"

	pow N3, I2, 0
	.fp_eq	(N3, 1.0, EQ8)
	print "not "
EQ8:	print "ok 8\\n"

	pow N3, 0.0, N2
	.fp_eq	(N3, 0.0, EQ9)
	print "not "
EQ9:	print "ok 9\\n"

	pow N3, 2.5, 0.0
	.fp_eq	(N3, 1.0, EQ10)
	print "not "
EQ10:	print "ok 10\\n"

	pow N3, 2.5, I2
	.fp_eq	(N3, 39.0625, EQ11)
	print "not "
EQ11:	print "ok 11\\n"

	pow N3, 2.0, -4
	.fp_eq	(N3, 0.0625, EQ12)
	print "not "
EQ12:	print "ok 12\\n"

	pow N3, 0, N2
	.fp_eq	(N3, 0.0, EQ13)
	print "not "
EQ13:	print "ok 13\\n"

	pow N3, 4, -0.5
	.fp_eq	(N3, 0.5, EQ14)
	print "not "
EQ14:	print "ok 14\\n"

	pow N3, 4, I2
	.fp_eq	(N3, 256.0, EQ15)
	print "not "
EQ15:	print "ok 15\\n"

	pow N3, 4, -1
	.fp_eq	(N3, 0.25, EQ16)
	print "not "
EQ16:	print "ok 16\\n"
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
ok 13
ok 14
ok 15
ok 16
OUTPUT

1;
