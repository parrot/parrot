#!perl
use strict;
use TestCompiler tests => 20;

##############################
output_is(<<'CODE', <<'OUT', "+=");
.sub _test
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
output_is(<<'CODE', <<'OUT', "-=");
.sub _test
    $I0 = 10
    $I0 -= 20
    print $I0
    print "\n"
    end
.end
CODE
-10
OUT

output_is(<<'CODE', <<'OUT', "*=");
.sub _test
    $I0 = 10
    $I0 *= 20
    print $I0
    print "\n"
    end
.end
CODE
200
OUT

output_is(<<'CODE', <<'OUT', "/=");
.sub _test
    $I0 = 20
    $I0 /= 2
    print $I0
    print "\n"
    end
.end
CODE
10
OUT

output_is(<<'CODE', <<'OUT', "%=");
.sub _test
    $I0 = 20
    $I0 %= 7
    print $I0
    print "\n"
    end
.end
CODE
6
OUT

output_is(<<'CODE', <<'OUT', ".=");
.sub _test
    $S0 = "ab"
    $S0 .= "cd"
    print $S0
    print "\n"
    end
.end
CODE
abcd
OUT
output_is(<<'CODE', <<'OUT', "&=");
.sub _test
    $I0 =  0b1011
    $I0 &= 0b1000
    print $I0
    print "\n"
    end
.end
CODE
8
OUT

output_is(<<'CODE', <<'OUT', "|=");
.sub _test
    $I0 =  0b1011
    $I0 |= 0b1000
    print $I0
    print "\n"
    end
.end
CODE
11
OUT

output_is(<<'CODE', <<'OUT', "~=");
.sub _test
    $I0 =  0b1011
    $I0 ~= 0b1000
    print $I0
    print "\n"
    end
.end
CODE
3
OUT

output_is(<<'CODE', <<'OUT', ">>=");
.sub _test
    $I0 =  0b1011
    $I0 >>= 1
    print $I0
    print "\n"
    end
.end
CODE
5
OUT

output_is(<<'CODE', <<'OUT', ">>>=");
.sub _test
    $I0 =  0b1011
    $I0 >>>= 1
    print $I0
    print "\n"
    end
.end
CODE
5
OUT

output_is(<<'CODE', <<'OUT', "<<=");
.sub _test
    $I0 =  0b1011
    $I0 <<= 1
    print $I0
    print "\n"
    end
.end
CODE
22
OUT

output_is(<<'CODE', <<'OUT', "x = defined");
.sub _main
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

output_is(<<'CODE', <<'OUT', "x = clone");
.sub _main
    .local pmc a
    a = new PerlInt
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

output_is(<<'CODE', <<'OUT', "x = length");
.sub _main
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

output_is(<<'CODE', <<'OUT', "x = sin");
.sub _main
    $N0 = sin 0
    print $N0
    print "\n"
end
.end
CODE
0.000000
OUT

output_is(<<'CODE', <<'OUT', "x = can");
.sub _main
    $P0 = new ParrotIO
    $I0 = can $P0, "puts"
    print $I0
    print "\n"
end
.end
CODE
1
OUT

output_is(<<'CODE', <<'OUT', "x = isa");
.sub _main
    $P0 = new PerlInt
    $I0 = isa $P0, "scalar"
    print $I0
    print "\n"
end
.end
CODE
1
OUT

output_is(<<'CODE', <<'OUT', "x = add");
.sub _main
    $I0 = 10
    $I1 = add $I0, 10
    print $I1
    print "\n"
    end
.end
CODE
20
OUT

output_is(<<'CODE', <<'OUT', "x = invoke");
.sub _main
    $P0 = find_global "_s"
    $P0 = invokecc
    $S0 = "done\n"
    $S0 = print
    end
.end
.sub _s
    print "in sub\n"
    P1 = invoke
.end
CODE
in sub
done
OUT
