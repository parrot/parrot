#! perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Config;
use Parrot::Test tests => 53;

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

pasm_output_is(<< 'CODE', << 'OUTPUT', "multiply");
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


  for my $type ("Complex", "Float", "Integer") {
      pir_output_is(<<"CODE", <<OUTPUT, "complex divide by zero $type");
.sub _main :main
    P0 = new Complex
    set P0, "4+3.5i"
    P1 = new Complex
    ## divide by a zero $type
    P2 = new $type
    set P2, 0
    push_eh OK
    P1 = P0 / P2
    print "fail\\n"
    clear_eh
OK:
    get_results '(0,0)', \$P0, \$S0
    print "ok\\n"
    print \$S0
    print "\\n"
.end
CODE
ok
Divide by zero
OUTPUT
  }

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

SKIP: {
  skip("instantiate n/y", 3);
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
	.DoIt("%.3f%+.3fi\n", "0+i")
.end
CODE
1+35i
0.000+3.142i
0.000+1.000i
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "pow with complex numbers");
.macro DoIt(base, power)
	c = .base
	c2 = .power
	c3 = pow c, c2
	$S0 = sprintf "%.6f%+.6fi\n", c3
	print $S0
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
.end
CODE
0.207880+0.000000i
-1.000000+0.000000i
-4.000000+0.000000i
-1.452505-0.809890i
0.455938+0.000000i
0.183457+0.983028i
-4.000000+0.000000i
16.000000+0.000000i
1.000000+1.000000i
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "sqrt of complex numbers");
.macro DoIt(val)
    c = .val
	c2 = sqrt c
	print c2
	print "\n"
.endm
.sub main :main
	.local pmc c, c2
    c = new .Complex
	.DoIt("4")
	.DoIt("i")
	.DoIt("2i")
	.DoIt("2+2i")
	.DoIt("1+i")
.end
CODE
2+0i
0.707107+0.707107i
1+1i
1.55377+0.643594i
1.09868+0.45509i
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "e^(pi*i) + 1 = 0");
.macro PrintIt(fmt, number)
	c = .number
	$S0 = sprintf .fmt, c
	print $S0
.endm
.sub main :main
	.local pmc c, c2, c3
    c = new .Complex
    c2 = new .Complex
    c3 = new .Complex
	# e^(pi * i) + 1 = 0
	$N0 = atan 1
	$N0 *= 4
	c[0] = 0.0
	c[1] = $N0
	c2 = c.exp()
	c2 += 1.0
        .PrintIt("%.3f%+.3fi\n", c2) 

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
        .PrintIt("%.3f%+.3fi\n", c3) 
.end
CODE
0.000+0.000i
0.000+0.000i
OUTPUT

# This code is used to generate the below tests
# The inverse hyperbolic functions are broken
# and handling of -0.0 problems requires hand editting the tests
# Need to find some formal spec for when to return -0.0...
#use Math::Complex;
#foreach my $func (qw(
#	ln exp sqrt
#	sin   cos   tan   cot   sec   csc
#	asin  acos  atan  acot  asec  acsc
#	sinh  cosh  tanh  coth  sech  csch
#	)) {
#	#asinh acosh atanh acoth asech acsch
#	my $fmt = '"%f%+fi"';
#	my $fmtg = '"%g%+gi"';
#
#	my $code = << "END";
#pir_output_is(<< 'CODE', << 'OUTPUT', "$func of complex numbers");
#.macro DoIt(val, res)
#	if .res == 'Math::Complex Error' goto .\$ok
#	c = .val
#	c2 = c.$func()
#	str = sprintf $fmt, c2
#	unless str != .res goto .\$ok
#	print "\\n$func("
#	print .val
#	print ")\\n\\t\\tgot\\t"
#	print str
#	print "\\n\\t\\tnot\\t"
#	print .res
#	print "\\n"
#.local \$ok:
#.endm
#.sub main :main
#	.local pmc c, c2
#	.local string str
#	c = new .Complex
#	c2 = new .Complex
#END
#	foreach my $num (
#		[-2.0, 0.0],
#		[-1.0, 0.0],
#		[-0.5, 0.0],
#		[ 0.5, 0.0],
#		[ 1.0, 0.0],
#		[ 2.0, 0.0],
#
#		[0.0, -2.0],
#		[0.0, -1.0],
#		[0.0, -0.5],
#		[0.0,  0.5],
#		[0.0,  1.0],
#		[0.0,  2.0],
#
#		[ 0, 0],
#		[ 2, 3], [ 2, -3],
#		[-2, 3], [-2, -3],
#	) {
#		my $a;
#		# Eval in case Math::Complex wants to die
#		eval "\$a = $func($num->[0] + ($num->[1] * i))";
#		if ($@) {
#			$code .= sprintf "\t.DoIt($fmtg, 'Math::Complex Error')\n",
#				$num->[0], $num->[1];
#		}
#		else {
#			$code .= sprintf "\t.DoIt($fmtg, $fmt)\n",
#				$num->[0], $num->[1],
#				Re($a), Im($a);
#		}
#	}
#	$code .= <<END;
#	print "done\\n"
#.end
#CODE
#done
#OUTPUT
#
#END
#	#eval $code;
#	print STDERR $code;
#}

