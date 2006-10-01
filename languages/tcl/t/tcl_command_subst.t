#!/usr/bin/perl

use strict;
use warnings;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);

use Parrot::Test tests => 13;
use Test::More;

language_output_is( "tcl", <<'TCL', <<'OUT', "all" );
 set a 5
 puts [set a]
TCL
5
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "leading" );
 set a 5
 puts [set a]b
TCL
5b
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "trailing" );
 set a 5
 puts b[set a]
TCL
b5
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "escaped brace" );
 set a "St\[ring Parsing"
 puts $a
TCL
St[ring Parsing
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "escaped brace" );
 set a "St\\\[ring Parsing"
 puts $a
TCL
St\[ring Parsing
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "embedded escaped open brace" );
 set a [set b \[]
 puts $a
TCL
[
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "embedded escaped close brace" );
 set a [set b \]]
 puts $a
TCL
]
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "command subst inside string" );
 set a "2 [set b 3]"
 puts $a
TCL
2 3
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "nested command subst" );
 puts [set a [set b 2]]
TCL
2
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "] in \"\"s" );
 puts [set a "]"]
TCL
]
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', '] in ""s in [expr]' );
  puts [expr {4*[llength "]"]}]
TCL
4
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', '" in []s in ""s in [expr]' );
puts [expr {4*"[llength "]"]"}]
TCL
4
OUT

language_output_is( 'tcl', <<'TCL', <<'OUT', '\n after last command' );
puts [
    set x {}
    set x 3
]
TCL
3
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
