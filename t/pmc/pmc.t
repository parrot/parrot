#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/pmc.t - Perl PMCs

=head1 SYNOPSIS

	% perl t/pmc/pmc.t

=head1 DESCRIPTION

Contains a lot of Perl PMC related tests.

=cut

use Parrot::Test tests => 94;
use Test::More;
use Parrot::PMC qw(%pmc_types);
my $max_pmc = scalar(keys(%pmc_types)) + 1;

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

output_is(<<'CODE', <<'OUTPUT', "newpmc");
	print "starting\n"
	new P0, .PerlInt
	print "ending\n"
	end
CODE
starting
ending
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "illegal min newpmc");
	new P0, 0
	end
CODE
Illegal PMC enum (0) in new
OUTPUT

output_is(<<"CODE", <<"OUTPUT", "illegal max newpmc");
	new P0, $max_pmc
	end
CODE
Illegal PMC enum ($max_pmc) in new
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "set/print integer");
	new P0, .PerlInt
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
	new P0, .PerlInt
	set P0, 123
	add P0, P0, P0
	print P0
	print "\n"
	end
CODE
246
OUTPUT

output_is(<<'CODE', <<OUTPUT, "sub integer from self");
	new P0, .PerlInt
	set P0, 456
	sub P0, P0, P0
	print P0
	print "\n"
	end
CODE
0
OUTPUT

output_is(<<'CODE', <<OUTPUT, "multiply integer by self");
	new P0, .PerlInt
	set P0, 124
	mul P0, P0, P0
	print P0
	print "\n"
	end
CODE
15376
OUTPUT

output_is(<<"CODE", <<OUTPUT, "divide integer by self");
@{[ $fp_equality_macro ]}
	new P0, .PerlInt
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
	new P0, .PerlInt
	new P1, .PerlInt
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
	new P0, .PerlInt
	new P1, .PerlInt
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
	new P0, .PerlInt
	new P1, .PerlInt
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
	new P0, .PerlInt
	new P1, .PerlInt
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

#
# Number tests
#
#
# Concat tests
#
output_is(<<'CODE', <<OUTPUT, "concatenate integer to string");
	new P0, .PerlInt
	new P1, .PerlString
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
	new P0, .PerlInt
	new P1, .PerlString
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
	new P0, .PerlNum
	new P1, .PerlString
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
	new P0, .PerlString
	new P1, .PerlNum
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
	new P0, .PerlString
	new P1, .PerlString
	set P0, "foo"
	set P1, "bar"
	concat P0,P0,P1
	print P0
	print "\n"
	end
CODE
foobar
OUTPUT

output_is(<<'CODE', <<OUTPUT, "concatenate <foo> to undef");
	new P0, .PerlUndef
	new P1, .PerlInt
	set P1, 10
	concat P0, P0, P1
        set S0, P0
        eq S0, "10", OK1
        print "not "
OK1:    print "ok 1\n"

	new P0, .PerlUndef
	new P1, .PerlNum
	set P1, 1.2
	concat P0, P0, P1
        set S0, P0
        eq S0, "1.200000", OK2
        print "not "
OK2:    print "ok 2\n"

	new P0, .PerlUndef
	new P1, .PerlString
	set P1, "Foo"
	concat P0, P0, P1
        set S0, P0
        eq S0, "Foo", OK3
        print "not "
OK3:    print "ok 3\n"

	new P0, .PerlUndef
	new P1, .PerlUndef
	concat P0, P0, P1
        set S0, P0
        eq S0, "", OK4
        print "not "
OK4:    print "ok 4\n"
	end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT


output_is(<<'CODE', <<OUTPUT, "concatenate undef to <foo>");
	new P0, .PerlUndef
	new P1, .PerlInt
	set P1, 10
	concat P1, P1, P0
        set S0, P1
        eq S0, "10", OK1
        print "not "
OK1:    print "ok 1\n"

	new P0, .PerlUndef
	new P1, .PerlNum
	set P1, 1.2
	concat P1, P1, P0
        set S0, P1
        eq S0, "1.200000", OK2
        print "not "
OK2:    print "ok 2\n"

	new P0, .PerlUndef
	new P1, .PerlString
	set P1, "Foo"
	concat P1, P1, P0
        set S0, P1
        eq S0, "Foo", OK3
        print "not "
