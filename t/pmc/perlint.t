#! perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/perlint.t - Perl Integers

=head1 SYNOPSIS

	% perl -Ilib t/pmc/perlint.t

=head1 DESCRIPTION

Tests the PerlInt PMC. Checks Perl-specific integer behaviour.

=cut

use Parrot::Test tests => 70;
use Parrot::PMC '%pmc_types';

my $perlint = $pmc_types{'PerlInt'};
my $ok = '"ok 1\n"';
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

warn "failed to get type of PerlInt!" unless defined $perlint;

output_is(<<"CODE", <<'OUTPUT', ".PerlInt == $perlint");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
# type
    set I0, I23
    eq I0,$perlint,ok_1
    print "value of .PerlInt is "
    print I0
    print " and not $perlint\\nnot "
ok_1:
    print $ok
    end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<'OUTPUT', "type");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
    new P0,I23
# type
    typeof I0,P0
    eq I0,$perlint,ok_1
    print "not "
ok_1:
    print $ok
    end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "inheritance");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
    new P0,I23
# clone
    set P0, 10
    clone P1, P0
    set P1, 20
    set I0, P0
    eq I0,10,ok_1
    print "not "
ok_1:
    print "ok 1\n"
    set I0, P1
    eq I0,20,ok_2
    print "not "
ok_2:
    print "ok 2\n"
    end
CODE
ok 1
ok 2
OUTPUT

output_is(<<CODE, <<'OUTPUT', "copy");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
@{[ $fp_equality_macro ]}
	new P0, I23
	new P1, I23
	set P0, -3
	clone P1, P0
        set I1, P1
	eq I1, -3, EQ1
	print I1
	print	"not "
EQ1:	print 	"ok 1\\n"
	set P0, 3.6
	clone P1, P0
	.fp_eq(P1, 3.6, EQ2)
	print P1
	print	"not "
EQ2:	print 	"ok 2\\n"
	set P0, "foo"
	clone P1, P0
        set S1, P1
	eq S1, "foo", EQ3
	print S1
	print	"not "
EQ3:	print 	"ok 3\\n"
	end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "set/print integer");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
	new P0, I23
	set P0, 123
	print P0
	print "\n"
	end
CODE
123
OUTPUT

output_is(<<CODE, <<OUTPUT, "if (P) - Int");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
	new	P0, I23

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

output_is(<<CODE, <<OUTPUT, "unless (P) - Int");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
	new	P0, I23

	set	P0, 0
	unless	P0, OK1
	print	"not "
OK1:	print	"ok 1\\n"

	set	P0, 1
	unless	P0, BAD2
	branch OK2
BAD2:	print	"not "
OK2:	print	"ok 2\\n"

	end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<OUTPUT, "inc, PerlInt");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
    new P3, I23
    set P3, 0
    inc P3
    print P3
    print "\n"

LP: inc P3
    set I3, P3
    lt I3, 1000, LP
    print P3
    print "\n"

    end
CODE
1
1000
OUTPUT

output_is(<<'CODE', <<OUTPUT, "dec, PerlInt");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
    new P3, I23
    set P3, 0
    dec P3
    print P3
    print "\n"

LP: dec P3
    set I3, P3
    gt I3, -2000, LP
    print P3
    print "\n"

    end
CODE
-1
-2000
OUTPUT

output_is(<<CODE, <<OUTPUT, "mul_p_p, PerlInt");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
@{[ $fp_equality_macro ]}
        new P0,I23
        new P1,I23
        set P0,8
        set P1,2
        mul P0,P1
        .fp_eq(P0,16,EQ1)
        print "not "
EQ1:   print "ok 1"
        print "\\n"

        new P2, I24
        set P2, 0.0625
        mul P0, P2
        .fp_eq(P0,1,EQ2)
        print "not "
EQ2:   print "ok 2"
        print "\\n"
        end
CODE
ok 1
ok 2
OUTPUT

output_is(<<CODE, <<OUTPUT, "mul_p_i, PerlInt");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
@{[ $fp_equality_macro ]}
        new P0,I23
        set P0,8
        mul P0,2
        .fp_eq(P0,16,EQ1)
        print "not "
EQ1:    print "ok 1"
        print "\\n"
        end
CODE
ok 1
OUTPUT

output_is(<<CODE, <<OUTPUT, "div_p_i, PerlInt");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
@{[ $fp_equality_macro ]}
        new P0,I23
        set P0,8
        div P0,2
        .fp_eq(P0,4,EQ1)
        print "not "
EQ1:    print "ok 1"
        print "\\n"
        end
