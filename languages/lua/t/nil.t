#! perl -w
# Copyright (C) 2005-2006, The Perl Foundation.
# $Id: nil.t 11446 2006-02-06 14:07:49Z fperrad $

=head1 NAME

t/nil.t - Lua nil & coercion

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/nil.t

=head1 DESCRIPTION

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 24;
use Test::More;

language_output_like( 'lua', <<'CODE', <<'OUT', '-nil' );
print(-nil)
CODE
/attempt to perform arithmetic on a nil value/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '# nil' );
print(# nil)
CODE
/attempt to get length of a nil value/
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'not nil' );
print(not nil)
CODE
true
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'nil + 10' );
print(nil + 10)
CODE
/attempt to perform arithmetic on a nil value/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'nil - 2' );
print(nil - 2)
CODE
/attempt to perform arithmetic on a nil value/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'nil * 3.14' );
print(nil * 3.14)
CODE
/attempt to perform arithmetic on a nil value/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'nil / -7' );
print(nil / -7)
CODE
/attempt to perform arithmetic on a nil value/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'nil % 4' );
print(nil % 4)
CODE
/attempt to perform arithmetic on a nil value/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'nil ^ 3' );
print(nil ^ 3)
CODE
/attempt to perform arithmetic on a nil value/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'nil .. "end"' );
print(nil .. "end")
CODE
/attempt to concatenate a nil value/
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'nil == nil' );
print(nil == nil)
CODE
true
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'nil ~= nil' );
print(nil ~= nil)
CODE
false
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'nil == 1' );
print(nil == 1)
CODE
false
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'nil ~= 1' );
print(nil ~= 1)
CODE
true
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'nil < nil' );
print(nil < nil)
CODE
/attempt to compare two nil values/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'nil <= nil' );
print(nil <= nil)
CODE
/attempt to compare two nil values/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'nil > nil' );
print(nil > nil)
CODE
/attempt to compare two nil values/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'nil >= nil' );
print(nil >= nil)
CODE
/attempt to compare two nil values/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'nil < 0' );
print(nil < 0)
CODE
/attempt to compare \w+ with \w+/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'nil <= 0' );
print(nil <= 0)
CODE
/attempt to compare \w+ with \w+/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'nil > 0' );
print(nil > 0)
CODE
/attempt to compare \w+ with \w+/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'nil >= 0' );
print(nil >= 0)
CODE
/attempt to compare \w+ with \w+/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'get_pmc_keyed' );
a = nil
print(a[1])
CODE
/attempt to index/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'set_pmc_keyed' );
a = nil
a[1] = 1
CODE
/attempt to index/
OUT

