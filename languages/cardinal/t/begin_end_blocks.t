#!perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;

language_output_is( 'cardinal', <<'CODE', <<'OUT', 'begin block test' );
puts "This comes after"
BEGIN { 
  puts "Here I am"
  puts "Here I am"
  puts "Here I am"
}
CODE
OUT

language_output_is( 'cardinal', <<'CODE', <<'OUT', 'end block test' );
END { 
  puts "Here I am"
  puts "Here I am"
  puts "Here I am"
}
puts "This comes before"
CODE
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