CODE
ok 1
OUTPUT

output_is(<<CODE, <<OUTPUT, "mod_p_i, PerlInt");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
@{[ $fp_equality_macro ]}
        new P0,I23
        set P0,3
        mod P0,6
        .fp_eq(P0,3,EQ1)
        print "not "
EQ1:    print "ok 1"
        print "\\n"
        end
CODE
ok 1
OUTPUT

output_is(<<CODE, <<OUTPUT, "mod_p_p_i, PerlInt");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
@{[ $fp_equality_macro ]}
        new P0,I23
        set P0,7
        new P1,I23
        mod P1, P0, 6
        .fp_eq(P1,1,EQ1)
        print "not "
EQ1:    print "ok 1"
        print "\\n"
        end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "bor");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
    new P0, I23
    set P0, 0b11110000
    bor P0, 0b00001111
    print P0
    print "\n"

    new P1, I23
    set P0, 0
    set P1, 12
    bor P0, P1
    print P0
    print "\n"

    new P1, I24
    set P1, 47.11
    set P0, 7
    bor P1, P0, 8
    print P1
    print "\n"

    new P2, I25
    set P2, "String"
    set P0, 128
    set P1, 1
    bor P2, P0, P1
    print P2
    print "\n"

    new P4, I21
    set P0, 12
    set P1, 24
    bor P4, P0, P1
    print P4
    print "\n"
    end
CODE
255
12
15
129
28
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "bxor");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
    new P0, I23
    set P0, 0b11111000
    bxor P0, 0b00011111
    print P0
    print "\n"

    new P1, I23
    set P0, 16
    set P1, 31
    bxor P0, P1
    print P0
    print "\n"

    new P1, I24
    set P1, 47.11
    set P0, 7
    bxor P1, P0, 7
    print P1
    print "\n"

    new P2, I25
    set P2, "String"
    set P0, 127
    set P1, 1
    bxor P2, P0, P1
    print P2
    print "\n"

    new P4, I21
    set P0, 200
    set P1, 100
    bxor P4, P0, P1
    print P4
    print "\n"
    end
CODE
231
15
0
126
172
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "band");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
    new P0, I23
    set P0, 0b10101010
    band P0, 0b10011001
    print P0
    print "\n"

    new P1, I23
    new P2, I23
    set P1, 255
    set P2, 29
    band P1, P2
    print P1
    print "\n"

    new P3, I24
    set P3, 3.14
    set P1, 0b00001111
    set P2, 0b00001100
    band P3, P1, P2
    print P3
    print "\n"

    new P3, I25
    set P3, "Foo"
    band P3, P1, 0b00001100
    print P3
    print "\n"

    new P3, I21
    set P1, 100
    set P2, 100
    band P3, P1, P2
    print P3
    print "\n"
    end
CODE
136
29
12
12
100
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "bnot");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
    new P0, I26

# We use band in these tests to null out the high bits, and make the
# tests independent of the size of our INTVALs
    bnot P0, P0
    band P0, 0b01010101
    print P0
    print "\n"

    new P0, I26
    new P1, I23
    set P1, 0b01100110
    bnot P0, P1
    band P0, 0b10011001
    print P0
    print "\n"
    end
CODE
85
153
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "bnot");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
    new P0, I23
    set P0, 0b10101010

# We use band in these tests to null out the high bits, and make the
# tests independent of the size of our INTVALs
    bnot P0, P0
    band P0, 0b01010101
    print P0
    print "\n"

    new P1, I23
    set P0, 0b01100110
    bnot P1, P0
    band P1, 0b10011001
    print P1
    print "\n"

    new P1, I24
    set P0, 0b00001111
    bnot P1, P0
    band P1, 0b11110000
    print P1
    print "\n"

    new P1, I25
    set P0, 0b00110011
    bnot P1, P0
    band P1, 0b11001100
    print P1
    print "\n"

    new P1, I26
    set P0, 0b00000000
    bnot P1, P0
    band P1, 0b11111111
    print P1
    print "\n"

    end
CODE
85
153
240
204
255
OUTPUT

# shl/shr tests adapted from t/op/bitwise.t

output_is(<<'CODE', <<'OUTPUT', "shr (>>)");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
    new P0, I23
    new P1, I23
    new P2, I23
    new P3, I23
    set P0, 0b001100
    set P1, 0b010100
    set P2, 1
    set P3, 2

    new P4, I23
    new P5, I24
    new P6, I25
    new P7, I21

    shr P4, P0, P2
    shr P5, P0, P3
    shr P6, P1, P2
    shr P7, P1, 2

    print P4
    print "\n"
    print P5
    print "\n"
    print P6
    print "\n"
    print P7
    print "\n"

    set P0, 0b001100
    set P1, 0b010100
    shr P0, P2
    shr P1, 2
    print P0
    print "\n"
    print P1
    print "\n"
    end
