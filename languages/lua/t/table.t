#! perl -w
# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

t/table.t - Lua Table Library

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/table.t

=head1 DESCRIPTION

Tests Lua Table Library
(implemented in F<languages/lua/lib/luatable.pir>).

See "Lua 5.1 Reference Manual", section 5.5 "Table Manipulation".

See "Programming in Lua", section 19 "The Table Library".

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 11;
use Test::More;

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
/table contains non-strings/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function concat (non-string)' );
t = {"a","b",true,"d","e"}
print(table.concat(t,","))
CODE
/table contains non-strings/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function foreach (array)' );
t = {"a","b","c"}
table.foreach(t, print)
CODE
1	a
2	b
3	c
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
-- t[6] = "g"
-- print(table.maxn(t))
CODE
0
2
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function remove' );
t = {}
a = table.remove(t)
print(a)
t = {"a","b","c","d","e"}
a = table.remove(t)
print(a)
print(table.concat(t,","))
a = table.remove(t,3)
print(a)
print(table.concat(t,","))
a = table.remove(t,1)
print(a)
print(table.concat(t,","))
a = table.remove(t,7)
print(a)
print(table.concat(t,","))
CODE
nil
e
a,b,c,d
c
a,b,d
a
b,d
nil
b
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function setn' );
a = {}
table.setn(a, 10000)
CODE
/'setn' is obsolete/
OUTPUT

