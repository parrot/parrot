#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/bitlib.t - bitwise operations library

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/bitlib.t

=head1 DESCRIPTION

Tests bitlib
(implemented in F<languages/lua/src/lib/bitlib.pir>).

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test;
use Test::More;
use Parrot::Test::Lua;
use Config;

my $test_prog = Parrot::Test::Lua::get_test_prog();
if ( $test_prog eq 'lua' ) {
    plan skip_all => "parrot only";
}
else {
    plan tests => 8;
}

my $bit_bits = $Config{longsize} * 8 - 1;
$bit_bits = 53 if ($bit_bits == 63);
language_output_is( 'lua', << 'CODE', << "OUTPUT", 'bit.bits' );
require "bitlib"
print(type(bit.bits))
print(bit.bits)
CODE
number
$bit_bits
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bit.bnot' );
require "bitlib"
assert(bit.bnot(0) == bit.cast(-1))
assert(bit.bnot(-1) == bit.cast(0))
for nb = 1, bit.bits do
    local a = 2 ^ nb - 1
    -- print("nb = " .. nb .. ", a = " .. a)
    assert(bit.bnot(a) == bit.cast(-1 - a))
end
CODE
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bit.band' );
require "bitlib"
assert(bit.band(0, 0) == bit.cast(0))
assert(bit.band(0, -1) == bit.cast(0))
assert(bit.band(-1, -1) == bit.cast(-1))
for nb = 1, bit.bits do
    local a = 2 ^ nb - 1
    -- print("nb = " .. nb .. ", a = " .. a)
    assert(bit.band(a, 0) == bit.cast(0))
    assert(bit.band(a, 1) == bit.cast(1))
    assert(bit.band(a, -1) == bit.cast(a))
    assert(bit.band(a, a) == bit.cast(a))
end
CODE
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bit.bor' );
require "bitlib"
assert(bit.bor(0, 0) == bit.cast(0))
assert(bit.bor(0, -1) == bit.cast(-1))
assert(bit.bor(-1, -1) == bit.cast(-1))
for nb = 1, bit.bits do
    local a = 2 ^ nb - 1
    -- print("nb = " .. nb .. ", a = " .. a)
    assert(bit.bor(a, 0) == bit.cast(a))
    assert(bit.bor(a, 1) == bit.cast(a))
    assert(bit.bor(a, -1) == bit.cast(-1))
    assert(bit.bor(a, a) == bit.cast(a))
end
CODE
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bit.bxor ' );
require "bitlib"
assert(bit.bxor(0, 0) == bit.cast(0))
assert(bit.bxor(0, -1) == bit.cast(-1))
assert(bit.bxor(-1, -1) == bit.cast(0))
for nb = 1, bit.bits do
    local a = 2 ^ nb - 1
    -- print("nb = " .. nb .. ", a = " .. a)
    assert(bit.bxor(a, 0) == bit.cast(a))
    assert(bit.bxor(a, 1) == bit.cast(a - 1))
    assert(bit.bxor(a, -1) == bit.cast(-a - 1))
    assert(bit.bxor(a, a) == bit.cast(0))
end
CODE
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bit.lshift' );
require "bitlib"
assert(bit.lshift(0, 0) == bit.cast(0))
assert(bit.lshift(-1, 0) == bit.cast(-1))
for nb = 1, bit.bits - 1 do
    local a = 2 ^ nb - 1
    -- print("nb = " .. nb .. ", a = " .. a)
    assert(bit.lshift(a, 1) == bit.cast(a + a))
    assert(bit.lshift(1, nb) == bit.cast(2 ^ nb))
end
CODE
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bit.rshift' );
require "bitlib"
assert(bit.rshift(0, 0) == bit.cast(0))
assert(bit.rshift(-1, 0) == bit.cast(-1))
for nb = 1, bit.bits do
    local a = 2 ^ nb - 1
    -- print("nb = " .. nb .. ", a = " .. a)
    assert(bit.rshift(a, 1) == math.floor(a / 2))
    assert(bit.rshift(a, nb) == bit.cast(0))
    assert(bit.rshift(a, nb - 1) == bit.cast(1))
end
CODE
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bit.arshift' );
require "bitlib"
assert(bit.arshift(-1, 1) == bit.cast(-1))
CODE
OUTPUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
