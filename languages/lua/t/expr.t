#! perl -w
# Copyright: 2005-2006 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/expr.t - Lua expression

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/expr.t

=head1 DESCRIPTION

See "Lua 5.0 Reference Manual", section 2.5 "Expressions".

See "Programming in Lua", section 3 "Expressions".

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 11;
use Test::More;

language_output_is( 'lua', <<'CODE', <<'OUT', 'relational op (by reference)' );
a = {}; a.x = 1; a.y = 0;
b = {}; b.x = 1; b.y = 0;
c = a
print(a==c)
print(a~=b)
CODE
true
true
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'relational op' );
print("0"==0)
print(2<15)
print("2"<"15")
CODE
false
true
false
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'relational op' );
print(2<"15")
CODE
/compare/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'relational op' );
print("2"<15)
CODE
/compare/
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'logical op' );
print(4 and 5)
print(nil and 13)
print(false and 13)
print(4 or 5)
print(false or 5)
print(false or "text")
CODE
5
nil
false
4
5
text
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'logical op' );
print(10 or error())
print(nil or "a")
print(nil and 10)
print(false and error())
print(false and nil)
print(false or nil)
print(10 and 20)
CODE
10
a
nil
false
false
nil
20
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'logical not' );
print(not nil)
print(not false)
print(not 0)
print(not not nil)
print(not "text")
a = {}
print(not a)
CODE
true
true
false
false
false
false
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'concatenation' );
print("Hello " .. "World")
print(0 .. 1)
a = "Hello"
print(a .. " World")
print(a)
CODE
Hello World
01
Hello World
Hello
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'coercion' );
print("10" + 1)
print("10 + 1")
print("-5.3" * "2")
print(10 .. 20)
print(tostring(10) == "10")
print(10 .. "" == "10")
CODE
11
10 + 1
-10.6
1020
true
true
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'no coercion' );
print("hello" + 1)
CODE
/perform arithmetic/
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'clone ?' );
print(10 + 2)
print(10 + 5)
a = 20
print(a + 3)
print(a + 6)
b = 30
c = b + 4
d = b + 7
print(c)
print(d)
CODE
12
15
23
26
34
37
OUT

