#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 8;
use Test::More;

language_output_is('tcl', <<'TCL', <<'OUT', 'noarg');
 set a 2
 puts [append a]
TCL
2
OUT

language_output_is('tcl', <<'TCL', <<'OUT', 'multiarg');
 set a 1
 puts [append a 2 3]
TCL
123
OUT

language_output_is('tcl', <<'TCL', <<'OUT', 'multiarg');
 set a 1
 set b [append a 2]
 puts $b
TCL
12
OUT

language_output_is('tcl', <<'TCL', <<'OUT', 'empty with several args');
 set x ""
 append x 1 2 abc "long string"
 puts $x
TCL
12abclong string
OUT

language_output_is('tcl', <<'TCL', <<'OUT', 'unset variable');
 append x 1 2 abc "long string"
 puts $x
TCL
12abclong string
OUT

language_output_is('tcl', <<'TCL', <<'OUT', 'wrong # args error');
 append
TCL
wrong # args: should be "append varName ?value value ...?"
OUT

language_output_is('tcl', <<'TCL', <<'OUT', 'variable isn\'t array error');
 set x ""
 append x(0) 44
TCL
can't set "x(0)": variable isn't array
OUT

# Tcl currently throughs an error for this code
# but a bug has been filed for it at http://tcl.sf.net (#1227172)
language_output_is('tcl', <<'TCL', <<'OUT', 'append unset variable');
 append x
TCL
can't read "x": no such variable
OUT
