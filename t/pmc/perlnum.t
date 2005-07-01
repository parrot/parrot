#! perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/perlnum.t - Perl Numbers

=head1 SYNOPSIS

    % perl -Ilib t/pmc/perlnum.t

=head1 DESCRIPTION

Tests the C<PerlNum> PMC. Checks Perl-specific numeric behaviour.

=cut

use Parrot::Test tests => 55;
use Test::More;

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

output_is(<<CODE, <<OUTPUT, "if (P) - Num");
    new    P0, .PerlNum

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

output_is(<<CODE, <<OUTPUT, "unless (P) - Num");
    new    P0, .PerlNum

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
EQ1:    print "ok 1\\n"
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
EQ1:    print "ok 1\\n"
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
EQ1:    print "ok 1\\n"
    end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "add number to self");
@{[ $fp_equality_macro ]}
    new P0, .PerlNum
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

output_is(<<"CODE", <<OUTPUT, "sub number from self");
@{[ $fp_equality_macro ]}
    new P0, .PerlNum
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

output_is(<<"CODE", <<OUTPUT, "multiply number by self");
@{[ $fp_equality_macro ]}
    new P0, .PerlNum
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

output_is(<<"CODE", <<OUTPUT, "divide number by self");
@{[ $fp_equality_macro ]}
    new P0, .PerlNum
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
EQ1:    print "ok 1\\n"
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
EQ1:    print "ok 1\\n"
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
EQ1:    print "ok 1\\n"
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
EQ1:    print "ok 1\\n"
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
EQ1:    print "ok 1\\n"
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
EQ1:    print "ok 1\\n"
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
EQ1:    print "ok 1\\n"
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
EQ1:    print "ok 1\\n"
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
EQ1:    print "ok 1\\n"
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
EQ1:    print "ok 1\\n"
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
EQ1:    print "ok 1\\n"
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
EQ1:    print "ok 1\\n"
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
EQ1:    print "ok 1"
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
EQ1:    print "ok 1"
    print "\\n"
    new P2, .PerlNum
    new P3, .PerlNum
    new P4, .PerlNum
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
EQ1:    print "ok 1"
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

output_is(<<CODE, <<OUTPUT, "p =  fmod(p,p)");
@{[ $fp_equality_macro ]}
    new    P0, .PerlNum
    new    P1, .PerlNum
    new    P2, .PerlNum
    new    P3, .PerlInt
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
output_is(<<'CODE', <<'OUTPUT', "+- zero");
  new P0, .PerlNum
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

pir_output_is(<< 'CODE', << 'OUTPUT', "Truth of a positive float");

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

pir_output_is(<< 'CODE', << 'OUTPUT', "Truth of a negative float");

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

pir_output_is(<< 'CODE', << 'OUTPUT', "Truth of a positive integer");

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

pir_output_is(<< 'CODE', << 'OUTPUT', "Truth of a negative integer");

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

pir_output_is(<< 'CODE', << 'OUTPUT', "Falseness of 0");

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

pir_output_is(<< 'CODE', << 'OUTPUT', "Falseness of 0.000");

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

pir_output_is(<< 'CODE', << 'OUTPUT', "check whether interface is done");

.sub _main
    .local pmc pmc1
    pmc1 = new PerlNum
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

TODO: {
    no warnings 'once';
    local $TODO = "pending PerlInt's numeric tower morphinc semantics";
pir_output_is(<<'CODE', <<'OUT', "perlint should morph to num on cos()ing");
.sub main @MAIN
    .local pmc x, y
    # integer morphing for perlint
    print "perlint morph"
    x = new PerlInt
    x = assign 1
    x = new PerlUndef
    y = cos x
    print y
    print "\n"
.end
CODE
perlint morph 0.540302
OUT
}
