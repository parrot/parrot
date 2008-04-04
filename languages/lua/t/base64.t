#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/base64.t - base64 library

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/base64.t

=head1 DESCRIPTION

Tests base64
(implemented in F<languages/lua/src/lib/base64.pir>).

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test;
use Test::More;
use Parrot::Test::Lua;

my $test_prog = Parrot::Test::Lua::get_test_prog();
if ( $test_prog eq 'lua' ) {
    plan skip_all => "parrot only";
}
else {
    plan tests => 2;
}

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'base64.version' );
require "base64"
print(base64.version)
CODE
base64 library for Lua on Parrot
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'base64' );
require "base64"

s = "Lua-scripting-language"
a = base64.encode(s)
b = base64.decode(a)
print(a, b, string.len(b))
CODE
THVhLXNjcmlwdGluZy1sYW5ndWFnZQ==	Lua-scripting-language	22
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
