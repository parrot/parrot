#! perl -w
# Copyright (C) 2006, The Perl Foundation.
# $Id: threads.t 14891 2006-10-11 10:24:50Z fperrad $

=head1 NAME

t/threads.t - Lua thread & coercion

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/threads.t

=head1 DESCRIPTION

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 24;
use Test::More;

language_output_like( 'lua', <<'CODE', <<'OUT', '- co' );
co = coroutine.create(function () return 1 end)
print(- co)
CODE
/attempt to perform arithmetic on/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', '# co' );
co = coroutine.create(function () return 1 end)
print(# co)
CODE
/attempt to get length of/
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'not co' );
co = coroutine.create(function () return 1 end)
print(not co)
CODE
false
OUT

TODO: {
local $TODO = 'pb with MMD function';

language_output_like( 'lua', <<'CODE', <<'OUT', 'co + 10' );
co = coroutine.create(function () return 1 end)
print(co + 10)
CODE
/attempt to perform arithmetic on/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'co - 2' );
co = coroutine.create(function () return 1 end)
print(co - 2)
CODE
/attempt to perform arithmetic on/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'co * 3.14' );
co = coroutine.create(function () return 1 end)
print(co * 3.14)
CODE
/attempt to perform arithmetic on/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'co / -7' );
co = coroutine.create(function () return 1 end)
print(co / -7)
CODE
/attempt to perform arithmetic on/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'co % 4' );
co = coroutine.create(function () return 1 end)
print(co % 4)
CODE
/attempt to perform arithmetic on/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'co ^ 3' );
co = coroutine.create(function () return 1 end)
print(co ^ 3)
CODE
/attempt to perform arithmetic on/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'co .. "end"' );
co = coroutine.create(function () return 1 end)
print(co .. "end")
CODE
/attempt to concatenate/
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'co == co' );
co = coroutine.create(function () return 1 end)
print(co == co)
CODE
true
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'co1 ~= co2' );
co1 = coroutine.create(function () return 1 end)
co2 = coroutine.create(function () return 2 end)
print(co1 ~= co2)
CODE
true
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'co == 1' );
co = coroutine.create(function () return 1 end)
print(co == 1)
CODE
false
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'co ~= 1' );
co = coroutine.create(function () return 1 end)
print(co ~= 1)
CODE
true
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'co1 < co2' );
co1 = coroutine.create(function () return 1 end)
co2 = coroutine.create(function () return 2 end)
print(co1 < co2)
CODE
/attempt to compare two thread values/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'co1 <= co2' );
co1 = coroutine.create(function () return 1 end)
co2 = coroutine.create(function () return 2 end)
print(co1 <= co2)
CODE
/attempt to compare two thread values/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'co1 > co2' );
co1 = coroutine.create(function () return 1 end)
co2 = coroutine.create(function () return 2 end)
print(co1 > co2)
CODE
/attempt to compare two thread values/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'co1 >= co2' );
co1 = coroutine.create(function () return 1 end)
co2 = coroutine.create(function () return 2 end)
print(co1 >= co2)
CODE
/attempt to compare two thread values/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'co < 0' );
co = coroutine.create(function () return 1 end)
print(co < 0)
CODE
/attempt to compare \w+ with \w+/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'co <= 0' );
co = coroutine.create(function () return 1 end)
print(co <= 0)
CODE
/attempt to compare \w+ with \w+/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'co > 0' );
co = coroutine.create(function () return 1 end)
print(co > 0)
CODE
/attempt to compare \w+ with \w+/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'co >= 0' );
co = coroutine.create(function () return 1 end)
print(co >= 0)
CODE
/attempt to compare \w+ with \w+/
OUT
}

language_output_like( 'lua', <<'CODE', <<'OUT', 'get_pmc_keyed' );
a = coroutine.create(function () return 1 end)
print(a[1])
CODE
/attempt to index/
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'set_pmc_keyed' );
a = coroutine.create(function () return 1 end)
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

