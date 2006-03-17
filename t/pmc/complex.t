#! perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 32;

=head1 NAME

t/pmc/complex.t - Complex Numbers

=head1 SYNOPSIS

	% prove t/pmc/complex.t

=head1 DESCRIPTION

Tests the Complex PMC.

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


pasm_output_is(<<'CODE', <<'OUTPUT', "String parsing");
    new P0, .Complex
    new P1, .String

	set P0, "4"
	print P0
    print "\n"

	set P0, "3.14"
	print P0
    print "\n"

	set P0, ".5"
	print P0
    print "\n"

	set P0, "-13"
	print P0
    print "\n"

	set P0, "-.3"
	print P0
    print "\n"

	set P0, "i"
	print P0
    print "\n"

	set P0, "-i"
	print P0
    print "\n"

	set P0, ".3i"
	print P0
    print "\n"

	set P0, "2 + 3i"
	print P0
    print "\n"

	set P0, "4 + 3.5i"
	print P0
    print "\n"

	set P0, "2 + .1 i"
	print P0
    print "\n"

	set P0, "10 - i"
	print P0
    print "\n"

	set P0, "5 - .3i"
	print P0
    print "\n"

	set P1, "-4-i"
	assign P0, P1
	print P0
    print "\n"

	set P1, "- 20 - .5 i"
	assign P0, P1
	print P0
    print "\n"

	set P1, "-13 +2i"
	assign P0, P1
	print P0
    print "\n"

	end
CODE
4+0i
3.14+0i
0.5+0i
-13+0i
-0.3+0i
0+1i
0-1i
0+0.3i
2+3i
4+3.5i
2+0.1i
10-1i
5-0.3i
-4-1i
-20-0.5i
-13+2i
OUTPUT

pasm_output_like(<<'CODE', <<'OUTPUT', "Malformed string: real part");
    new P0, .Complex
    set P0, "q + 3i"
    end
CODE
/Complex: malformed string/
OUTPUT

pasm_output_like(<<'CODE', <<'OUTPUT', "Malformed string: imaginary part");
    new P0, .Complex
    set P0, "1 + ij"
    end
CODE
/Complex: malformed string/
OUTPUT

pasm_output_like(<<'CODE', <<'OUTPUT', "Malformed string: missing +/-");
    new P0, .Complex
    set P0, "1 * i"
CODE
/Complex: malformed string/
OUTPUT

pasm_output_is(<<'CODE', <<'OUTPUT', "add");
	new P0, .Complex
	new P1, .Complex
	new P2, .Float
        new P3, .Integer

    set P0, "1 + i"
    add P0, P0, P0
    print P0
    print "\n"

    set P0, "1 - i"
    set P1, "1 + i"
    add P0, P0, P1
    print P0
    print "\n"
    print P1
    print "\n"

    set P0, "-i"
    set P1, "1"
    add P1, P0, P1
    print P0
    print "\n"
    print P1
    print "\n"

    set P0, "2 + i"
    set P2, 3.3
    add P1, P0, P2
    print P1
    print "\n"

    set P0, "3 + 5i"
    add P1, P0, 2
    print P1
    print "\n"

    set P0, "2 + 2i"
    add P1, P0, -2.0
    print P1
    print "\n"

    set P0, "3 + 3i"
    set P3, -3
    add P1, P0, P3
    print P1
    print "\n"
    add P1, P3, P0
    print P1
    print "\n"

    end
CODE
2+2i
2+0i
1+1i
0-1i
1-1i
5.3+1i
5+5i
0+2i
0+3i
0+3i
OUTPUT

pasm_output_is(<<'CODE', <<'OUTPUT', "subtract");
	new P0, .Complex
	new P1, .Complex
	new P2, .Float
        new P3, .Integer

    set P0, "1 + i"
    sub P0, P0, P0
    print P0
    print "\n"

    set P0, "1 - i"
    set P1, "1 + i"
    sub P0, P0, P1
    print P0
    print "\n"
    print P1
    print "\n"

    set P0, "-i"
    set P1, "1"
    sub P1, P0, P1
    print P0
    print "\n"
    print P1
    print "\n"

    set P0, "1 - 4i"
    set P2, -1.0
    sub P1, P0, P2
    print P1
    print "\n"

    set P0, "- 2 - 2i"
    sub P1, P0, -4
    print P1
    print "\n"

    set P0, "3 + i"
    sub P1, P0, 1.2
    print P1
    print "\n"

    set P0, "1024 - 3i"
    set P3, 2048
    sub P1, P0, P3
    print P1
    print "\n"
    sub P1, P3, P0
    print P1
    print "\n"

    end
CODE
0+0i
0-2i
1+1i
0-1i
-1-1i
2-4i
2-2i
1.8+1i
-1024-3i
1024+3i
OUTPUT

