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

use Parrot::Test tests => 7;
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


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
