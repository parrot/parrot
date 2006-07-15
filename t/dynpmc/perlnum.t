# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 60;

=head1 NAME

t/dynpmc/perlnum.t - Test the Perl Number PMC

=head1 SYNOPSIS

    % prove t/dynpmc/perlnum.t

=head1 DESCRIPTION

Tests the C<PerlNum> PMC. Checks Perl-specific numeric behaviour.

=cut

my $fp_equality_macro = <<'ENDOFMACRO';
.macro fp_eq (    J, K, L )
    save    N0
    save    N1
    save    N2

    set    N0, .J
    set    N1, .K
    sub    N2, N1,N0
    abs    N2, N2
    gt    N2, 0.000001, .$FPEQNOK

    restore N2
    restore    N1
    restore    N0
    branch    .L
.local $FPEQNOK:
    restore N2
    restore    N1
    restore    N0
.endm
.macro fp_ne(    J,K,L)
    save    N0
    save    N1
    save    N2

    set    N0, .J
    set    N1, .K
    sub    N2, N1,N0
    abs    N2, N2
    lt    N2, 0.000001, .$FPNENOK

    restore    N2
    restore    N1
    restore    N0
    branch    .L
.local $FPNENOK:
    restore    N2
    restore    N1
    restore    N0
.endm
ENDOFMACRO

my $load_perl = <<'END_PASM';
    loadlib P20, 'perl_group'
    find_type I24, 'PerlInt'
    find_type I25, 'PerlNum'
    find_type I27, 'PerlString'
    find_type I28, 'PerlUndef'
END_PASM

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', "set/get string value");
    new P0, I27
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

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "assign number");
@{[ $fp_equality_macro ]}
    new P0, I24
    assign P0, 42.21
    .fp_eq(P0, 42.21, OK1)
    print  "not "
OK1:
    print  "ok 1\\n"

    new P1, I25
    assign P1, 21.01
    .fp_eq(P1, 21.01, OK2)
    print  "not "
OK2:
    print  "ok 2\\n"

    new P2, I27
    assign P2, 7.65
    .fp_eq(P2, 7.65, OK3)
    print  "not "
OK3:
    print  "ok 3\\n"

    new P3, I28
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

pasm_output_is($load_perl . <<CODE, <<OUTPUT, "if (P) - Num");
    new    P0, I25

    set    P0, 1.1
    if    P0, OK1
    print    "not "
OK1:    print    "ok 1\\n"

    set    P0, 0.0
    if    P0, BAD2
    branch OK2
BAD2:    print    "not "
OK2:    print    "ok 2\\n"

    end
CODE
ok 1
ok 2
OUTPUT

pasm_output_is($load_perl . <<CODE, <<OUTPUT, "unless (P) - Num");
    new    P0, I25

    set    P0, 0.0
    unless    P0, OK1
    print    "not "
OK1:    print    "ok 1\\n"

    set    P0, 1.1
    unless    P0, BAD2
    branch OK2
BAD2:    print    "not "
OK2:    print    "ok 2\\n"

    end
CODE
ok 1
ok 2
OUTPUT

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "inc, PerlNum");
@{[ $fp_equality_macro ]}
    new P3, I25

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

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "dec, PerlNum");
@{[ $fp_equality_macro ]}
    new P3, I25

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

pasm_output_is($load_perl . <<CODE, <<OUTPUT, "mul_p_p, PerlNum");
@{[ $fp_equality_macro ]}
    new P0,I25
    new P1,I25
    set P0,-2.5
    set P1,2.5
    mul P0,P1
    .fp_eq(P0,-6.25,EQ1)
    print "not "
EQ1:   print "ok 1"
    print "\\n"

    new P2, I24
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

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "add number to string integer");
@{[ $fp_equality_macro ]}
    new P0, I25
    new P1, I27
    set P0, 6.1
    set P1, "7"
    add P0,P0,P1
    .fp_eq( P0, 13.1, EQ1)
    print P0
    print "not "
