#! perl
# Copyright (C) 2005-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/basic.t - Lua Basic Library

=head1 SYNOPSIS

    % perl t/basic.t

=head1 DESCRIPTION

Tests Lua Basic Library
(implemented in F<languages/lua/lib/luabasic.pir>).

See "Lua 5.1 Reference Manual", section 5.1 "Basic Functions",
L<http://www.lua.org/manual/5.1/manual.html#5.1>.

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../lib", "$FindBin::Bin";

use Parrot::Test tests => 54;
use Test::More;

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function assert' );
v, msg = assert("text", "assert string")
print(v, msg)
assert({}, "assert table")
CODE
text	assert string
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function assert(false, msg)' );
assert(false, "ASSERTION TEST")
CODE
/^[^:]+: [^:]+:\d+: ASSERTION TEST\nstack traceback:\n/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function assert(false)' );
assert(false)
CODE
/^[^:]+: [^:]+:\d+: assertion failed!\nstack traceback:\n/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function assert(false, nil)' );
assert(false, nil)
CODE
/^[^:]+: [^:]+:\d+: assertion failed!\nstack traceback:\n/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function collectgarbage "stop/restart/collect"' );
print(collectgarbage('stop'))
print(collectgarbage('restart'))
print(collectgarbage('collect'))
print(collectgarbage())
CODE
0
0
0
0
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function collectgarbage "count"' );
print(collectgarbage('count'))
CODE
/^\d+(\.\d+)?$/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function collectgarbage invalid' );
collectgarbage('unknown')
CODE
/^[^:]+: [^:]+:\d+: bad argument #1 to 'collectgarbage' \(invalid option 'unknown'\)\nstack traceback:\n/
OUTPUT

unlink('../lib1.lua') if ( -f '../lib1.lua' );
my $X;
open $X, '>', '../lib1.lua';
print {$X} << 'CODE';
function norm (x, y)
    return (x^2 + y^2)^0.5
end

function twice (x)
    return 2*x
end
CODE
close $X;

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function dofile');
dofile('lib1.lua')
n = norm(3.4, 1.0)
print(twice(n))
CODE
7.0880180586677
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function dofile (stdin)', params => "< lib1.lua" );
dofile()
n = norm(3.4, 1.0)
print(twice(n))
CODE
7.0880180586677
OUTPUT

# clean up lib1.lua
unlink('../lib1.lua') if ( -f '../lib1.lua' );

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function dofile (no file)' );
dofile("no_file.lua")
CODE
/^[^:]+:( [^:]+:\d+:)? cannot open no_file.lua: No such file or directory\nstack traceback:\n/
OUTPUT

unlink('../foo.lua') if ( -f '../foo.lua' );
open $X, '>', '../foo.lua';
print {$X} '?syntax error?';
close $X;

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function dofile (syntax error)');
dofile('foo.lua')
CODE
/lua[^:]*:/
OUTPUT

# clean up foo.lua
unlink('../foo.lua') if ( -f '../foo.lua' );

language_output_is( 'lua', <<'CODE', <<'OUT', 'function getfenv' );
local function f () end

print(type(getfenv(0)))
assert(getfenv(0) == _G)
assert(getfenv(1) == _G)
assert(getfenv() == _G)
print(type(getfenv(f)))
assert(getfenv(f) == _G)
print(type(getfenv(print)))
assert(getfenv(print) == _G)
CODE
table
table
table
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'function getfenv (negative)' );
print(getfenv(-3))
CODE
/^[^:]+: [^:]+:\d+: bad argument #1 to 'getfenv' \(level must be non-negative\)\nstack traceback:\n/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'function getfenv (too depth)' );
print(getfenv(12))
CODE
/^[^:]+: [^:]+:\d+: bad argument #1 to 'getfenv' \(invalid level\)\nstack traceback:\n/
OUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function ipairs' );
a = {"a","b","c"}
local f, v, s = ipairs(a)
print(type(f), type(v), s)
s, v = f(a, s)
print(s, v)
s, v = f(a, s)
print(s, v)
s, v = f(a, s)
print(s, v)
s, v = f(a, s)
print(s, v)
CODE
function	table	0
1	a
2	b
3	c
nil	nil
OUTPUT

