#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/pyint.t - Python Integer basic type

=head1 SYNOPSIS

	% perl -Ilib t/dynclass/pyint.t

=head1 DESCRIPTION

Tests the Python Integer PMC.

=cut

use Parrot::Test tests => 24;

output_is(<< 'CODE', << 'OUTPUT', "abs");
##PIR##
.sub main @MAIN
    loadlib P1, "python_group"
    find_type $I0, "PyInt"
    new $P1, $I0

    set $P1, -13

    new $P2, $I0
    abs $P2, $P1
    print $P2
    print " "
    $P2 = $P1.__abs__($P1)
    print $P2
    print "\n"
.end
CODE
13 13
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "add");
##PIR##
.sub main @MAIN
    loadlib P1, "python_group"
    find_type $I0, "PyInt"
    new $P0, $I0
    new $P1, $I0

    set $P0, 31
    set $P1, -13

    new $P2, $I0
    $P2 = $P0 + $P1
    print $P2
    print " "
    $P2 = $P0.__add__($P0,$P1)
    print $P2
    print " "
    $P2 = $P1.__radd__($P1,$P0)
    print $P2
    print "\n"
.end
CODE
18 18 18
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "and");
##PIR##
.sub main @MAIN
    loadlib P1, "python_group"
    find_type $I0, "PyInt"
    new $P0, $I0
    new $P1, $I0

    set $P0, 31
    set $P1, -13

    new $P2, $I0
    and $P2, $P0, $P1
    print $P2
    print " "
    band $P2, $P0, $P1
    print $P2
    print " "
    $P2 = $P0.__and__($P0,$P1)
    print $P2
    print " "
    $P2 = $P1.__rand__($P1,$P0)
    print $P2
    print "\n"
.end
CODE
-13 19 19 19
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "cmp");
##PIR##
.sub main @MAIN
    loadlib P1, "python_group"
    find_type $I0, "PyInt"
    new $P0, $I0
    new $P1, $I0

    set $P0, 31
    set $P1, -13

    new $P2, $I0
    cmp $I2, $P0, $P1
    $P2 = $I2
    print $P2
    print " "
    cmp $I2, $P0, -13
    $P2 = $I2
    print $P2
    print " "
    $P2 = $P0.__cmp__($P0,$P1)
    print $P2
    print "\n"
.end
CODE
1 1 1
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "div");
##PIR##
.sub main @MAIN
    loadlib P1, "python_group"
    find_type $I0, "PyInt"
    new $P0, $I0
    new $P1, $I0

    set $P0, 31
    set $P1, -13

    new $P2, $I0
    $P2 = $P0 / $P1
    print $P2
    print " "
    $P2 = $P0 / -13
    print $P2
    print " "
    $P2 = $P0.__div__($P0,$P1)
    print $P2
    print " "
    $P2 = $P1.__rdiv__($P1,$P0)
    print $P2
    print "\n"
.end
CODE
-3 -3 -3 -3
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "float");
##PIR##
.sub main @MAIN
    loadlib P1, "python_group"
    find_type $I0, "PyInt"
    new $P0, $I0

    set $P0, -13

    $P2 = $P0.__float__($P0)
    print $P2
    print "\n"
.end
CODE
-13.0
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "floordiv");
##PIR##
.sub main @MAIN
    loadlib P1, "python_group"
    find_type $I0, "PyInt"
    new $P0, $I0
    new $P1, $I0

    set $P0, 31
    set $P1, -13

    new $P2, $I0
    $P2 = $P0 // $P1
    print $P2
    print " "
    $P2 = $P0 // -13
    print $P2
    print " "
    $P2 = $P0.__floordiv__($P0,$P1)
    print $P2
    print " "
    $P2 = $P1.__rfloordiv__($P1,$P0)
    print $P2
    print "\n"