pir_output_is(<< 'CODE', << 'OUTPUT', "ln of complex numbers");
.macro DoIt(val, res)
	c = .val
	c2 = c.ln()
	str = sprintf "%f%+fi", c2
	unless str != .res goto .$ok
	print "\nln("
	print .val
	print ")\n\t	got\t"
	print str
	print "\n\t\tnot\t"
	print .res
	print "\n"
.local $ok:
.endm
.sub main :main
	.local pmc c, c2
	.local string str
	c = new .Complex
	c2 = new .Complex
	.DoIt("-2+0i", "0.693147+3.141593i")
	.DoIt("-1+0i", "0.000000+3.141593i")
	.DoIt("-0.5+0i", "-0.693147+3.141593i")
	.DoIt("0.5+0i", "-0.693147+0.000000i")
	.DoIt("1+0i", "0.000000+0.000000i")
	.DoIt("2+0i", "0.693147+0.000000i")
	.DoIt("0-2i", "0.693147-1.570796i")
	.DoIt("0-1i", "0.000000-1.570796i")
	.DoIt("0-0.5i", "-0.693147-1.570796i")
	.DoIt("0+0.5i", "-0.693147+1.570796i")
	.DoIt("0+1i", "0.000000+1.570796i")
	.DoIt("0+2i", "0.693147+1.570796i")
	.DoIt("0+0i", "-inf+0.000000i")
	.DoIt("2+3i", "1.282475+0.982794i")
	.DoIt("2-3i", "1.282475-0.982794i")
	.DoIt("-2+3i", "1.282475+2.158799i")
	.DoIt("-2-3i", "1.282475-2.158799i")
	print "done\n"
.end
CODE
done
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "exp of complex numbers");
.macro DoIt(val, res)
	c = .val
	c2 = c.exp()
	str = sprintf "%f%+fi", c2
	unless str != .res goto .$ok
	print "\nexp("
	print .val
	print ")\n\t	got\t"
	print str
	print "\n\t\tnot\t"
	print .res
	print "\n"
.local $ok:
.endm
.sub main :main
	.local pmc c, c2
	.local string str
	c = new .Complex
	c2 = new .Complex
	.DoIt("-2+0i", "0.135335+0.000000i")
	.DoIt("-1+0i", "0.367879+0.000000i")
	.DoIt("-0.5+0i", "0.606531+0.000000i")
	.DoIt("0.5+0i", "1.648721+0.000000i")
	.DoIt("1+0i", "2.718282+0.000000i")
	.DoIt("2+0i", "7.389056+0.000000i")
	.DoIt("0-2i", "-0.416147-0.909297i")
	.DoIt("0-1i", "0.540302-0.841471i")
	.DoIt("0-0.5i", "0.877583-0.479426i")
	.DoIt("0+0.5i", "0.877583+0.479426i")
	.DoIt("0+1i", "0.540302+0.841471i")
	.DoIt("0+2i", "-0.416147+0.909297i")
	.DoIt("0+0i", "1.000000+0.000000i")
	.DoIt("2+3i", "-7.315110+1.042744i")
	.DoIt("2-3i", "-7.315110-1.042744i")
	.DoIt("-2+3i", "-0.133981+0.019099i")
	.DoIt("-2-3i", "-0.133981-0.019099i")
	print "done\n"
.end
CODE
done
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "sqrt of complex numbers");
.macro DoIt(val, res)
	c = .val
	c2 = c.sqrt()
	str = sprintf "%f%+fi", c2
	unless str != .res goto .$ok
	print "\nsqrt("
	print .val
	print ")\n\t	got\t"
	print str
	print "\n\t\tnot\t"
	print .res
	print "\n"
.local $ok:
.endm
.sub main :main
	.local pmc c, c2
	.local string str
	c = new .Complex
	c2 = new .Complex
	.DoIt("-2+0i", "0.000000+1.414214i")
	.DoIt("-1+0i", "0.000000+1.000000i")
	.DoIt("-0.5+0i", "0.000000+0.707107i")
	.DoIt("0.5+0i", "0.707107+0.000000i")
	.DoIt("1+0i", "1.000000+0.000000i")
	.DoIt("2+0i", "1.414214+0.000000i")
	.DoIt("0-2i", "1.000000-1.000000i")
	.DoIt("0-1i", "0.707107-0.707107i")
	.DoIt("0-0.5i", "0.500000-0.500000i")
	.DoIt("0+0.5i", "0.500000+0.500000i")
	.DoIt("0+1i", "0.707107+0.707107i")
	.DoIt("0+2i", "1.000000+1.000000i")
	.DoIt("0+0i", "0.000000+0.000000i")
	.DoIt("2+3i", "1.674149+0.895977i")
	.DoIt("2-3i", "1.674149-0.895977i")
	.DoIt("-2+3i", "0.895977+1.674149i")
	.DoIt("-2-3i", "0.895977-1.674149i")
	print "done\n"
