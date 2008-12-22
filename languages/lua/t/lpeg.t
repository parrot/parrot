#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/lpeg.t - LPeg library

=head1 SYNOPSIS

    % perl t/lpeg.t

=head1 DESCRIPTION

Tests LPeg
(implemented in F<languages/lua/src/lib/lpeg.pir>).

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../lib", "$FindBin::Bin";

use Parrot::Test tests => 14;
use Test::More;
use Parrot::Config;
use Parrot::Test::Lua;

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'require & version' );
require "lpeg"
print(lpeg.version())
CODE
0.9
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'lpeg.P"str"' );
require "lpeg"
local a = lpeg.P"str"
print(lpeg.type(a))
CODE
pattern
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'lpeg.P(0)' );
require "lpeg"
local a = lpeg.P(0)
print(lpeg.type(a))
CODE
pattern
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'lpeg.P(2)' );
require "lpeg"
local a = lpeg.P(2)
print(lpeg.type(a))
CODE
pattern
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'lpeg.P(-2)' );
require "lpeg"
local a = lpeg.P(-2)
print(lpeg.type(a))
CODE
pattern
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'lpeg.P(-300)' );
require "lpeg"
local a = lpeg.P(-300)
print(lpeg.type(a))
CODE
pattern
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'lpeg.P(true)' );
require "lpeg"
local a = lpeg.P(true)
print(lpeg.type(a))
CODE
pattern
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'lpeg.P(false)' );
require "lpeg"
local a = lpeg.P(false)
print(lpeg.type(a))
CODE
pattern
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'lpeg.P(patt)' );
require "lpeg"
local a = lpeg.P"A"
local b = lpeg.P(a)
print(lpeg.type(b))
CODE
pattern
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'lpeg.P(nil)' );
require "lpeg"
local a = lpeg.P(nil)
CODE
/^[^:]+: [^:]+:\d+: bad argument #1 to 'P' \(pattern expected, got nil\)\nstack traceback:\n/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'lpeg.S"A"' );
require "lpeg"
local a = lpeg.S"A"
print(lpeg.type(a))
CODE
pattern
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'lpeg.V"A"' );
require "lpeg"
local a = lpeg.V"A"
print(lpeg.type(a))
CODE
pattern
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'lpeg.V()' );
require "lpeg"
local a = lpeg.V()
CODE
/^[^:]+: [^:]+:\d+: bad argument #1 to 'V' \(non-nil value expected\)\nstack traceback:\n/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'lpeg.V(nil)' );
require "lpeg"
local a = lpeg.V(nil)
CODE
/^[^:]+: [^:]+:\d+: bad argument #1 to 'V' \(non-nil value expected\)\nstack traceback:\n/
OUTPUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
