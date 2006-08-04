#!/usr/bin/perl

use strict;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 15;
use Test::More;

language_output_is("tcl",<<'TCL',<<OUT,"simple if");
 if { 1 == 1 } {
   puts true
 } {
   puts false
 }
TCL
true
OUT

language_output_is("tcl",<<'TCL',<<OUT,"simple if with else");
 if { 1 == 1 } {
   puts true
 } else {
   puts false
 }
TCL
true
OUT

language_output_is("tcl",<<'TCL',<<OUT,"simple if with then");
 if { 1 != 1 } then {
   puts true
 } {
   puts false
 }
TCL
false
OUT

language_output_is("tcl",<<'TCL',<<OUT,"simple if with then, else");
 if { 1 == 1 } then {
   puts true
 } else {
   puts false
 }
TCL
true
OUT

language_output_is("tcl",<<'TCL',<<OUT,"simple if with then, elseif");
 if { 1 != 1 } then {
   puts true
 } elseif { 2==2 } {
   puts blue
 }
TCL
blue
OUT

language_output_is('tcl', <<'TCL', <<'OUT', 'simple if with then, elseif with then');
  if 0 then {
    puts if
  } elseif 1 then {
    puts elseif
  }
TCL
elseif
OUT

language_output_is("tcl",<<'TCL',<<OUT,"simple if with then, elseif, else");
 if { 1 != 1 } then {
   puts true
 } elseif { 2 != 2 } {
   puts blue
 } else {
   puts whee
 }
TCL
whee
OUT

language_output_is("tcl",<<'TCL',<<OUT,"simple if with elseif, implicit else");
 if { 1 != 1 } {
   puts true
 } elseif { 2 != 2 } {
   puts blue
 } {
   puts whee
 }
TCL
whee
OUT

language_output_is("tcl",<<'TCL','',"simple if with implicit then, false");
 if { 1 != 1 } {
   puts true
 }
TCL

language_output_is("tcl",<<'TCL',<<OUT,"simple if with implicit then, true");
 if { 1 == 1 } {
   puts true
 }
TCL
true
OUT

language_output_is("tcl", <<'TCL',<<OUT,"pathological elseif");
if 0 then {
  puts true
} elseif 0 {
  puts bar
}
TCL
OUT

language_output_is('tcl', <<'TCL', <<'OUT', 'if - expected boolean');
if {"foo"} then {puts foo}
TCL
expected boolean value but got "foo"
OUT

language_output_is('tcl', <<'TCL', <<'OUT', 'if - numeric non-0 is true');
  if 2 then {puts ok}
TCL
ok
OUT

language_output_is('tcl', <<'TCL', <<'OUT', 'if - no script following else');
  if {[puts foo]&&1} {puts true} else
TCL
wrong # args: no script following "else" argument
OUT

language_output_is('tcl', <<'TCL', <<'OUT', 'if - no expression after elseif');
  if {[puts foo]&&1} {puts true} elseif
TCL
wrong # args: no expression after "elseif" argument
OUT

