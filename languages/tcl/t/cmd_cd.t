#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 3;
use Test::More;

language_output_is("tcl",<<'TCL',<<OUT,"cd too many args");
 cd a b
TCL
wrong # args: should be "cd ?dirName?"
OUT

language_output_is("tcl",<<'TCL',<<"OUT","cd home");
 cd
 puts [pwd]
TCL
$ENV{HOME}
OUT


#XXX portably write a test that cd's to a safe dir and checks it...
SKIP: {
  skip("Too dumb to create a directory") unless -d "/tmp";

language_output_is("tcl",<<'TCL',<<"OUT","cd home");
 cd /usr
 puts [pwd]
TCL
/usr
OUT
}
