#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/md5.t - md5 library

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/md5.t

=head1 DESCRIPTION

Tests md5
(implemented in F<languages/lua/src/lib/md5.pir>).

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
    plan tests => 10;
}

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'md5.version' );
require 'md5'
print(md5.version)
CODE
md5 library for Lua on Parrot
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'md5.new()' );
require 'md5'
d = md5.new()
print(type(d))
CODE
userdata
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'md5.__tostring' );
require 'md5'
d = md5.new()
print(d)
CODE
/^md5 context [0-9A-Fa-f]{8,16}$/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'md5:tostring()' );
require 'md5'
d = md5.new()
s = d:tostring()
assert(type(s) == 'string', "got string")
print(s)
CODE
/^md5 context [0-9A-Fa-f]{8,16}$/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'md5.digest(s [, raw])' );
require 'md5'
s = 'message digest'
known = 'f96b697d7cb7938d525a2f31aaf161d0'
assert(md5.digest(s) == known)
assert(md5.digest(s, false) == known)
md = md5.digest(s, true)
assert(type(md) == 'string', "raw digest is a string")
assert(md:len() == 16, "length of raw digest")
CODE
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'md5:digest()' );
require 'md5'
known = 'f96b697d7cb7938d525a2f31aaf161d0'
d = md5.new()
d:update('message')
d:update(' ')
d:update('digest')
assert(d:digest() == known)
CODE
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'md5:digest(false)' );
require 'md5'
known = 'f96b697d7cb7938d525a2f31aaf161d0'
d = md5.new()
d:update('message')
d:update(' ')
d:update('digest')
assert(d:digest(false) == known)
CODE
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'md5:digest(true)' );
require 'md5'
d = md5.new()
d:update('message')
d:update(' ')
d:update('digest')
md = d:digest(true)
assert(type(md) == 'string', "raw digest is not a string")
assert(md:len() == 16, "length of raw digest is not 16")
fmt = string.rep('%2x', 16)
print(string.format(fmt, string.byte(md, 1, 16)))
CODE
f96b697d7cb7938d525a2f31aaf161d0
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'md5:reset()' );
require 'md5'
s = 'message digest'
known = 'f96b697d7cb7938d525a2f31aaf161d0'
d = md5.new()
d:update(s)
assert(d:digest() == known)
assert(d:digest() ~= known)
d:reset()
d:update(s)
assert(d:digest() == known)
CODE
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'md5:clone()' );
require 'md5'
s = 'message digest'
known = 'f96b697d7cb7938d525a2f31aaf161d0'
d = md5.new()
d:update(s)
d2 = d:clone()
assert(d:digest() == known)
assert(d:digest() ~= known)
assert(d2:digest() == known)
CODE
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
