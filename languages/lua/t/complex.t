#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/complex.t - complex library

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/complex.t

=head1 DESCRIPTION

Tests complex
(implemented in F<languages/lua/src/lib/complex.pir>).

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 26;
use Parrot::Config;
use Test::More;
use Parrot::Test::Lua;

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'complex.version' );
require 'complex'
print(complex.version)
CODE
complex library for Lua on Parrot
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'complex.I' );
require 'complex'
print(complex.I)
CODE
0+1i
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'complex.new' );
require 'complex'
print(complex.new())
print(complex.new(2))
print(complex.new(3, 4))
CODE
0+0i
2+0i
3+4i
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'complex:real & imag' );
require 'complex'
z = complex.new(3, 4)
print(z:real())
print(z:imag())
CODE
3
4
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'complex cast' );
require 'complex'
print(complex.real(2))
print(complex.real('2'))
CODE
2
2
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'complex bad cast' );
require 'complex'
print(complex.real({}))
CODE
/^[^:]+: [^:]+:\d+: bad argument #1 to 'real' \(complex number expected, got table\)\nstack traceback:\n/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'complex bad cast' );
require 'complex'
print(complex.real('str'))
CODE
/^[^:]+: [^:]+:\d+: bad argument #1 to 'real' \(number expected, got string\)\nstack traceback:\n/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'complex __unm' );
require 'complex'
z = complex.new(3, 4)
print(-z)
CODE
-3-4i
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function abs' );
require 'complex'
z = complex.new(3, 4)
a = z:abs()
print(a)
print(type(a))
CODE
5
number
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function acos' );
require 'complex'
z = complex.new(3, 4)
print(z:acos())
CODE
0.936812-2.30551i
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function acosh' );
require 'complex'
z = complex.new(3, 4)
print(z:acosh())
CODE
2.30551+0.936812i
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function asin' );
require 'complex'
z = complex.new(3, 4)
print(z:asin())
CODE
0.633984+2.30551i
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function asinh' );
require 'complex'
z = complex.new(3, 4)
print(z:asinh())
CODE
2.29991+0.917617i
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function atan' );
require 'complex'
z = complex.new(3, 4)
print(z:atan())
CODE
1.44831+0.158997i
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function atanh' );
require 'complex'
z = complex.new(3, 4)
print(z:atanh())
CODE
0.117501+1.40992i
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function conj' );
require 'complex'
z = complex.new(3, 4)
print(z:conj())
CODE
3-4i
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function cos' );
require 'complex'
z = complex.new(3, 4)
print(z:cos())
CODE
-27.0349-3.85115i
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function cosh' );
require 'complex'
z = complex.new(3, 4)
print(z:cosh())
CODE
-6.58066-7.58155i
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function exp' );
require 'complex'
z = complex.new(3, 4)
print(z:exp())
CODE
-13.1288-15.2008i
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function log' );
require 'complex'
z = complex.new(3, 4)
print(z:log())
CODE
1.60944+0.927295i
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function pow' );
require 'complex'
z = complex.new(3, 4)
w = complex.new(2, 1)
print(z:pow(w))
CODE
-9.38086-3.1341i
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function sin' );
require 'complex'
z = complex.new(3, 4)
print(z:sin())
CODE
3.85374-27.0168i
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function sinh' );
require 'complex'
z = complex.new(3, 4)
print(z:sinh())
CODE
-6.54812-7.61923i
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function sqrt' );
require 'complex'
z = complex.new(3, 4)
print(z:sqrt())
CODE
2+1i
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function tan' );
require 'complex'
z = complex.new(3, 4)
print(z:tan())
CODE
-0.000187346+0.999356i
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function tanh' );
require 'complex'
z = complex.new(3, 4)
print(z:tanh())
CODE
1.00071+0.00490826i
OUTPUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
