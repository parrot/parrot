#! perl -w
# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

t/userdata.t - Lua userdata & coercion

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/userdata.t

=head1 DESCRIPTION

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 24;
use Test::More;

language_output_like( 'lua', <<'CODE', <<'OUT', '- u' );
local u = io.stdin
print(- u)
CODE
/attempt to perform arithmetic on/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '# u' );
local u = io.stdin
print(# u)
CODE
/attempt to get length of/
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'not u' );
local u = io.stdin
print(not u)
CODE
false
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'u + 10' );
local u = io.stdin
print(u + 10)
CODE
/attempt to perform arithmetic on/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'u - 2' );
local u = io.stdin
print(u - 2)
CODE
/attempt to perform arithmetic on/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'u * 3.14' );
local u = io.stdin
print(u * 3.14)
CODE
/attempt to perform arithmetic on/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'u / -7' );
local u = io.stdin
print(u / -7)
CODE
/attempt to perform arithmetic on/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'u % 4' );
local u = io.stdin
print(u % 4)
CODE
/attempt to perform arithmetic on/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'u ^ 3' );
local u = io.stdin
print(u ^ 3)
CODE
/attempt to perform arithmetic on/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'u .. "end"' );
local u = io.stdin
print(u .. "end")
CODE
/attempt to concatenate/
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'u == u' );
local u = io.stdin
print(u == u)
CODE
true
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'u ~= v' );
local u = io.stdin
local v = io.stdout
print(u ~= v)
CODE
true
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'u == 1' );
local u = io.stdin
print(u == 1)
CODE
false
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'u ~= 1' );
local u = io.stdin
print(u ~= 1)
CODE
true
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'u < v' );
local u = io.stdin
local v = io.stdout
print(u < v)
CODE
/attempt to compare two userdata values/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'u <= v' );
local u = io.stdin
local v = io.stdout
print(u <= v)
CODE
/attempt to compare two userdata values/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'u > v' );
local u = io.stdin
local v = io.stdout
print(u > v)
CODE
/attempt to compare two userdata values/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'u >= v' );
local u = io.stdin
local v = io.stdout
print(u >= v)
CODE
/attempt to compare two userdata values/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'u < 0' );
local u = io.stdin
print(u < 0)
CODE
/attempt to compare \w+ with \w+/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'u <= 0' );
local u = io.stdin
print(u <= 0)
CODE
/attempt to compare \w+ with \w+/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'u > 0' );
local u = io.stdin
print(u > 0)
CODE
/attempt to compare \w+ with \w+/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'u >= 0' );
local u = io.stdin
print(u >= 0)
CODE
/attempt to compare \w+ with \w+/
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'get_pmc_keyed' );
local u = io.stdin
print(u[1])
CODE
nil
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'set_pmc_keyed' );
local u = io.stdin
u[1] = 1
CODE
/attempt to index/
OUT

