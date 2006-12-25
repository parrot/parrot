#!perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;

language_output_is( 'cardinal', <<'CODE', <<'OUT', 'begin block test' );
a = 'outside variable'
begin
  puts "Inside begin block"
  puts a
end
CODE
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
