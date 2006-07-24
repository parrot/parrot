#! perl -w
# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

t/fornum.t - Lua for statement

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/fornum.t

=head1 DESCRIPTION

See "Lua 5.0 Reference Manual", section 2.4.4 "Control Structures".

See "Programming in Lua", section 4.3 "Control Structures".

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 10;
use Test::More;

language_output_is( 'lua', <<'CODE', <<'OUT', 'for 1, 10, 2' );
for i = 1, 10, 2 do
    print(i)
end
CODE
1
3
5
7
9
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'for 3, 5' );
for i = 3, 5 do
    print(i)
end
CODE
3
4
5
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'for 5, 1, -1' );
for i = 5, 1, -1 do
    print(i)
end
CODE
5
4
3
2
1
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'for 5, 5' );
for i = 5, 5 do
    print(i)
end
CODE
5
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'for 5, 5, -1' );
for i = 5, 5, -1 do
    print(i)
end
CODE
5
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'for 5, 3' );
for i = 5, 3 do
    print(i)
end
CODE
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'for 5, 7, -1' );
for i = 5, 7, -1 do
    print(i)
end
CODE
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'for break' );
for i = 1, 10, 2 do
    if i > 4 then break end
    print(i)
end
CODE
1
3
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'for tonumber' );
local function first() print("first",1); return 1 end
local function limit() print("limit",8); return 8 end
local function step()  print("step",2);  return 2 end

for i = first(), limit(), step() do
    print(i)
end
CODE
first	1
limit	8
step	2
1
3
5
7
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'for tonumber' );
local function first() return 1 end
local function limit() return end
local function step()  return 2 end

for i = first(), limit(), step() do
    print(i)
end
CODE
/for' limit must be a number/
OUT

