#! perl
# Copyright (C) 2006-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/table.t - Lua Table Library

=head1 SYNOPSIS

    % perl t/table.t

=head1 DESCRIPTION

Tests Lua Table Library
(implemented in F<languages/lua/lib/luatable.pir>).

See "Lua 5.1 Reference Manual", section 5.5 "Table Manipulation",
L<http://www.lua.org/manual/5.1/manual.html#5.5>.

See "Programming in Lua", section 19 "The Table Library".

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../lib", "$FindBin::Bin";

use Parrot::Test tests => 18;
use Test::More;
use Parrot::Test::Lua;

my $test_prog = Parrot::Test::Lua::get_test_prog();

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function concat' );
t = {"a","b","c","d","e"}
print(table.concat(t))
print(table.concat(t,","))
print(table.concat(t,",",2))
print(table.concat(t,",",2,4))
print(table.concat(t,",",4,2))
CODE
abcde
a,b,c,d,e
b,c,d,e
b,c,d

OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function concat (number)' );
t = {"a","b",3,"d","e"}
print(table.concat(t,","))
CODE
a,b,3,d,e
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function concat (out of range)' );
t = {"a","b","c","d","e"}
print(table.concat(t,",",2,7))
CODE
/^[^:]+: [^:]+:\d+: invalid value \(nil\) at index 6 in table for 'concat'\nstack traceback:\n/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function concat (non-string)' );
t = {"a","b",true,"d","e"}
print(table.concat(t,","))
CODE
/^[^:]+: [^:]+:\d+: invalid value \(boolean\) at index 3 in table for 'concat'\nstack traceback:\n/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function foreach (array)' );
t = {"a","b","c"}
table.foreach(t, print)
CODE
1	a
2	b
3	c
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function foreach (hash)' );
t = {a=10, b=100}
table.foreach(t, print)
CODE
/^(a\t10\nb\t100|b\t100\na\t10)$/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function foreachi' );
t = {"a","b","c"}
table.foreachi(t, print)
CODE
1	a
2	b
3	c
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function getn' );
print(table.getn{10,2,4})
print(table.getn{10,2,nil})
CODE
3
2
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function insert' );
a = {10, 20, 30}
table.insert(a, 1, 15)
print(table.concat(a,","))
t = {}
table.insert(t, "a")
print(table.concat(t,","))
table.insert(t, "b")
print(table.concat(t,","))
table.insert(t, 1, "c")
print(table.concat(t,","))
table.insert(t, 2, "d")
print(table.concat(t,","))
table.insert(t, 7, "e")
print(t[7])
table.insert(t, -9, "f")
print(t[-9])
CODE
15,10,20,30
a
a,b
c,a,b
c,d,a,b
e
f
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function maxn' );
t = {}
print(table.maxn(t))
t[1] = "a"
t[2] = "b"
print(table.maxn(t))
t[6] = "g"
print(table.maxn(t))
CODE
0
2
6
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function maxn' );
a = {}
a[10000] = 1
print(table.maxn(a))
CODE
10000
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function remove' );
t = {}
a = table.remove(t)
print(a)                        -- nil
t = {"a","b","c","d","e"}
a = table.remove(t)
print(a)                        -- e
print(table.concat(t,","))      -- a,b,c,d
a = table.remove(t,3)
print(a)                        -- c
print(table.concat(t,","))      -- a,b,d
a = table.remove(t,1)
print(a)                        -- a
print(table.concat(t,","))      -- b,d
a = table.remove(t,7)
print(a)                        -- nil
print(table.concat(t,","))      -- b,d
CODE
nil
e
a,b,c,d
c
a,b,d
a
b,d
nil
b,d
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function setn' );
a = {}
table.setn(a, 10000)
CODE
/^[^:]+: [^:]+:\d+: 'setn' is obsolete\nstack traceback:\n/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function sort' );
lines = {
    luaH_set = 10,
    luaH_get = 24,
    luaH_present = 48,
}

a = {}
for n in pairs(lines) do a[#a + 1] = n end
table.sort(a)
for i,n in ipairs(a) do print(n) end
CODE
luaH_get
luaH_present
luaH_set
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function sort' );
lines = {
    luaH_set = 10,
    luaH_get = 24,
    luaH_present = 48,
}

function pairsByKeys (t, f)
    local a = {}
    for n in pairs(t) do a[#a + 1] = n end
    table.sort(a, f)
    local i = 0     -- iterator variable
    return function ()  -- iterator function
        i = i + 1
        return a[i], t[a[i]]
    end
end

for name, line in pairsByKeys(lines) do
    print(name, line)
end
CODE
luaH_get	24
luaH_present	48
luaH_set	10
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function sort' );
lines = {
    luaH_set = 10,
    luaH_get = 24,
    luaH_present = 48,
}

function pairsByKeys (t, f)
    local a = {}
    for n in pairs(t) do a[#a + 1] = n end
    table.sort(a, f)
    local i = 0     -- iterator variable
    return function ()  -- iterator function
        i = i + 1
        return a[i], t[a[i]]
    end
end

for name, line in pairsByKeys(lines, function (a, b) return a < b end) do
    print(name, line)
end
CODE
luaH_get	24
luaH_present	48
luaH_set	10
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function sort (all permutations)' );
function permgen (a, n)
    n = n or #a
    if n <= 1 then
        coroutine.yield(a)
    else
        for i=1,n do
            a[n], a[i] = a[i], a[n]
            permgen(a, n - 1)
            a[n], a[i] = a[i], a[n]
        end
    end
end

function permutations (a)
    local co = coroutine.create(function () permgen(a) end)
    return function ()
               local code, res = coroutine.resume(co)
               return res
           end
end

local t = {}
for _, v in ipairs{'a', 'b', 'c', 'd', 'e', 'f', 'g'} do
    table.insert(t, v)
    local ref = table.concat(t, ' ')
    print(ref)
    local n = 0
    for p in permutations(t) do
        local c = {}
        for i, v in ipairs(p) do
            c[i] = v
        end
        table.sort(c)
        assert(ref == table.concat(c, ' '), table.concat(p, ' '))
        n = n + 1
    end
    print(n)
end
CODE
a
1
a b
2
a b c
6
a b c d
24
a b c d e
120
a b c d e f
720
a b c d e f g
5040
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function sort (bad func)' );
-- see bug : http://www.lua.org/bugs.html#5.1.3
local t = { 1 }
table.sort( { t, t, t, t, }, function (a, b) return a[1] == b[1] end )
CODE
/^[^:]+: [^:]+:\d+: invalid order function for sorting\nstack traceback:\n/
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

