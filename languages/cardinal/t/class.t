#!perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;

language_output_is( 'cardinal', <<'CODE', <<'OUT', 'simple conditional test' );
class ClassA
  puts "Evaluating class"

  def initialize
    @a = 10
  end

  def a
    puts @a
  end
end

aobj = ClassA.new
aobj.a
CODE
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