OK3:    print "ok 3\n"

	end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<'CODE', <<OUTPUT, "concatenate STRING to undef");
	new P0, .PerlUndef
	concat P0, P0, "Foo"
        set S0, P0
        eq S0, "Foo", OK1
        print "not "
OK1:    print "ok 1\n"
	end
CODE
ok 1
OUTPUT

#
# Basic string number conversion
#
output_is(<<CODE, <<OUTPUT, "string to int");
	new	P0, .PerlString

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

output_is(<<'CODE', <<OUTPUT, "nasty string -> int");
	new	P0, .PerlInt
	set	P0, "Z1"
	set	I0, P0
	print	I0
	print	P0
	print	"\n"

	set	P0, "\x0 1"
	set	I0, P0
	print	I0
	print	"\n"

	set	P0, "1.23e2"
	set	I0, P0
	print	I0
	print	"\n"
       end
CODE
0Z1
0
123
OUTPUT

output_is(<<CODE, <<OUTPUT, "string to number conversion");
@{[ $fp_equality_macro ]}
	new	P0, .PerlNum

	set	P0, "1"
	set	N0, P0
	.fp_eq(	N0, 1, EQ1)
	print	N0
	print	"not "
EQ1:	print	"ok 1\\n"

	set	P0, "1.2"
	set	N0, P0
	.fp_eq(	N0, 1.2, EQ2)
	print	N0
	print	"not "
EQ2:	print	"ok 2\\n"

	set	P0, "1.2e1"
	set	N0, P0
	.fp_eq(	N0, 12, EQ3)
	print	N0
	print	"not "
EQ3:	print	"ok 3\\n"

	set	P0, "1.2e-1"
	set	N0, P0
	.fp_eq(	N0, 0.12, EQ4)
	print	N0
	print	"not "
EQ4:	print	"ok 4\\n"

	set	P0, "1.2e2.1"
	set	N0, P0
	.fp_eq(	N0, 120, EQ5)
	print	N0
	print	"not "
EQ5:	print	"ok 5\\n"

	set	P0, "X1.2X"
	set	N0, P0
	.fp_eq(	N0, 0.0, EQ6)
	print	N0
	print	"not "
EQ6:	print	"ok 6\\n"

	set	P0, "E1-1.2e+2"
	set	N0, P0
	.fp_eq(	N0, 0.0, EQ7)
	print	N0
	print	"not "
EQ7:	print	"ok 7\\n"

	set	P0, "++-1"
	set	N0, P0
	.fp_eq(	N0, 0.0, EQ8)
	print	N0
	print	"not "
EQ8:	print	"ok 8\\n"

	set	P0, "1234.1234.5"
	set	N0, P0
	.fp_eq(	N0, 1234.1234, EQ9)
	print	N0
	print	"not "
EQ9:	print	"ok 9\\n"

	set	P0, "this is empty!"
	set	N0, P0
	.fp_eq(	N0, 0.0, EQ10)
	print	N0
	print	" not "
EQ10:	print	"ok 10\\n"

	set	P0, "0e123"
	set	N0, P0
	.fp_eq(	N0, 0, EQ11)
	print	N0
	print	" not "
EQ11:	print	"ok 11\\n"

	set	P0, "000000000000000000000000000000000000000001e-0"
	set	N0, P0
	.fp_eq(	N0, 1, EQ12)
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
	new P0, .PerlInt
	new P1, .PerlString
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
	new P0, .PerlInt
	new P1, .PerlString
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
	new P0, .PerlInt
	new P1, .PerlString
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

output_is(<<"CODE", <<OUTPUT, "add number to string integer");
@{[ $fp_equality_macro ]}
	new P0, .PerlNum
	new P1, .PerlString
	set P0, 6.1
	set P1, "7"
	add P0,P0,P1
	.fp_eq( P0, 13.1, EQ1)
	print P0
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "add number to string");
@{[ $fp_equality_macro ]}
	new P0, .PerlNum
	new P1, .PerlString
	set P0, 6.1
	set P1, "ab"
	add P0,P0,P1
	.fp_eq( P0, 6.1, EQ1)
	print P0
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "add number to string number");
@{[ $fp_equality_macro ]}
	new P0, .PerlNum
	new P1, .PerlString
	set P0, 6.1
	set P1, "7.5"
	add P0,P0,P1
	.fp_eq( P0, 13.6, EQ1)
	print P0
	print "not "
