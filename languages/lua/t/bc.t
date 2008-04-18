#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/bc.t - bc library

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/bc.t

=head1 DESCRIPTION

Tests bc
(implemented in F<languages/lua/src/lib/bc.pir>).

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test;
use Parrot::Config;
use Test::More;
use Parrot::Test::Lua;

my $test_prog = Parrot::Test::Lua::get_test_prog();
if ( $test_prog eq 'lua' ) {
    plan skip_all => "parrot only";
}
elsif ( !$PConfig{gmp} ) {
    plan skip_all => "No gmp library available";
}
else {
    plan tests => 27;
}

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bc.version' );
require 'bc'
print(bc.version)
CODE
bc library for Lua on Parrot
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bc.number (string)' );
require 'bc'
n = bc.number "12"
print(type(n))
print(n)
CODE
userdata
12
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bc.number (number)' );
require 'bc'
n = bc.number(12)
print(type(n))
print(n)
CODE
userdata
12
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bc.number (bc)' );
require 'bc'
n = bc.number(12)
n = bc.number(n)
print(type(n))
print(n)
CODE
userdata
12
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bc.tostring ()' );
require 'bc'
n = bc.number "12"
s = bc.tostring(n)
print(type(s))
print(s)
CODE
string
12
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bc.digits ()' );
require 'bc'
bc.digits(10)
print(bc.digits())
CODE
10
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bc.__unm' );
require 'bc'
a = bc.number(12)
n = - a
print(n)
CODE
-12
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bc.add ()' );
require 'bc'
n = bc.add(12, 34)
print(n)
CODE
46
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bc.__add' );
require 'bc'
a = bc.number(12)
n = a + 34
print(n)
CODE
46
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bc.sub ()' );
require 'bc'
n = bc.sub(12, 34)
print(n)
CODE
-22
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bc.__sub' );
require 'bc'
a = bc.number(12)
n = a - 34
print(n)
CODE
-22
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bc.mul ()' );
require 'bc'
n = bc.mul(2, 3)
print(n)
CODE
6
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bc.__mul' );
require 'bc'
a = bc.number(2)
n = a * 3
print(n)
CODE
6
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bc.div ()' );
require 'bc'
n = bc.div(12, 3)
print(n)
CODE
4
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bc.div (by zero)' );
require 'bc'
n = bc.div(12, 0)
print(n)
CODE
nil
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bc.__div' );
require 'bc'
a = bc.number(12)
n = a / 3
print(n)
CODE
4
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bc.mod ()' );
require 'bc'
n = bc.mod(13, 3)
print(n)
CODE
1
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bc.mod (by zero)' );
require 'bc'
n = bc.mod(13, 0)
print(n)
CODE
nil
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bc.pow ()' );
require 'bc'
n = bc.pow(2, 3)
print(n)
CODE
8
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bc.__pow' );
require 'bc'
a = bc.number(2)
n = a ^ 3
print(n)
CODE
8
OUTPUT

my @todo = ( todo => 'sqrt not implemented with BigInt' );
language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bc.sqrt ()', @todo );
require 'bc'
n = bc.sqrt(4)
print(n)
CODE
2
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bc.sqrt ()' );
require 'bc'
n = bc.sqrt(-4)
print(n)
CODE
nil
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bc.isneg ()' );
require 'bc'
print(bc.isneg(12))
print(bc.isneg(-34))
print(bc.isneg "0")
-- print(bc.isneg "-0")
CODE
false
true
false
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bc.iszero ()' );
require 'bc'
print(bc.iszero(12))
print(bc.iszero(-34))
print(bc.iszero "0")
print(bc.iszero "-0")
CODE
false
false
true
true
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bc.compare ()' );
require 'bc'
print(bc.compare(12, 34))
print(bc.compare(12, 12))
print(bc.compare(34, 12))
CODE
-1
0
1
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bc.__eq' );
require 'bc'
a = bc.number(12)
print(a == bc.number(10))
print(a == bc.number(12))
CODE
false
true
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'bc.__lt' );
require 'bc'
a = bc.number(12)
print(a < bc.number(10))
print(a < bc.number(12))
print(a < bc.number(14))
CODE
false
false
true
OUTPUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
