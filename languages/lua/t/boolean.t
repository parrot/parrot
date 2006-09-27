#! perl -w
# Copyright (C) 2005-2006, The Perl Foundation.
# $Id$

=head1 NAME

t/boolean.t - Lua boolean & coercion

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/boolean.t

=head1 DESCRIPTION

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 24;
use Test::More;

language_output_like( 'lua', <<'CODE', <<'OUT', '-true' );
print(-true)
CODE
/attempt to perform arithmetic on a \w+ value/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '# true' );
print(# true)
CODE
/attempt to get length of a boolean value/
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'not false' );
print(not false)
CODE
true
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'true + 10' );
print(true + 10)
CODE
/attempt to perform arithmetic on a boolean value/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'true - 2' );
print(true - 2)
CODE
/attempt to perform arithmetic on a boolean value/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'true * 3.14' );
print(true * 3.14)
CODE
/attempt to perform arithmetic on a boolean value/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'true / -7' );
print(true / -7)
CODE
/attempt to perform arithmetic on a boolean value/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'true % 4' );
print(true % 4)
CODE
/attempt to perform arithmetic on a boolean value/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'true ^ 3' );
print(true ^ 3)
CODE
/attempt to perform arithmetic on a boolean value/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'true .. "end"' );
print(true .. "end")
CODE
/attempt to concatenate a boolean value/
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'true == true' );
print(true == true)
CODE
true
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'true ~= false' );
print(true ~= false)
CODE
true
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'true == 1' );
print(true == 1)
CODE
false
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'true ~= 1' );
print(true ~= 1)
CODE
true
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'true < false' );
print(true < false)
CODE
/attempt to compare two boolean values/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'true <= false' );
print(true <= false)
CODE
/attempt to compare two boolean values/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'true > false' );
print(true > false)
CODE
/attempt to compare two boolean values/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'true >= false' );
print(true >= false)
CODE
/attempt to compare two boolean values/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'true < 0' );
print(true < 0)
CODE
/attempt to compare \w+ with \w+/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'true <= 0' );
print(true <= 0)
CODE
/attempt to compare \w+ with \w+/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'true > 0' );
print(true > 0)
CODE
/attempt to compare \w+ with \w+/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'true >= 0' );
print(true >= 0)
CODE
/attempt to compare \w+ with \w+/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'get_pmc_keyed' );
a = true
print(a[1])
CODE
/attempt to index/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'set_pmc_keyed' );
a = true
a[1] = 1
CODE
/attempt to index/
OUT

