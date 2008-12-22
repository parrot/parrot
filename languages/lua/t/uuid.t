#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/uuid.t - uuid library

=head1 SYNOPSIS

    % perl t/uuid.t

=head1 DESCRIPTION

Tests uuid
(implemented in F<languages/lua/src/lib/uuid.pir>).

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../lib", "$FindBin::Bin";

use Parrot::Test;
use Test::More;
use Parrot::Test::Lua;

my $test_prog = Parrot::Test::Lua::get_test_prog();
if ( $test_prog eq 'lua' ) {
    plan skip_all => "parrot only";
}
else {
    plan tests => 8;
}

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'uuid.version' );
require "uuid"
print(uuid.version)
CODE
uuid library for Lua on Parrot
OUTPUT


language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'uuid.new ()' );
require "uuid"
print(uuid.new())
CODE
/^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/
OUTPUT


language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'uuid.new ("default")' );
require "uuid"
print(uuid.new("default"))
CODE
/^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/
OUTPUT


language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'uuid.new ("random")' );
require "uuid"
print(uuid.new("random"))
CODE
/^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/
OUTPUT


language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'uuid.new ("time")' );
require "uuid"
print(uuid.new("time"))
CODE
/^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/
OUTPUT


language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'uuid.isvalid ()' );
require "uuid"
assert(uuid.isvalid('') == false)
assert(uuid.isvalid('84949cc5-4701-4a84-895b-354c584a981b') == true)
CODE
OUTPUT


language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'uuid.time ()' );
require "uuid"
u = '84949cc5-4701-4a84-895b-354c584a981b'
t = uuid.time(u)
print(t)
CODE
-1
OUTPUT


language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'uuid.time (invalid)' );
require "uuid"
u = '12345678-12345-123-1234-123456789012'
t = uuid.time(u)
print(t)
CODE
nil
OUTPUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