.end
CODE
done
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "sin of complex numbers");
.macro DoIt(val, res)
	c = .val
	c2 = c.sin()
	str = sprintf "%f%+fi", c2
	unless str != .res goto .$ok
	print "\nsin("
	print .val
	print ")\n\t	got\t"
	print str
	print "\n\t\tnot\t"
	print .res
	print "\n"
.local $ok:
.endm
.sub main :main
	.local pmc c, c2
	.local string str
	c = new .Complex
	c2 = new .Complex
	.DoIt("-2+0i", "-0.909297+0.000000i")
	.DoIt("-1+0i", "-0.841471+0.000000i")
	.DoIt("-0.5+0i", "-0.479426+0.000000i")
	.DoIt("0.5+0i", "0.479426+0.000000i")
	.DoIt("1+0i", "0.841471+0.000000i")
	.DoIt("2+0i", "0.909297+0.000000i")
	.DoIt("0-2i", "0.000000-3.626860i")
	.DoIt("0-1i", "0.000000-1.175201i")
	.DoIt("0-0.5i", "0.000000-0.521095i")
	.DoIt("0+0.5i", "0.000000+0.521095i")
	.DoIt("0+1i", "0.000000+1.175201i")
	.DoIt("0+2i", "0.000000+3.626860i")
	.DoIt("0+0i", "0.000000+0.000000i")
	.DoIt("2+3i", "9.154499-4.168907i")
	.DoIt("2-3i", "9.154499+4.168907i")
	.DoIt("-2+3i", "-9.154499-4.168907i")
	.DoIt("-2-3i", "-9.154499+4.168907i")
	print "done\n"
.end
CODE
done
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "cos of complex numbers");
.macro DoIt(val, res)
	c = .val
	c2 = c.cos()
	str = sprintf "%f%+fi", c2
	unless str != .res goto .$ok
	print "\ncos("
	print .val
	print ")\n\t	got\t"
	print str
	print "\n\t\tnot\t"
	print .res
	print "\n"
.local $ok:
.endm
.sub main :main
	.local pmc c, c2
	.local string str
	c = new .Complex
	c2 = new .Complex
	.DoIt("-2+0i", "-0.416147+0.000000i")
	.DoIt("-1+0i", "0.540302+0.000000i")
	.DoIt("-0.5+0i", "0.877583+0.000000i")
	.DoIt("0.5+0i", "0.877583+0.000000i")
	.DoIt("1+0i", "0.540302+0.000000i")
	.DoIt("2+0i", "-0.416147+0.000000i")
	.DoIt("0-2i", "3.762196+0.000000i")
	.DoIt("0-1i", "1.543081+0.000000i")
	.DoIt("0-0.5i", "1.127626+0.000000i")
	.DoIt("0+0.5i", "1.127626+0.000000i")
	.DoIt("0+1i", "1.543081+0.000000i")
	.DoIt("0+2i", "3.762196+0.000000i")
	.DoIt("0+0i", "1.000000+0.000000i")
	.DoIt("2+3i", "-4.189626-9.109228i")
	.DoIt("2-3i", "-4.189626+9.109228i")
	.DoIt("-2+3i", "-4.189626+9.109228i")
	.DoIt("-2-3i", "-4.189626-9.109228i")
	print "done\n"
.end
CODE
done
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "tan of complex numbers");
.macro DoIt(val, res)
	c = .val
	c2 = c.tan()
	str = sprintf "%f%+fi", c2
	unless str != .res goto .$ok
	print "\ntan("
	print .val
	print ")\n\t	got\t"
	print str
	print "\n\t\tnot\t"
	print .res
	print "\n"
.local $ok:
.endm
.sub main :main
	.local pmc c, c2
	.local string str
	c = new .Complex
	c2 = new .Complex
	.DoIt("-2+0i", "2.185040+0.000000i")
	.DoIt("-1+0i", "-1.557408+0.000000i")
	.DoIt("-0.5+0i", "-0.546302+0.000000i")
	.DoIt("0.5+0i", "0.546302+0.000000i")
	.DoIt("1+0i", "1.557408+0.000000i")
	.DoIt("2+0i", "-2.185040-0.000000i")
	.DoIt("0-2i", "0.000000-0.964028i")
	.DoIt("0-1i", "0.000000-0.761594i")
	.DoIt("0-0.5i", "0.000000-0.462117i")
	.DoIt("0+0.5i", "0.000000+0.462117i")
	.DoIt("0+1i", "0.000000+0.761594i")
	.DoIt("0+2i", "0.000000+0.964028i")
	.DoIt("0+0i", "0.000000+0.000000i")
	.DoIt("2+3i", "-0.003764+1.003239i")
	.DoIt("2-3i", "-0.003764-1.003239i")
	.DoIt("-2+3i", "0.003764+1.003239i")
	.DoIt("-2-3i", "0.003764-1.003239i")
	print "done\n"
