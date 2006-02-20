#! perl -w
# Copyright: 2006 The Perl Foundation.  All Rights Reserved.
# $Id: metatable.t 11501 2006-02-10 18:27:13Z particle $

=head1 NAME

t/metatable.t - Lua tables

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/metatable.t

=head1 DESCRIPTION

See "Programming in Lua", section 13 "Metatables and Metamethods".

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 2;
use Test::More;

language_output_is( 'lua', <<'CODE', <<'OUT', 'metatable' );
t = {}
print(getmetatable(t))
t1 = {}
setmetatable(t, t1)
assert(getmetatable(t) == t1)
CODE
nil
OUT


language_output_like( 'lua', <<'CODE', <<'OUT', 'protected metatable' );
t = {}
mt = {}
mt.__metatable = "not your business"
setmetatable(t, mt)
assert(getmetatable(t) == "not your business")
setmetatable(t, {})
CODE
/cannot change a protected metatable/
OUT


