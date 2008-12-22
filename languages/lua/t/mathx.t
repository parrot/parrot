#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/mathx.t - mathx library

=head1 SYNOPSIS

    % perl t/mathx.t

=head1 DESCRIPTION

Tests mathx
(implemented in F<languages/lua/src/lib/mathx.pir>).

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../lib", "$FindBin::Bin";

use Parrot::Test tests => 37;
use Parrot::Config;
use Test::More;
use Parrot::Test::Lua;

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'require' );
require 'mathx'
print(math.pi)
CODE
/^3\.14/
OUTPUT

SKIP:
{
    skip "skipped on win32" => 2 if ( $^O eq 'MSWin32' );

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'infinity' );
require 'mathx'
print(type(math.infinity))
print(math.infinity)
CODE
number
inf
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'nan' );
require 'mathx'
print(type(math.nan))
print(math.nan)
CODE
number
nan
OUTPUT
}

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function acosh' );
require 'mathx'
print(math.acosh(2))
CODE
/^1\.316/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function asinh' );
require 'mathx'
print(math.asinh(0.5))
CODE
/^0\.481/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function atanh' );
require 'mathx'
print(math.atanh(0.5))
CODE
/^0\.549/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function cbrt' );
require 'mathx'
print(math.cbrt(2))
CODE
/^1\.259/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function copysign' );
require 'mathx'
print(math.copysign(3.14, -2))
CODE
/^-3\.14/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function erf' );
require 'mathx'
print(math.erf(2))
CODE
/^0\.995/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function erfc' );
require 'mathx'
print(math.erfc(2))
CODE
/^0\.004/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function exp2' );
require 'mathx'
print(math.exp2(3))
CODE
/^8$/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function expm1' );
require 'mathx'
print(math.expm1(2))
CODE
/^6\.389/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function fdim' );
require 'mathx'
print(math.fdim(7, 3))
CODE
/^4$/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function fma' );
require 'mathx'
print(math.fma(2, 3, 4))
CODE
/^10$/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function fmax' );
require 'mathx'
print(math.fmax(1))
print(math.fmax(1, 2))
print(math.fmax(1, 2, 3, -4))
CODE
1
2
3
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function fmin' );
require 'mathx'
print(math.fmin(1))
print(math.fmin(1, 2))
print(math.fmin(1, 2, 3, -4))
CODE
1
1
-4
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function fpclassify' );
require 'mathx'
print(math.fpclassify(1))
CODE
normal
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function gamma' );
require 'mathx'
print(math.gamma(0.5))
CODE
/^1\.772/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function hypot' );
require 'mathx'
print(math.hypot(2, 3))
CODE
/^3\.605/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function ilogb' );
require 'mathx'
print(math.ilogb(47))
CODE
/^5$/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function isfinite' );
require 'mathx'
print(math.isfinite(1))
CODE
true
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function isinf' );
require 'mathx'
print(math.isinf(1))
CODE
false
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function isnan' );
require 'mathx'
print(math.isnan(1))
CODE
false
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function isnormal' );
require 'mathx'
print(math.isnormal(1))
CODE
true
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function lgamma' );
require 'mathx'
print(math.lgamma(0.5))
CODE
/^0\.572/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function log1p' );
require 'mathx'
print(math.log1p(47))
CODE
/^3\.871/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function log2' );
require 'mathx'
print(math.log2(47))
CODE
/^5\.554/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function logb' );
require 'mathx'
print(math.logb(47))
CODE
/^5$/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function nearbyint' );
require 'mathx'
print(math.nearbyint(3.14))
CODE
/^3$/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function nextafter' );
require 'mathx'
print(math.nextafter(3.14, 5))
CODE
/^3\.14$/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function nexttoward' );
require 'mathx'
print(math.nexttoward(3.14, 5))
CODE
/^3\.14$/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function remainder' );
require 'mathx'
print(math.remainder(4, 3))
CODE
/^1$/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function rint' );
require 'mathx'
print(math.rint(3.14))
CODE
/^3$/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function round' );
require 'mathx'
print(math.round(3.14))
CODE
/^3$/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function scalbn' );
require 'mathx'
print(math.scalbn(2, 3))
CODE
/^16$/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function signbit' );
require 'mathx'
print(math.signbit(3.14))
CODE
0
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function trunc' );
require 'mathx'
print(math.trunc(3.14))
CODE
/^3$/
OUTPUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
