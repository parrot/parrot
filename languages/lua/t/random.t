#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/random.t - random library

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/random.t

=head1 DESCRIPTION

Tests random
(implemented in F<languages/lua/src/lib/random.pir>).

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test;
use Test::More;
use Parrot::Test::Lua;

my $test_prog = Parrot::Test::Lua::get_test_prog();
if ( $test_prog eq 'lua' ) {
    plan skip_all => "parrot only";
}
else {
    plan tests => 10;
}

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'random.version' );
require 'random'
print(random.version)
CODE
random library for Lua on Parrot
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'random.new()' );
require 'random'
r = random.new()
print(type(r))
CODE
userdata
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'random.__tostring' );
require 'random'
r = random.new()
print(r)
CODE
/^random handle [0-9A-Fa-f]{8,16}$/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'random:tostring()' );
require 'random'
r = random.new()
s = r:tostring()
assert(type(s) == 'string', "got string")
print(r)
CODE
/^random handle [0-9A-Fa-f]{8,16}$/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'random:value()' );
require 'random'
r = random.new(1234)
v = r:value()
assert(type(v) == 'number', "got number")
print(v)
CODE
0.19151945020806
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'random:valuei(a, b)' );
require 'random'
r = random.new()
for i = 1, 4 do
    print(r:valuei(11, 16))
end
CODE
14
15
12
14
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'random:valuei(a)' );
require 'random'
r = random.new()
for i = 1, 4 do
    print(r:valuei(6))
end
CODE
4
5
2
4
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'random:valuex()' );
require 'random'
r = random.new()
v = r:valuex()
assert(type(v) == 'number', "got number")
print(v)
CODE
0.64357194128897
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'random:seed()' );
require 'random'
r = random.new(1234)
print('new', r:value(), r:value(), r:value())
print('more', r:value(), r:value(), r:value())
r:seed(1234)
print('seed', r:value(), r:value(), r:value())
r:seed()
print('seed', r:value(), r:value(), r:value())
CODE
new	0.19151945020806	0.49766366637723	0.62210876648829
more	0.81783844293511	0.43772773734241	0.61211189362502
seed	0.19151945020806	0.49766366637723	0.62210876648829
seed	0.64357194203035	0.76435543917221	0.27009103057675
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'random:clone()' );
require 'random'
r = random.new(1234)
s = r:clone()
print('new', r:value(), r:value(), r:value())
print('more', r:value(), r:value(), r:value())
print('clone', s:value(), s:value(), s:value())
CODE
new	0.19151945020806	0.49766366637723	0.62210876648829
more	0.81783844293511	0.43772773734241	0.61211189362502
clone	0.19151945020806	0.49766366637723	0.62210876648829
OUTPUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
