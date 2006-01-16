#! perl -w
# Copyright: 2006 The Perl Foundation.  All Rights Reserved.
# $Id: table.t 11084 2006-01-11 13:12:49Z fperrad $

=head1 NAME

t/table.t - Lua Table Library

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/table.t

=head1 DESCRIPTION

Tests Lua Table Library
(implemented in F<languages/lua/lib/luatable.pir>).

See "Lua 5.0 Reference Manual", section 5.4 "Table Manipulation".

See "Programming in Lua", section 19 "The Table Library".

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 8;
use Test::More;

language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function concat");
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

language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function concat (number)");
t = {"a","b",3,"d","e"} 
print(table.concat(t,","))
CODE
a,b,3,d,e
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', "function concat (out of range)");
t = {"a","b","c","d","e"} 
print(table.concat(t,",",2,7))
CODE
/table contains non-strings/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', "function concat (non-string)");
t = {"a","b",true,"d","e"} 
print(table.concat(t,","))
CODE
/table contains non-strings/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function foreach (array)");
t = {"a","b","c"} 
table.foreach(t, print)
CODE
1	a
2	b
3	c
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function foreachi (array)");
t = {"a","b","c"} 
table.foreachi(t, print)
CODE
1	a
2	b
3	c
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function getn");
print(table.getn{10,2,4})
print(table.getn{10,2,nil})
print(table.getn{10,2,nil; n=3})
print(table.getn{n=1000})
CODE
3
2
3
1000
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function setn");
a = {}
print(table.getn(a))
table.setn(a, 10000)
print(table.getn(a))

b = {n=10}
print(table.getn(b))
table.setn(b, 10000)
print(table.getn(b))
CODE
0
10000
10
10000
OUTPUT