.end
CODE
done
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "cot of complex numbers");
.macro DoIt(val, res)
	c = .val
	c2 = c.cot()
	str = sprintf "%f%+fi", c2
	unless str != .res goto .$ok
	print "\ncot("
	print .val
	print ")\n\t	got\t"
	print str
	print "\n\t\tnot\t"
	print .res
	print "\n"
.local $ok:
.endm
.sub main :main
	.local pmc c, c2
	.local string str
	c = new .Complex
	c2 = new .Complex
	.DoIt("-2+0i", "0.457658+0.000000i")
	.DoIt("-1+0i", "-0.642093-0.000000i")
	.DoIt("-0.5+0i", "-1.830488-0.000000i")
	.DoIt("0.5+0i", "1.830488+0.000000i")
	.DoIt("1+0i", "0.642093+0.000000i")
	.DoIt("2+0i", "-0.457658+0.000000i")
	.DoIt("0-2i", "0.000000+1.037315i")
	.DoIt("0-1i", "0.000000+1.313035i")
	.DoIt("0-0.5i", "0.000000+2.163953i")
	.DoIt("0+0.5i", "0.000000-2.163953i")
	.DoIt("0+1i", "0.000000-1.313035i")
	.DoIt("0+2i", "0.000000-1.037315i")
	.DoIt("2+3i", "-0.003740-0.996758i")
	.DoIt("2-3i", "-0.003740+0.996758i")
	.DoIt("-2+3i", "0.003740-0.996758i")
	.DoIt("-2-3i", "0.003740+0.996758i")
	print "done\n"
.end
CODE
done
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "sec of complex numbers");
.macro DoIt(val, res)
	c = .val
	c2 = c.sec()
	str = sprintf "%f%+fi", c2
	unless str != .res goto .$ok
	print "\nsec("
	print .val
	print ")\n\t	got\t"
	print str
	print "\n\t\tnot\t"
	print .res
	print "\n"
.local $ok:
.endm
.sub main :main
	.local pmc c, c2
	.local string str
	c = new .Complex
	c2 = new .Complex
	.DoIt("-2+0i", "-2.402998-0.000000i")
	.DoIt("-1+0i", "1.850816+0.000000i")
	.DoIt("-0.5+0i", "1.139494+0.000000i")
	.DoIt("0.5+0i", "1.139494+0.000000i")
	.DoIt("1+0i", "1.850816+0.000000i")
	.DoIt("2+0i", "-2.402998-0.000000i")
	.DoIt("0-2i", "0.265802+0.000000i")
	.DoIt("0-1i", "0.648054+0.000000i")
	.DoIt("0-0.5i", "0.886819+0.000000i")
	.DoIt("0+0.5i", "0.886819+0.000000i")
	.DoIt("0+1i", "0.648054+0.000000i")
	.DoIt("0+2i", "0.265802+0.000000i")
	.DoIt("0+0i", "1.000000+0.000000i")
	.DoIt("2+3i", "-0.041675+0.090611i")
	.DoIt("2-3i", "-0.041675-0.090611i")
	.DoIt("-2+3i", "-0.041675-0.090611i")
	.DoIt("-2-3i", "-0.041675+0.090611i")
	print "done\n"
.end
CODE
done
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "csc of complex numbers");
.macro DoIt(val, res)
	c = .val
	c2 = c.csc()
	str = sprintf "%f%+fi", c2
	unless str != .res goto .$ok
	print "\ncsc("
	print .val
	print ")\n\t	got\t"
	print str
	print "\n\t\tnot\t"
	print .res
	print "\n"
.local $ok:
.endm
.sub main :main
	.local pmc c, c2
	.local string str
	c = new .Complex
	c2 = new .Complex
	.DoIt("-2+0i", "-1.099750-0.000000i")
	.DoIt("-1+0i", "-1.188395-0.000000i")
	.DoIt("-0.5+0i", "-2.085830-0.000000i")
	.DoIt("0.5+0i", "2.085830+0.000000i")
	.DoIt("1+0i", "1.188395+0.000000i")
	.DoIt("2+0i", "1.099750+0.000000i")
	.DoIt("0-2i", "0.000000+0.275721i")
	.DoIt("0-1i", "0.000000+0.850918i")
	.DoIt("0-0.5i", "0.000000+1.919035i")
	.DoIt("0+0.5i", "0.000000-1.919035i")
	.DoIt("0+1i", "0.000000-0.850918i")
	.DoIt("0+2i", "0.000000-0.275721i")
	.DoIt("2+3i", "0.090473+0.041201i")
	.DoIt("2-3i", "0.090473-0.041201i")
	.DoIt("-2+3i", "-0.090473+0.041201i")
	.DoIt("-2-3i", "-0.090473-0.041201i")
	print "done\n"
