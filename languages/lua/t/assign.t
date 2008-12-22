#! perl
# Copyright (C) 2005-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/assign.t - Lua assignment

=head1 SYNOPSIS

    % perl t/assign.t

=head1 DESCRIPTION

See "Lua 5.1 Reference Manual", section 2.4.3 "Assignment",
L<http://www.lua.org/manual/5.1/manual.html#2.4.3>.

See "Programming in Lua", section 4.1 "Assignment".

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../lib", "$FindBin::Bin";

use Parrot::Test tests => 10;
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

language_output_is( 'lua', <<'CODE', <<'OUT', 'padding with function' );
function f() print("f") end
a = 2
a, b, c = f(), 3
print(a, b, c)
CODE
f
nil	3	nil
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

language_output_is( 'lua', <<'CODE', <<'OUT', 'local variable' );
local i = 1
local j = i
print(i, j)
j = 2
print(i, j)
CODE
1	1
1	2
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

language_output_is( 'lua', <<'CODE', <<'OUT', 'assignment list swap values.' );
local n1 = 1
local n2 = 2
local n3 = 3
local n4 = 4

print(n1)
print(n2)
print(n3)
print(n4)

n1,n2,n3,n4 = n4,n3,n2,n1

print(n1)
print(n2)
print(n3)
print(n4)
CODE
1
2
3
4
4
3
2
1
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

