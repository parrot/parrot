#! perl -w
# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

t/debug.t - Lua Debug Library

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/debug.t

=head1 DESCRIPTION

Tests Lua Debug Library
(implemented in F<languages/lua/lib/luadebug.pir>).

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 2;
use Test::More;

language_output_is( 'lua', <<'CODE', <<'OUT', 'getmetatable' );
t = {}
print(debug.getmetatable(t))
t1 = {}
setmetatable(t, t1)
assert(debug.getmetatable(t) == t1)
CODE
nil
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'setmetatable' );
t = {}
t1 = {}
debug.setmetatable(t, t1)
assert(getmetatable(t) == t1)
print "ok"
CODE
ok
OUT

