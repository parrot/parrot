#! perl -w
# Copyright (C) 2006, The Perl Foundation.
# $Id: metatable.t 11501 2006-02-10 18:27:13Z particle $

=head1 NAME

t/metatable.t - Lua tables

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/metatable.t

=head1 DESCRIPTION

See "Lua 5.0 Reference Manual", section 2.8 "Metatables".

See "Programming in Lua", section 13 "Metatables and Metamethods".

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 28;
use Test::More;

language_output_is( 'lua', <<'CODE', <<'OUT', 'metatable' );
t = {}
print(getmetatable(t))
t1 = {}
setmetatable(t, t1)
assert(getmetatable(t) == t1)
CODE
nil
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'protected metatable' );
t = {}
mt = {}
mt.__metatable = "not your business"
setmetatable(t, mt)
assert(getmetatable(t) == "not your business")
setmetatable(t, {})
CODE
/cannot change a protected metatable/
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'metatable for string' );
assert(getmetatable("").__index == string)
print("ok")
CODE
ok
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'metatable for all types' );
print(getmetatable(nil))
print(getmetatable(false))
print(getmetatable(2))
print(getmetatable(print))
CODE
nil
nil
nil
nil
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '__tostring' );
t = {}
mt = { __tostring=function () return "__TABLE__" end }
setmetatable(t, mt)
print(tostring(t))
CODE
__TABLE__
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '__tostring no-output' );
t = {}
mt = {}
function mt.__tostring () print("return nothing") end
setmetatable(t, mt)
print(type(tostring(t)))
CODE
return nothing
nil
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '__tostring too-many-output' );
t = {}
mt = {}
mt.__tostring = function () return "__FIRST__", 2 end
setmetatable(t, mt)
print(tostring(t))
CODE
__FIRST__
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '__tostring invalid' );
t = {}
t.mt = {}
setmetatable(t, t.mt)
t.mt.__tostring = "not a function"
print(tostring(t))
CODE
/attempt to call a string value/
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'cplx __add' );
Cplx = {}
Cplx.mt = {}

function Cplx.new (re, im)
    local c = {}
    setmetatable(c, Cplx.mt)
    c.re = tonumber(re)
    if im == nil then
        c.im = 0.0
    else
        c.im = tonumber(im)
    end
    return c
end

function Cplx.mt.__tostring (c)
    return "(" .. c.re .. "," .. c.im .. ")"
end

function Cplx.mt.__add (a, b)
    if type(a) ~= "table" then
        a = Cplx.new(a, 0)
    end
    if type(b) ~= "table" then
        b = Cplx.new(b, 0)
    end
    local r = Cplx.new(a.re + b.re, a.im + b.im)
    return r
end

c1 = Cplx.new(1, 3)
c2 = Cplx.new(2, -1)

print(c1 + c2)
print(c1 + 3)
print(-2 + c1)
print(c1 + "3")
print("-2" + c1)

CODE
(3,2)
(4,3)
(-1,3)
(4,3)
(-1,3)
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'cplx __sub' );
Cplx = {}
Cplx.mt = {}

function Cplx.new (re, im)
    local c = {}
    setmetatable(c, Cplx.mt)
    c.re = tonumber(re)
    if im == nil then
        c.im = 0.0
    else
        c.im = tonumber(im)
    end
    return c
end

function Cplx.mt.__tostring (c)
    return "(" .. c.re .. "," .. c.im .. ")"
end

function Cplx.mt.__sub (a, b)
    if type(a) ~= "table" then
        a = Cplx.new(a, 0)
    end
    if type(b) ~= "table" then
        b = Cplx.new(b, 0)
    end
    local r = Cplx.new(a.re - b.re, a.im - b.im)
    return r
end

c1 = Cplx.new(1, 3)
c2 = Cplx.new(2, -1)

print(c1 - c2)
print(c1 - 3)
print(-2 - c1)
print(c1 - "3")
print("-2" - c1)

CODE
(-1,4)
(-2,3)
(-3,-3)
(-2,3)
(-3,-3)
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'cplx __mul' );
Cplx = {}
Cplx.mt = {}

