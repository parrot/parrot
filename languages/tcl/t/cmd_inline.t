#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 3;

my($tcl,$expected);

language_output_is("tcl",<<'TCL',<<'OUT',"PIR compiler");
 inline PIR {
   .sub test
     print "ok\n"
   .end 
 }
TCL
ok
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"PIR compiler");
 inline PASM {
   print "ok\n"
 }
TCL
ok
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"invalid compiler");
 inline JAVA {
   System.out.println("mmm, coffee");
 }
TCL
invalid language "JAVA" specified
OUT