.end
CODE
done
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "asin of complex numbers");
.macro DoIt(val, res)
	c = .val
	c2 = c.asin()
	str = sprintf "%f%+fi", c2
	unless str != .res goto .$ok
	print "\nasin("
	print .val
	print ")\n\t	got\t"
	print str
	print "\n\t\tnot\t"
	print .res
	print "\n"
.local $ok:
.endm
.sub main :main
	.local pmc c, c2
	.local string str
	c = new .Complex
	c2 = new .Complex
	.DoIt("-2+0i", "-1.570796+1.316958i")
	.DoIt("-1+0i", "-1.570796-0.000000i")
	.DoIt("-0.5+0i", "-0.523599-0.000000i")
	.DoIt("0.5+0i", "0.523599-0.000000i")
	.DoIt("1+0i", "1.570796-0.000000i")
	.DoIt("2+0i", "1.570796-1.316958i")
	.DoIt("0-2i", "0.000000-1.443635i")
	.DoIt("0-1i", "0.000000-0.881374i")
	.DoIt("0-0.5i", "0.000000-0.481212i")
	.DoIt("0+0.5i", "0.000000+0.481212i")
	.DoIt("0+1i", "0.000000+0.881374i")
	.DoIt("0+2i", "0.000000+1.443635i")
	.DoIt("0+0i", "0.000000-0.000000i")
	.DoIt("2+3i", "0.570653+1.983387i")
	.DoIt("2-3i", "0.570653-1.983387i")
	.DoIt("-2+3i", "-0.570653+1.983387i")
	.DoIt("-2-3i", "-0.570653-1.983387i")
	print "done\n"
.end
CODE
done
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "acos of complex numbers");
.macro DoIt(val, res)
	c = .val
	c2 = c.acos()
	str = sprintf "%f%+fi", c2
	unless str != .res goto .$ok
	print "\nacos("
	print .val
	print ")\n\t	got\t"
	print str
	print "\n\t\tnot\t"
	print .res
	print "\n"
.local $ok:
.endm
.sub main :main
	.local pmc c, c2
	.local string str
	c = new .Complex
	c2 = new .Complex
	.DoIt("-2+0i", "3.141593-1.316958i")
	.DoIt("-1+0i", "3.141593-0.000000i")
	.DoIt("-0.5+0i", "2.094395-0.000000i")
	.DoIt("0.5+0i", "1.047198-0.000000i")
	.DoIt("1+0i", "0.000000-0.000000i")
	.DoIt("2+0i", "0.000000+1.316958i")
	.DoIt("0-2i", "1.570796+1.443635i")
	.DoIt("0-1i", "1.570796+0.881374i")
	.DoIt("0-0.5i", "1.570796+0.481212i")
	.DoIt("0+0.5i", "1.570796-0.481212i")
	.DoIt("0+1i", "1.570796-0.881374i")
	.DoIt("0+2i", "1.570796-1.443635i")
	.DoIt("0+0i", "1.570796-0.000000i")
	.DoIt("2+3i", "1.000144-1.983387i")
	.DoIt("2-3i", "1.000144+1.983387i")
	.DoIt("-2+3i", "2.141449-1.983387i")
	.DoIt("-2-3i", "2.141449+1.983387i")
	print "done\n"
.end
CODE
done
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "atan of complex numbers");
.macro DoIt(val, res)
	c = .val
	c2 = c.atan()
	str = sprintf "%f%+fi", c2
	unless str != .res goto .$ok
	print "\natan("
	print .val
	print ")\n\t	got\t"
	print str
	print "\n\t\tnot\t"
	print .res
	print "\n"
.local $ok:
.endm
.sub main :main
	.local pmc c, c2
	.local string str
	c = new .Complex
	c2 = new .Complex
	.DoIt("-2+0i", "-1.107149+0.000000i")
	.DoIt("-1+0i", "-0.785398+0.000000i")
	.DoIt("-0.5+0i", "-0.463648+0.000000i")
	.DoIt("0.5+0i", "0.463648+0.000000i")
	.DoIt("1+0i", "0.785398+0.000000i")
	.DoIt("2+0i", "1.107149+0.000000i")
	.DoIt("0-2i", "-1.570796-0.549306i")
	.DoIt("0-0.5i", "-0.000000-0.549306i")
	.DoIt("0+0.5i", "-0.000000+0.549306i")
	.DoIt("0+2i", "-1.570796+0.549306i")
	.DoIt("0+0i", "-0.000000+0.000000i")
	.DoIt("2+3i", "1.409921+0.229073i")
	.DoIt("2-3i", "1.409921-0.229073i")
	.DoIt("-2+3i", "-1.409921+0.229073i")
	.DoIt("-2-3i", "-1.409921-0.229073i")
	print "done\n"
