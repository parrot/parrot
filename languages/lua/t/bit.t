#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/bit.t - bitwise operations library

=head1 SYNOPSIS

    % perl t/bit.t

=head1 DESCRIPTION

Tests bit
(implemented in F<languages/lua/src/lib/bit.pir>).

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../lib", "$FindBin::Bin";

use Parrot::Test;
use Test::More;
use Parrot::Test::Lua;
use Config;

my $test_prog = Parrot::Test::Lua::get_test_prog();
if ( $test_prog eq 'lua' ) {
    plan skip_all => "parrot only";
}
else {
    plan tests => 6;
}

language_output_is( 'lua', << 'CODE', << "OUTPUT", 'require' );
m = require "bit"
print(type(m))
CODE
table
OUTPUT

language_output_is( 'lua', << 'CODE', << "OUTPUT", 'bit.tobit' );
m = require "bit"
assert(bit.tobit(1) == 1)
CODE
OUTPUT

language_output_is( 'lua', << 'CODE', << "OUTPUT", 'bit.band' );
m = require "bit"
assert(bit.band(1) == 1)
CODE
OUTPUT

language_output_is( 'lua', << 'CODE', << "OUTPUT", 'bit.bxor' );
m = require "bit"
assert(bit.bxor(1, 2) == 3)
CODE
OUTPUT

language_output_is( 'lua', << 'CODE', << "OUTPUT", 'bit.bor' );
m = require "bit"
assert(bit.bor(1,2,4,8,16,32,64,128) == 255)
CODE
OUTPUT

language_output_is( 'lua', << 'CODE', << "OUTPUT", 'bit.bswap' );
m = require "bit"
assert(bit.bswap(0x12345678) == 0x78563412)
CODE
OUTPUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
