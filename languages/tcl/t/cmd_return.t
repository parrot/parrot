#!perl

use strict;
use warnings;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);

use Parrot::Test tests => 3;
use Test::More;

language_output_is( "tcl", <<'TCL', <<OUT, "simple return with value" );
 proc joe {} {
   set a 10
   return $a
   set a 20
 }
 puts [joe]
TCL
10
OUT

language_output_is( "tcl", <<'TCL', <<OUT, "simple return with no value" );
 proc joe {} {
   return
 }
 puts [joe]
TCL

OUT

language_output_is('tcl', <<'TCL', <<'OUT', '-code error');
  proc joe {} { return -code error "bad args" }
  joe
  puts foo
TCL
bad args
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
