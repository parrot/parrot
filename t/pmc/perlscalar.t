# Copyright: 2006 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 3;

=head1 NAME

t/pmc/perlscalar.t - test Perl non-container PMCs

=head1 SYNOPSIS

    % prove t/pmc/perlscalar.t

=head1 DESCRIPTION

Tests the perlscalar PMC.

=cut

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


pir_output_is(<<'CODE', <<'OUT', 'new', todo => 'not yet working');
.sub 'test' :main
	new P0, .perlscalar
	print "ok 1\n"
.end
CODE
ok 1
OUT

pasm_output_is(<<'CODE', <<OUTPUT, "assign Px,Py");
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

pasm_output_is(<<"CODE", <<OUTPUT, "exchange");
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
        new P5, .Hash
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

