#! perl
# Copyright (C) 2005-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/examples.t - some Lua code examples

=head1 SYNOPSIS

    % perl t/examples.t

=head1 DESCRIPTION

First tests in order to check infrastructure.

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../lib", "$FindBin::Bin";

use Parrot::Test tests => 8;
use Test::More;

language_output_is( 'lua', <<'CODE', <<'OUT', 'hello world' );
print("Hello World")
CODE
Hello World
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'hello world' );
print "Hello World"
CODE
Hello World
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'version' );
print(_VERSION)
CODE
/^Lua 5\.1/
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'factorial (recursive)' );
function factorial (n)
    if n == 0 then
        return 1
    else
        return n * factorial(n-1)
    end
end

print(factorial(7))
CODE
5040
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'factorial (recursive)' );
local function factorial (n)
    if n == 0 then
        return 1
    else
        return n * factorial(n-1)
    end
end

print(factorial(7))
CODE
5040
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'factorial (loop)' );
function factorial (n)
    local a = 1
    for i = 1,n,1 do
        a = a*i
    end
    return a
end

print(factorial(7))
CODE
5040
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'with args', params => "abc def"  );
print(#arg)
print(...)
CODE
2
abc	def
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'man or boy' );
--[[

  Knuth's "man or boy" test.
  See http://en.wikipedia.org/wiki/Man_or_boy_test

]]

local function A (k, x1, x2, x3, x4, x5)
    local function B ()
        k = k - 1
        return A(k, B, x1, x2, x3, x4)
    end
    if k <= 0 then
        return x4() + x5()
    else
        return B()
    end
end

print(A(10, --> -67
        function () return 1 end,
        function () return -1 end,
        function () return -1 end,
        function () return 1 end,
        function () return 0 end)
)
CODE
-67
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

