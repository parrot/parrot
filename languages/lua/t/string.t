#! perl
# Copyright (C) 2005-2007, The Perl Foundation.
# $Id$

=head1 NAME

t/string.t - Lua String Library

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/string.t

=head1 DESCRIPTION

Tests Lua String Library
(implemented in F<languages/lua/lib/luastring.pir>).

See "Lua 5.1 Reference Manual", section 5.4 "String Manipulation",
L<http://www.lua.org/manual/5.1/manual.html#5.4>.

See "Programming in Lua", section 20 "The String Library".

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 25;
use Test::More;

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function string.byte' );
print(string.byte("ABC"))
print(string.byte("ABC", 2))
print(string.byte("ABC", -1))
print(string.byte("ABC", 4))
print(string.byte("ABC", 0))
print(string.byte("ABC", 1, 3))
print(string.byte("ABC", 1, 4))
CODE
65
66
67


65	66	67
65	66	67
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'metatable' );
print(getmetatable("ABC"))
CODE
/table: (0[Xx])?[0-9A-Fa-f]+/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'method s:byte' );
s = "ABC"
print(s:byte(2))
CODE
66
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function string.char' );
print(string.char(65, 66, 67))
print(string.char())
CODE
ABC

OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function string.find (mode plain)' );
s = "hello world"
i, j = string.find(s, "hello")
print(i, j)
print(string.find(s, "hello", 1, true))
print(string.find(s, "hello", 1))
print(string.sub(s, i, j))
print(string.find(s, "world"))
i, j = string.find(s, "l")
print(i, j)
print(string.find(s, "lll"))
print(string.find(s, "hello", 2, true))
print(string.find(s, "world", 2, true))
CODE
1	5
1	5
1	5
hello
7	11
3	3
nil
nil
7	11
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function string.find (with regex & captures)' );
s = "hello world"
print(string.find(s, "^h.ll."))
print(string.find(s, "w.rld", 2))
print(string.find(s, "W.rld"))
print(string.find(s, "^(h.ll.)"))
print(string.find(s, "^(h.)l(l.)"))
s = "Deadline is 30/05/1999, firm"
date = "%d%d/%d%d/%d%d%d%d"
print(string.sub(s, string.find(s, date)))
CODE
1	5
7	11
nil
1	5	hello
1	5	he	lo
30/05/1999
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function string.format' );
print(string.format("pi = %.4f", math.pi))
d = 5; m = 11; y = 1990
print(string.format("%02d/%02d/%04d", d, m, y))
tag, title = "h1", "a title"
print(string.format("<%s>%s</%s>", tag, title, tag))
CODE
pi = 3.1416
05/11/1990
<h1>a title</h1>
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function string.format %q' );
print(string.format('%q', 'a string with "quotes" and \n new line'))
CODE
"a string with \"quotes\" and \
 new line"
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function string.format (too many arg)' );
print(string.format("%s %s", 1, 2, 3))
CODE
1 2
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function string.format (too few arg)' );
print(string.format("%s %s", 1))
CODE
/string expected, got no value/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function string.format (bad arg)' );
print(string.format("%d", 'toto'))
CODE
/number expected, got string/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function string.format (invalid option)' );
print(string.format("%k", 'toto'))
CODE
/invalid option '%k' to 'format'/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function string.format (invalid format)' );
print(string.format("%------s", 'toto'))
CODE
/invalid format \(repeated flags\)/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function string.format (invalid format)' );
print(string.format("pi = %.123f", math.pi))
CODE
/invalid format \(width or precision too long\)/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'function string.format (invalid format)' );
print(string.format("% 123s", 'toto'))
CODE
/invalid format \(width or precision too long\)/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function string.gmatch' );
s = "hello"
for c in string.gmatch(s, "..") do
    print(c)
end
for c1, c2 in string.gmatch(s, "(.)(.)") do
    print(c1, c2)
end
CODE
he
ll
h	e
l	l
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function string.gmatch' );
s = "hello world from Lua"
for w in string.gmatch(s, "%a+") do
    print(w)
end
CODE
hello
world
from
Lua
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function string.gmatch' );
s = "from=world, to=Lua"
for k, v in string.gmatch(s, "(%w+)=(%w+)") do
    print(k, v)
end
CODE
from	world
to	Lua
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function string.len' );
print(string.len(""))
print(string.len("test"))
print(string.len("a\000b\000c"))
print(string.len('"'))
CODE
0
4
5
1
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function string.lower' );
print(string.lower("Test"))
print(string.lower("TeSt"))
CODE
test
test
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function string.match' );
s = "hello world"
print(string.match(s, "^hello"))
print(string.match(s, "world", 2))
print(string.match(s, "World"))
print(string.match(s, "^(h.ll.)"))
print(string.match(s, "^(h.)l(l.)"))
date = "Today is 17/7/1990"
d = string.match(date, "%d+/%d+/%d+")
print(d)
d, m, y = string.match(date, "(%d+)/(%d+)/(%d+)")
print(d, m, y)
print(string.match("The number 1298 is even", "%d+"))
pair = "name = Anna"
key, value = string.match(pair, "(%a+)%s*=%s*(%a+)")
print(key, value)
CODE
hello
world
nil
hello
he	lo
17/7/1990
17	7	1990
1298
name	Anna
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function string.rep' );
print(string.rep("ab", 3))
print(string.rep("ab", 0))
print(string.rep("ab", -1))
print(string.rep("", 5))
CODE
ababab



OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function string.reverse' );
print(string.reverse("abcde"))
print(string.reverse("abcd"))
print(string.reverse(""))
CODE
edcba
dcba

OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function string.sub' );
print(string.sub("abcde", 1, 2))
print(string.sub("abcde", 3, 4))
print(string.sub("abcde", -2))
CODE
ab
cd
de
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'function string.upper' );
print(string.upper("Test"))
print(string.upper("TeSt"))
CODE
TEST
TEST
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

