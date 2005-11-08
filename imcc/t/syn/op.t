#!perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use Parrot::Test tests => 24;

##############################
pir_output_is(<<'CODE', <<'OUT', "+=");
.sub test :main
    $I0 = 10
    $I0 += 20
    print $I0
    print "\n"
    end
.end
CODE
30
OUT

##############################
pir_output_is(<<'CODE', <<'OUT', "-=");
.sub test :main
    $I0 = 10
    $I0 -= 20
    print $I0
    print "\n"
    end
.end
CODE
-10
OUT

pir_output_is(<<'CODE', <<'OUT', "*=");
.sub test :main
    $I0 = 10
    $I0 *= 20
    print $I0
    print "\n"
    end
.end
CODE
200
OUT

pir_output_is(<<'CODE', <<'OUT', "/=");
.sub test :main
    $I0 = 20
    $I0 /= 2
    print $I0
    print "\n"
    end
.end
CODE
10
OUT

pir_output_is(<<'CODE', <<'OUT', "%=");
.sub test :main
    $I0 = 20
    $I0 %= 7
    print $I0
    print "\n"
    end
.end
CODE
6
OUT

pir_output_is(<<'CODE', <<'OUT', ".=");
.sub test :main
    $S0 = "ab"
    $S0 .= "cd"
    print $S0
    print "\n"
    end
.end
CODE
abcd
OUT
pir_output_is(<<'CODE', <<'OUT', "&=");
.sub test :main
    $I0 =  0b1011
    $I0 &= 0b1000
    print $I0
    print "\n"
    end
.end
CODE
8
OUT

pir_output_is(<<'CODE', <<'OUT', "|=");
.sub test :main
    $I0 =  0b1011
    $I0 |= 0b1000
    print $I0
    print "\n"
    end
.end
CODE
11
OUT

pir_output_is(<<'CODE', <<'OUT', "~=");
.sub test :main
    $I0 =  0b1011
    $I0 ~= 0b1000
    print $I0
    print "\n"
    end
.end
CODE
3
OUT

pir_output_is(<<'CODE', <<'OUT', ">>=");
.sub test :main
    $I0 =  0b1011
    $I0 >>= 1
    print $I0
    print "\n"
    end
.end
CODE
5
OUT

pir_output_is(<<'CODE', <<'OUT', ">>>=");
.sub test :main
    $I0 =  0b1011
    $I0 >>>= 1
    print $I0
    print "\n"
    end
.end
CODE
5
OUT

pir_output_is(<<'CODE', <<'OUT', "<<=");
.sub test :main
    $I0 =  0b1011
    $I0 <<= 1
    print $I0
    print "\n"
    end
.end
CODE
22
OUT

pir_output_is(<<'CODE', <<'OUT', "x = defined");
.sub test :main
    .local pmc a
    a = new PerlArray
    push a, 10
    $I0 = defined a
    print $I0
    $I0 = defined a[0]
    print $I0
    $I0 = defined a[1]
    print $I0
    print "\n"
    end
.end
CODE
110
OUT

pir_output_is(<<'CODE', <<'OUT', "x = clone");
.sub test :main
    .local pmc a
    a = new Integer
    a = 10
    .local pmc b
    b = clone a
    print b
    print "\n"
    end
.end
CODE
10
OUT

pir_output_is(<<'CODE', <<'OUT', "x = length");
.sub test :main
    .local string s
    s = "abc"
    $I0 = length s
    print $I0
    print "\n"
    end
.end
CODE
3
OUT

pir_output_is(<<'CODE', <<'OUT', "x = sin");
.sub test :main
    $N0 = sin 0
    print $N0
    print "\n"
end
.end
CODE
0.000000
OUT

pir_output_is(<<'CODE', <<'OUT', "x = can");
.sub test :main
    $P0 = new ParrotIO
    $I0 = can $P0, "puts"
    print $I0
    print "\n"
end
.end
CODE
1
OUT

pir_output_is(<<'CODE', <<'OUT', "x = isa");
.sub test :main
    $P0 = new Integer
    $I0 = isa $P0, "scalar"
    print $I0
    print "\n"
end
.end
CODE
1
OUT

pir_output_is(<<'CODE', <<'OUT', "x = add");
.sub test :main
    $I0 = 10
    $I1 = add $I0, 10
    print $I1
    print "\n"
    end
.end
CODE
20
OUT

pir_output_is(<<'CODE', <<'OUT', "x = invoke");
.sub test :main
    $P0 = find_global "_s"
    $P0 = invokecc
    $S0 = "done\n"
    $S0 = print
    end
.end
.sub _s
    print "in sub\n"
    returncc
.end
CODE
in sub
done
OUT

# ticket 32393
pir_output_is(<<'CODE', '', "empty sub");
.sub _foo
.end

.emit
.eom
CODE

pir_output_is(<<'CODE', <<'OUT', "if null X goto Y");
.sub main :main
    null $P0
    if null $P0 goto BLAH
    print "NOT A "
BLAH:
   print "PASS\n"
.end
CODE
PASS
OUT

pir_output_is(<<'CODE', <<'OUT', "unless null X goto Y");
.sub main :main
    null $P0
    unless null $P0 goto BLAH
    print "PASS\n"
    end
BLAH:
   print "FAIL"
.end
CODE
PASS
OUT

pir_output_is(<<'CODE', <<'OUT', "if null X goto Y");
.sub main :main
    $S0 = "hello"
    if null $S0 goto BLAH
    print "PASS\n"
    end
BLAH:
   print "FAIL"
.end
CODE
PASS
OUT