EQ1:	print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<OUTPUT, "p =  p % p (int % int)");
	new 	P0, .PerlInt
	new	P1, .PerlInt
	new	P2, .PerlInt
        new     P3, .PerlNum
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
	new 	P0, .PerlInt
	new	P1, .PerlString
	new	P2, .PerlInt
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

output_is(<<CODE, <<OUTPUT, "p =  fmod(p,p)");
@{[ $fp_equality_macro ]}
	new 	P0, .PerlNum
	new	P1, .PerlNum
	new	P2, .PerlNum
        new     P3, .PerlInt
	set	P0, 13.4
	set	P1, 6.0
	cmod	P2, P0, P1
        .fp_eq(P2, 1.4, OK1)
        print "not "
OK1:    print "ok 1\\n"
        set     P0, -25.1
	cmod	P3, P0, P1
        .fp_eq(P3, -1.1, OK2)
        print "not "
OK2:    print "ok 2\\n"
	cmod	P0, P0, P1
        .fp_eq(P0, -1.1, OK3)
        print "not "
OK3:    print "ok 3\\n"
	end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<CODE, <<OUTPUT, "(int / int) -> float");
@{[ $fp_equality_macro ]}
	new 	P0, .PerlInt
	new	P1, .PerlInt
	new	P2, .PerlNum
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

output_is(<<CODE, <<'OUTPUT', "copy");
@{[ $fp_equality_macro ]}
	new P0, .PerlInt
	new P1, .PerlInt
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

output_is(<<'CODE', <<'OUTPUT', "set/get string value");
	new P0, .PerlString
        set P0, "foo"
        set S0, P0
        eq S0, "foo", OK1
        print "not "
OK1:    print "ok 1\n"

        set P0, "\0"
        set S0, P0
        eq S0, "\0", OK2
        print "not "
OK2:    print "ok 2\n"

        set P0, ""
        set S0, P0
        eq S0, "", OK3
        print "not "
OK3:    print "ok 3\n"

        set P0, 0
        set S0, P0
        eq S0, "0", OK4
        print "not "
OK4:    print "ok 4\n"

        set P0, 0.0
        set S0, P0
        eq S0, "0", OK5
        print "not "
OK5:    print "ok 5\n"

        set P0, "0b000001"
        set S0, P0
        eq S0, "0b000001", OK6
        print "not "
OK6:    print "ok 6\n"

	end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
OUTPUT

# The same for PerlNums...

output_is(<<'CODE', <<'OUTPUT', "set/get string value");
	new P0, .PerlString
        set P0, "bar"
        set S0, P0
        eq S0, "bar", OK1
        print "not "
OK1:    print "ok 1\n"

        set P0, "\0"
        set S0, P0
        eq S0, "\0", OK2
        print "not "
OK2:    print "ok 2\n"

        set P0, ""
        set S0, P0
        eq S0, "", OK3
        print "not "
OK3:    print "ok 3\n"

        set P0, -1
        set S0, P0
        eq S0, "-1", OK4
        print "not "
OK4:    print "ok 4\n"

        set P0, -1.0
        set S0, P0
        eq S0, "-1", OK5
        print "not "
OK5:    print "ok 5\n"

        set P0, "1.23e23"
        set S0, P0
        eq S0, "1.23e23", OK6
        print "not "
OK6:    print "ok 6\n"

	end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
OUTPUT

output_is(<<CODE, <<OUTPUT, "if (P) - Int");
	new	P0, .PerlInt

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
	new	P0, .PerlInt

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

output_is(<<CODE, <<OUTPUT, "if (P) - Num");
	new	P0, .PerlNum

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

output_is(<<CODE, <<OUTPUT, "unless (P) - Num");
	new	P0, .PerlNum

	set	P0, 0.0
	unless	P0, OK1
	print	"not "
OK1:	print	"ok 1\\n"

	set	P0, 1.1
	unless	P0, BAD2
	branch OK2
BAD2:	print	"not "
OK2:	print	"ok 2\\n"

	end
CODE
ok 1
ok 2
OUTPUT

output_is(<<CODE, <<OUTPUT, "if (P) - String");
	new	P0, .PerlString

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

	set	P0, "\\x0"
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