CODE
6
3
10
5
6
5
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "shl (<<)");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
    new P0, I23
    new P1, I23
    new P2, I23
    new P3, I23
    set P0, 0b001100
    set P1, 0b010100
    set P2, 1
    set P3, 2

    new P4, I23
    new P5, I24
    new P6, I25
    new P7, I21

    shl P4, P0, P2
    shl P5, P0, P3
    shl P6, P1, P2
    shl P7, P1, 2

    print P4
    print "\n"
    print P5
    print "\n"
    print P6
    print "\n"
    print P7
    print "\n"

    set P0, 0b001100
    set P1, 0b010100
    shl P0, P2
    shl P1, 2
    print P0
    print "\n"
    print P1
    print "\n"
    end
CODE
24
48
40
80
24
80
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "inc/dec a PerlUndef");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
    new P0, I26
    new P1, I26
    inc P0
    print P0
    inc P0
    print P0
    dec P1
    print P1
    dec P1
    print P1
    print "\n"
    end
CODE
12-1-2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "divide gives int if possible");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
    new P0, I23
    new P1, I23
    new P2, I26
    set P0, 12
    set P1, 2
    div P2, P0, P1
    print P2
    print "\n"
    div P2, P1
    print P2
    print "\n"
    div P2, 2
    print P2
    print "\n"
    end
CODE
6
3
1.500000
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "division by zero, #1");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
    new P0, I23
    new P1, I23
    new P2, I21
    set P0, 12
    set P1, 0
    div P2, P0, P1
    end
CODE
/division by zero/
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "division by zero, #2");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
    new P0, I23
    new P1, I21
    new P2, I21
    set P0, 12
    div P2, P0, P1
    end
CODE
/division by zero/
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "division by zero, #3");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
    new P0, I23
    new P1, I24
    new P2, I21
    set P0, 12
    set P1, 0.0
    div P2, P0, P1
    end
CODE
/division by zero/
OUTPUT

#
# Let perl do the computation.
#
output_is(<<'CODE', <<OUTPUT, "add integer to self");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
	new P0, I23
	set P0, 123
	add P0, P0, P0
	print P0
	print "\n"
	end
CODE
246
OUTPUT

output_is(<<'CODE', <<OUTPUT, "sub integer from self");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
	new P0, I23
	set P0, 456
	sub P0, P0, P0
	print P0
	print "\n"
	end
CODE
0
OUTPUT

output_is(<<'CODE', <<OUTPUT, "multiply integer by self");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
	new P0, I23
	set P0, 124
	mul P0, P0, P0
	print P0
	print "\n"
	end
CODE
15376
OUTPUT

output_is(<<"CODE", <<OUTPUT, "divide integer by self");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
@{[ $fp_equality_macro ]}
	new P0, I23
	set P0, 23
	div P0, P0, P0
	.fp_eq( P0, 1.0, EQ1)
	print P0
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<OUTPUT, "add integer to other");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
	new P0, I23
	new P1, I23
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
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
	new P0, I23
	new P1, I23
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
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
	new P0, I23
	new P1, I23
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
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
@{[ $fp_equality_macro ]}
	new P0, I23
	new P1, I23
	set P0, 123
	set P1, 246
	div P1, P1, P0

	.fp_eq( P1, 2.0, EQ1)
	print P1
	print "not "
EQ1:	print "ok 1"
	print "\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<OUTPUT, "subtract native integer from PerlInt");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
	new P0, I23
	new P1, I23
	set I0, 4000
	set P0, 123
	sub P1, P0, I0
	print P1
	print "\n"
	sub P0, P0, I0
	print P0
	print "\n"
        sub P0, -3876
	print P0
	print "\n"
	end
CODE
-3877
-3877
-1
OUTPUT

output_is(<<'CODE', <<OUTPUT, "multiply PerlInt with native integer");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
	new P0, I23
	new P1, I23
	set I0, 4000
	set P0, 123
	mul P1, P0, I0
	print P1
	print "\n"
	mul P0, P0, I0
	print P0
	print "\n"
        mul P0, -1
	print P0
	print "\n"
        mul P0, 0
	print P0
	print "\n"
	end
CODE
492000
492000
-492000
0
OUTPUT

