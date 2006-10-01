#!/usr/bin/perl

use strict;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 4;
use Test::More;
use vars qw($TODO);

language_output_is( "tcl", <<'TCL', <<'OUT', "command: global explicit" );
  ::puts ok
TCL
ok
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "command: global explicit (extra colons)" );
  :::::::puts ok
TCL
ok
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "command: all colons" );
  proc ::: {} {puts ok}
  {}
TCL
ok
OUT

language_output_is( "tcl", <<'TCL', <<'OUT', "command: global explicit (not enough colons)" );
  :puts ok
TCL
invalid command name ":puts"
OUT
