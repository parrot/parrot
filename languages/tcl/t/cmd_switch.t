#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 16;
use Test::More;
use vars qw($TODO);

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

language_output_is("tcl",<<'TCL',<<OUT,"bad flag, -monkey");
 switch -monkey a
TCL
bad option "-monkey": must be -exact, -glob, -regexp, -matchvar, -indexvar, or --
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
 switch -- -b -a {
   puts a
 } -b {
   puts b
 } 
TCL
b
OUT

language_output_is("tcl",<<'TCL',<<OUT,"implied exact, single choice in list");
  switch ab {
    ab	{ puts AB }
  }
TCL
AB
OUT

language_output_is("tcl",<<'TCL',<<OUT,"implied exact, no globbing");
  switch ab {
    *b { puts *B }
    a* { puts A* }
    ab { puts AB }
    ba { puts BA }
  }
TCL
AB
OUT

language_output_is("tcl",<<'TCL',<<OUT,"implied exact, default");
  switch abc {
    *b { puts *B }
    a* { puts A* }
    ab { puts AB }
    ba { puts BA }
    default { puts DEF }
  }
TCL
DEF
OUT

language_output_is("tcl",<<'TCL',<<OUT,"implied exact, match before default");
  switch ab {
    *b { puts *B }
    a* { puts A* }
    ab { puts AB }
    ba { puts BA }
    default { puts DEF }
  }
TCL
AB
OUT

language_output_is("tcl",<<'TCL',<<OUT,"implied exact, no match, no default");
  switch abc {
    *b { puts *B }
    a* { puts A* }
    ab { puts AB }
    ba { puts BA }
  }
  puts ok
TCL
ok
OUT

language_output_is("tcl",<<'TCL',<<OUT,"implied exact, choices in list");
  switch ab {
    b  { puts B }
    ab { puts AB }
    ba { puts BA }
  }
TCL
AB
OUT

language_output_is("tcl",<<'TCL',<<OUT,"-glob, three choices");
  switch -glob ab {
    b  { puts B }
    a* { puts A* }
    ab { puts AB }
  }
TCL
A*
OUT

language_output_is("tcl",<<'TCL',<<OUT,"-glob, no match, no default");
  switch -glob abc {
    b  { puts B }
    a? { puts A? }
    *a { puts *A }
  }
  puts ok
TCL
ok
OUT

language_output_is("tcl",<<'TCL',<<OUT,"-glob, no match, default");
  switch abc {
    b  { puts B }
    a? { puts A? }
    *a { puts *A }
    default { puts ok }
  }
TCL
ok
OUT


