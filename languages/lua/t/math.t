#! perl -w
# Copyright (C) 2005-2006, The Perl Foundation.
# $Id$

=head1 NAME

t/math.t - Lua Mathematic Library


=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/math.t

=head1 DESCRIPTION

Tests Lua Mathematic Library
(implemented in F<languages/lua/lib/luamath.pir>).

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 32;
use Test::More;

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'variable pi' );
print(math.pi)
CODE
/3\.14/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'variable huge' );
print(math.huge)
CODE
/(inf|1.#INF)/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function abs' );
a = -12.34
b = math.abs(a)
c = math.abs(b)
print(a)
print(b)
print(type(b))
print(c)
CODE
-12.34
12.34
number
12.34
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function acos' );
print(math.acos(0.5))
CODE
/1\.047/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function asin' );
print(math.asin(0.5))
CODE
/0\.523/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function atan' );
print(math.atan(0.5))
CODE
/\.463/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function atan2' );
print(math.atan2(1, 2))
CODE
/\.463/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function ceil' );
print(math.ceil(12.34))
print(math.ceil(-12.34))
CODE
13
-12
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function cos' );
print(math.cos(0))
CODE
1
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function deg' );
print(math.deg(math.pi))
CODE
180
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function exp' );
print(math.exp(1.0))
CODE
/2\.718/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function floor' );
print(math.floor(12.34))
print(math.floor(-12.34))
CODE
12
-13
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function fmod' );
print(math.fmod(7, 3))
print(math.fmod(-7, 3))
CODE
1
-1
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function frexp' );
print(math.frexp(1.5))
CODE
0.75	1
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function ldexp' );
print(math.ldexp(1.2, 3))
CODE
9.6
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function log' );
print(math.log(47))
CODE
/3\.85/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function log10' );
print(math.log10(47))
CODE
/1\.672/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function max 0' );
print(math.max())
CODE
/number expected/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function max' );
print(math.max(1))
print(math.max(1, 2))
print(math.max(1, 2, 3, -4))
CODE
1
2
3
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function min 0' );
print(math.min())
CODE
/number expected/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function min' );
print(math.min(1))
print(math.min(1, 2))
print(math.min(1, 2, 3, -4))
CODE
1
1
-4
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function modf' );
print(math.modf(2.25))
CODE
2	0.25
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function pow' );
print(math.pow(-2, 3))
CODE
-8
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function rad' );
print(math.rad(180))
CODE
/3\.14/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function random no arg' );
print(math.random())
CODE
/^\d\.\d+/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function random 1 arg' );
print(math.random(9))
CODE
/^\d/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function random 2 arg' );
print(math.random(10,19))
CODE
/^1\d/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function random too many arg' );
print(math.random(1, 2, 3))
CODE
/wrong number of arguments/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function randomseed' );
math.randomseed(12)
a = math.random()
math.randomseed(12)
b = math.random()
assert(a == b, "Equal seeds produce equal sequences of numbers")
print "ok"
CODE
ok
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function sin' );
print(math.sin(math.pi/2))
CODE
1
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function sqrt' );
print(math.sqrt(2))
CODE
/1\.414/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function tan' );
print(math.tan(math.pi/4))
CODE
1
OUTPUT

