#!perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;

language_output_is( 'cardinal', <<'CODE', <<'OUT', 'simple for loop test inclusive range' );
for x in (1..10)
  puts x
end
CODE
OUT

language_output_is( 'cardinal', <<'CODE', <<'OUT', 'simple for loop test exclusive range' );
for x in (1...10)
  puts x
end
CODE
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
