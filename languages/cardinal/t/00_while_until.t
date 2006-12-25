#!perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;

language_output_is( 'cardinal', <<'CODE', <<'OUT', 'simple while test' );
a=10
puts a
a-=1 while a > 5
puts a
CODE
OK
OUT

language_output_is( 'cardinal', <<'CODE', <<'OUT', 'simple until test' );
a=10
puts a
a-=1 until a < 5
puts a
CODE
OK
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