.end
CODE
-3 -3 -3 -3
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "hex");
##PIR##
.sub main @MAIN
    loadlib P1, "python_group"
    find_type $I0, "PyInt"
    new $P0, $I0
    set $P0, 31

    $P2 = $P0.__hex__($P0)
    print $P2
    print "\n"
.end
CODE
0x1f
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "int");
##PIR##
.sub main @MAIN
    loadlib P1, "python_group"
    find_type $I0, "PyInt"
    new $P0, $I0

    set $P0, -13

    $P2 = $P0.__int__($P0)
    print $P2
    print "\n"
.end
CODE
-13
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "invert");
##PIR##
.sub main @MAIN
    loadlib P1, "python_group"
    find_type $I0, "PyInt"
    new $P1, $I0

    set $P1, -13

    new $P2, $I0
    $P2 = ~ $P1
    print $P2
    print " "
    $P2 = $P1.__invert__($P1)
    print $P2
    print "\n"
.end
CODE
12 12
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "lshift");
##PIR##
.sub main @MAIN
    loadlib P1, "python_group"
    find_type $I0, "PyInt"
    new $P0, $I0
    new $P1, $I0

    set $P0, 31
    set $P1, 3

    new $P2, $I0
    $P2 = $P0 << $P1
    print $P2
    print " "
    $P2 = $P0 << 3
    print $P2
    print " "
    $P2 = $P0.__lshift__($P0,$P1)
    print $P2
    print " "
    $P2 = $P1.__rlshift__($P1,$P0)
    print $P2
    print "\n"
.end
CODE
248 248 248 248
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "mod");
##PIR##
.sub main @MAIN
    loadlib P1, "python_group"
    find_type $I0, "PyInt"
    new $P0, $I0
    new $P1, $I0

    set $P0, 31
    set $P1, -13

    new $P2, $I0
    $P2 = $P0 % $P1
    print $P2
    print " "
    $P2 = $P0 % -13
    print $P2
    print " "
    $P2 = $P0.__mod__($P0,$P1)
    print $P2
    print " "
    $P2 = $P1.__rmod__($P1,$P0)
    print $P2
    print "\n"
.end
CODE
-8 -8 -8 -8
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "mul");
##PIR##
.sub main @MAIN
    loadlib P1, "python_group"
    find_type $I0, "PyInt"
    new $P0, $I0
    new $P1, $I0

    set $P0, 31
    set $P1, -13

    new $P2, $I0
    $P2 = $P0 * $P1
    print $P2
    print " "
    $P2 = $P0 * -13
    print $P2
    print " "
    $P2 = $P0.__mul__($P0,$P1)
    print $P2
    print " "
    $P2 = $P1.__rmul__($P1,$P0)
    print $P2
    print "\n"
.end
CODE
-403 -403 -403 -403
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "neg");
##PIR##
.sub main @MAIN
    loadlib P1, "python_group"
    find_type $I0, "PyInt"
    new $P1, $I0

    set $P1, -13

    new $P2, $I0
    $P2 = - $P1
    print $P2
    print " "
    $P2 = $P1.__neg__($P1)
    print $P2
    print "\n"
.end
CODE
13 13
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "nonzero");
##PIR##
.sub main @MAIN
    loadlib P1, "python_group"
    find_type $I0, "PyInt"
    new $P1, $I0

    set $P1, -13

    new $P2, $I0
    $P2 = $P1.__nonzero__($P1)
    print $P2
    print "\n"
.end
CODE
True
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "oct");
##PIR##
.sub main @MAIN
    loadlib P1, "python_group"
    find_type $I0, "PyInt"
    new $P0, $I0
    set $P0, 31

    $P2 = $P0.__oct__($P0)
    print $P2
    print "\n"