output_is(<<"CODE", <<OUTPUT, "divide PerlInt by native integer");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
@{[ $fp_equality_macro ]}
	new P0, I23
	set I0, 4000
	set P0, 123
	div P0, P0, I0
	.fp_eq( P0, 0.03075, EQ1)
	print P0
	print "not "
EQ1:	print "ok 1"
	print "\\n"

        div P0, 5
        .fp_eq(P0, 0.00615, EQ2)
	print P0
	print "not "
EQ2:	print "ok 2"
	print "\\n"
	end
CODE
ok 1
ok 2
OUTPUT

#
# PerlInt and FLOATVAL, tests
#
output_is(<<"CODE", <<OUTPUT, "add native number to integer");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
@{[ $fp_equality_macro ]}
	new P0, I23
	new P1, I23
	set N0, 4000.04
	set P0, 123
	add P1, P0, N0
	.fp_eq( P1, 4123.04, EQ1)
	print "not "
EQ1:	print "ok 1\\n"
	add P0, P0, N0
	.fp_eq( P0, 4123.04, EQ2)
        print "not "
EQ2:	print "ok 2\\n"
        new P0, I23
        set P0, 12
        add P0, 0.16
	.fp_eq( P0, 12.16, EQ3)
        print "not "
EQ3:	print "ok 3\\n"
	end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<"CODE", <<OUTPUT, "subtract native number from integer");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
@{[ $fp_equality_macro ]}
	new P0, I23
	new P1, I23
	set N0, 4000.04
	set P0, 123
	sub P1, P0, N0
	.fp_eq( P1, -3877.04, EQ1)
	print "not "
EQ1:	print "ok 1\\n"
	sub P0, P0, N0
	.fp_eq( P0, -3877.04, EQ2)
	print "not "
EQ2:	print "ok 2\\n"
        new P0, I23
        set P0, -3877
        sub P0, 23.01
	.fp_eq( P0, -3900.01, EQ3)
	print "not "
EQ3:	print "ok 3\\n"
	end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<'CODE', <<OUTPUT, "multiply integer with native number");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
	new P0, I23
	new P1, I23
	set N0, 4000.04
	set P0, 123
	mul P1, P0, N0
	print P1
	print "\n"
	mul P0, P0, N0
	print P0
	print "\n"

        new P0, I23
        set P0, 12
        mul P0, 25.5
	print P0
	print "\n"
	end
CODE
492004.920000
492004.920000
306
OUTPUT

output_is(<<"CODE", <<OUTPUT, "divide integer by native number");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
@{[ $fp_equality_macro ]}
	new P0, I23
	set N0, 4000
	set P0, 123
	div P0, P0, N0

	.fp_eq( P0, 0.03074969250307496925, EQ1)
	print P0
	print "not "
EQ1:	print "ok 1"
	print "\\n"

        new P0, I23
        set P0, 250
        div P0, 0.01
	.fp_eq( P0, 25000.0, EQ2)
        print P0
	print "not "
EQ2:	print "ok 2"
	print "\\n"
	end
CODE
ok 1
ok 2
OUTPUT

#
# PerlInt and INTVAL tests
#
output_is(<<'CODE', <<OUTPUT, "add native integer to PerlInt");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
	new P0, I23
	new P1, I23
	set I0, 4000
	set P0, 123
	add P1, P0, I0
	print P1
	print "\n"
	add P0, P0, I0
	print P0
	print "\n"
        add P0, 20
	print P0
	print "\n"
	end
CODE
4123
4123
4143
OUTPUT

#
# Number tests
#
#
# Concat tests
#
output_is(<<'CODE', <<OUTPUT, "concatenate integer to string");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
	new P0, I23
	new P1, I25
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
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
	new P0, I23
	new P1, I25
	set P0, "foo"
	set P1, -7
	concat P0,P0,P1
	print P0
	print "\n"
	end
CODE
foo-7
OUTPUT

#
# Arithmetic operators
#
output_is(<<'CODE', <<OUTPUT, "add integer to string integer");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
	new P0, I23
	new P1, I25
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
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
	new P0, I23
	new P1, I25
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
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
@{[ $fp_equality_macro ]}
	new P0, I23
	new P1, I25
	set P0, 6
	set P1, "7.5"
	add P0,P0,P1
	.fp_eq( P0, 13.5, EQ1)
	print P0
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<OUTPUT, "assign integer");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
    new P0, I23
    assign P0, 42
    print P0
    print "\n"

    new P1, I24
    assign P1, 21
    print P1
    print "\n"

    new P2, I25
    assign P2, 7
    print P2
    print "\n"

    new P3, I21
    assign P3, 1
    print P3
    print "\n"

    end
