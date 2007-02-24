#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id: package.t $

=head1 NAME

t/package.t - Lua Package Library

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/package.t

=head1 DESCRIPTION

Tests Lua Package Library
(implemented in F<languages/lua/lib/luapackage.pir>).

See "Lua 5.1 Reference Manual", section 5.3 "Modules",
L<http://www.lua.org/manual/5.1/manual.html#5.3>.

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 1;
use Test::More;

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'table package.loaded' );
t = {}
for k in pairs(package.loaded) do
    table.insert(t, k)
end
table.sort(t)
for k, v in ipairs(t) do
    print(v)
end
CODE
_G
coroutine
debug
io
math
os
package
string
table
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

