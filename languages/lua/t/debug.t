#! perl
# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

=head1 NAME

t/debug.t - Lua Debug Library

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/debug.t

=head1 DESCRIPTION

Tests Lua Debug Library
(implemented in F<languages/lua/lib/luadebug.pir>).

See "Lua 5.1 Reference Manual", section 5.9 "The Debug Library",
L<http://www.lua.org/manual/5.1/manual.html#5.9>.

See "Programming in Lua", section 23 "The Debug Library".

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 5;
use Test::More;

language_output_is( 'lua', <<'CODE', <<'OUT', 'debug.getfenv' );
local function f () end

print(debug.getfenv(3.14))
print(type(debug.getfenv(f)))
assert(debug.getfenv(f) == _G)
print(type(debug.getfenv(print)))
assert(debug.getfenv(print) == _G)
CODE
nil
table
table
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'debug.getmetatable' );
t = {}
print(debug.getmetatable(t))
t1 = {}
setmetatable(t, t1)
assert(debug.getmetatable(t) == t1)
CODE
nil
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'debug.setfenv' );
t = {}
function f () end

assert(debug.setfenv(f, t) == f)
print(type(debug.getfenv(f)))
assert(debug.getfenv(f) == t)
assert(debug.setfenv(print, t) == print)
print(type(debug.getfenv(print)))
assert(debug.getfenv(print) == t)
CODE
table
table
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'debug.setfenv (forbidden)' );
t = {}
debug.setfenv(t, t)
CODE
/'setfenv' cannot change environment of given object/
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'debug.setmetatable' );
t = {}
t1 = {}
assert(debug.setmetatable(t, t1) == true)
assert(getmetatable(t) == t1)
print "ok"
CODE
ok
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