function Cplx.new (re, im)
    local c = {}
    setmetatable(c, Cplx.mt)
    c.re = tonumber(re)
    if im == nil then
        c.im = 0.0
    else
        c.im = tonumber(im)
    end
    return c
end

function Cplx.mt.__tostring (c)
    return "(" .. c.re .. "," .. c.im .. ")"
end

function Cplx.mt.__mul (a, b)
    if type(a) ~= "table" then
        a = Cplx.new(a, 0)
    end
    if type(b) ~= "table" then
        b = Cplx.new(b, 0)
    end
    local r = Cplx.new(a.re*b.re - a.im*b.im,
        a.re*b.im + a.im*b.re)
    return r
end

c1 = Cplx.new(1, 3)
c2 = Cplx.new(2, -1)

print(c1 * c2)
print(c1 * 3)
print(-2 * c1)
print(c1 * "3")
print("-2" * c1)
CODE
(5,5)
(3,9)
(-2,-6)
(3,9)
(-2,-6)
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'cplx __div' );
Cplx = {}
Cplx.mt = {}

function Cplx.new (re, im)
    local c = {}
    setmetatable(c, Cplx.mt)
    c.re = tonumber(re)
    if im == nil then
        c.im = 0.0
    else
        c.im = tonumber(im)
    end
    return c
end

function Cplx.mt.__tostring (c)
    return "(" .. c.re .. "," .. c.im .. ")"
end

function Cplx.mt.__div (a, b)
    if type(a) ~= "table" then
        a = Cplx.new(a, 0)
    end
    if type(b) ~= "table" then
        b = Cplx.new(b, 0)
    end
    local n = b.re*b.re + b.im*b.im
    local inv = Cplx.new(b.re/n, b.im/n)
    local r = Cplx.new(a.re*inv.re - a.im*inv.im,
        a.re*inv.im + a.im*inv.re)
    return r
end

c1 = Cplx.new(2, 6)
c2 = Cplx.new(2, 0)

print(c1 / c2)
print(c1 / 2)
print(-4 / c2)
print(c1 / "2")
print("-4" / c2)
CODE
(1,3)
(1,3)
(-2,0)
(1,3)
(-2,0)
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'cplx __unm' );
Cplx = {}
Cplx.mt = {}

function Cplx.new (re, im)
    local c = {}
    setmetatable(c, Cplx.mt)
    c.re = tonumber(re)
    if im == nil then
        c.im = 0.0
    else
        c.im = tonumber(im)
    end
    return c
end

function Cplx.mt.__tostring (c)
    return "(" .. c.re .. "," .. c.im .. ")"
end

function Cplx.mt.__unm (a)
    if type(a) ~= "table" then
        a = Cplx.new(a, 0)
    end
    local r = Cplx.new(-a.re, -a.im)
    return r
end

c1 = Cplx.new(1, 3)
print(- c1)
CODE
(-1,-3)
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'cplx __eq' );
Cplx = {}
Cplx.mt = {}

function Cplx.new (re, im)
    local c = {}
    setmetatable(c, Cplx.mt)
    c.re = tonumber(re)
    if im == nil then
        c.im = 0.0
    else
        c.im = tonumber(im)
    end
    return c
end

function Cplx.mt.__tostring (c)
    return "(" .. c.re .. "," .. c.im .. ")"
end

function Cplx.mt.__eq (a, b)
    if type(a) ~= "table" then
        a = Cplx.new(a, 0)
    end
    if type(b) ~= "table" then
        b = Cplx.new(b, 0)
    end
    return (a.re == b.re) and (b.im == b.im) 
end

c1 = Cplx.new(2, 0)
c2 = Cplx.new(1, 3)
c3 = Cplx.new(2, 0)
print(c1 ~= c2)
print(c1 == c3)
print(c1 == 2)
print(Cplx.mt.__eq(c1, 2))
CODE
true
true
false
true
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'cplx __lt __le' );
Cplx = {}
Cplx.mt = {}

function Cplx.new (re, im)
    local c = {}
    setmetatable(c, Cplx.mt)
    c.re = tonumber(re)
    if im == nil then
        c.im = 0.0
    else
        c.im = tonumber(im)
    end
    return c
end

function Cplx.mt.__tostring (c)
    return "(" .. c.re .. "," .. c.im .. ")"
