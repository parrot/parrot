#! perl -w
# Copyright (C) 2005-2006, The Perl Foundation.
# $Id$

=head1 NAME

t/assign.t - Lua assignment

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/assign.t

=head1 DESCRIPTION

See "Lua 5.0 Reference Manual", section 2.4.3 "Assignment".

See "Programming in Lua", section 4.1 "Assignment".

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 7;
use Test::More;

language_output_is( 'lua', <<'CODE', <<'OUT', 'global variable' );
print(b)
b = 10
print(b)
b = nil
print(b)
CODE
nil
10
nil
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'check eval' );
a = {}
i = 3
i, a[i] = i+1, 20
print(i)
print(a[3])
CODE
4
20
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'check swap' );
x = 1.
y = 2.
print(x, y)
x, y = y, x -- swap
print(x, y)
CODE
1	2
2	1
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'check padding' );
a, b, c = 0, 1
print(a, b, c)
a, b = a+1, b+1, a+b
print(a, b)
a, b, c = 0
print(a, b, c)
CODE
0	1	nil
1	2
0	nil	nil
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'adjust with function' );
function f() return 1, 2 end
a, b, c, d = f()
print(a, b, c, d)
CODE
1	2	nil	nil
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'local variable' );
j = 10
local i = 1
print(i)
print(j)
local i = 2
print(i)
CODE
1
10
2
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'param & result of function' );
local function f(x) return 2*x end

print(f(2))
a = 2
a = f(a)
print(a)
local b = 2
b = f(b)
print(b)
CODE
4
4
4
OUT