output_is(<<CODE, <<OUTPUT, "unless (P) - String");
	new	P0, .PerlString

        set     P0, "0"
        unless  P0, OK1
        print   "not"
OK1:	print	"ok 1\\n"

	set	P0, "1"
	unless	P0, BAD2
        branch  OK2
BAD2:	print	"not "
OK2:	print	"ok 2\\n"

	end
CODE
ok 1
ok 2
OUTPUT

output_is(<<"CODE", <<'OUTPUT', "undef-logical");
	new P0, .PerlInt
	new P1, .PerlUndef
	new P2, .PerlInt

# undef or undef = 0
	or P0, P1, P1
	print P0
        print "a"

# undef and undef = 0
	and P0, P1, P1
	print P0
        print "b"

#undef xor undef = 0
        xor P0, P1, P1
	print P0
        print "c"

# undef or foo = foo
	set P2, 349
	or P0, P1, P2
	print P0

# undef and foo = undef
	and P0, P1, P2
	print P0
        print "c"

#undef xor foo = foo
        set P2, 910
	xor P0, P1, P2
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
abc349c910xy1z
OUTPUT

output_is(<<"CODE", <<'OUTPUT', "undef-add");
@{[ $fp_equality_macro ]}
	new P1, .PerlUndef

# undef + perlundef
	new P0, .PerlUndef
	add P0, P1, P1
	print P0
	print "\\n"

# undef + perlint

	new P0, .PerlUndef
	new P2, .PerlInt
	set P2, 947
	add P0, P1, P2
	print P0
	print "\\n"

# undef + perlnum

	new P0, .PerlUndef
	new P2, .PerlNum
	set P2, 385.623
	add P0, P1, P2
	.fp_eq( P0, 385.623, OK)

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
	new P0, .PerlInt
	new P1, .PerlUndef

# undef - undef
	sub P0, P1, P1
	print P0
	print "\\n"

# undef - perlint
	new P2, .PerlInt
	set P2, 947
	sub P0, P1, P2
	print P0
	print "\\n"

# undef - perlnum

	new P2, .PerlNum
	set P2, 385.623
	sub P0, P1, P2
	.fp_eq( P0, -385.623, OK2)

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

	new P0, .PerlInt
	new P1, .PerlUndef
	new P2, .PerlInt

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
	new P2, .PerlNum
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
	new P0, .PerlInt
	new P1, .PerlUndef
	new P2, .PerlInt

# Undef / PerlInt
	set P2, 19
	div P0, P1, P2
	print P0
	print "\\n"

# Undef / PerlNum
	new P2, .PerlNum
	set P2, 343.8
	div P0, P1, P2
	print P0
	print "\\n"

	end
CODE
0
0
OUTPUT

output_is(<<"CODE", <<'OUTPUT', "undef-string");
	new P0, .PerlUndef
        set S0, P0
        eq S0, "", OK
        print "not "
OK:     print "ok\\n"
	end
CODE
ok
OUTPUT


output_is(<<CODE, <<OUTPUT, "mul_p_p, PerlInt");
@{[ $fp_equality_macro ]}
        new P0,.PerlInt
        new P1,.PerlInt
        set P0,8
        set P1,2
        mul P0,P1
        .fp_eq(P0,16,EQ1)
        print "not "
EQ1:   print "ok 1"
        print "\\n"

        new P2, .PerlNum
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


output_is(<<CODE, <<OUTPUT, "mul_p_p, PerlNum");
@{[ $fp_equality_macro ]}
        new P0,.PerlNum
        new P1,.PerlNum
        set P0,-2.5
        set P1,2.5
        mul P0,P1
        .fp_eq(P0,-6.25,EQ1)
        print "not "
EQ1:   print "ok 1"
       print "\\n"

        new P2, .PerlInt
        set P2, 2
        mul P0, P2
        .fp_eq(P0,-12.5,EQ2)
        print "not "
EQ2:   print "ok 2"
       print "\\n"

       end
CODE
ok 1
ok 2
OUTPUT


output_is(<<CODE, <<OUTPUT, "mul_p_i, PerlInt");
@{[ $fp_equality_macro ]}
        new P0,.PerlInt
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
@{[ $fp_equality_macro ]}
        new P0,.PerlInt
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
@{[ $fp_equality_macro ]}
        new P0,.PerlInt
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
@{[ $fp_equality_macro ]}
        new P0,.PerlInt
        set P0,7
        new P1,.PerlInt
        mod P1, P0, 6
        .fp_eq(P1,1,EQ1)
        print "not "
