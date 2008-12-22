#! perl
# Copyright (C) 2006-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/iterator.t - Lua iterators

=head1 SYNOPSIS

    % perl t/iterator.t

=head1 DESCRIPTION

See "Programming in Lua", section 7 "Iterators and the Generic for" and
section 9.3 "Coroutines as Iterators".

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../lib", "$FindBin::Bin";

use Parrot::Test tests => 8;
use Test::More;

language_output_is( 'lua', <<'CODE', <<'OUT', 'list_iter' );
function list_iter (t)
    local i = 0
    local n = #t
    return function ()
               i = i + 1
               if i <= n then
                   return t[i]
               else
                   return nil
               end
           end
end

t = {10, 20, 30}
for element in list_iter(t) do
    print(element)
end
CODE
10
20
30
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'values' );
function values (t)
    local i = 0
    return function ()
               i = i + 1
               return t[i]
           end
end

t = {10, 20, 30}
for element in values(t) do
    print(element)
end
CODE
10
20
30
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'emul ipairs' );
local function iter (a, i)
    i = i + 1
    local v = a[i]
    if v then
        return i, v
    end
end

local function ipairs (a)
    return iter, a, 0
end

a = {'one', 'two', 'three'}

for i, v in ipairs(a) do
    print(i, v)
end
CODE
1	one
2	two
3	three
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'emul pairs' );
local function iter (a, i)
    i = i + 1
    local v = a[i]
    if v then
        return i, v
    end
end

local function pairs (t)
    return next, t, nil
end

a = {'one', 'two', 'three'}

for k, v in pairs(a) do
    print(k, v)
end
CODE
1	one
2	two
3	three
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'with next' );
t = {'one', 'two', 'three'}

for k, v in next, t do
    print(k, v)
end
CODE
1	one
2	two
3	three
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'permutations' );
function permgen (a, n)
    n = n or #a         -- default for 'n' is size of 'a'
    if n <= 1 then      -- nothing to change?
        coroutine.yield(a)
    else
        for i=1,n do
            -- put i-th element as the last one
            a[n], a[i] = a[i], a[n]
            -- generate all permutations of the other elements
            permgen(a, n - 1)
            -- restore i-th element
            a[n], a[i] = a[i], a[n]
        end
    end
end

function permutations (a)
    local co = coroutine.create(function () permgen(a) end)
    return function ()  -- iterator
               local code, res = coroutine.resume(co)
               return res
           end
end

for p in permutations{'a', 'b', 'c'} do
    print(table.concat(p, ' '))
end
CODE
b c a
c b a
c a b
a c b
b a c
a b c
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'permutations with wrap' );
function permgen (a, n)
    n = n or #a         -- default for 'n' is size of 'a'
    if n <= 1 then      -- nothing to change?
        coroutine.yield(a)
    else
        for i=1,n do
            -- put i-th element as the last one
            a[n], a[i] = a[i], a[n]
            -- generate all permutations of the other elements
            permgen(a, n - 1)
            -- restore i-th element
            a[n], a[i] = a[i], a[n]
        end
    end
end

function permutations (a)
    return coroutine.wrap(function () permgen(a) end)
end

for p in permutations{'a', 'b', 'c'} do
    print(table.concat(p, ' '))
end
CODE
b c a
c b a
c a b
a c b
b a c
a b c
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'fibo' );
function fibogen ()
    local x, y = 0, 1
    while true do
        coroutine.yield(x)
        x, y = y, x + y
    end
end

function fibo ()
    return coroutine.wrap(function () fibogen() end)
end

for n in fibo() do
    print(n)
    if n > 30 then break end
end
CODE
0
1
1
2
3
5
8
13
21
34
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