.end
CODE
done
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "acot of complex numbers");
.macro DoIt(val, res)
	c = .val
	c2 = c.acot()
	str = sprintf "%f%+fi", c2
	unless str != .res goto .$ok
	print "\nacot("
	print .val
	print ")\n\t	got\t"
	print str
	print "\n\t\tnot\t"
	print .res
	print "\n"
.local $ok:
.endm
.sub main :main
	.local pmc c, c2
	.local string str
	c = new .Complex
	c2 = new .Complex
	.DoIt("-2+0i", "-0.463648+0.000000i")
	.DoIt("-1+0i", "-0.785398+0.000000i")
	.DoIt("-0.5+0i", "-1.107149+0.000000i")
	.DoIt("0.5+0i", "1.107149+0.000000i")
	.DoIt("1+0i", "0.785398+0.000000i")
	.DoIt("2+0i", "0.463648+0.000000i")
	.DoIt("0-2i", "-0.000000+0.549306i")
	.DoIt("0-0.5i", "-1.570796+0.549306i")
	.DoIt("0+0.5i", "-1.570796-0.549306i")
	.DoIt("0+2i", "-0.000000-0.549306i")
	.DoIt("2+3i", "0.160875-0.229073i")
	.DoIt("2-3i", "0.160875+0.229073i")
	.DoIt("-2+3i", "-0.160875-0.229073i")
	.DoIt("-2-3i", "-0.160875+0.229073i")
	print "done\n"
.end
CODE
done
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "asec of complex numbers");
.macro DoIt(val, res)
	c = .val
	c2 = c.asec()
	str = sprintf "%f%+fi", c2
	unless str != .res goto .$ok
	print "\nasec("
	print .val
	print ")\n\t	got\t"
	print str
	print "\n\t\tnot\t"
	print .res
	print "\n"
.local $ok:
.endm
.sub main :main
	.local pmc c, c2
	.local string str
	c = new .Complex
	c2 = new .Complex
	.DoIt("-2+0i", "2.094395-0.000000i")
	.DoIt("-1+0i", "3.141593-0.000000i")
	.DoIt("-0.5+0i", "3.141593-1.316958i")
	.DoIt("0.5+0i", "0.000000+1.316958i")
	.DoIt("1+0i", "0.000000-0.000000i")
	.DoIt("2+0i", "1.047198-0.000000i")
	.DoIt("0-2i", "1.570796-0.481212i")
	.DoIt("0-1i", "1.570796-0.881374i")
	.DoIt("0-0.5i", "1.570796-1.443635i")
	.DoIt("0+0.5i", "1.570796+1.443635i")
	.DoIt("0+1i", "1.570796+0.881374i")
	.DoIt("0+2i", "1.570796+0.481212i")
	.DoIt("2+3i", "1.420411+0.231335i")
	.DoIt("2-3i", "1.420411-0.231335i")
	.DoIt("-2+3i", "1.721182+0.231335i")
	.DoIt("-2-3i", "1.721182-0.231335i")
	print "done\n"
.end
CODE
done
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "acsc of complex numbers");
.macro DoIt(val, res)
	c = .val
	c2 = c.acsc()
	str = sprintf "%f%+fi", c2
	unless str != .res goto .$ok
	print "\nacsc("
	print .val
	print ")\n\t	got\t"
	print str
	print "\n\t\tnot\t"
	print .res
	print "\n"
.local $ok:
.endm
.sub main :main
	.local pmc c, c2
	.local string str
	c = new .Complex
	c2 = new .Complex
	.DoIt("-2+0i", "-0.523599-0.000000i")
	.DoIt("-1+0i", "-1.570796-0.000000i")
	.DoIt("-0.5+0i", "-1.570796+1.316958i")
	.DoIt("0.5+0i", "1.570796-1.316958i")
	.DoIt("1+0i", "1.570796-0.000000i")
	.DoIt("2+0i", "0.523599-0.000000i")
	.DoIt("0-2i", "0.000000+0.481212i")
	.DoIt("0-1i", "0.000000+0.881374i")
	.DoIt("0-0.5i", "0.000000+1.443635i")
	.DoIt("0+0.5i", "0.000000-1.443635i")
	.DoIt("0+1i", "0.000000-0.881374i")
	.DoIt("0+2i", "0.000000-0.481212i")
	.DoIt("2+3i", "0.150386-0.231335i")
	.DoIt("2-3i", "0.150386+0.231335i")
	.DoIt("-2+3i", "-0.150386-0.231335i")
	.DoIt("-2-3i", "-0.150386+0.231335i")
	print "done\n"