EQ1:    print "ok 1"
        print "\\n"
        end
CODE
ok 1
OUTPUT


output_is(<<CODE, <<OUTPUT, "typeof");
    new P0,.PerlInt
    typeof S0,P0
    eq     S0,"PerlInt",OK_1
    print  "not "
OK_1:
    print  "ok 1\\n"
    typeof I0,P0
    eq     I0,.PerlInt,OK_2
    print  "not "
OK_2:
    print  "ok 2\\n"
    end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<OUTPUT, "inc, PerlInt");
    new P3, .PerlInt
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

output_is(<<"CODE", <<OUTPUT, "inc, PerlNum");
@{[ $fp_equality_macro ]}
     new P3, .PerlNum

     set P3, -0.999
     inc P3
     .fp_eq(P3, 0.001, OK1)
     print "not "
OK1: print "ok 1\\n"

     inc P3
     .fp_eq(P3, 1.001, OK2)
     print "not "
OK2: print "ok 2\\n"

     end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<OUTPUT, "dec, PerlInt");
    new P3, .PerlInt
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

output_is(<<"CODE", <<OUTPUT, "dec, PerlNum");
@{[ $fp_equality_macro ]}
     new P3, .PerlNum

     set P3, 1.001
     dec P3
     .fp_eq(P3, 0.001, OK1)
     print "not "
OK1: print "ok 1\\n"

     dec P3
     .fp_eq(P3, -0.999, OK2)
     print "not "
OK2: print "ok 2\\n"

     end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<OUTPUT, "assign integer");
    new P0, .PerlInt
    assign P0, 42
    print P0
    print "\n"

    new P1, .PerlNum
    assign P1, 21
    print P1
    print "\n"

    new P2, .PerlString
    assign P2, 7
    print P2
    print "\n"

    new P3, .PerlUndef
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

output_is(<<"CODE", <<OUTPUT, "assign number");
@{[ $fp_equality_macro ]}
    new P0, .PerlInt
    assign P0, 42.21
    .fp_eq(P0, 42.21, OK1)
    print  "not "
OK1:
    print  "ok 1\\n"

    new P1, .PerlNum
    assign P1, 21.01
    .fp_eq(P1, 21.01, OK2)
    print  "not "
OK2:
    print  "ok 2\\n"

    new P2, .PerlString
    assign P2, 7.65
    .fp_eq(P2, 7.65, OK3)
    print  "not "
OK3:
    print  "ok 3\\n"

    new P3, .PerlUndef
    assign P3, 1.23
    .fp_eq(P3, 1.23, OK4)
    print  "not "
OK4:
    print  "ok 4\\n"

    end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<<'CODE', <<OUTPUT, "assign string");
    new P0, .PerlInt
    assign P0, "Albert"
    print P0
    print "\n"

    new P1, .PerlNum
    assign P1, "Beth"
    print P1
    print "\n"

    new P2, .PerlString
    assign P2, "Charlie"
    print P2
    print "\n"

    new P3, .PerlUndef
    assign P3, "Doris"
    print P3
    print "\n"

    end
CODE
Albert
Beth
Charlie
Doris
OUTPUT

my $checkTypes;
while (my ($type, $id) = each %pmc_types) {
    next if $type eq "Null";
    next if $type eq "Iterator";   # these need an initializer
    next if $type eq "Enumerate";
    next if $type eq "Ref";
    next if $type eq "SharedRef";
    next if $type eq "ParrotObject";
    next if $type eq "deleg_pmc";
    next if $type eq "BigInt";
    my $set_ro = ($type =~ /^Const\w+/) ? <<EOPASM : '';
    new P10, .PerlInt
    inc P10
    setprop P0, "_ro", P10
EOPASM
    $checkTypes .= <<"CHECK";
    new P0, .$type
    $set_ro
    set S1, "$type"
    typeof S0, P0
    ne S0, S1, L_BadName
    set I1, $id
    typeof I0, P0
    ne I0, I1, L_BadId
CHECK
}

output_is(<<"CODE", <<OUTPUT, "PMC type check");
    new P10, .PerlHash # Type id hash
    new P11, .PerlHash # Type name hash