unlink('../foo.lua') if ( -f '../foo.lua' );
open $X, '>', '../foo.lua';
print {$X} << 'CODE';
function foo (x)
    print(x)
end
CODE
close $X;

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function loadfile');
f = loadfile('foo.lua')
print(foo)
f()
foo("ok")
CODE
nil
ok
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function loadfile (stdin)', params => "< foo.lua" );
f = loadfile()
print(foo)
f()
foo("ok")
CODE
nil
ok
OUTPUT

# clean up foo.lua
unlink('../foo.lua') if ( -f '../foo.lua' );

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function loadfile (no file)' );
f, msg = loadfile("no_file.lua")
print(f, msg)
CODE
/^nil\t.*cannot open no_file.lua: No such file or directory/
OUTPUT

unlink('../foo.lua') if ( -f '../foo.lua' );
open $X, '>', '../foo.lua';
print {$X} '?syntax error?';
close $X;

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function loadfile (syntax error)');
f, msg = loadfile('foo.lua')
print(f, msg)
CODE
/nil\t.*/
OUTPUT

# clean up foo.lua
unlink('../foo.lua') if ( -f '../foo.lua' );

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function loadstring' );
f = loadstring("i = i + 1")
i = 0
f(); print(i)
f(); print(i)
CODE
1
2
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function loadstring' );
i = 32
local i = 0
f = loadstring("i = i + 1; print(i)")
g = function () i = i + 1; print(i) end
f()
g()
CODE
33
1
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function loadstring (syntax error)' );
f, msg = loadstring("?syntax error?")
print(f, msg)
CODE
/nil\t.*/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function next (array)' );
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

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function next (no arg)' );
a = next()
print(a)
CODE
/^[^:]+: [^:]+:\d+: bad argument #1 to 'next' \(table expected, got no value\)\nstack traceback:\n/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function next (invalid key)' );
t = {"a","b","c"}
a = next(t, 6)
print(a)
CODE
/^[^:]+:( [^:]+:\d+:)? invalid key to 'next'\nstack traceback:\n/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function next (unorderer)' );
t = {"a","b","c"}
a = next(t, 2)
print(a)
a = next(t, 1)
print(a)
a = next(t, 3)
print(a)
CODE
3
2
nil
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function pairs' );
a = {"a","b","c"}
local f, v, s = pairs(a)
print(type(f), type(v), s)
s = f(v, s)
print(s)
s = f(v, s)
print(s)
s = f(v, s)
print(s)
s = f(v, s)
print(s)
CODE
function	table	nil
1
2
3
nil
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function pcall' );
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

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function pcall (incomplete)' );
r, msg = pcall(assert)
print(msg)
CODE
/bad argument #1 to '(\?|assert)' \(value expected\)/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function rawequal (true)' );
t = {}
a = t
print(rawequal(nil, nil))
print(rawequal(false, false))
print(rawequal(3, 3))
print(rawequal("text", "text"))
print(rawequal(t, a))
print(rawequal(print, print))
CODE
true
true
true
true
true
true
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function rawequal (false)' );
t = {}
print(rawequal(nil, 2))
print(rawequal(false, true))
print(rawequal(false, 2))
print(rawequal(3, 2))
print(rawequal(3, "2"))
print(rawequal("text", "2"))
print(rawequal("text", 2))
print(rawequal(t, {}))
print(rawequal(t, 2))
print(rawequal(print, format))
print(rawequal(print, 2))
CODE
false
false
false
false
false
false
false
false
false
false
false
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function rawget' );
t = {a = "letter a", b = "letter b"}
print(rawget(t, "a"))
CODE
letter a
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function rawset' );
t = {}
assert(rawset(t, "a", "letter a") == t)
print(t.a)
CODE
letter a
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function select' );
print(select("#"))
print(select("#","a","b","c"))
print(select(1,"a","b","c"))
print(select(3,"a","b","c"))
print(select(5,"a","b","c"))
CODE
0
3
a	b	c
c

OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function select (out of range)' );
print(select(0,"a","b","c"))
CODE
/^[^:]+: [^:]+:\d+: bad argument #1 to 'select' \(index out of range\)\nstack traceback:\n/
OUTPUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'function setfenv' );
t = {}
function f () end

