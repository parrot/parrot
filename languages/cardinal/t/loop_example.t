#!perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;

language_output_is( 'cardinal', <<'CODE', <<'OUT', 'simple addition test' );
i = 1000
while i > 0
  puts i
  a = i + i + i
  i = i - 1
end
CODE
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