pasm_output_is(<<'CODE', <<'OUTPUT', "multiply");
	new P0, .Complex
	new P1, .Complex
	new P2, .Float
        new P3, .Integer

    set P0, "2 + 3i"
    mul P0, P0, P0
    print P0
    print "\n"

    set P0, "5 - 2i"
    set P1, "5 + 2i"
    mul P0, P0, P1
    print P0
    print "\n"
    print P1
    print "\n"

    set P0, "3i"
    set P1, "2 - i"
    mul P1, P0, P1
    print P0
    print "\n"
    print P1
    print "\n"

    set P0, "2 - 2i"
    set P2, 0.5
    mul P1, P0, P2
    print P1
    print "\n"

    set P0, "1 - i"
    mul P1, P0, 2
    print P1
    print "\n"

    set P0, "-1 + i"
    mul P1, P0, -1.0
    print P1
    print "\n"

    set P0, "1 + i"
    set P3, 10
    mul P1, P0, P3
    print P1
    print "\n"
    end
CODE
-5+12i
29+0i
5+2i
0+3i
3+6i
1-1i
2-2i
1-1i
10+10i
OUTPUT

pasm_output_is(<<'CODE', <<'OUTPUT', "divide");
	new P0, .Complex
	new P1, .Complex
	new P2, .Float

    set P0, "2 + 3i"
    div P0, P0, P0
    print P0
    print "\n"

    set P0, "3 + 5i"
    set P1, "5 - 3i"
    div P0, P0, P1
    print P0
    print "\n"
    print P1
    print "\n"

    set P0, "25"
    set P1, "3 + 4i"
    div P1, P0, P1
    print P0
    print "\n"
    print P1
    print "\n"

    set P0, "-3 + 6i"
    set P2, 3.0
    div P1, P0, P2
    print P1
    print "\n"

    set P0, "-2 + 3i"
    div P1, P0, 2
    print P1
    print "\n"

    set P0, "2 - 3i"
    div P1, P0, 0.5
    print P1
    print "\n"

    end
CODE
1+0i
0+1i
5-3i
25+0i
3-4i
-1+2i
-1+1.5i
4-6i
OUTPUT

pasm_output_is(<<"CODE", <<'OUTPUT', "get int/num/bool");
@{[ $fp_equality_macro ]}
        new P0, .Complex
        set P0, "2 - 1.5i"
        print P0
        print "\\n"

        set I0, P0
        print I0
        print "\\n"

        set N0, P0
        .fp_eq( N0, 2.5, OK )
        print "not "
OK:     print "ok\\n"

        if P0, TRUE
        print "not "
TRUE:   print "true\\n"

        set P0, "0"
        unless P0, FALSE
        print "not "
FALSE:  print "false\\n"

        end
CODE
2-1.5i
2
ok
true
false
OUTPUT

pasm_output_is(<<"CODE", <<'OUTPUT', "get keyed");
@{[ $fp_equality_macro ]}
        new P0, .Complex
        new P1, .String
        set P0, "- 3.3 + 1.2i"
        set P1, "imag"

        set N0, P0["real"]
        set N1, P0["imag"]
        set N2, P0[P1]
        print "N0 "
        .fp_ne( N0, -3.3, BAD1)
        print "N1 "
        .fp_ne( N1, 1.2, BAD1)
        print "N2 "
        .fp_ne( N2, 1.2, BAD1)
        branch OK1

BAD1:   print "not "
OK1:    print "OK\\n"

        set P2, P0["real"]
        set P3, P0[P1]
        print P2
        print "\\n"
        print P3
        print "\\n"

        set I0, P0["real"]
        set I1, P0[P1]
        print I0
        print "\\n"
        print I1
        print "\\n"

        end
CODE
N0 N1 N2 OK
-3.3
1.2
-3
1
OUTPUT

pasm_output_like(<<"CODE", <<'OUTPUT', "get keyed: invalid string key");
    new P0, .Complex
    set P0, "5 + 3.5i"
    set N0, P0["Foo"]
    end
CODE
/Complex: key is neither 'real' or 'imag'/
OUTPUT

pasm_output_like(<<"CODE", <<'OUTPUT', "get keyed: invalid numeric key");
    new P0, .Complex
    set P0, "5 + 3.5i"
    set N0, P0[2]
    end
CODE
/Complex: key must be 0 or 1/
OUTPUT

pasm_output_is(<<'CODE', <<'OUTPUT', "set int/num");
    new P0, .Complex

    set P0, "3 + 4i"
    set P0, -2
    print P0
    print "\n"

    set P0, "2 + 5i"
    set P0, .4
    print P0
    print "\n"

    end
CODE
-2+0i
0.4+0i
OUTPUT

