#! perl -w
# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

t/functions.t - Lua function & coercion

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/functions.t

=head1 DESCRIPTION

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 48;
use Test::More;

language_output_like( 'lua', <<'CODE', <<'OUT', '- f' );
f = print
print(- f)
CODE
/attempt to perform arithmetic on/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '# f' );
f = print
print(# f)
CODE
/attempt to get length of/
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'not f' );
f = print
print(not f)
CODE
false
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f + 10' );
f = print
print(f + 10)
CODE
/attempt to perform arithmetic on/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f - 2' );
f = print
print(f - 2)
CODE
/attempt to perform arithmetic on/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f * 3.14' );
f = print
print(f * 3.14)
CODE
/attempt to perform arithmetic on/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f / -7' );
f = print
print(f / -7)
CODE
/attempt to perform arithmetic on/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f % 4' );
f = print
print(f % 4)
CODE
/attempt to perform arithmetic on/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f ^ 3' );
f = print
print(f ^ 3)
CODE
/attempt to perform arithmetic on/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f .. "end"' );
f = print
print(f .. "end")
CODE
/attempt to concatenate/
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'f == f' );
f = print
print(f == print)
CODE
true
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'f ~= g' );
f = print
g = type
print(f ~= g)
h = function () return 2 end
print(f ~= h)
CODE
true
true
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'f == 1' );
f = print
print(f == 1)
CODE
false
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'f ~= 1' );
f = print
print(f ~= 1)
CODE
true
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f < g' );
f = print
g = type
print(f < g)
CODE
/attempt to compare two function values/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f <= g' );
f = print
g = function () return 2 end
print(f <= g)
CODE
/attempt to compare two function values/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f > g' );
f = print
g = type
print(f > g)
CODE
/attempt to compare two function values/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f >= g' );
f = print
g = function () return 2 end
print(f >= g)
CODE
/attempt to compare two function values/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f < 0' );
f = print
print(f < 0)
CODE
/attempt to compare \w+ with \w+/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f <= 0' );
f = print
print(f <= 0)
CODE
/attempt to compare \w+ with \w+/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f > 0' );
f = print
print(f > 0)
CODE
/attempt to compare \w+ with \w+/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f >= 0' );
f = print
print(f >= 0)
CODE
/attempt to compare \w+ with \w+/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'get_pmc_keyed' );
a = print
print(a[1])
CODE
/attempt to index/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'set_pmc_keyed' );
a = print
a[1] = 1
CODE
/attempt to index/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '- f' );
f = function () return 1 end
print(- f)
CODE
/attempt to perform arithmetic on/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '# f' );
f = function () return 1 end
print(# f)
CODE
/attempt to get length of/
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'not f' );
f = function () return 1 end
print(not f)
CODE
false
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f + 10' );
f = function () return 1 end
print(f + 10)
CODE
/attempt to perform arithmetic on/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f - 2' );
f = function () return 1 end
print(f - 2)
CODE
/attempt to perform arithmetic on/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f * 3.14' );
f = function () return 1 end
print(f * 3.14)
CODE
/attempt to perform arithmetic on/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f / -7' );
f = function () return 1 end
print(f / -7)
CODE
/attempt to perform arithmetic on/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f % 4' );
f = function () return 1 end
print(f % 4)
CODE
/attempt to perform arithmetic on/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f ^ 3' );
f = function () return 1 end
print(f ^ 3)
CODE
/attempt to perform arithmetic on/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f .. "end"' );
f = function () return 1 end
print(f .. "end")
CODE
/attempt to concatenate/
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'f == f' );
f = function () return 1 end
g = f
print(f == g)
CODE
true
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'f ~= g' );
f = function () return 1 end
g = function () return 2 end
print(f ~= g)
h = print
print(f ~= h)
CODE
true
true
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'f == 1' );
f = function () return 1 end
print(f == 1)
CODE
false
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'f ~= 1' );
f = function () return 1 end
print(f ~= 1)
CODE
true
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f < g' );
f = function () return 1 end
g = function () return 2 end
print(f < g)
CODE
/attempt to compare two function values/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f <= g' );
f = function () return 1 end
print(f <= print)
CODE
/attempt to compare two function values/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f > g' );
f = function () return 1 end
g = function () return 2 end
print(f > g)
CODE
/attempt to compare two function values/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f >= g' );
f = function () return 1 end
print(f >= print)
CODE
/attempt to compare two function values/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f < 0' );
f = function () return 1 end
print(f < 0)
CODE
/attempt to compare \w+ with \w+/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f <= 0' );
f = function () return 1 end
print(f <= 0)
CODE
/attempt to compare \w+ with \w+/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f > 0' );
f = function () return 1 end
print(f > 0)
CODE
/attempt to compare \w+ with \w+/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'f >= 0' );
f = function () return 1 end
print(f >= 0)
CODE
/attempt to compare \w+ with \w+/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'get_pmc_keyed' );
a = function () return 1 end
print(a[1])
CODE
/attempt to index/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'set_pmc_keyed' );
a = function () return 1 end
a[1] = 1
CODE
/attempt to index/
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

