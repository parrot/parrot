#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 3;
use Test::More;
use vars qw($TODO);

language_output_is("tcl",<<'TCL',<<OUT,"wildcards");
  puts [string match {b?n*a} banana]
  puts [string match {b?n*a} bznza]
  puts [string match {b?n*a} bana]

  puts [string match {b?n*a} bnan]

  puts [string match {b\?n*a} b?nana]
  puts [string match {b\?n*a} banana]
  puts [string match {b?n\*a} ban*a]
  puts [string match {b?n\*a} banana]

  puts [string match {?n?*} bnan]
  puts [string match {?n?*} ana]
  puts [string match {?n?*} an]
TCL
1
1
1
0
1
0
1
0
1
1
0
OUT

TODO: {
local $TODO="globbing needs to be specialised for Tcl";
language_output_is("tcl",<<'TCL',<<OUT,"character classes");
  puts [string match {[ab]*} apple]
  puts [string match {[ab]*} boot]
  puts [string match {[ab]*} a]

  puts [string match {[ab]*} ring]

  puts [string match {[0-9]} 0]
  puts [string match {[0-9]} 5]
  puts [string match {[0-9]} 9]
  puts [string match {[0-9]} a]

  puts [string match {[^d-f]} z]
  puts [string match {[^d-f]} c]
  puts [string match {[!d-f]} g]
  puts [string match {[!d-f]} d]
  puts [string match {[^d-f]} e]
  puts [string match {[^d-f]} f]
TCL
1
1
1
0
1
1
1
0
0
0
0
1
1
1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"braces should be literal");
  puts [string match {{az,bz}} "{az,bz}"]
  puts [string match {{az,bz}} "bz"]
  puts [string match {[a-z]{5}} "b{5}"]
  puts [string match {[a-z]{5}} "bbbbb"]
TCL
1
0
1
0
OUT
}