end

function Cplx.mt.__lt (a, b)
    if type(a) ~= "table" then
        a = Cplx.new(a, 0)
    end
    if type(b) ~= "table" then
        b = Cplx.new(b, 0)
    end
    local ra = a.re*a.re + a.im*a.im
    local rb = b.re*b.re + b.im*b.im
    return ra < rb 
end

function Cplx.mt.__le (a, b)
    if type(a) ~= "table" then
        a = Cplx.new(a, 0)
    end
    if type(b) ~= "table" then
        b = Cplx.new(b, 0)
    end
    local ra = a.re*a.re + a.im*a.im
    local rb = b.re*b.re + b.im*b.im
    return ra <= rb 
end

function Cplx.mt.__cmp (a, b)
    -- only use on Parrot
    if type(a) ~= "table" then
        a = Cplx.new(a, 0)
    end
    if type(b) ~= "table" then
        b = Cplx.new(b, 0)
    end
    local ra = a.re*a.re + a.im*a.im
    local rb = b.re*b.re + b.im*b.im
    if ra <= rb then
        if ra < rb then
            return -1
        else
            return 0
        end
    else
        return 1
    end
end

c1 = Cplx.new(2, 0)
c2 = Cplx.new(1, 3)
c3 = Cplx.new(2, 0)
print(c1 < c2)
print(c1 < c3)
print(c1 <= c3)
CODE
true
false
true
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'cplx __lt' );
Cplx = {}
Cplx.mt = {}

function Cplx.new (re, im)
    local c = {}
    setmetatable(c, Cplx.mt)
    c.re = tonumber(re)
    if im == nil then
        c.im = 0.0
    else
        c.im = tonumber(im)
    end
    return c
end

function Cplx.mt.__tostring (c)
    return "(" .. c.re .. "," .. c.im .. ")"
end

function Cplx.mt.__lt (a, b)
    if type(a) ~= "table" then
        a = Cplx.new(a, 0)
    end
    if type(b) ~= "table" then
        b = Cplx.new(b, 0)
    end
    local ra = a.re*a.re + a.im*a.im
    local rb = b.re*b.re + b.im*b.im
    return ra < rb 
end

c1 = Cplx.new(2, 0)
c2 = Cplx.new(1, 3)
c3 = Cplx.new(2, 0)
print(c1 < c2)
print(c1 < c3)
print(c1 <= c3)
CODE
true
false
true
OUT

TODO: {
local $TODO = 'fix me (luabase.pmc:invoke)';

language_output_is( 'lua', <<'CODE', <<'OUT', 'cplx __call' );
Cplx = {}
Cplx.mt = {}

function Cplx.new (re, im)
    local c = {}
    setmetatable(c, Cplx.mt)
    c.re = tonumber(re)
    if im == nil then
        c.im = 0.0
    else
        c.im = tonumber(im)
    end
    return c
end

function Cplx.mt.__tostring (c)
    return "(" .. c.re .. "," .. c.im .. ")"
end

function Cplx.mt.__call (obj, ...)
    print("Cplx.__call " .. tostring(obj) .. ", " .. table.concat(arg, ", "))
    return true
end

c1 = Cplx.new(2, 0)
c1()
c1("a")
r = c1("a", "b", "c")
print(r)
CODE
Cplx.__call (2,0), 
Cplx.__call (2,0), a
Cplx.__call (2,0), a, b, c
true
OUT
}

language_output_is( 'lua', <<'CODE', <<'OUT', 'table-access' );
-- create a namespace
Window = {}
-- create a prototype with default values
Window.prototype = {x=0, y=0, width=100, heigth=100, }
-- create a metatable
Window.mt = {}
-- declare the constructor function
function Window.new (o)
    setmetatable(o, Window.mt)
    return o
end

Window.mt.__index = function (table, key)
    return Window.prototype[key]
end

w = Window.new{x=10, y=20}
print(w.x)
print(w.width)
print(rawget(w, "x"))
print(rawget(w, "width"))
CODE
10
100
10
nil
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'table-access' );
-- create a namespace
Window = {}
-- create a prototype with default values
Window.prototype = {x=0, y=0, width=100, heigth=100, }
-- create a metatable
Window.mt = {}
-- declare the constructor function
function Window.new (o)
    setmetatable(o, Window.mt)
    return o
