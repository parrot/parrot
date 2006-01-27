#! perl -w
# Copyright: 2006 The Perl Foundation.  All Rights Reserved.
# $Id: assign.t 10933 2006-01-06 01:43:24Z particle $

=head1 NAME

t/function.t - Lua functions

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/function.t

=head1 DESCRIPTION

See "Lua 5.0 Reference Manual", section 2.5.8 "Function Definitions".

See "Programming in Lua", section 5 "Functions".

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 3;

language_output_is( 'lua', <<'CODE', <<'OUT', 'fct1' );
function f(a, b) return a or b end

print(f(3))
print(f(3, 4))
print(f(3, 4, 5))
CODE
3
3
3
OUT


language_output_is( 'lua', <<'CODE', <<'OUT', 'var args' );
local function g(a, b, ...)
    print(a, b, arg.n, arg[1], arg[2]) 
end

g(3)
g(3, 4)
g(3, 4, 5, 8)
CODE
3	nil	0	nil	nil
3	4	0	nil	nil
3	4	2	5	8
OUT


language_output_is( 'lua', <<'CODE', <<'OUT', 'var args' );
function f() return 1, 2 end
function g() return "a", f() end
function h() return f(), "b" end
function k() return "c", (f()) end

print(f())
print(g())
print(h())
print(k())
CODE
1	2
a	1	2
1	b
c	1
OUT

