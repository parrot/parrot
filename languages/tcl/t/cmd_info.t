#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 21;
use Test::More;
use vars qw($TODO);

language_output_is("tcl",<<'TCL',<<OUT,"info no subcommand");
 info
TCL
wrong # args: should be "info option ?arg arg ...?"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"info bad subcommand");
 info bork
TCL
bad option "bork": must be args, body, cmdcount, commands, complete, default, exists, functions, globals, hostname, level, library, loaded, locals, nameofexecutable, patchlevel, procs, script, sharedlibextension, tclversion, or vars
OUT

language_output_is("tcl",<<'TCL',<<OUT,"info args bad param");
 info args
TCL
wrong # args: should be "info args procname"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"info args bad param too many");
 info args a b c
TCL
wrong # args: should be "info args procname"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"info args no args");
 proc me {} { puts 2 }
 puts [info args me]
TCL

OUT

language_output_is("tcl",<<'TCL',<<OUT,"info args one arg");
 proc me {a} { puts 2 }
 puts [info args me]
TCL
a
OUT

language_output_is("tcl",<<'TCL',<<OUT,"info args multi args");
 proc me {a b c args} { puts 2 }
 puts [info args me]
TCL
a b c args
OUT

language_output_is("tcl",<<'TCL',<<OUT,"info args no proc");
 puts [info args me]
TCL
"me" isn't a procedure
OUT

language_output_is("tcl",<<'TCL',<<OUT,"info body no args");
 info body
TCL
wrong # args: should be "info body procname"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"info body too many args");
 info body a b
TCL
wrong # args: should be "info body procname"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"info body bad proc");
 info body bork
TCL
"bork" isn't a procedure
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"info body normal proc");
 proc say {a} {
  puts $a
  #fun
 }
 puts [info body say]
TCL

  puts $a
  #fun
 
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"info functions too many args");
 info functions a b
TCL
wrong # args: should be "info functions ?pattern?"
OUT

TODO: {
  local $TODO = "implement sorting before this can work reliably";

language_output_is("tcl",<<'TCL',<<'OUT',"info functions basic");
 puts [info functions]
TCL
round wide sqrt sin double log10 atan hypot rand abs acos atan2 srand sinh floor log int tanh tan asin ceil cos cosh exp pow fmod
OUT
}

language_output_is("tcl",<<'TCL',<<'OUT',"info functions pattern");
 puts [info functions s??t]
TCL
sqrt
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"info exists no args");
  info exists
TCL
wrong # args: should be "info exists varName"
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"info exists too many args");
  info exists a b c
TCL
wrong # args: should be "info exists varName"
OUT

TODO: {
  local $TODO = "info exists currently slightly borked";

language_output_is("tcl",<<'TCL',<<'OUT',"info exists true");
  set a 1
  puts [info exists a]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"info exists false");
  puts [info exists a]
TCL
0
OUT
}

language_output_is("tcl",<<'TCL',<<'OUT',"info tclversion too many args");
  info tclversion v
TCL
wrong # args: should be "info tclversion"
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"info tclversion");
  if {[info tclversion] == [set tcl_version]} {
    puts "ok"
  }
TCL
ok
OUT
