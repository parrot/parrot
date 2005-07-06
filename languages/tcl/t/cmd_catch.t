#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 9;

language_output_is("tcl",<<'TCL',<<OUT,"discard error");
  catch {
    error dead
  }
TCL
OUT

language_output_is("tcl",<<'TCL',<<OUT,"error message");
  catch {
    error dead
  } var
  puts $var
TCL
dead
OUT

language_output_is("tcl",<<'TCL',<<OUT,"error type: none");
  set a [catch {
    set b 0
  }]
  puts $a
TCL
0
OUT

language_output_is("tcl",<<'TCL',<<OUT,"error type: error");
  set a [catch {
    error dead
  }]
  puts $a
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"error type: return");
  set a [catch {
    return
  }]
  puts $a
TCL
2
OUT

language_output_is("tcl",<<'TCL',<<OUT,"error type: break");
  set a [catch {
    break
  }]
  puts $a
TCL
3
OUT

language_output_is("tcl",<<'TCL',<<OUT,"error type: continue");
  set a [catch {
    continue
  }]
  puts $a
TCL
4
OUT

language_output_is("tcl",<<'TCL',<<OUT,"error, invalid command");
  catch blorg var
  puts $var
TCL
invalid command name "blorg"
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"bad args");
  catch
TCL
wrong # args: should be "catch script ?resultVarName? ?optionVarName?"
OUT