EQ1:    print "ok 1\\n"
    end
CODE
ok 1
OUTPUT

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "add number to string");
@{[ $fp_equality_macro ]}
    new P0, I25
    new P1, I27
    set P0, 6.1
    set P1, "ab"
    add P0,P0,P1
    .fp_eq( P0, 6.1, EQ1)
    print P0
    print "not "
EQ1:    print "ok 1\\n"
    end
CODE
ok 1
OUTPUT

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "add number to string number");
@{[ $fp_equality_macro ]}
    new P0, I25
    new P1, I27
    set P0, 6.1
    set P1, "7.5"
    add P0,P0,P1
    .fp_eq( P0, 13.6, EQ1)
    print P0
    print "not "
EQ1:    print "ok 1\\n"
    end
CODE
ok 1
OUTPUT

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "add number to self");
@{[ $fp_equality_macro ]}
    new P0, I25
    set P0, 123.123
    add P0, P0, P0
    .fp_eq( P0, 246.246, EQ1)
    print P0
    print "not "
EQ1:    print "ok 1\\n"
    end
CODE
ok 1
OUTPUT

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "sub number from self");
@{[ $fp_equality_macro ]}
    new P0, I25
    set P0, 456.456
    sub P0, P0, P0
    .fp_eq( P0, 0, EQ1)
    print P0
    print "not "
EQ1:    print "ok 1\\n"
    end
CODE
ok 1
OUTPUT

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "multiply number by self");
@{[ $fp_equality_macro ]}
    new P0, I25
    set P0, 124.124
    mul P0, P0, P0
    .fp_eq( P0, 15406.767376, EQ1)
    print P0
    print "not "
EQ1:    print "ok 1\\n"
    end
CODE
ok 1
OUTPUT

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "divide number by self");
@{[ $fp_equality_macro ]}
    new P0, I25
    set P0, 23.23
    div P0, P0, P0
    .fp_eq( P0, 1, EQ1)
    print P0
    print "not "
EQ1:    print "ok 1\\n"
    end
CODE
ok 1
OUTPUT

#
# Number vs. number
#
pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "add number to other");
@{[ $fp_equality_macro ]}
    new P0, I25
    new P1, I25
    set P0, 123.123
    set P1, 321.321
    add P1, P1, P0
    .fp_eq( P1, 444.444, EQ1)
    print P1
    print "not "
EQ1:    print "ok 1\\n"
    end
CODE
ok 1
OUTPUT

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "subtract number from other");
@{[ $fp_equality_macro ]}
    new P0, I25
    new P1, I25
    set P0, 123.123
    set P1, 321.321
    sub P1, P1, P0
    .fp_eq( P1, 198.198, EQ1)
    print P1
    print "not "
EQ1:    print "ok 1\\n"
    end
CODE
ok 1
OUTPUT

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "multiply number by other");
@{[ $fp_equality_macro ]}
    new P0, I25
    new P1, I25
    set P0, 123.123
    set P1, 321.321
    mul P1, P1, P0
    .fp_eq( P1, 39562.005483, EQ1)
    print P1
    print "not "
EQ1:    print "ok 1\\n"
    end
CODE
ok 1
OUTPUT

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "divide number by other");
@{[ $fp_equality_macro ]}
    new P0, I25
    new P1, I25
    set P0, 123.123
    set P1, 246.246
    div P1, P1, P0
    .fp_eq( P1, 2, EQ1)
    print P1
    print "not "
EQ1:    print "ok 1\\n"
    end
CODE
ok 1
OUTPUT

#
# Number vs. integer
#
pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "add integer to number");
@{[ $fp_equality_macro ]}
    new P0, I24
    new P1, I25
    set P0, 123
    set P1, 321.321
    add P1, P1, P0
    .fp_eq( P1, 444.321, EQ1)
    print P1
    print "not "
EQ1:    print "ok 1\\n"
    end
