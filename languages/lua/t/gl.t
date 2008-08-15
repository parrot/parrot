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
use Parrot::Config;
use Parrot::Test::Lua;

my $test_prog = Parrot::Test::Lua::get_test_prog();
if ( $test_prog eq 'lua' ) {
    plan skip_all => "parrot only";
}
elsif ( !$PConfig{has_opengl} ) {
    plan skip_all => "OpenGL needed";
}
else {
    plan tests => 4;
}

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'require' );
require "glut"
require "gl"
print "OpenGL"
CODE
OpenGL
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'bad type' );
require 'gl'
gl.Begin(nil)
CODE
/^[^:]+: [^:]+:\d+: incorrect argument to function 'gl.Begin'\nstack traceback:\n/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'bad value' );
require 'gl'
gl.Begin('BAD_VALUE')
CODE
/^[^:]+: [^:]+:\d+: incorrect string argument to function 'gl.Begin'\nstack traceback:\n/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'Begin/End' );
require 'gl'
gl.Begin('TRIANGLES')
gl.End()
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
