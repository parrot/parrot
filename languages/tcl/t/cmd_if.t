#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 9;
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