.end
CODE
done
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "sinh of complex numbers");
.macro DoIt(val, res)
	c = .val
	c2 = c.sinh()
	str = sprintf "%f%+fi", c2
	unless str != .res goto .$ok
	print "\nsinh("
	print .val
	print ")\n\t	got\t"
	print str
	print "\n\t\tnot\t"
	print .res
	print "\n"
.local $ok:
.endm
.sub main :main
	.local pmc c, c2
	.local string str
	c = new .Complex
	c2 = new .Complex
	.DoIt("-2+0i", "-3.626860+0.000000i")
	.DoIt("-1+0i", "-1.175201+0.000000i")
	.DoIt("-0.5+0i", "-0.521095+0.000000i")
	.DoIt("0.5+0i", "0.521095+0.000000i")
	.DoIt("1+0i", "1.175201+0.000000i")
	.DoIt("2+0i", "3.626860+0.000000i")
	.DoIt("0-2i", "-0.000000-0.909297i")
	.DoIt("0-1i", "0.000000-0.841471i")
	.DoIt("0-0.5i", "0.000000-0.479426i")
	.DoIt("0+0.5i", "0.000000+0.479426i")
	.DoIt("0+1i", "0.000000+0.841471i")
	.DoIt("0+2i", "-0.000000+0.909297i")
	.DoIt("0+0i", "0.000000+0.000000i")
	.DoIt("2+3i", "-3.590565+0.530921i")
	.DoIt("2-3i", "-3.590565-0.530921i")
	.DoIt("-2+3i", "3.590565+0.530921i")
	.DoIt("-2-3i", "3.590565-0.530921i")
	print "done\n"
.end
CODE
done
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "cosh of complex numbers");
.macro DoIt(val, res)
	c = .val
	c2 = c.cosh()
	str = sprintf "%f%+fi", c2
	unless str != .res goto .$ok
	print "\ncosh("
	print .val
	print ")\n\t	got\t"
	print str
	print "\n\t\tnot\t"
	print .res
	print "\n"
.local $ok:
.endm
.sub main :main
	.local pmc c, c2
	.local string str
	c = new .Complex
	c2 = new .Complex
	.DoIt("-2+0i", "3.762196-0.000000i")
	.DoIt("-1+0i", "1.543081-0.000000i")
	.DoIt("-0.5+0i", "1.127626-0.000000i")
	.DoIt("0.5+0i", "1.127626+0.000000i")
	.DoIt("1+0i", "1.543081+0.000000i")
	.DoIt("2+0i", "3.762196+0.000000i")
	.DoIt("0-2i", "-0.416147-0.000000i")
	.DoIt("0-1i", "0.540302-0.000000i")
	.DoIt("0-0.5i", "0.877583-0.000000i")
	.DoIt("0+0.5i", "0.877583+0.000000i")
	.DoIt("0+1i", "0.540302+0.000000i")
	.DoIt("0+2i", "-0.416147+0.000000i")
	.DoIt("0+0i", "1.000000+0.000000i")
	.DoIt("2+3i", "-3.724546+0.511823i")
	.DoIt("2-3i", "-3.724546-0.511823i")
	.DoIt("-2+3i", "-3.724546-0.511823i")
	.DoIt("-2-3i", "-3.724546+0.511823i")
	print "done\n"
.end
CODE
done
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "tanh of complex numbers");
.macro DoIt(val, res)
	c = .val
	c2 = c.tanh()
	str = sprintf "%f%+fi", c2
	unless str != .res goto .$ok
	print "\ntanh("
	print .val
	print ")\n\t	got\t"
	print str
	print "\n\t\tnot\t"
	print .res
	print "\n"
.local $ok:
.endm
.sub main :main
	.local pmc c, c2
	.local string str
	c = new .Complex
	c2 = new .Complex
	.DoIt("-2+0i", "-0.964028+0.000000i")
	.DoIt("-1+0i", "-0.761594+0.000000i")
	.DoIt("-0.5+0i", "-0.462117+0.000000i")
	.DoIt("0.5+0i", "0.462117+0.000000i")
	.DoIt("1+0i", "0.761594+0.000000i")
	.DoIt("2+0i", "0.964028+0.000000i")
	.DoIt("0-2i", "0.000000+2.185040i")
	.DoIt("0-1i", "0.000000-1.557408i")
	.DoIt("0-0.5i", "0.000000-0.546302i")
	.DoIt("0+0.5i", "0.000000+0.546302i")
	.DoIt("0+1i", "0.000000+1.557408i")
	.DoIt("0+2i", "0.000000-2.185040i")
	.DoIt("0+0i", "0.000000+0.000000i")
	.DoIt("2+3i", "0.965386-0.009884i")
	.DoIt("2-3i", "0.965386+0.009884i")
	.DoIt("-2+3i", "-0.965386-0.009884i")
	.DoIt("-2-3i", "-0.965386+0.009884i")
	print "done\n"