CODE
ok 1
OUTPUT

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "subtract integer from number");
@{[ $fp_equality_macro ]}
    new P0, I24
    new P1, I25
    set P0, 123
    set P1, 321.321
    sub P1, P1, P0
    .fp_eq( P1, 198.321, EQ1)
    print P1
    print "not "
EQ1:    print "ok 1\\n"
    end
CODE
ok 1
OUTPUT

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "multiply integer by number");
@{[ $fp_equality_macro ]}
    new P0, I24
    new P1, I25
    set P0, 123
    set P1, 321.321
    mul P1, P1, P0
    .fp_eq( P1,39522.483 , EQ1)
    print P1
    print "not "
EQ1:    print "ok 1\\n"
    end
CODE
ok 1
OUTPUT

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "divide integer by number");
@{[ $fp_equality_macro ]}
    new P0, I24
    new P1, I25
    set P0, 123
    set P1, 246.246
    div P1, P1, P0
    .fp_eq( P1, 2.002 , EQ1)
    print P1
    print "not "
EQ1:    print "ok 1\\n"
    end
CODE
ok 1
OUTPUT

#
# Number vs. integer
#
pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "add integer to number");
@{[ $fp_equality_macro ]}
    new P0, I24
    new P1, I25
    set P0, 123
    set P1, 321.321
    add P1, P0, P1
    .fp_eq( P1, 444.321 , EQ1)
    print P1
    print "not "
EQ1:    print "ok 1\\n"
    end
CODE
ok 1
OUTPUT

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "subtract integer from number");
@{[ $fp_equality_macro ]}
    new P0, I24
    new P1, I25
    set P0, 123
    set P1, 321.321
    sub P1, P0, P1
    .fp_eq( P1, -198.321000, EQ1)
    print P1
    print "not "
EQ1:    print "ok 1\\n"
    end
CODE
ok 1
OUTPUT

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "multiply integer by number");
@{[ $fp_equality_macro ]}
    new P0, I24
    new P1, I25
    set P0, 123
    set P1, 321.321
    mul P1, P0, P1
    .fp_eq( P1, 39522.483, EQ1)
    print P1
    print "not "
EQ1:    print "ok 1\\n"
    end
CODE
ok 1
OUTPUT

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "divide integer by number");
@{[ $fp_equality_macro ]}
    new P0, I24
    new P1, I25
    set P0, 123
    set P1, 246.246
    div P1, P0, P1
    .fp_eq( P1, 0.499500, EQ1)
    print P1
    print "not "
EQ1:    print "ok 1\\n"
    end
CODE
ok 1
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<OUTPUT, "add number  number gives int");
    new P0, I25
    new P1, I25
    set P0, 4.2
    set P1, 2.8
    add P0, P1
    print P0
    print "\n"
    end
CODE
7
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<OUTPUT, "sub number  number gives int");
    new P0, I25
    new P1, I25
    set P0, 4.2
    set P1, 2.2
    sub P0, P1
    print P0
    print "\n"
    end
CODE
2
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<OUTPUT, "mul number  number gives int");
    new P0, I25
    new P1, I25
    set P0, 4.5
    set P1, 2.0
    mul P0, P1
    print P0
    print "\n"
    end
CODE
9
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<OUTPUT, "divide number by number gives int");
    new P0, I25
    new P1, I25
    set P0, 4.2
    set P1, 2.1
    div P0, P1
    print P0
    print "\n"
    end
CODE
2
OUTPUT

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "add PerlNum to PerlNum");
@{[ $fp_equality_macro ]}
    new P0, I25
    new P1, I25
    set P1, 4000.04
    set P0, 123
    add P0, P0, P1
    .fp_eq( P0, 4123.04, EQ1)
    print "not "
EQ1:    print "ok 1"
    print "\\n"
    end
CODE
ok 1
OUTPUT

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "subtract PerlNum from PerlNum");
@{[ $fp_equality_macro ]}
    new P0, I25
    new P1, I25
    set P1, 4000.04
    set P0, 123
    sub P0, P0, P1
    .fp_eq( P0, -3877.04, EQ1)
    print "not "
