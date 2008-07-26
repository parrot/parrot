#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/gl.t - OpenGL library

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/gl.t

=head1 DESCRIPTION

Tests OpenGL
(implemented in F<languages/lua/src/lib/gl.pir>
and F<languages/lua/src/lib/glut.pir>).

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
    plan tests => 1;
}

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'require' );
require "glut"
require "gl"
print "OpenGL"
CODE
OpenGL
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
