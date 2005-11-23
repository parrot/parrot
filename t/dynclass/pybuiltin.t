#! perl
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 6;
use Parrot::Config;


=head1 NAME

t/dynclass/pybuiltin.t - Python Builtins

=head1 SYNOPSIS

	% prove t/dynclass/pybuiltin.t

=head1 DESCRIPTION

Tests the Python Builtins.

=cut


pir_output_is(<< 'CODE', << 'OUTPUT', "autoload");
.sub main :main
    new_pad 0

    new $P0, "PyInt"

    set $P0, 31
    print $P0
    print "\n"
.end
CODE
31
OUTPUT


pir_output_is(<< 'CODE', << 'OUTPUT', "delegating");

.sub main :main
    new_pad 0
    loadlib $P0, "python_group"
    find_global P0, "PyBuiltin", "__load__"
    invoke

    find_type $I0, "PyInt"
    new $P0, $I0
    new $P1, $I0

    set $P0, 31
    set $P1, -13

    find_lex $P2, "abs"
    $P3 = $P2($P1)
    print $P3
    print "\n"

    find_lex $P2, "cmp"
    $P3 = $P2($P0,$P1)
    print $P3
    print "\n"

    find_lex $P2, "complex"
    $P3 = $P2($P0,$P1)
    print $P3
    print "\n"

    find_lex $P2, "float"
    $P3 = $P2($P0)
    print $P3
    print "\n"

    find_lex $P2, "hex"
    $P3 = $P2($P0)
    print $P3
    print "\n"

    find_lex $P2, "int"
    $P3 = $P2($P0)
    print $P3
    print "\n"

    find_lex $P2, "oct"
    $P3 = $P2($P0)
    print $P3
    print "\n"
.end
CODE
13
1
(31-13j)
31.0
0x1f
31
037
OUTPUT

SKIP: { skip("No BigInt Lib configured", 1) if !$PConfig{gmp};
pir_output_is(<< 'CODE', << 'OUTPUT', "bigint");

.sub main :main
    new_pad 0
    loadlib $P0, "python_group"
    find_global P0, "PyBuiltin", "__load__"
    invoke

    find_type $I0, "PyInt"
    new $P0, $I0
    set $P0, 31

    find_lex $P1, "long"
    $P2 = $P1($P0)
    get_repr $S0, $P2
    print $S0
    print "\n"
.end
CODE
31L
OUTPUT
}

pir_output_is(<< 'CODE', << 'OUTPUT', "range");

.sub main :main
    new_pad 0
    loadlib $P0, "python_group"
    find_global P0, "PyBuiltin", "__load__"
    invoke

    find_type $I0, "PyInt"
    new $P0, $I0
    new $P1, $I0
    new $P2, $I0
    new $P3, $I0
    new $P4, $I0

    set $P0, 0
    set $P1, 1
    set $P2, 2
    set $P3, 3
    set $P4, -2

    find_lex $P5, "range"
    $P6 = $P5($P0,$P0,$P1)
    print $P6
    print "\n"

    $P6 = $P5($P0,$P3,$P1)
    print $P6
    print "\n"

    $P6 = $P5($P0,$P3,$P2)
    print $P6
    print "\n"

    $P6 = $P5($P3,$P0,$P4)
    print $P6
    print "\n"

    $P6 = $P5($P0,$P3)
    print $P6
    print "\n"

    $P6 = $P5($P2)
    print $P6
    print "\n"
.end
CODE
[]
[0, 1, 2]
[0, 2]
[3, 1]
[0, 1, 2]
[0, 1]
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "boolean");

.sub main :main
    new_pad 0
    loadlib $P0, "python_group"
    find_global P0, "PyBuiltin", "__load__"
    invoke

    find_lex $P1, "False"
    find_lex $P2, "True"

    print $P1
    print " "
    print $P2
    print "\n"
.end
CODE
False True
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "boolean");

.sub main :main
    new_pad 0
    loadlib $P0, "python_group"

    find_lex $P1, "cmp"
    getattribute $P2, $P1, '__name__'
    print $P2
    print "\n"
.end
CODE
cmp
OUTPUT
