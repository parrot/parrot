#!/usr/bin/perl

use strict;
use warnings;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);

use Parrot::Test tests => 6;
use Test::More;

language_output_is( "tcl", <<'TCL', <<OUT, "no args" );
 parray
TCL
wrong # args: should be "parray a ?pattern?"
OUT

language_output_is( "tcl", <<'TCL', <<OUT, "too many args" );
 parray a b c d
TCL
wrong # args: should be "parray a ?pattern?"
OUT

language_output_is( "tcl", <<'TCL', <<OUT, "bad array" );
  parray bad_array
TCL
"bad_array" isn't an array
OUT

language_output_is( "tcl", <<'TCL', <<OUT, "bad array, with pattern" );
  parray bad_array bork?
TCL
"bad_array" isn't an array
OUT

language_output_is( "tcl", <<'TCL', <<OUT, "with pattern" );
  array set a [list z always ab first coco last]
  parray a a*
TCL
a(ab) = first
OUT

language_output_is( "tcl", <<'TCL', <<OUT, "normal usage" );
  array set a [list z always ab first coco last]
  parray a
TCL
a(ab)   = first
a(coco) = last
a(z)    = always
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