$checkTypes
    print "All names and ids ok.\\n"
    end
L_BadName:
    print S1
    print " PMCs have incorrect name \\""
    print S0
    print "\\"\\n"
    end
L_BadId:
    print S1
    print " PMCs should be type "
    print I1
    print " but have incorrect type "
    print I0
    print "\\n"
    end
# delegate calls these 2 functions
.namespace ["delegate"]
.pcc_sub __name:
   set S5, "delegate"
   set I0, 1
   set I1, 1	# 1 string retval
   set I3, 0	# no pmc
   invoke P1
.pcc_sub __type:
   find_type I5, "delegate"
   set I0, 1
   set I1, 1
   set I3, 0
   invoke P1
CODE
All names and ids ok.
OUTPUT

output_is(<<'CODE', <<OUTPUT, "eq_p_p");
      new P0, .PerlInt
      new P1, .PerlInt

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

      new P0, .PerlNum
      new P1, .PerlNum

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

      new P0, .PerlString
      new P1, .PerlString

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

      new P0, .PerlUndef
      new P1, .PerlUndef

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
      set I0, 12

      new P0, .PerlInt
      set P0, I0
      eq P0, I0, OK1
      print "not "
OK1:  print "ok 1\n"

      new P0, .PerlNum
      set P0, I0
      eq P0, I0, OK2
      print "not "
OK2:  print "ok 2\n"

      new P0, .PerlString
      set P0, I0
      eq P0, I0, OK3
      print "not "
OK3:  print "ok 3\n"

      new P0, .PerlUndef
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
      new P0, .PerlInt
      new P1, .PerlInt

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

      new P0, .PerlNum
      new P1, .PerlNum

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

      new P0, .PerlString
      new P1, .PerlString

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
      new P0, .PerlInt
      new P1, .PerlInt

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

      new P2, .PerlNum
      new P3, .PerlNum

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
      new P0, .PerlInt
      set P0, 1

      lt P0, 2, OK1
      print "not "
OK1:  print "ok 1\n"

      lt P0, 0, BAD2
      branch OK2
BAD2: print "not ok 2\n"
OK2:  print "ok 2\n"

      new P2, .PerlNum
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
      new P0, .PerlInt
      new P1, .PerlInt

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

      new P2, .PerlNum
      new P3, .PerlNum

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
      new P0, .PerlInt
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

      new P2, .PerlNum
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
      new P0, .PerlInt
      new P1, .PerlInt

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

      new P2, .PerlNum
      new P3, .PerlNum

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
      new P0, .PerlInt
      new P1, .PerlInt

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

      new P2, .PerlNum
      new P3, .PerlNum

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
      new P0, .PerlInt
      new P1, .PerlInt

      set P0, 12
      neg P1, P0
      print P1
      print "\n"

      new P0, .PerlNum
      new P1, .PerlNum
      set N0, -12.345678

      set P0, N0
      neg P1, P0
      print P1
      print "\n"

      new P0, .PerlInt
      new P1, .PerlNum

      set P0, 1
      neg P1, P0
      print P1
      print "\n"

      new P0, .PerlNum
      new P1, .PerlInt

      set P0, 1.234567
      neg P1, P0
      print P1
      print "\n"

      new P0, .PerlInt
      set P0, 25
      neg P0, P0
      print P0
      print "\n"

      new P0, .PerlNum
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
      new P0, .PerlInt
      set P0, 12
      neg P0
      print P0
      print "\n"

      new P0, .PerlNum
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

output_is(<<'CODE', <<OUTPUT, "assign Px,Py");
    new P0, .PerlInt
    new P1, .PerlNum
    new P2, .PerlString
    new P3, .PerlUndef
    set P0, 123
    set P1, 3.14
    set P2, "7.4x"
    set P3, 666

    new P10, .PerlInt
    new P11, .PerlNum
    new P12, .PerlString
    new P13, .PerlUndef

    assign P10, P0
    assign P11, P0
    assign P12, P0
    assign P13, P0
    print P10
    print ":"
    print P11
    print ":"
    print P12
    print ":"
    print P13
    print "\n"

    assign P10, P1
    assign P11, P1
    assign P12, P1
    assign P13, P1
    print P10
    print ":"
    print P11
    print ":"
    print P12
    print ":"
    print P13
    print "\n"

    assign P10, P2
    assign P11, P2
    assign P12, P2
    assign P13, P2
    print P10
    print ":"
    print P11
    print ":"
    print P12
    print ":"
    print P13
    print "\n"

    assign P10, P3
    assign P11, P3
    assign P12, P3
    assign P13, P3
    print P10
    print ":"
    print P11
    print ":"
    print P12
    print ":"
    print P13
    print "\n"

    end