EQ1:    print "ok 1"
    print "\\n"
    new P2, I25
    new P3, I25
    new P4, I25
    set P2, 12.7
    set P3, 12.6
    sub P3, P2
    .fp_eq( P3, -0.1, EQ2)
    print "not "
EQ2:    print "ok 2"
    print "\\n"
    end
CODE
ok 1
ok 2
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<OUTPUT, "multiply PerlNum with PerlNum");
    new P0, I25
    new P1, I25
    set P1, 4000.04
    set P0, 123
    mul P0, P0, P1
    print P0
    print "\n"
    end
CODE
492004.920000
OUTPUT

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "divide PerlNum by PerlNum");
@{[ $fp_equality_macro ]}
    new P0, I25
    new P1, I25
    set P1, 4000
    set P0, 123
    div P0, P0, P1

    .fp_eq( P0, 0.03074969250307496925, EQ1)
    print P0
    print "not "
EQ1:    print "ok 1"
    print "\\n"
    end
CODE
ok 1
OUTPUT

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "add INTVAL to PerlNum");
@{[ $fp_equality_macro ]}
    new P0, I25
    new P1, I25

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

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "add FLOATVAL to PerlNum");
@{[ $fp_equality_macro ]}
    new P0, I25
    new P1, I25

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

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "subtract INTVAL from PerlNum");
@{[ $fp_equality_macro ]}
    new P0, I25
    new P1, I25

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

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "subtract FLOATVAL from PerlNum");
@{[ $fp_equality_macro ]}
    new P0, I25
    new P1, I25

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

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "multiply PerlNum by INTVAL");
@{[ $fp_equality_macro ]}
    new P0, I25
    new P1, I25

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

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "multiply PerlNum by FLOATVAL");
@{[ $fp_equality_macro ]}
    new P0, I25
    new P1, I25

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

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "divide PerlNum by INTVAL");
@{[ $fp_equality_macro ]}
    new P0, I25
    new P1, I25

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

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "divide PerlNum by FLOATVAL");
@{[ $fp_equality_macro ]}
    new P0, I25
    new P1, I25

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


pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "eq_p_n");
    new P0, I25

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


pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "ne_p_n");
    new P0, I25

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

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "eq_num");
    new P0, I25
    new P1, I25

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

    new P2, I24
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

pasm_output_is($load_perl . <<CODE, <<OUTPUT, "p =  fmod(p,p)");
@{[ $fp_equality_macro ]}
    new    P0, I25
    new    P1, I25
    new    P2, I25
    new    P3, I24
    set    P0, 13.4
    set    P1, 6.0
    cmod    P2, P0, P1
    .fp_eq(P2, 1.4, OK1)
    print "not "
OK1:    print "ok 1\\n"
    set    P0, -25.1
    cmod    P3, P0, P1
    .fp_eq(P3, -1.1, OK2)
    print "not "
OK2:    print "ok 2\\n"
    cmod    P0, P0, P1
    .fp_eq(P0, -1.1, OK3)
    print "not "
OK3:    print "ok 3\\n"
    end
CODE
ok 1
ok 2
ok 3
OUTPUT

#
# s. config/gen/platform/generic/math.h
#
pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', "+- zero");
  new P0, I25
  set P0, 0.0
  print P0
  print "\n"
  set P0, -0.0
  print P0
  print "\n"
  end
CODE
0
-0.000000
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Truth of a positive float");

.sub _main
    .local pmc float_1
    float_1 = new Float
    float_1 = 123.123
    print float_1
    if float_1 goto IS_TRUE
    print " is false\n"
    end
    IS_TRUE:
    print " is true\n"
    end
.end
CODE
123.123 is true
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Truth of a negative float");