.end
CODE
037
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "or");
##PIR##
.sub main @MAIN
    loadlib P1, "python_group"
    find_type $I0, "PyInt"
    new $P0, $I0
    new $P1, $I0

    set $P0, 31
    set $P1, -13

    new $P2, $I0
    or $P2, $P0, $P1
    print $P2
    print " "
    bor $P2, $P0, $P1
    print $P2
    print " "
    $P2 = $P0.__or__($P0,$P1)
    print $P2
    print " "
    $P2 = $P1.__ror__($P1,$P0)
    print $P2
    print "\n"
.end
CODE
31 -1 -1 -1
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "pos");
##PIR##
.sub main @MAIN
    loadlib P1, "python_group"
    find_type $I0, "PyInt"
    new $P1, $I0

    set $P1, -13

    new $P2, $I0
    $P2 = $P1.__pos__($P1)
    print $P2
    print "\n"
.end
CODE
-13
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "pow");
##PIR##
.sub main @MAIN
    loadlib P1, "python_group"
    find_type $I0, "PyInt"
    new $P0, $I0
    new $P1, $I0
    new $P2, $I0

    set $P0, 31
    set $P1, 2
    set $P2, -1 

    new $P3, $I0
    $P3 = $P0 ** $P1
    print $P3
    print " "
    $P3 = $P0 ** 3
    print $P3
    print " "
    $P3 = $P0.__pow__($P0,$P1)
    print $P3
    print " "
    $P3 = $P1.__pow__($P1,$P2)
    print $P3
    print " "
    $P3 = $P2.__rpow__($P2,$P1)
    print $P3
    print "\n"
.end
CODE
961 29791 961 0.5 0.5
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "repr");
##PIR##
.sub main @MAIN
    loadlib P1, "python_group"
    find_type $I0, "PyInt"
    new $P0, $I0
    new $P1, $I0

    set $P1, -13

    new $P2, $I0
    $P2 = $P1.__repr__($P1)
    print $P2
    print " "
    $P2 = $P1.__str__($P1)
    print $P2
    print "\n"
.end
CODE
-13 -13
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "rshift");
##PIR##
.sub main @MAIN
    loadlib P1, "python_group"
    find_type $I0, "PyInt"
    new $P0, $I0
    new $P1, $I0

    set $P0, 31
    set $P1, 3

    new $P2, $I0
    $P2 = $P0 >> $P1
    print $P2
    print " "
    $P2 = $P0 >> 3
    print $P2
    print " "
    $P2 = $P0.__rshift__($P0,$P1)
    print $P2
    print " "
    $P2 = $P1.__rrshift__($P1,$P0)
    print $P2
    print "\n"
.end
CODE
3 3 3 3
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "sub");
##PIR##
.sub main @MAIN
    loadlib P1, "python_group"
    find_type $I0, "PyInt"
    new $P0, $I0
    new $P1, $I0

    set $P0, 31
    set $P1, -13

    new $P2, $I0
    $P2 = $P0 - $P1
    print $P2
    print " "
    $P2 = $P0.__sub__($P0,$P1)
    print $P2
    print " "
    $P2 = $P1.__rsub__($P1,$P0)
    print $P2
    print "\n"
.end
CODE
44 44 44
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "truediv");
##PIR##
.sub main @MAIN
    loadlib P1, "python_group"
    find_type $I0, "PyInt"
    new $P0, $I0
    new $P1, $I0

    set $P0, 31
    set $P1, -4

    new $P2, $I0
    $P2 = $P0.__truediv__($P0,$P1)
    print $P2
    print "\n"
.end
CODE
-7.75
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "xor");
##PIR##
.sub main @MAIN
    loadlib P1, "python_group"
    find_type $I0, "PyInt"
    new $P0, $I0
    new $P1, $I0

    set $P0, 31
    set $P1, -13

    new $P2, $I0
    bxor $P2, $P0, $P1
    print $P2
    print " "
    $P2 = $P0.__xor__($P0,$P1)
    print $P2
    print " "
    $P2 = $P1.__rxor__($P1,$P0)
    print $P2
    print "\n"
.end
CODE
-20 -20 -20
OUTPUT
