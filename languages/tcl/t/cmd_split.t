#!/usr/bin/perl

use strict;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 7;
use Test::More;

language_output_is("tcl",<<'TCL',<<OUT,"split too few args");
 split
TCL
wrong # args: should be "split string ?splitChars?"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"split too many args");
 split a b c
TCL
wrong # args: should be "split string ?splitChars?"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"split default split");
 puts [lindex [split {that is fun}] 2]
TCL
fun
OUT

language_output_is("tcl",<<'TCL',<<OUT,"split empty string");
 puts [split {Modern Major General} {}]
TCL
M o d e r n { } M a j o r { } G e n e r a l
OUT

language_output_is("tcl",<<'TCL',<<OUT,"split single char");
 puts [split {perl.perl6.language} .]
TCL
perl perl6 language
OUT

language_output_is("tcl",<<'TCL',<<OUT,"split multi char");
 puts [split {perl.perl6.language} glop]
TCL
{} er . er 6. an ua e
OUT

language_output_is("tcl",<<'TCL',<<OUT,"split and a miss");
 puts [split {perl.perl6.language} z]
TCL
perl.perl6.language
OUT