CODE
42
21
7
1
OUTPUT

output_is(<<'CODE', <<OUTPUT, "p =  p % p (int % int)");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
	new 	P0, I23
	new	P1, I23
	new	P2, I23
        new     P3, I24
	set	P0, 11
	set	P1, 10
	mod	P2, P0, P1
	print	P2
	print	"\n"
        set     P0, 12
	mod	P3, P0, P1
	print	P3
	print	"\n"
	mod	P0, P0, P1
	print	P0
	print	"\n"
	end
CODE
1
2
2
OUTPUT

output_is(<<'CODE', <<OUTPUT, "p =  p % p (int % numeric string)");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
	new 	P0, I23
	new	P1, I25
	new	P2, I23
	set	P0, 11
	set	P1, "10"
	mod	P2, P0, P1
	print	P2
	print	"\n"
        set     P0, 12
	end
CODE
1
OUTPUT

output_is(<<CODE, <<OUTPUT, "(int / int) -> float");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
@{[ $fp_equality_macro ]}
	new 	P0, I23
	new	P1, I23
	new	P2, I24
	set	P0, 1
	set	P1, 2
	div		P2, P0, P1
	.fp_eq(	P2, 0.5, EQ1)
	print 	P2
	print	" not "
EQ1:	print 	"ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<OUTPUT, "logical or");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
        new P0, I23
        new P1, I23
        new P2, I23
        set P0, 10
        set P1, 20
        or P2, P1, P0
        eq P2, 20, OK1
        print P2
        print "not "
OK1:    print "ok 1\n"
        set P1, 0
        or P2, P1, P0
        eq P2, 10, OK2
        print P2
        print "not "
OK2:    print "ok 2\n"
        end
CODE
ok 1
ok 2
OUTPUT

output_is(<<"CODE", <<OUTPUT, "logical or with Num/Str/Undef");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
@{[ $fp_equality_macro ]}
        new P0, I24
        new P1, I23
        new P2, I23
        set P0, 10.5
        set P1, 20
        or P2, P1, P0
        eq P2, 20, OK1
        print P2
        print "not "
OK1:    print "ok 1\\n"
        set P1, 0
        or P2, P1, P0
        .fp_eq(P2, 10.5, OK2)
        print P2
        print "not "
OK2:    print "ok 2\\n"

        new P0, I25
        set P0, "ND3"
        set P1, 30
        or P2, P1, P0
        eq P2, 30, OK3
        print P2
        print "not "
OK3:    print "ok 3\\n"
        set P1, 0
        or P2, P1, P0
        set S2, P2
        eq S2, "ND3", OK4
        print P2
        print "not "
OK4:    print "ok 4\\n"

        new P0, I26
        set P1, 40
        or P2, P1, P0
        eq P2, 40, OK5
        print P2
        print "not "
OK5:    print "ok 5\\n"
        set P1, 0
        or P2, P1, P0
        defined I2, P2
        eq I2, 0, OK6
        print P2
        print "not "
OK6:    print "ok 6\\n"
        end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
OUTPUT

output_is(<<'CODE', <<OUTPUT, "logical xor");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
        new P0, I23
        new P1, I23
        new P2, I23
        set P0, 0
        set P1, 20
        xor P2, P1, P0
        eq P2, 20, OK1
        print P2
        print "not "
OK1:    print "ok 1\n"
        set P0, 10
        set P1, 0
        xor P2, P1, P0
        eq P2, 10, OK2
        print P2
        print "not "
OK2:    print "ok 2\n"
        set P0, 0
        set P1, 0
        xor P2, P1, P0
        unless P2, OK3
        print P2
        print "not "
OK3:    print "ok 3\n"
        set P0, 1
        set P1, 1
        xor P2, P1, P0
        unless P2, OK4
        print P2
        print "not "
OK4:    print "ok 4\n"
        end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<<"CODE", <<OUTPUT, "logical xor with Num/Str/Undef");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
@{[ $fp_equality_macro ]}
        new P0, I24
        new P1, I23
        new P2, I23
        set P0, 0.0
        set P1, 20
        xor P2, P1, P0
        eq P2, 20, OK1
        print P2
        print "not "
OK1:    print "ok 1\\n"
        set P0, 12.5
        set P1, 0
        xor P2, P1, P0
        .fp_eq(P2, 12.5, OK2)
        print P2
        print "not "
OK2:    print "ok 2\\n"
        set P0, 0.0
        set P1, 0
        xor P2, P1, P0
        unless P2, OK3
        print P2
        print "not "