end

Window.mt.__index = Window.prototype  -- just a table

w = Window.new{x=10, y=20}
print(w.x)
print(w.width)
print(rawget(w, "x"))
print(rawget(w, "width"))
CODE
10
100
10
nil
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'tables with default values' );
function setDefault (t, d)
    local mt = {__index = function () return d end}
    setmetatable (t, mt)
end

tab = {x=10, y=20}
print(tab.x, tab.z)
setDefault(tab, 0)
print(tab.x, tab.z)
CODE
10	nil
10	0
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'tables with default values' );
local mt = {__index = function (t) return t.___ end}
function setDefault (t, d)
    t.___ = d
    setmetatable (t, mt)
end

tab = {x=10, y=20}
print(tab.x, tab.z)
setDefault(tab, 0)
print(tab.x, tab.z)
CODE
10	nil
10	0
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'tables with default values' );
local key = {}
local mt = {__index = function (t) return t[key] end}
function setDefault (t, d)
    t[key] = d
    setmetatable (t, mt)
end

tab = {x=10, y=20}
print(tab.x, tab.z)
setDefault(tab, 0)
print(tab.x, tab.z)
CODE
10	nil
10	0
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'tracking table accesses' );
t = {}  -- original table
-- keep a private access to original table
local _t = t
-- create proxy
t = {}
-- create metatable
local mt = {
    __index = function (t,k)
        print("*access to element " .. tostring(k))
        return _t[k]  -- access the original table
    end,
   
    __newindex = function (t,k,v)
        print("*update of element " .. tostring(k) ..
                             " to " .. tostring(v))
        _t[k] = v  -- update original table
    end
}
setmetatable(t, mt)

t[2] = 'hello'
print(t[2])
CODE
*update of element 2 to hello
*access to element 2
hello
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'tracking table accesses' );
-- create private index
local index = {}
-- create metatable
local mt = {
    __index = function (t,k)
        print("*access to element " .. tostring(k))
        return t[index][k]  -- access the original table
    end,
   
    __newindex = function (t,k,v)
        print("*update of element " .. tostring(k) ..
                             " to " .. tostring(v))
        t[index][k] = v  -- update original table
    end
}
function track (t)
    local proxy = {}
    proxy[index] = t
    setmetatable(proxy, mt)
    return proxy
end

t = {}
t = track(t)

t[2] = 'hello'
print(t[2])
CODE
*update of element 2 to hello
*access to element 2
hello
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'read-only tables' );
function readOnly (t)
    local proxy = {}
    local mt = {
        __index = t,
        __newindex = function (t,k,v)
            error("attempt to update a read-only table", 2)
        end
    }
    setmetatable(proxy, mt)
    return proxy
end

days = readOnly{"Sunday", "Monday", "Tuesday", "Wednesday",
        "Thurday", "Friday", "Saturday"}

print(days[1])        
CODE
Sunday
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'read-only tables' );
function readOnly (t)
    local proxy = {}
    local mt = {
        __index = t,
        __newindex = function (t,k,v)
            error("attempt to update a read-only table", 2)
        end
    }
    setmetatable(proxy, mt)
    return proxy
end

days = readOnly{"Sunday", "Monday", "Tuesday", "Wednesday",
        "Thurday", "Friday", "Saturday"}

days[2] = "Noday"        
CODE
/attempt to update a read-only table/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'declaring global variables' );
setmetatable(_G, {
    __newindex = function (_, n)
        error("attempt to write to undeclared variable " .. n, 2)
    end,
    __index = function (_, n)
        error("attempt to read undeclared variable" .. n, 2)
    end, 
})

a = 1
CODE
/attempt to write to undeclared variable a/
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'declaring global variables' );
function declare (name, initval)
    rawset(_G, name, initval or false)
end

setmetatable(_G, {
    __newindex = function (_, n)
        error("attempt to write to undeclared variable " .. n, 2)
    end,
    __index = function (_, n)
        error("attempt to read undeclared variable" .. n, 2)
    end, 
})

declare "a"
a = 1
print(a)
CODE
1
OUT

