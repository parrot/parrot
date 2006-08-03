#!/usr/bin/perl

use strict;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 14;
use Parrot::Config;
use Test::More;

SKIP: {
  skip("Parrot not configured with ICU",5) unless $PConfig{has_icu};
language_output_is("tcl",<<TCL,<<OUT,"string match nocase");
  puts [string match -nocase ABC abc]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string match nocase: unicode (Greek alphas)");
  puts [string match -nocase \u03b1 \u0391]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string equal, diff with -nocase");
  puts [string equal -nocase APPLEs oranGES]
TCL
0
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string equal, same with -nocase");
  puts [string equal -nocase baNAna BAnana]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string equal, -length and -nocase");
  puts [string equal -nocase -length 4 fERry FeRroUs]
TCL
1
OUT
}

# XXX - many of the classes are NOT tested here, and we rely
# on the cvs tests from tcl for that.

my %doubles = qw(
  2.1    1    
  7.0    1
  7      1
  1e1    1
  .1     1
  no     0
  .      0
  +2.    1
  -2.    1
);

foreach my $double (keys %doubles) {
  language_output_is("tcl",<<"TCL",<<"OUT","string is double: $double");
    puts [string is double $double]
TCL
$doubles{$double}
OUT

}
