#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/sha1.t - sha1 library

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/sha1.t

=head1 DESCRIPTION

Tests sha1
(implemented as md5 in F<languages/lua/src/lib/md5.pir>).

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test;
use Parrot::Config;
use Test::More;
use Parrot::Test::Lua;

my $test_prog = Parrot::Test::Lua::get_test_prog();
if ( $test_prog eq 'lua' ) {
    plan skip_all => "parrot only";
}
elsif ( !$PConfig{has_crypto} ) {
    plan skip_all => "No crypto library available";
}
else {
    plan tests => 3;
}

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'sha1.version' );
require 'sha1'
print(sha1.version)
CODE
sha1 library for Lua on Parrot
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'sha1.new()' );
require 'sha1'
d = sha1.new()
print(type(d))
CODE
userdata
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'sha1.__tostring' );
require 'sha1'
d = sha1.new()
print(d)
CODE
/^sha1 context [0-9A-Fa-f]{8,16}$/
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