OK3:    print "ok 3\\n"
        set P0, 10.0
        set P1, 10
        xor P2, P1, P0
        unless P2, OK4
        print P2
        print "not "
OK4:    print "ok 4\\n"

        new P0, I25
        set P0, ""
        set P1, 20
        xor P2, P1, P0
        eq P2, 20, OK5
        print P2
        print "not "
OK5:    print "ok 5\\n"
        set P0, "non-zero"
        set P1, 0
        xor P2, P1, P0
        set S2, P2
        eq S2, "non-zero", OK6
        print P2
        print "not "
OK6:    print "ok 6\\n"
        set P0, ""
        set P1, 0
        xor P2, P1, P0
        unless P2, OK7
        print P2
        print "not "
OK7:    print "ok 7\\n"
        set P0, "non-zero"
        set P1, 10
        xor P2, P1, P0
        unless P2, OK8
        print P2
        print "not "
OK8:    print "ok 8\\n"

        new P0, I21
        set P1, 20
        xor P2, P1, P0
        eq P2, 20, OK9
        print P2
        print "not "
OK9:    print "ok 9\\n"
        set P1, 0
        xor P2, P1, P0
        eq P2, 0, OK10
        print P2
        print "not "
OK10:   print "ok 10\\n"
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
OUTPUT

output_is(<<'CODE', <<OUTPUT, "logical and");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
        new P0, I23
        new P1, I23
        new P2, I23
        set P0, 10
        set P1, 20
        and P2, P1, P0
        eq P2, 10, OK1
        print P2
        print "not "
OK1:    print "ok 1\n"
        set P1, 0
        and P2, P1, P0
        eq P2, 0, OK2
        print P2
        print "not "
OK2:    print "ok 2\n"
        end
CODE
ok 1
ok 2
OUTPUT

output_is(<<"CODE", <<OUTPUT, "logical and with Num/Str/Undef");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
@{[ $fp_equality_macro ]}
        new P0, I24
        new P1, I23
        new P2, I23
        set P0, 10.0
        set P1, 20
        and P2, P1, P0
        .fp_eq(P2, 10.0, OK1)
        print P2
        print "not "
OK1:    print "ok 1\\n"
        set P1, 0
        and P2, P1, P0
        eq P2, 0, OK2
        print P2
        print "not "
OK2:    print "ok 2\\n"

        new P0, I25
        set P0, "kjuh"
        set P1, 20
        and P2, P1, P0
        set S2, P2
        eq S2, "kjuh", OK3
        print P2
        print "not "
OK3:    print "ok 3\\n"
        set P1, 0
        and P2, P1, P0
        eq P2, 0, OK4
        print P2
        print "not "
OK4:    print "ok 4\\n"

        new P0, I26
        set P1, 20
        and P2, P1, P0
        defined I2, P2
        eq I2, 0, OK5
        print P2
        print "not "
OK5:    print "ok 5\\n"
        set P1, 0
        and P2, P1, P0
        defined I2, P2
        ne I2, 1, BAD6
        set I3, P2
        ne I3, 0, BAD6
        branch OK6
BAD6:   print P2
        print "not "
OK6:    print "ok 6\\n"
        end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
OUTPUT

output_is(<<'CODE', <<OUTPUT, "eq_p_p");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
      new P0, I23
      new P1, I23

      set P0, 10
      set P1, 10

      eq P0, P1, OK1
      print "not "
OK1:  print "ok 1\n"

      set P0, 11
      eq P0, P1, BAD2
      branch OK2
BAD2: print "not ok 2\n"
OK2:  print "ok 2\n"

      new P0, I24
      new P1, I24

      set N0, 4.5
      set P0, N0
      set P1, N0

      eq P0, P1, OK3
      print "not "
OK3:  print "ok 3\n"

      set P0, 0.0
      eq P0, P1, BAD4
      branch OK4
BAD4: print "not ok 4\n"
OK4:  print "ok 4\n"

      new P0, I25
      new P1, I25

      set S0, "Artichoke"
      set P0, S0
      set P1, S0

      eq P0, P1, OK5
      print "not "
OK5:  print "ok 5\n"

      set P0, "Cabbage"
      eq P0, P1, BAD6
      branch OK6
BAD6: print "not ok 6\n"
OK6:  print "ok 6\n"

      new P0, I26
      new P1, I26

      eq P0, P1, OK7
      print "not "
OK7:  print "ok 7\n"

      set P1, 100
      eq P0, P1, BAD8
      branch OK8
BAD8: print "not ok 8\n"
OK8:  print "ok 8\n"

      set P1, 5.5
      eq P0, P1, BAD9
      branch OK9
