#!perl
use strict;
use TestCompiler tests => 10;

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

