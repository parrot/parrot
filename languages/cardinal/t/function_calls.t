#!perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;

language_output_is( 'cardinal', <<'CODE', <<'OUT', 'simple function call' );
def func1
  puts 'func1'
end

func1
CODE
OUT

language_output_is( 'cardinal', <<'CODE', <<'OUT', 'function call with one positional parameter' );
def func1( a )
  puts a
end

func1 'func with one arg'
CODE
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
