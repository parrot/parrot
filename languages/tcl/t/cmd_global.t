#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 3;
use vars qw($TODO);

language_output_is("tcl",<<TCL,<<OUT,"missing global");
  proc a {} {
    global q
    puts \$q
 }
 a
TCL
can't read "q": no such variable
OUT

language_output_is("tcl",<<TCL,<<OUT,"one global");
  proc a {} {
    global q
    puts \$q
 }
 set q 2
 a
TCL
2
OUT

language_output_is("tcl",<<TCL,<<OUT,"few globals");
  proc a {} {
    global q r s
    puts "\$q \$r \$s"
 }
 set q 1
 set r 2
 set s 3
 a
TCL
1 2 3
OUT
