#!/usr/bin/perl

use strict;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 5;

language_output_is(tcl => << 'TCL', <<OUT, "time, not enough args");
 time
TCL
wrong # args: should be "time script ?count?"
OUT

language_output_is(tcl => << 'TCL', <<OUT, "time, too many args");
 time a b c
TCL
wrong # args: should be "time script ?count?"
OUT

language_output_is(tcl => << 'TCL', <<OUT, "time bad count arg");
 time {set a} 3.2
TCL
expected integer but got "3.2"
OUT

language_output_like(tcl => <<'TCL', '/\d+ microseconds per iteration\n/', 'check return value');
 puts [time { expr 2+2 }]
TCL

language_output_is(tcl => << 'TCL', <<OUT, "time verify code executed");
 time {set a 2} 3 
 puts $a
TCL
2
OUT

