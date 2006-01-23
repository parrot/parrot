#! perl -w
# Copyright: 2005-2006 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/basic.t - Lua Basic Library

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/basic.t

=head1 DESCRIPTION

Tests Lua Basic Library
(implemented in F<languages/lua/lib/luabasic.pir>).

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 14;
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

language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function next (array)");
t = {"a","b","c"}
a = next(t, nil)
print(a)
a = next(t, 1) 
print(a)
a = next(t, 2) 
print(a)
a = next(t, 3) 
print(a)
CODE
1
2
3
nil
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function pcall");
r = pcall(assert, true)
print(r)
r, msg = pcall(assert, false, "catched")
print(r, msg)
r = pcall(assert)
print(r)
CODE
true
false	catched
false
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', "function pcall (incomplete)");
r, msg = pcall(assert)
print(msg)
CODE
/value expected/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function rawget");
t = {a = "letter a", b = "letter b"}
print(rawget(t, "a"))
CODE
letter a
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function rawset");
t = {}
rawset(t, "a", "letter a")
print(t.a)
CODE
letter a
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

TODO: {
local $TODO = "tonumber !";

language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function tonumber");
a = "text12"
i = tonumber(a)
print(i)
CODE
nil
OUTPUT

}

language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function unpack");
print(unpack{})
print(unpack{"a"})
print(unpack{"a","b","c"})
print((unpack{"a","b","c"}))
CODE

a
a	b	c
a
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function xpcall");
r = xpcall(assert, nil)
print(r)
CODE
false
OUTPUT

