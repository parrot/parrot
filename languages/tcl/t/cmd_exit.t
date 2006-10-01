#!/usr/bin/perl

use strict;
use warnings;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);

use Parrot::Test tests => 3;
use Test::More;

language_output_is( "tcl", <<'TCL', <<OUT, "noarg" );
 puts here
 exit
 puts nothere
TCL
here
OUT

language_output_is( "tcl", <<'TCL', <<OUT, "bad arg" );
 exit bork
TCL
expected integer but got "bork"
OUT

language_output_is( "tcl", <<'TCL', <<OUT, "too many args" );
 exit bork me
TCL
wrong # args: should be "exit ?returnCode?"
OUT

# TODO: should check return value of exit, also

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