assert(setfenv(f, t) == f)
print(type(getfenv(f)))
assert(getfenv(f) == t)
CODE
table
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'function setfenv' );
a = 1
setfenv(1, {g = _G})
g.print(a)
g.print(g.a)
CODE
nil
1
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'function setfenv' );
a = 1
local newgt = {}        -- create new environment
setmetatable(newgt, {__index = _G})
setfenv(1, newgt)       -- set it
print(a)
a = 10
print(a)
print(_G.a)
_G.a = 20
print(_G.a)
CODE
1
10
1
20
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'function setfenv' );
function factory ()
    return function ()
               return a    -- "global" a
           end
end

a = 3
f1 = factory()
f2 = factory()
print(f1())
print(f2())
setfenv(f1, {a = 10})
print(f1())
print(f2())
CODE
3
3
10
3
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'function setfenv (negative)' );
setfenv(-3, {})
CODE
/^[^:]+: [^:]+:\d+: bad argument #1 to 'setfenv' \(level must be non-negative\)\nstack traceback:\n/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'function setfenv (too depth)' );
print(setfenv(12, {}))
CODE
/^[^:]+: [^:]+:\d+: bad argument #1 to 'setfenv' \(invalid level\)\nstack traceback:\n/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'function setfenv (bad arg)' );
t = {}
setfenv(t, t)
CODE
/^[^:]+: [^:]+:\d+: bad argument #1 to 'setfenv' \(number expected, got table\)\nstack traceback:\n/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'function setfenv (forbidden)' );
setfenv(print, {})
CODE
/^[^:]+: [^:]+:\d+: 'setfenv' cannot change environment of given object\nstack traceback:\n/
OUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function type' );
print(type("Hello world"))
print(type(10.4*3))
print(type(print))
print(type(type))
print(type(true))
print(type(nil))
print(type(io.stdin))
print(type(type(X)))
CODE
string
number
function
function
boolean
nil
userdata
string
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function type' );
print(type(a))
a = 10
print(type(a))
a = "a string!!"
print(type(a))
a = print
a(type(a))
print(type(function () end))
CODE
nil
number
string
function
function
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function type (no arg)' );
type()
CODE
/^[^:]+: [^:]+:\d+: bad argument #1 to 'type' \(value expected\)\nstack traceback:\n/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function type' );
a = 12.34
t = type(a)
print(a)
print(t)
CODE
12.34
number
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function tonumber' );
r = tonumber("text12")
print(type(r), r)
r = tonumber("12text")
print(type(r), r)
r = tonumber(3.14)
print(type(r), r)
r = tonumber("3.14")
print(type(r), r)
r = tonumber("  3.14  ")
print(type(r), r)
r = tonumber(111, 2)
print(type(r), r)
r = tonumber("111", 2)
print(type(r), r)
r = tonumber("  111  ", 2)
print(type(r), r)
a = {}
r = tonumber(a)
print(type(r), r)
CODE
nil	nil
nil	nil
number	3.14
number	3.14
number	3.14
number	7
number	7
number	7
nil	nil
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function tonumber (no arg)' );
tonumber()
CODE
/^[^:]+: [^:]+:\d+: bad argument #1 to 'tonumber' \(value expected\)\nstack traceback:\n/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function tonumber (bad base)' );
r = tonumber("111", 200)
print(type(r), r)
CODE
/^[^:]+: [^:]+:\d+: bad argument #2 to 'tonumber' \(base out of range\)\nstack traceback:\n/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function tostring (no arg)' );
tostring()
CODE
/^[^:]+: [^:]+:\d+: bad argument #1 to 'tostring' \(value expected\)\nstack traceback:\n/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function unpack' );
print(unpack{})
print(unpack{"a"})
print(unpack{"a","b","c"})
print((unpack{"a","b","c"}))
print(unpack({"a","b","c","d","e"},2,4))
print(unpack({"a","b","c"},2,4))
CODE

a
a	b	c
a
b	c	d
b	c	nil
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function xpcall' );
r = xpcall(assert, nil)
print(r)
CODE
false
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function xpcall (backtrace)' );
function backtrace ()
    return 'not a back trace'
end

r, m = xpcall(assert, backtrace)
print(r, m)
CODE
false	not a back trace
OUTPUT

# clean up temporary files
map { unlink("../tmp1.$_") if ( -f "../tmp1.$_" ) } qw(lua pbc pir);

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