.sub _main
    .local pmc float_1
    float_1 = new Float
    float_1 = -123.123
    print float_1
    if float_1 goto IS_TRUE
    print " is false\n"
    end
    IS_TRUE:
    print " is true\n"
    end
.end
CODE
-123.123 is true
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Truth of a positive integer");

.sub _main
    .local pmc float_1
    float_1 = new Float
    float_1 = 1
    print float_1
    if float_1 goto IS_TRUE
    print " is false\n"
    end
    IS_TRUE:
    print " is true\n"
    end
.end
CODE
1 is true
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Truth of a negative integer");

.sub _main
    .local pmc float_1
    float_1 = new Float
    float_1 = -1
    print float_1
    if float_1 goto IS_TRUE
    print " is false\n"
    end
    IS_TRUE:
    print " is true\n"
    end
.end
CODE
-1 is true
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Falseness of 0");

.sub _main
    .local pmc float_1
    float_1 = new Float
    float_1 = 0
    print float_1
    if float_1 goto IS_TRUE
    print " is false\n"
    end
    IS_TRUE:
    print " is true\n"
    end
.end
CODE
0 is false
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Falseness of 0.000");

.sub _main
    .local pmc float_1
    float_1 = new Float
    float_1 = 0.000
    print float_1
    if float_1 goto IS_TRUE
    print " is false\n"
    end
    IS_TRUE:
    print " is true\n"
    end
.end
CODE
0 is false
OUTPUT

pir_output_is(<<"CODE", <<'OUTPUT', 'check whether interface is done');

.sub 'test' :main
$load_perl

    .local pmc pmc1
    pmc1 = new I25
    .local int bool1
    does bool1, pmc1, "scalar"
    print bool1
    print "\\n"
    does bool1, pmc1, "float"
    print bool1
    print "\\n"
    does bool1, pmc1, "no_interface"
    print bool1
    print "\\n"
    end
.end
CODE
1
1
0
OUTPUT

TODO: {
    no warnings 'once';
    local $TODO = "pending PerlInt's numeric tower morphing semantics";
pir_output_is(<<"CODE", <<'OUT', "perlint should morph to num on cos()ing");
.sub 'test' :main
$load_perl
    .local pmc x, y
    # integer morphing for perlint
    print "perlint morph"
    x = new I24
    x = assign 1
    x = new I28
    y = cos x
    print y
    print "\\n"
.end
CODE
perlint morph 0.540302
OUT
}


pasm_output_is($load_perl . <<"CODE", <<'OUTPUT', 'add number to other');
@{[ $fp_equality_macro ]}
	new P0, I25
	new P1, .Float
	set P0, 123.123
	set P1, 321.321
	add P1, P1, P0
	.fp_eq( P1, 444.444, EQ1)
	print P1
	print "not "
EQ1:	print "ok 1\\n"

	new P0, I25
	new P1, .Float
	set P0, 123.123
	set P1, 321.321
	add P0, P0, P1
	.fp_eq( P0, 444.444, EQ2)
	print P0
	print "not "
EQ2:	print "ok 2\\n"

        new P2, .Integer
        new P3, .Float
        set P2, 100
        set P3, 12.5
        add P2, P2, P3
        eq P2, 112.5, EQ3
        print P2
	print "not "
EQ3:	print "ok 3\\n"

        new P2, .Integer
        new P3, .Float
        set P2, 100
        set P3, 12.5
        add P3, P3, P2
        .fp_eq(P3, 112.5, EQ4)
        print P3
	print "not "
EQ4:	print "ok 4\\n"
	end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

pasm_output_is($load_perl . <<"CODE", <<'OUTPUT', 'subtract number from other');
@{[ $fp_equality_macro ]}
	new P0, I25
	new P1, .Float
	set P0, 111.222
	set P1, 333.444
	sub P1, P1, P0
	.fp_eq( P1, 222.222, EQ1)
	print P1
	print "not "
