#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/complex.t - Complex Numbers

=head1 SYNOPSIS

	% perl -Ilib t/pmc/complex.t

=head1 DESCRIPTION

Tests the Complex PMC.

=cut

use Parrot::Test tests => 24;
use Test::More;

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


output_is(<<'CODE', <<'OUTPUT', "String parsing");
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

output_like(<<'CODE', <<'OUTPUT', "Malformed string: real part");
    new P0, .Complex
    set P0, "q + 3i"
    end
CODE
/Complex: malformed string/
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "Malformed string: imaginary part");
    new P0, .Complex
    set P0, "1 + ij"
    end
CODE
/Complex: malformed string/
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "Malformed string: missing +/-");
    new P0, .Complex
    set P0, "1 * i"
CODE
/Complex: malformed string/
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "add");
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

output_is(<<'CODE', <<'OUTPUT', "subtract");
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
1024-3i
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "multiply");
	new P0, .Complex
	new P1, .Complex
	new P2, .Float

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
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "divide");
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

output_is(<<"CODE", <<'OUTPUT', "get int/num/bool");
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

output_is(<<"CODE", <<'OUTPUT', "get keyed");
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

output_like(<<"CODE", <<'OUTPUT', "get keyed: invalid string key");
    new P0, .Complex
    set P0, "5 + 3.5i"
    set N0, P0["Foo"]
    end
CODE
/Complex: key is neither 'real' or 'imag'/
OUTPUT

output_like(<<"CODE", <<'OUTPUT', "get keyed: invalid numeric key");
    new P0, .Complex
    set P0, "5 + 3.5i"
    set N0, P0[2]
    end
CODE
/Complex: key must be 0 or 1/
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "set int/num");
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

output_is(<<'CODE', <<'OUTPUT', "set keyed");
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

output_like(<<'CODE', <<'OUTPUT', "set keyed: invalid key");
    new P0, .Complex
    set P0[2], 12.5
    end
CODE
/Complex: key must be 0 or 1/
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "is_equal");
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

output_is(<<'CODE', <<'OUTPUT', "abs");
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

output_is(<< 'CODE', << 'OUTPUT', "check whether interface is done");
##PIR##
.sub _main
    .local pmc pmc1
    pmc1 = new Complex
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

output_is(<< 'CODE', << 'OUTPUT', "instantiate, PASM, I");
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

output_is(<< 'CODE', << 'OUTPUT', "instantiate, PIR, N");
##PIR##
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

output_is(<< 'CODE', << 'OUTPUT', "instantiate, PIR, P");
##PIR##
.sub main
    $P0 = getclass "Complex"
    $P1 = new Float
    $P1 = 2.0
    $P2 = new Float
    $P2 = 3.0
    $P1 = $P0."instantiate"($P1, $P2)
    print $P1
    print "\n"
    end
.end
CODE
2+3i
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "instantiate, PIR, S");
##PIR##
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

output_is(<<"CODE", <<'OUTPUT', "neg");
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

output_is(<<"CODE", <<'OUTPUT', "clone");
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
