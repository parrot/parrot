#! perl -w
# Copyright: 2005-2006 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/string.t - Lua String Library

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/string.t

=head1 DESCRIPTION

Tests Lua String Library
(implemented in F<languages/lua/lib/luastring.pir>).

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 7;
use Test::More;

language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function string.char");
print(string.char(65, 66, 67))
print(string.char())
CODE
ABC

OUTPUT


language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function string.byte");
print(string.byte("ABC"))
print(string.byte("ABC", 2))
print(string.byte("ABC", -1))
print(string.byte("ABC", 4))
print(string.byte("ABC", 0))
CODE
65
66
67
nil
nil
OUTPUT


language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function string.len");
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


language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function string.lower");
print(string.lower("Test"))
print(string.lower("TeSt"))
CODE
test
test
OUTPUT


language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function string.rep");
print(string.rep("ab", 3))
print(string.rep("ab", 0))
print(string.rep("ab", -1))
print(string.rep("", 5))
CODE
ababab



OUTPUT


language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function string.sub");
print(string.sub("abcde", 1, 2))
print(string.sub("abcde", -2))
CODE
ab
de
OUTPUT


language_output_is( 'lua', << 'CODE', << 'OUTPUT', "function string.upper");
print(string.upper("Test"))
print(string.upper("TeSt"))
CODE
TEST
TEST
OUTPUT