CODE
123:123:123:123
3.140000:3.140000:3.140000:3.140000
7.4x:7.4x:7.4x:7.4x
666:666:666:666
OUTPUT

output_is(<<"CODE", <<OUTPUT, "exchange");
@{[ $fp_equality_macro ]}
	new P0, .PerlInt
        new P1, .PerlInt
	set P0, 123
	set P1, 246
        exchange P0, P1
        set I0, P0
        eq I0, 246, EQ1
        print "not "
EQ1:    print "ok 1\\n"
        set I1, P1
        eq I1, 123, EQ2
        print "not "
EQ2:    print "ok 2\\n"
        new P2, .PerlNum
        new P3, .PerlString
        set P2, 1234.567890
        set P3, "Themistocles"
        exchange P2, P3
        set S2, P2
        eq S2, "Themistocles", EQ3
        print "not "
EQ3:    print "ok 3\\n"
        set S2, "1234.567890"
        set S3, P3
        eq S2, S3, EQ4
        print "not "
EQ4:    print "ok 4\\n"
        new P4, .PerlArray
        new P5, .PerlHash
        new P6, .PerlString
        set P4[2], "Array"
        set P5["2"], "Hash"
        exchange P4, P5
        set S0, P4["2"]
        eq S0, "Hash", EQ5
        print "not "
EQ5:    print "ok 5\\n"
        set S0, P5[2]
        eq S0, "Array", EQ6
        print "not "
EQ6:    print "ok 6\\n"
	end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
OUTPUT

output_is(<<'CODE', <<OUTPUT, "arithmetic with PerlUndef and native ints");
        new P0, .PerlUndef
        add P0, 10
        set I1, P0
        print I1
        print "\n"

        new P0, .PerlUndef
        sub P0, 20
        set I1, P0
        print I1
        print "\n"

        new P0, .PerlUndef
        mul P0, 30
        set I1, P0
        print I1
        print "\n"

        new P0, .PerlUndef
        div P0, 40
        set I1, P0
        print I1
        print "\n"
        end
CODE
10
-20
0
0
OUTPUT

output_is(<<"CODE", <<OUTPUT, "arithmetic with PerlUndef and native floats");
@{[ $fp_equality_macro ]}
        new P0, .PerlUndef
        add P0, 10.0
        set N1, P0
        .fp_ne(N1, 10.0, ERROR)
        print "ok 1\\n"

        new P0, .PerlUndef
        sub P0, 2.345
        set N1, P0
        .fp_ne(N1, -2.345, ERROR)
        print "ok 2\\n"

        new P0, .PerlUndef
        mul P0, 32.5
        set N1, P0
        .fp_ne(N1, 0.000, ERROR)
        print "ok 3\\n"

        new P0, .PerlUndef
        div P0, 0.5
        set N1, P0
        .fp_ne(N1, 0.000, ERROR)
        print "ok 4\\n"
        branch DONE
ERROR:  print "not ok\\n"
        print N1
DONE:
        end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_like(<<"CODE", <<'OUTPUT', "undef warning");
	.include "warnings.pasm"
	warningson .PARROT_WARNINGS_UNDEF_FLAG
	new P0, .PerlUndef
	print P0
	end
CODE
/Use of uninitialized.*
\s+in file .*pasm/i
OUTPUT

output_like(<<"CODE", <<'OUTPUT', "find_method");
	new P1, .PerlInt
	find_method P0, P1, "no_such_meth"
	end
CODE
/Method 'no_such_meth' not found/
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "new with a native type");
        new P1, .INTVAL
	print "never\n"
	end
CODE
/(unknown macro|unexpected DOT)/
OUTPUT

output_is(<<'CODE', <<OUTPUT, "repeat");
        new P0, .PerlUndef
        new P1, .PerlString
        new P2, .PerlInt

        set P2, 1024
        repeat P1, P0, P2
        set S1, P1
        eq S1, "", OK1
        print "not "