BAD9: print "not ok 9\n"
OK9:  print "ok 9\n"

       set P1, "true"
       eq P0, P1, BAD10
       branch OK10
BAD10: print "not ok 10\n"
OK10:  print "ok 10\n"

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
OUTPUT

output_is(<<'CODE', <<OUTPUT, "eq_p_i");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
      set I0, 12

      new P0, I23
      set P0, I0
      eq P0, I0, OK1
      print "not "
OK1:  print "ok 1\n"

      new P0, I24
      set P0, I0
      eq P0, I0, OK2
      print "not "
OK2:  print "ok 2\n"

      new P0, I25
      set P0, I0
      eq P0, I0, OK3
      print "not "
OK3:  print "ok 3\n"

      new P0, I21
      eq P0, I0, BAD4
      branch OK4
BAD4: print "not "
OK4:  print "ok 4\n"

      set P0, I0
      eq P0, I0, OK5
      print "not "
OK5:  print "ok 5\n"
      end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
OUTPUT

output_is(<<'CODE', <<OUTPUT, "ne_p_p");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
      new P0, I23
      new P1, I23

      set P0, 1
      set P1, 11

      ne P0, P1, OK1
      print "not "
OK1:  print "ok 1\n"

      set P0, 11
      ne P0, P1, BAD2
      branch OK2
BAD2: print "not ok 2\n"
OK2:  print "ok 2\n"

      new P0, I24
      new P1, I24

      set N0, 4.5
      set P0, N0
      set P1, 0.0

      ne P0, P1, OK3
      print "not "
OK3:  print "ok 3\n"

      set P1, N0
      ne P0, P1, BAD4
      branch OK4
BAD4: print "not ok 4\n"
OK4:  print "ok 4\n"

      new P0, I25
      new P1, I25

      set S0, "Artichoke"
      set P0, S0
      set P1, "Artichoke..."

      ne P0, P1, OK5
      print "not "
OK5:  print "ok 5\n"

      set P1, S0
      ne P0, P1, BAD6
      branch OK6
BAD6: print "not ok 6\n"
OK6:  print "ok 6\n"
      end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
OUTPUT

output_is(<<'CODE', <<OUTPUT, "lt_p_p");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
      new P0, I23
      new P1, I23

      set P0, 1
      set P1, -1

      lt P1, P0, OK1
      print "not "
OK1:  print "ok 1\n"

      lt P0, P1, BAD2
      branch OK2
BAD2: print "not ok 2\n"
OK2:  print "ok 2\n"

      lt P1, P1, BAD3
      branch OK3
BAD3: print "not ok 3\n"
OK3:  print "ok 3\n"

      new P2, I24
      new P3, I24

      set P2, 12.49
      set P3, 12.5

      lt P2, P3, OK4
      print "not "
OK4:  print "ok 4\n"

      lt P3, P2, BAD5
      branch OK5
BAD5: print "not ok 5\n"
OK5:  print "ok 5\n"

      lt P3, P3, BAD6
      branch OK6
BAD6: print "not ok 6\n"
OK6:  print "ok 6\n"

      end


CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
OUTPUT

output_is(<<'CODE', <<OUTPUT, "lt_p_i");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
      new P0, I23
      set P0, 1

      lt P0, 2, OK1
      print "not "
OK1:  print "ok 1\n"

      lt P0, 0, BAD2
      branch OK2
BAD2: print "not ok 2\n"
OK2:  print "ok 2\n"

      new P2, I24
      set P2, 12.49
      set I2, 15

      lt P2, I2, OK3
      print "not "
OK3:  print "ok 3\n"

      set I2, 10
      lt P2, I2, BAD4
      branch OK4
BAD4: print "not ok 4\n"
OK4:  print "ok 4\n"

      end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<<'CODE', <<OUTPUT, "le_p_p");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
      new P0, I23
      new P1, I23

      set P0, 1
      set P1, -1

      le P1, P0, OK1
      print "not "
OK1:  print "ok 1\n"

      le P0, P1, BAD2
      branch OK2
BAD2: print "not ok 2\n"
OK2:  print "ok 2\n"

      le P1, P1, OK3
      print "not "
OK3:  print "ok 3\n"

      new P2, I24
      new P3, I24

      set P2, 12.49
      set P3, 12.5

      le P2, P3, OK4
      print "not "
OK4:  print "ok 4\n"

      le P3, P2, BAD5
      branch OK5
BAD5: print "not ok 5\n"
OK5:  print "ok 5\n"

      le P3, P3, OK6
      print "not "
