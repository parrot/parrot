#! perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id: basic.t  $

=head1 NAME

t/basic.t - Lua Basic Library

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/basic.t

=head1 DESCRIPTION

Tests Lua Basic Library
(implemented in F<languages/lua/lib/luabasic.pir>).

=cut

use Parrot::Test tests => 7;
use Test::More;

language_output_like( 'lua', << 'CODE', << 'OUTPUT', "function assert(false, msg)");
assert(false, "ASSERTION TEST")
CODE
/ASSERTION TEST/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', "function assert(false)");
assert(false)
CODE
/assertion failed!/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', "function assert(false, nil)");
assert(false, nil)
CODE
/assertion failed!/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function type");
print(type("Hello world"))
print(type(10.4*3))
-- print(type(print))
-- print(type(type))
print(type(true))
print(type(nil))
print(type(type(X)))
CODE
string
number
boolean
nil
string
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', "function type (no arg)");
type()
CODE
/value expected/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function tonumber");
a = 12.34
t = type(a)
print(a)
print(t)
CODE
12.34
number
OUTPUT

SKIP: {
skip("tonumber !", 1);

language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function tonumber");
a = "text12"
i = tonumber(a)
print(i)
CODE
nil
OUTPUT

}