OK1:    print "ok 1\n"

        new P0, .PerlUndef
        new P1, .PerlString
        repeat P1, P0, 1024
        set S1, P1
        eq S1, "", OK2
        print "not "
OK2:    print "ok 2\n"
	end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "bor undef");
    new P0, .PerlUndef
    bor P0, 0b00001111
    print  P0
    print "\n"

    new P0, .PerlUndef
    new P1, .PerlInt
    set P1, 0b11110000
    bor P0, P1
    print P0
    print "\n"
    end
CODE
15
240
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "bxor undef");
    new P0, .PerlUndef
    bxor P0, 0b00001111
    print  P0
    print "\n"

    new P0, .PerlUndef
    new P1, .PerlInt
    set P1, 0b11110000
    bxor P0, P1
    print P0
    print "\n"
    end
CODE
15
240
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "band undef");
    new P0, .PerlUndef
    band P0, 0b00001111
    print  P0
    print "\n"

    new P0, .PerlUndef
    new P1, .PerlInt
    set P1, 0b11110000
    band P0, P1
    print P0
    print "\n"
    end
CODE
0
0
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "bnot");
    new P0, .PerlUndef

# We use band in these tests to null out the high bits, and make the
# tests independent of the size of our INTVALs
    bnot P0, P0
    band P0, 0b01010101
    print P0
    print "\n"

    new P0, .PerlUndef
    new P1, .PerlInt
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

output_is(<<'CODE', <<'OUTPUT', "if/unless with Integer PMC");
      new P0, .Integer
      set P0, 10
      if P0, OK1
      print "not "
OK1:  print "ok 1\n"
      unless P0, BAD2
      branch OK2
BAD2: print "not "
OK2:  print "ok 2\n"
      set P0, 0
      if P0, BAD3
      branch OK3
BAD3: print "not "
OK3:  print "ok 3\n"
      unless P0, OK4
      print "not "
OK4:  print "ok 4\n"
      end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "eq_addr same");
      new P0, .Integer
      set P1, P0
      eq_addr P0, P1, OK1
      print "not "
OK1:  print "ok 1\n"
      ne_addr P0, P1, BAD2
      branch OK2
BAD2: print "not "
OK2:  print "ok 2\n"
      end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "eq_addr diff");
      new P0, .Integer
      new P1, .Integer
      ne_addr P0, P1, OK1
      print "not "
OK1:  print "ok 1\n"
      eq_addr P0, P1, BAD2
      branch OK2
BAD2: print "not "
OK2:  print "ok 2\n"
      end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "isnull");
      null P0
      isnull P0, OK1
      print "not "
OK1:  print "ok 1\n"
      new P0, .PerlInt
      isnull P0, BAD2
      branch OK2
BAD2: print "not "
OK2:  print "ok 2\n"
      end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Random PMCs are singletons");
    new P0, .Random
    new P1, .Random
    eq_addr P0, P1, ok
    print "not the same "
ok: print "ok\n"
    end
CODE
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "rand int");
    new P0, .Random
    time I1
    set P0, I1	# seed
    set I0, P0
    set I1, P0
    ne I0, I1, ok1
    print "not "
ok1:print "ok 1\n"
    set I2, P0[100]
    ne I0, I2, ok2
    print "not "
ok2:print "ok 2\n"
    ge I2, 0, ok3
    print "not "
ok3:print "ok 3\n"
    lt I2, 100, ok4
    print "not "
ok4:print "ok 4\n"
    end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "rand float");
    new P0, .Random
    set N0, P0
    set N1, P0
    ne N0, N1, ok1
    print "not "
ok1:print "ok 1\n"
    ge N0, 0, ok2
    print "not "
ok2:print "ok 2\n"
    lt N0, 1.0, ok3
    print "not "
ok3:print "ok 3\n"
    ge N1, 0, ok4
    print "not "
ok4:print "ok 4\n"
    lt N1, 1.0, ok5
    print "not "
ok5:print "ok 5\n"
    end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "issame");
    new P0, .Undef
    new P1, .Undef
    set P1, P0
    issame I0, P0, P1
    print I0
    isntsame I0, P0, P1
    print I0
    new P2, .Undef
    issame I0, P0, P2
    print I0
    isntsame I0, P0, P2
    print I0
    print "\n"
    end
CODE
1001
OUTPUT

1;