OK6:  print "ok 6\n"

      end


CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
OUTPUT

output_is(<<'CODE', <<OUTPUT, "le_p_i");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
      new P0, I23
      set P0, 1

      le P0, 1, OK1
      print "not "
OK1:  print "ok 1\n"

      le P0, 0, BAD2
      branch OK2
BAD2: print "not ok 2\n"
OK2:  print "ok 2\n"

      le P0, 2, OK3
      print "not "
OK3:  print "ok 3\n"

      new P2, I24
      set P2, 12.0

      le P2, 12, OK4
      print "not "
OK4:  print "ok 4\n"

      le P2, 11, BAD5
      branch OK5
BAD5: print "not ok 5\n"
OK5:  print "ok 5\n"

      le P2, 13, OK6
      print "not "
OK6:  print "ok 6\n"

      end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
OUTPUT

output_is(<<'CODE', <<OUTPUT, "gt_p_p");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
      new P0, I23
      new P1, I23

      set P0, 10
      set P1, 0

      gt P0, P1, OK1
      print "not "
OK1:  print "ok 1\n"

      gt P1, P0, BAD2
      branch OK2
BAD2: print "not ok 2\n"
OK2:  print "ok 2\n"

      gt P1, P1, BAD3
      branch OK3
BAD3: print "not ok 3\n"
OK3:  print "ok 3\n"

      new P2, I24
      new P3, I24

      set P2, 1000.0
      set P3, 1000000.0

      gt P3, P2, OK4
      print "not "
OK4:  print "ok 4\n"

      gt P2, P3, BAD5
      branch OK5
BAD5: print "not ok 5\n"
OK5:  print "ok 5\n"

      gt P3, P3, BAD6
      branch OK6
BAD6: print "not ok 6\n"
OK6:  print "ok 6\n"

      end


CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
OUTPUT

output_is(<<'CODE', <<OUTPUT, "ge_p_p");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
      new P0, I23
      new P1, I23

      set P0, 10
      set P1, 0

      ge P0, P1, OK1
      print "not "
OK1:  print "ok 1\n"

      ge P1, P0, BAD2
      branch OK2
BAD2: print "not ok 2\n"
OK2:  print "ok 2\n"

      ge P1, P1, OK3
      print "not "
OK3:  print "ok 3\n"

      new P2, I24
      new P3, I24

      set P2, 1000.0
      set P3, 1000000.0

      ge P3, P2, OK4
      print "not "
OK4:  print "ok 4\n"

      ge P2, P3, BAD5
      branch OK5
BAD5: print "not ok 5\n"
OK5:  print "ok 5\n"

      ge P3, P3, OK6
      print "not "
OK6:  print "ok 6\n"

      end


CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
OUTPUT

output_is(<<'CODE', <<OUTPUT, "neg_p_p");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
      new P0, I23
      new P1, I23

      set P0, 12
      neg P1, P0
      print P1
      print "\n"

      new P0, I24
      new P1, I24
      set N0, -12.345678

      set P0, N0
      neg P1, P0
      print P1
      print "\n"

      new P0, I23
      new P1, I24

      set P0, 1
      neg P1, P0
      print P1
      print "\n"

      new P0, I24
      new P1, I23

      set P0, 1.234567
      neg P1, P0
      print P1
      print "\n"

      new P0, I23
      set P0, 25
      neg P0, P0
      print P0
      print "\n"

      new P0, I24
      set P0, -12.098765
      neg P0, P0
      print P0
      print "\n"

      end

CODE
-12
12.345678
-1
-1.234567
-25
12.098765
OUTPUT

output_is(<<'CODE', <<OUTPUT, "neg_p");
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
      new P0, I23
      set P0, 12
      neg P0
      print P0
      print "\n"

      new P0, I24
      set N0, -12.345678
      set P0, N0
      neg P0
      print P0
      print "\n"

      end
CODE
-12
12.345678
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check whether interface is done");

.sub test @MAIN
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
    .local pmc pmc1
    pmc1 = new I23
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

pir_output_is(<< 'CODE', << 'OUTPUT', "Fix for a minor problem");

.sub test @MAIN
    find_type I21, "PerlArray"
    find_type I22, "PerlHash"
    find_type I23, "PerlInt"
    find_type I24, "PerlNum"
    find_type I25, "PerlString"
    find_type I26, "PerlUndef"
    $P1 = new I23
    $P1 = 5
    $P2 = new I24
    $P2 = 0.2
    $P3 = new I24
    $P3 = $P1 / $P2
    print $P3
    print "\n"
.end
CODE
25
OUTPUT