EQ1:	print "ok 1\\n"

	new P0, I25
	new P1, .Float
	set P0, 123.456
	set P1, 456.123
	sub P0, P0, P1
	.fp_eq( P0, -332.667, EQ2)
	print P0
	print "not "
EQ2:	print "ok 2\\n"

	new P2, .Integer
	new P3, .Float
	set P2, 21
	set P3, 321.321
	sub P3, P3, P2
	.fp_eq( P3, 300.321, EQ3)
	print P3
	print "not "
EQ3:	print "ok 3\\n"

	new P2, .Integer
	new P3, .Float
	set P2, 21
	set P3, 321.321
	sub P2, P2, P3
	.fp_eq( P2, -300.321, EQ4)
	print P2
	print "not "
EQ4:	print "ok 4\\n"

	end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

pasm_output_is($load_perl . <<"CODE", <<'OUTPUT', 'multiply number by other');
@{[ $fp_equality_macro ]}
	new P0, I25
	new P1, .Float
	set P0, 123.123
	set P1, 321.321
	mul P1, P1, P0
	.fp_eq( P1, 39562.005483, EQ1)
	print P1
	print "not "
EQ1:	print "ok 1\\n"

	new P0, I25
	new P1, .Float
	set P0, 123.123
	set P1, 321.321
	mul P0, P0, P1
	.fp_eq( P0, 39562.005483, EQ2)
	print P0
	print "not "
EQ2:	print "ok 2\\n"

	new P2, .Integer
	new P3, .Float
	set P2, 5
	set P3, 321.321
	mul P3, P3, P2
	.fp_eq( P3, 1606.605, EQ3)
	print P3
	print "not "
EQ3:	print "ok 3\\n"

	new P2, I25
	new P3, .Float
	set P2, 5
	set P3, 1010.0101
	mul P2, P2, P3
	.fp_eq( P2, 5050.0505, EQ4)
	print P2
	print "not "
EQ4:	print "ok 4\\n"

	end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

pasm_output_is($load_perl . <<"CODE", <<'OUTPUT', 'divide number by other');
@{[ $fp_equality_macro ]}
	new P0, I25
	new P1, .Float
	set P0, 123.123
	set P1, 246.246
	div P1, P1, P0
	.fp_eq( P1, 2.0, EQ1)
	print P1
	print "not "
EQ1:	print "ok 1\\n"

	new P0, I25
	new P1, .Float
	set P0, 123.123
	set P1, 246.246
	div P0, P0, P1
	.fp_eq( P0, 0.5, EQ2)
	print P0
	print "not "
EQ2:	print "ok 2\\n"

	new P2, .Integer
	new P3, .Float
	set P2, 10
	set P3, 246.246
	div P3, P3, P2
	.fp_eq( P3, 24.6246, EQ3)
	print P3
	print "not "
EQ3:	print "ok 3\\n"
	
	new P2, .Integer
	new P3, .Float
	set P2, 300
	set P3, 246.246
	div P2, P2, P3
	.fp_eq( P2, 1.218293, EQ4)
	print P2
	print "not "
EQ4:	print "ok 4\\n"

        end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', 'comparison ops: cmp_num');
        new P1, .Float
        set P1, 1.1
        new P2, .Float
        set P2, 1.2
        new P3, .Float
        set P3, 1.0
        new P4, I25
        set P4, 1.1
        new P5, I25
        set P5, 1.2
        new P6, I25
        set P6, 1.0
        new P7, .Float
        set P7, P1

        cmp_num I0, P1, P1
        print I0
        print "\n"
        cmp_num I0, P1, P2
        print I0
        print "\n"
        cmp_num I0, P1, P3
        print I0
        print "\n"
        cmp_num I0, P1, P4
        print I0
        print "\n"
        cmp_num I0, P1, P5
        print I0
        print "\n"
        cmp_num I0, P1, P6
        print I0
        print "\n"
        cmp_num I0, P1, P7
        print I0
        print "\n"
        end
CODE
0
-1
1
0
-1
1
0
OUTPUT
