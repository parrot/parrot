#!/usr/bin/perl

use strict;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 3;
use Test::More;

language_output_is( "tcl", <<'TCL', <<'OUT', "PIR compiler" );
 inline PIR {
   .sub test
     print "ok\n"
   .end 
 }
TCL
ok
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "PASM compiler" );
 inline PASM {
   print "ok\n"
   end
 }
TCL
ok
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "invalid compiler" );
 inline JAVA {
   System.out.println("mmm, coffee");
 }
TCL
invalid language "JAVA" specified
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