.end
CODE
done
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "coth of complex numbers");
.macro DoIt(val, res)
	c = .val
	c2 = c.coth()
	str = sprintf "%f%+fi", c2
	unless str != .res goto .$ok
	print "\ncoth("
	print .val
	print ")\n\t	got\t"
	print str
	print "\n\t\tnot\t"
	print .res
	print "\n"
.local $ok:
.endm
.sub main :main
	.local pmc c, c2
	.local string str
	c = new .Complex
	c2 = new .Complex
	.DoIt("-2+0i", "-1.037315-0.000000i")
	.DoIt("-1+0i", "-1.313035-0.000000i")
	.DoIt("-0.5+0i", "-2.163953-0.000000i")
	.DoIt("0.5+0i", "2.163953-0.000000i")
	.DoIt("1+0i", "1.313035-0.000000i")
	.DoIt("2+0i", "1.037315-0.000000i")
	.DoIt("0-2i", "0.000000-0.457658i")
	.DoIt("0-1i", "0.000000+0.642093i")
	.DoIt("0-0.5i", "0.000000+1.830488i")
	.DoIt("0+0.5i", "0.000000-1.830488i")
	.DoIt("0+1i", "0.000000-0.642093i")
	.DoIt("0+2i", "0.000000+0.457658i")
	.DoIt("2+3i", "1.035747+0.010605i")
	.DoIt("2-3i", "1.035747-0.010605i")
	.DoIt("-2+3i", "-1.035747+0.010605i")
	.DoIt("-2-3i", "-1.035747-0.010605i")
	print "done\n"
.end
CODE
done
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "sech of complex numbers");
.macro DoIt(val, res)
	c = .val
	c2 = c.sech()
	str = sprintf "%f%+fi", c2
	unless str != .res goto .$ok
	print "\nsech("
	print .val
	print ")\n\t	got\t"
	print str
	print "\n\t\tnot\t"
	print .res
	print "\n"
.local $ok:
.endm
.sub main :main
	.local pmc c, c2
	.local string str
	c = new .Complex
	c2 = new .Complex
	.DoIt("-2+0i", "0.265802+0.000000i")
	.DoIt("-1+0i", "0.648054+0.000000i")
	.DoIt("-0.5+0i", "0.886819+0.000000i")
	.DoIt("0.5+0i", "0.886819-0.000000i")
	.DoIt("1+0i", "0.648054-0.000000i")
	.DoIt("2+0i", "0.265802-0.000000i")
	.DoIt("0-2i", "-2.402998+0.000000i")
	.DoIt("0-1i", "1.850816+0.000000i")
	.DoIt("0-0.5i", "1.139494+0.000000i")
	.DoIt("0+0.5i", "1.139494-0.000000i")
	.DoIt("0+1i", "1.850816-0.000000i")
	.DoIt("0+2i", "-2.402998-0.000000i")
	.DoIt("0+0i", "1.000000-0.000000i")
	.DoIt("2+3i", "-0.263513-0.036212i")
	.DoIt("2-3i", "-0.263513+0.036212i")
	.DoIt("-2+3i", "-0.263513+0.036212i")
	.DoIt("-2-3i", "-0.263513-0.036212i")
	print "done\n"
.end
CODE
done
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "csch of complex numbers");
.macro DoIt(val, res)
	c = .val
	c2 = c.csch()
	str = sprintf "%f%+fi", c2
	unless str != .res goto .$ok
	print "\ncsch("
	print .val
	print ")\n\t	got\t"
	print str
	print "\n\t\tnot\t"
	print .res
	print "\n"
.local $ok:
.endm
.sub main :main
	.local pmc c, c2
	.local string str
	c = new .Complex
	c2 = new .Complex
	.DoIt("-2+0i", "-0.275721-0.000000i")
	.DoIt("-1+0i", "-0.850918-0.000000i")
	.DoIt("-0.5+0i", "-1.919035-0.000000i")
	.DoIt("0.5+0i", "1.919035-0.000000i")
	.DoIt("1+0i", "0.850918-0.000000i")
	.DoIt("2+0i", "0.275721-0.000000i")
	.DoIt("0-2i", "-0.000000+1.099750i")
	.DoIt("0-1i", "0.000000+1.188395i")
	.DoIt("0-0.5i", "0.000000+2.085830i")
	.DoIt("0+0.5i", "0.000000-2.085830i")
	.DoIt("0+1i", "0.000000-1.188395i")
	.DoIt("0+2i", "-0.000000-1.099750i")
	.DoIt("2+3i", "-0.272549-0.040301i")
	.DoIt("2-3i", "-0.272549+0.040301i")
	.DoIt("-2+3i", "0.272549-0.040301i")
	.DoIt("-2-3i", "0.272549+0.040301i")
	print "done\n"
.end
CODE
done
OUTPUT

