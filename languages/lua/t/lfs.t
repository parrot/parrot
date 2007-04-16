#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

=head1 NAME

t/lfs.t - Lua File System Library

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/lfs.t

=head1 DESCRIPTION

Tests Lua File System Library
(implemented in F<languages/lua/lib/lfs.pir>).

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test;
use Test::More;

if ( exists $ENV{PARROT_LUA_TEST_PROG} ) {
    plan skip_all => "parrot only";
}
else {
    plan tests => 1;
}

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'require lfs' );
require "lfs"
print(type(lfs))
print(lfs._VERSION)
CODE
table
LuaFileSystem 1.2
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

