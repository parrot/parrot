#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/perlnum.t - Perl Numbers

=head1 SYNOPSIS

	% perl t/pmc/perlnum.t

=head1 DESCRIPTION

Tests the C<PerlNum> PMC. Checks Perl-specific numeric behaviour.

=cut

use Parrot::Test tests => 35;

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

output_is(<<"CODE", <<OUTPUT, "add PerlNum to PerlNum");
@{[ $fp_equality_macro ]}
	new P0, .PerlNum
	new P1, .PerlNum
	set P1, 4000.04
	set P0, 123
	add P0, P0, P1
	.fp_eq( P0, 4123.04, EQ1)
	print "not "
EQ1:	print "ok 1"
	print "\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "subtract PerlNum from PerlNum");
@{[ $fp_equality_macro ]}
	new P0, .PerlNum
	new P1, .PerlNum
	set P1, 4000.04
	set P0, 123
	sub P0, P0, P1
	.fp_eq( P0, -3877.04, EQ1)
	print "not "
EQ1:	print "ok 1"
	print "\\n"
        new P2, .PerlNum
        new P3, .PerlNum
        new P4, .PerlNum
        set P2, 12.7
        set P3, 12.6
        sub P3, P2
	.fp_eq( P3, -0.1, EQ2)
	print "not "
EQ2:	print "ok 2"
	print "\\n"
	end
CODE
ok 1
ok 2
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

output_is(<<"CODE", <<OUTPUT, "add INTVAL to PerlNum");
@{[ $fp_equality_macro ]}
        new P0, .PerlNum
        new P1, .PerlNum

        set P0, 12.5
        add P1, P0, 12
        .fp_eq(P1, 24.5, OK1)
        print "not "
OK1:    print "ok 1\\n"

        add P0, -12
        .fp_eq(P0, 0.5, OK2)
        print "not "
OK2:    print "ok 2\\n"

        end
CODE
ok 1
ok 2
OUTPUT

output_is(<<"CODE", <<OUTPUT, "add FLOATVAL to PerlNum");
@{[ $fp_equality_macro ]}
        new P0, .PerlNum
        new P1, .PerlNum

        set P0, 12.5
        add P1, P0, 12.6
        .fp_eq(P1, 25.1, OK1)
        print "not "
OK1:    print "ok 1\\n"

        add P0, -100.2
        .fp_eq(P0, -87.7, OK2)
        print "not "
OK2:    print "ok 2\\n"
        end
CODE
ok 1
ok 2
OUTPUT

output_is(<<"CODE", <<OUTPUT, "subtract INTVAL from PerlNum");
@{[ $fp_equality_macro ]}
        new P0, .PerlNum
        new P1, .PerlNum

        set P0, 12.5
        sub P1, P0, 12
        .fp_eq(P1, 0.5, OK1)
        print "not "
OK1:    print "ok 1\\n"

        sub P0, -12
        .fp_eq(P0, 24.5, OK2)
        print "not "
OK2:    print "ok 2\\n"

        end
CODE
ok 1
ok 2
OUTPUT

output_is(<<"CODE", <<OUTPUT, "subtract FLOATVAL from PerlNum");
@{[ $fp_equality_macro ]}
        new P0, .PerlNum
        new P1, .PerlNum

        set P0, 12.5
        sub P1, P0, 12.6
        .fp_eq(P1, -0.1, OK1)
        print "not "
OK1:    print "ok 1\\n"

        sub P0, -100.2
        .fp_eq(P0, 112.7, OK2)
        print "not "
OK2:    print "ok 2\\n"
        end
CODE
ok 1
ok 2
OUTPUT

output_is(<<"CODE", <<OUTPUT, "multiply PerlNum by INTVAL");
@{[ $fp_equality_macro ]}
        new P0, .PerlNum
        new P1, .PerlNum

        set P0, 12.5
        mul P1, P0, 5
        .fp_eq(P1, 62.5, OK1)
        print "not "
OK1:    print "ok 1\\n"

        mul P0, -1
        .fp_eq(P0, -12.5, OK2)
        print "not "
OK2:    print "ok 2\\n"

        end
CODE
ok 1
ok 2
OUTPUT

output_is(<<"CODE", <<OUTPUT, "multiply PerlNum by FLOATVAL");
@{[ $fp_equality_macro ]}
        new P0, .PerlNum
        new P1, .PerlNum

        set P0, 12.5
        mul P1, P0, 12.5
        .fp_eq(P1, 156.25, OK1)
        print "not "
OK1:    print "ok 1\\n"

        mul P0, 2.2
        .fp_eq(P0, 27.5, OK2)
        print "not "
OK2:    print "ok 2\\n"
        end
CODE
ok 1
ok 2
OUTPUT

output_is(<<"CODE", <<OUTPUT, "divide PerlNum by INTVAL");
@{[ $fp_equality_macro ]}
        new P0, .PerlNum
        new P1, .PerlNum

        set P0, 12.5
        div P1, P0, 5
        .fp_eq(P1, 2.5, OK1)
        print "not "
OK1:    print "ok 1\\n"

        div P0, 10
        .fp_eq(P0, 1.25, OK2)
        print "not "
OK2:    print "ok 2\\n"

        end
CODE
ok 1
ok 2
OUTPUT

output_is(<<"CODE", <<OUTPUT, "divide PerlNum by FLOATVAL");
@{[ $fp_equality_macro ]}
        new P0, .PerlNum
        new P1, .PerlNum

        set P0, 12.5
        div P1, P0, 0.35
        .fp_eq(P1, 35.714286, OK1)
        print "not "
OK1:    print "ok 1\\n"

        div P0, 5.0
        .fp_eq(P0, 2.5, OK2)
        print "not "
OK2:    print "ok 2\\n"
        end
CODE
ok 1
ok 2
OUTPUT


output_is(<<"CODE", <<OUTPUT, "eq_p_n");
        new P0, .PerlNum

        set P0, 12.5
        eq P0, 12.5, OK1
        print "not "
OK1:    print "ok 1\\n"

        eq P0, 25.0, BAD2
        branch OK2 
BAD2:   print "not "
OK2:    print "ok 2\\n"
        end
CODE
ok 1
ok 2
OUTPUT


output_is(<<"CODE", <<OUTPUT, "ne_p_n");
        new P0, .PerlNum

        set P0, 12.5
        ne P0, 12.0, OK1
        print "not "
OK1:    print "ok 1\\n"

        ne P0, 12.5, BAD2
        branch OK2 
BAD2:   print "not "
OK2:    print "ok 2\\n"
        end
CODE
ok 1
ok 2
OUTPUT

output_is(<<"CODE", <<OUTPUT, "eq_num");
        new P0, .PerlNum
        new P1, .PerlNum

        set N0, 12.5
        set P0, N0
        set P1, N0

        eq_num P0, P1, OK1
        print "not "
OK1:    print "ok 1\\n"

        inc P1
        eq_num P0, P1, BAD2
        branch OK2 
BAD2:   print "not "
OK2:    print "ok 2\\n"

        new P2, .PerlInt
        set P2, N0
        eq_num P0, P2, OK3
        print "not "
OK3:    print "ok 3\\n"
        end
CODE
ok 1
ok 2
ok 3
OUTPUT