pasm_output_is(<<'CODE', <<'OUTPUT', "set keyed");
    new P0, .Complex
    new P1, .String
    new P2, .String
    set P1, "real"

    set P0[P1], 1
    set P0["imag"], 4
    print P0
    print "\n"

    set P0[P1], 3.2
    set P0["imag"], -2.3
    print P0
    print "\n"

    set P2, ".5"
    set P0[P1], P2
    set P2, 6
    set P0["imag"], P2
    print P0
    print "\n"

    end
CODE
1+4i
3.2-2.3i
0.5+6i
OUTPUT

pasm_output_like(<<'CODE', <<'OUTPUT', "set keyed: invalid key");
    new P0, .Complex
    set P0[2], 12.5
    end
CODE
/Complex: key must be 0 or 1/
OUTPUT

pasm_output_is(<<'CODE', <<'OUTPUT', "is_equal");
    new P0, .Complex
    new P1, .Complex

    set P0, "2 + 3i"
    set P1["real"], 2
    set P1["imag"], 3

    eq P0, P1, OK1
    print "not "
OK1:print "ok1\n"

    set P1, 0
    ne P0, P1, OK2
    print "not "
OK2:print "ok2\n"

    end
CODE
ok1
ok2
OUTPUT

pasm_output_is(<<'CODE', <<'OUTPUT', "abs");
    new P0, .Complex
    set P0, "4 + 3j"
    new P1, .Undef
    abs P1, P0
    print P1
    print "\n"

    end
CODE
5
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check whether interface is done");

.sub _main
    .local pmc pmc1
    pmc1 = new .Complex
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

pasm_output_is(<< 'CODE', << 'OUTPUT', "instantiate, PASM, I");
    set I0, 1
    set I1, 2
    set I2, 0
    set I3, 0
    set I4, 0
    set I5, 10
    set I6, 20
    getclass P2, "Complex"
    instantiate P1
    print P1
    print "\n"
    end
CODE
10+20i
OUTPUT

SKIP: {
  skip("instantiate n/y", 2);
pir_output_is(<< 'CODE', << 'OUTPUT', "instantiate, PIR, N");

.sub main
    $P0 = getclass "Complex"
    $P1 = $P0."instantiate"(2.0, 3.0)
    print $P1
    print "\n"
    end
.end
CODE
2+3i
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "instantiate, PIR, P");

.sub main
    $P0 = getclass "Complex"
    $P1 = new .Float
    $P1 = 2.0
    $P2 = new .Float
    $P2 = 3.0
    $P1 = $P0."instantiate"($P1, $P2)
    print $P1
    print "\n"
    end
.end
CODE
2+3i
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "instantiate, PIR, S");

.sub main
    $P0 = getclass "Complex"
    $P1 = $P0."instantiate"("2 + 3i")
    print $P1
    print "\n"
    end
.end
CODE
2+3i
OUTPUT
}

pasm_output_is(<<"CODE", <<'OUTPUT', "neg");
@{[ $fp_equality_macro ]}
     new P0, .Complex
     set P0, "1.3 + 1.7i"
     new P1, .Integer
     neg P1, P0
     set N0, P1[0]
     set N1, P1[1]
     .fp_eq(N0, -1.3, OK1)
     print "not "
OK1: print "ok 1\\n"
     .fp_eq(N1, -1.7, OK2)
     print "not "
OK2: print "ok 2\\n"
     end
CODE
ok 1
ok 2
OUTPUT

pasm_output_is(<<"CODE", <<'OUTPUT', "clone");
@{[ $fp_equality_macro ]}
     new P0, .Complex
     set P0, "1 - 3i"
     clone P1, P0
     eq P0, P1, OK1
     print "not "
OK1: print "ok 1\\n"
     set P0, "0 + 0i"
     set N0, P1[0]
     set N1, P1[1]
     .fp_eq(N0, 1.0, OK2)
     print "not "
OK2: print "ok 2\\n"
     .fp_eq(N1, -3.0, OK3)
     print "not "
OK3: print "ok 3\\n"
     end
CODE
ok 1
ok 2
ok 3
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "sub");
.sub main :main
    .local pmc d, f, c
    d = new .Undef
    f = new .Float
    c = new .Complex
    f = 2.2
    c = "5+2j"
    d = c - f
    print d
    print "\n"
    typeof $S0, d
    print $S0
    print "\n"
    d = f - c
    print d
    print "\n"
    typeof $S0, d
    print $S0
    print "\n"
.end
CODE
2.8+2i
Complex
-2.8-2i
Complex
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "i_sub");
.sub main :main
    .local pmc f, c
    f = new .Float
    f = 2.2
    c = new .Complex
    c = "5+2j"
    c -= f
    print c
    print "\n"
    c = new .Complex
    c = "5+2j"
    f -= c
    print f
    print "\n"
