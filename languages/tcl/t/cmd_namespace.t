#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 17;
use Test::More;
use vars qw($TODO);

language_output_is("tcl",<<'TCL',<<OUT,"namespace: no args");
   namespace
TCL
wrong # args: should be "namespace subcommand ?arg ...?"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"namespace: bad subcommand");
   namespace asdf
TCL
bad option "asdf": must be children, code, current, delete, eval, exists, export, forget, import, inscope, origin, parent, qualifiers, tail, or which
OUT

language_output_is("tcl",<<'TCL',<<OUT,"namespace qualifiers: no args");
   namespace qualifiers
TCL
wrong # args: should be "namespace qualifiers string"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"namespace qualifiers: too many args");
   namespace qualifiers string string
TCL
wrong # args: should be "namespace qualifiers string"
OUT

TODO: {
  local $TODO = "unimplemented";
language_output_is("tcl",<<'TCL',<<OUT,"namespace qualifiers: simple");
   puts [namespace qualifiers ::a::b::c]
TCL
::a::b
OUT

language_output_is("tcl",<<'TCL',<<OUT,"namespace qualifiers: extra colons");
   puts [namespace qualifiers :::a:::b::c]
TCL
::a::b
OUT
}

language_output_is("tcl",<<'TCL',<<OUT,"namespace tail: no args");
   namespace tail
TCL
wrong # args: should be "namespace tail string"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"namespace qualifiers: too many args");
   namespace tail string string
TCL
wrong # args: should be "namespace tail string"
OUT

TODO: {
  local $TODO = "unimplemented";
language_output_is("tcl",<<'TCL',<<OUT,"namespace tail: simple");
   puts [namespace tail ::a::b::c]
TCL
c
OUT

language_output_is("tcl",<<'TCL',<<OUT,"namespace tail: extra colons");
   puts [namespace tail :::a:::b::c]
TCL
c
OUT
}

language_output_is("tcl",<<'TCL',<<OUT,"namespace current: too many args");
   namespace current current
TCL
wrong # args: should be "namespace current"
OUT

# TODO : more tests once we can *change* the namespace

language_output_is("tcl",<<'TCL',<<OUT,"namespace current: too many args");
   puts [namespace current]
TCL
::
OUT

language_output_is("tcl",<<'TCL',<<OUT,"namespace exists: no args");
   namespace exists
TCL
wrong # args: should be "namespace exists name"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"namespace exists: too many args");
   namespace exists a a
TCL
wrong # args: should be "namespace exists name"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"namespace exists: failure");
   puts [namespace exists a]
TCL
0
OUT

TODO: {
  local $TODO = "unimplemented";
language_output_is("tcl",<<'TCL',<<OUT,"namespace exists: global implicit");
   puts [namespace exists {}]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"namespace exists: global explicit");
   puts [namespace exists ::]
TCL
1
OUT
}
