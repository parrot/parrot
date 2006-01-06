#! perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
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

use Parrot::Test tests => 4;

language_output_like( 'lua', << 'CODE', << 'OUTPUT', "variable pi");
print(math.pi)
CODE
/3.14/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function abs");
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

language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function cos");
print(math.cos(0))
CODE
1
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function sin");
print(math.sin(math.pi/2))
CODE
1
OUTPUT