.end
CODE
2.8+2i
-2.8-2i
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "ln of complex numbers");
.macro DoIt(val)
    c = .val
	c2 = c.ln()
	print c2
	print "\n"
.endm
.sub main :main
	.local pmc c, c2
    c = new .Complex
	.DoIt("i")
	.DoIt("2i")
	.DoIt("2+2i")
	.DoIt("-1")
.end
CODE
0+1.5708i
0.693147+1.5708i
1.03972+0.785398i
0+3.14159i
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "exp of complex numbers");
.macro DoIt(val)
    c = .val
	c2 = c.exp()
	print c2
	print "\n"
.endm
.sub main :main
	.local pmc c, c2
    c = new .Complex
	.DoIt("i")
	.DoIt("2i")
	.DoIt("2+2i")

	# e^(pi * i) + 1 = 0
	$N0 = atan 1
	$N0 *= 4
	c[0] = 0.0
	c[1] = $N0
	c2 = c.exp()
	c2 += 1.0
    print c2
    print "\n"
.end
CODE
0.540302+0.841471i
-0.416147+0.909297i
-3.07493+6.71885i
0+0i
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "pow with complex numbers");
.macro DoIt(base, power)
	c = .base
	c2 = .power
	c3 = pow c, c2
	print c3
	print "\n"
.endm
.sub main :main
	.local pmc c, c2, c3
	c = new .Complex
	c2 = new .Complex
	c3 = new .Complex
	.DoIt("i", "i")
	.DoIt("i", "2")
	.DoIt("2i", "2")
	.DoIt("2+2i", "2+2i")
	.DoIt("i", "0.5i")
	.DoIt(2, "2i")
	c2 = new .Integer
	.DoIt("2i", 2)
	.DoIt("2", 4)
	c2 = new .Float
	.DoIt("2i", 0.5)

	# another e^(pi * i) + 1 = 0
	c = new .Complex
	c2 = new .Complex
	$N0 = exp 1
	c[0] = $N0
	c[1] = 0.0
	$N0 = atan 1
	$N0 *= 4
	c2[0] = 0.0
	c2[1] = $N0
	c3 = pow c, c2
	c3 += 1.0
	print c3
	print "\n"
.end
CODE
0.20788+0i
-1+0i
-4+0i
-1.4525-0.80989i
0.455938+0i
0.183457+0.983028i
-4+0i
16+0i
1+1i
0+0i
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "sprintf with a complex");
.macro DoIt(fmt, number)
	c = .number
	$S0 = sprintf .fmt, c
	print $S0
.endm
.sub main :main
	.local pmc c, c2
	c = new .Complex
	.DoIt("%d%+di\n", "1.35+35.1i")
	.DoIt("%.3f%+.3fi\n", "0+3.141592653589793i")
.end
CODE
1+35i
0.000+3.142i
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "sin of complex numbers");
.macro DoIt(val)
    c = .val
	c2 = sin c
	print c2
	print "\n"
.endm
.sub main :main
	.local pmc c, c2
    c = new .Complex
	.DoIt("i")
	.DoIt("2i")
	.DoIt("2+2i")
	.DoIt("1+i")
.end
CODE
0+1.1752i
0+3.62686i
3.42095-1.50931i
1.29846+0.634964i
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "cos of complex numbers");
.macro DoIt(val)
    c = .val
	c2 = cos c
	print c2
	print "\n"
.endm
.sub main :main
	.local pmc c, c2
    c = new .Complex
    c2 = new .Complex
	.DoIt("i")
	.DoIt("2i")
	.DoIt("1+i")
	.DoIt(".5+.5i")
	.DoIt("2+2i")
	.DoIt("-2-2i")
	.DoIt("-2+2i")
	.DoIt("-2")
	.DoIt("-2-0i")
	.DoIt("2-2i")
.end
CODE
1.54308+0i
3.7622+0i
0.83373-0.988898i
0.989585-0.249826i
-1.56563-3.29789i
-1.56563-3.29789i
-1.56563+3.29789i
-0.416147+0i
-0.416147-0i
-1.56563+3.29789i
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "atan of complex numbers");
.macro DoIt(val)
    c = .val
	c2 = atan c
	print c2
	print "\n"
.endm
.sub main :main
	.local pmc c, c2
    c = new .Complex
    c2 = new .Complex
	.DoIt("1")
	.DoIt("2")
	.DoIt("2i")
	.DoIt("2+2i")
	.DoIt("4")
	.DoIt("4i")
	.DoIt("4+4i")
.end
CODE
0.785398+0i
1.10715+0i
-1.5708+0.549306i
1.31122+0.238878i
1.32582+0i
-1.5708+0.255413i
1.44452+0.123674i
OUTPUT

