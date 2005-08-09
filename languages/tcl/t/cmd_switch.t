#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 6;
use Test::More;
use vars qw($TODO);

TODO: {
  local $TODO = "switch not written yet.";

language_output_is("tcl",<<'TCL',<<OUT,"too few args, 0");
 switch
TCL
wrong # args: should be "switch ?switches? string pattern body ... ?default body?"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"too few args, 1");
 switch a
TCL
wrong # args: should be "switch ?switches? string pattern body ... ?default body?"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"implied exact, singleton");
 switch a a {puts a}
TCL
a
OUT

language_output_is("tcl",<<'TCL',<<OUT,"implied exact, two choices");
 switch b a {
   puts a
 } b {
   puts b
 } 
TCL
b
OUT

language_output_is("tcl",<<'TCL',<<OUT,"implied exact, --");
 switch -- -a -a {puts -a}
TCL
-a
OUT

language_output_is("tcl",<<'TCL',<<OUT,"implied exact, --, two choices");
 switch -b -a {
   puts a
 } -b {
   puts b
 } 
TCL
b
OUT

}
