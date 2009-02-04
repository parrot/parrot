#! perl
# Copyright (C) 2005-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/number.t - Lua number & coercion

=head1 SYNOPSIS

    % perl t/number.t

=head1 DESCRIPTION

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../lib", "$FindBin::Bin";

use Parrot::Test tests => 53;
use Test::More;

language_output_is( 'lua', <<'CODE', <<'OUT', '-1' );
print(-1)
CODE
-1
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '# 1' );
print(# 1)
CODE
/^[^:]+: [^:]+:-?\d+: attempt to get length of a number value\nstack traceback:\n/
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'not 1' );
print(not 1)
CODE
false
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '10 + 2' );
print(10 + 2)
CODE
12
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '2 - 10' );
print(2 - 10)
CODE
-8
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '3.14 * 1' );
print(3.14 * 1)
CODE
3.14
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '-7 / 0.5' );
print(-7 / 0.5)
CODE
-14
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '1 / 0' );
print(1 / 0)
CODE
Inf
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '-25 % 3' );
print(-25 % 3)
CODE
2
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '1 % 0' );
print(1 % 0)
CODE
NaN
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '3 ^ 3' );
print(3 ^ 3)
CODE
27
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '10 + true' );
print(10 + true)
CODE
/^[^:]+: [^:]+:\d+: attempt to perform arithmetic on a boolean value\nstack traceback:\n/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '2 - nil' );
print(2 - nil)
CODE
/^[^:]+: [^:]+:\d+: attempt to perform arithmetic on a nil value\nstack traceback:\n/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '3.14 * false' );
print(3.14 * false)
CODE
/^[^:]+: [^:]+:\d+: attempt to perform arithmetic on a boolean value\nstack traceback:\n/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '-7 / {}' );
print(-7 / {})
CODE
/^[^:]+: [^:]+:\d+: attempt to perform arithmetic on a table value\nstack traceback:\n/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '3 ^ true' );
print(3 ^ true)
CODE
/^[^:]+: [^:]+:\d+: attempt to perform arithmetic on a boolean value\nstack traceback:\n/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '-25 % false' );
print(-25 % false)
CODE
/^[^:]+: [^:]+:\d+: attempt to perform arithmetic on a boolean value\nstack traceback:\n/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '10 + "text"' );
print(10 + "text")
CODE
/^[^:]+: [^:]+:\d+: attempt to perform arithmetic on a string value\nstack traceback:\n/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '2 - "text"' );
print(2 - "text")
CODE
/^[^:]+: [^:]+:\d+: attempt to perform arithmetic on a string value\nstack traceback:\n/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '3.14 * "text"' );
print(3.14 * "text")
CODE
/^[^:]+: [^:]+:\d+: attempt to perform arithmetic on a string value\nstack traceback:\n/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '-7 / "text"' );
print(-7 / "text")
CODE
/^[^:]+: [^:]+:\d+: attempt to perform arithmetic on a string value\nstack traceback:\n/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '25 % "text"' );
print(25 % "text")
CODE
/^[^:]+: [^:]+:\d+: attempt to perform arithmetic on a string value\nstack traceback:\n/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '3 ^ "text"' );
print(3 ^ "text")
CODE
/^[^:]+: [^:]+:\d+: attempt to perform arithmetic on a string value\nstack traceback:\n/
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '10 + "2"' );
print(10 + "2")
CODE
12
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '2 - "10"' );
print(2 - "10")
CODE
-8
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '3.14 * "1"' );
print(3.14 * "1")
CODE
3.14
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '-7 / "0.5"' );
print(-7 / "0.5")
CODE
-14
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '-25 % "3"' );
print(-25 % "3")
CODE
2
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '3 ^ "3"' );
print(3 ^ "3")
CODE
27
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '1 .. "end"' );
print(1 .. "end")
CODE
1end
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '1 .. 2' );
print(1 .. 2)
CODE
12
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '1 .. true' );
print(1 .. true)
CODE
/^[^:]+: [^:]+:\d+: attempt to concatenate a \w+ value\nstack traceback:\n/
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '1.0 == 1' );
print(1.0 == 1)
CODE
true
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '1 ~= 2' );
print(1 ~= 2)
CODE
true
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '1 == true' );
print(1 == true)
CODE
false
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '1 ~= nil' );
print(1 ~= nil)
CODE
true
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '1 == "1"' );
print(1 == "1")
CODE
false
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '1 ~= "1"' );
print(1 ~= "1")
CODE
true
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '1 < 0' );
print(1 < 0)
CODE
false
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '1 <= 0' );
print(1 <= 0)
CODE
false
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '1 > 0' );
print(1 > 0)
CODE
true
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '1 >= 0' );
print(1 >= 0)
CODE
true
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '1 < false' );
print(1 < false)
CODE
/^[^:]+: [^:]+:\d+: attempt to compare \w+ with \w+\nstack traceback:\n/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '1 <= nil' );
print(1 <= nil)
CODE
/^[^:]+: [^:]+:\d+: attempt to compare \w+ with \w+\nstack traceback:\n/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '1 > true' );
print(1 > true)
CODE
/^[^:]+: [^:]+:\d+: attempt to compare \w+ with \w+\nstack traceback:\n/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '1 >= {}' );
print(1 >= {})
CODE
/^[^:]+: [^:]+:\d+: attempt to compare \w+ with \w+\nstack traceback:\n/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '1 < "0"' );
print(1 < "0")
CODE
/^[^:]+: [^:]+:\d+: attempt to compare \w+ with \w+\nstack traceback:\n/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '1 <= "0"' );
print(1 <= "0")
CODE
/^[^:]+: [^:]+:\d+: attempt to compare \w+ with \w+\nstack traceback:\n/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '1 > "0"' );
print(1 > "0")
CODE
/^[^:]+: [^:]+:\d+: attempt to compare \w+ with \w+\nstack traceback:\n/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '1 >= "0"' );
print(1 >= "0")
CODE
/^[^:]+: [^:]+:\d+: attempt to compare \w+ with \w+\nstack traceback:\n/
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', '1e9' );
print(1000000000)
print(1e9)
print(1.0e+9)
CODE
1000000000
1000000000
1000000000
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'get_pmc_keyed' );
a = 3.14
print(a[1])
CODE
/^[^:]+: [^:]+:\d+: attempt to index/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'set_pmc_keyed' );
a = 3.14
a[1] = 1
CODE
/^[^:]+: [^:]+:\d+: attempt to index/
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:


