#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 45;
use Test::More;
use vars qw($TODO);

language_output_is("tcl",<<'TCL',<<OUT,"array, no args");
 array
TCL
wrong # args: should be "array option arrayName ?arg ...?"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"array, good subcommand, no array");
 array exists
TCL
wrong # args: should be "array option arrayName ?arg ...?"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"array, bad subcommand, bad arary");
 array bork foo
TCL
bad option "bork": must be anymore, donesearch, exists, get, names, nextelement, set, size, startsearch, statistics, or unset
OUT

language_output_is("tcl",<<'TCL',<<OUT,"array exists yes");
 set b(c) 2
 puts [array exists b]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"array exists no");
 set a 2
 puts [array exists a]
TCL
0
OUT

language_output_is("tcl",<<'TCL',<<OUT,"array exists missing");
 puts [array exists a]
TCL
0
OUT

language_output_is("tcl",<<'TCL',<<OUT,"array exists too many args");
 puts [array exists a b]
TCL
wrong # args: should be "array exists arrayName"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"array size too many args");
 array size a b
TCL
wrong # args: should be "array size arrayName"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"array size 1");
 set a(1) 1
 puts [array size a]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"array size 2");
 set a(1) 1; set a(2) 2
 puts [array size a]
TCL
2
OUT

language_output_is("tcl",<<'TCL',<<OUT,"array size not array");
 set a 1
 puts [array size a]
TCL
0
OUT

language_output_is("tcl",<<'TCL',<<OUT,"array set list");
 array set a [list a b]
 puts $a(a)
TCL
b
OUT

language_output_is("tcl",<<'TCL',<<OUT,"array set multi list");
 array set a [list a b c d e f]
 puts $a(a)
 puts $a(c)
 puts $a(e)
TCL
b
d
f
OUT

language_output_is("tcl",<<'TCL',<<OUT,"array set preserve old values");
 set a(a) b
 array set a [list c d e f]
 puts $a(a)
 puts $a(c)
 puts $a(e)
TCL
b
d
f
OUT

language_output_is("tcl",<<'TCL',<<OUT,"array set");
 array set a {a b}
 puts $a(a)
TCL
b
OUT

language_output_is("tcl",<<'TCL',<<OUT,"array set multi");
 array set a {a b c d e f}
 puts $a(a)
 puts $a(c)
 puts $a(e)
TCL
b
d
f
OUT

language_output_is("tcl",<<'TCL',<<OUT,"array set uneven");
 array set a a
TCL
list must have an even number of elements
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"array set return value");
  puts [array set a [list a b]]
TCL

OUT

language_output_is("tcl",<<'TCL',<<'OUT',"array set not array");
  set a 44
  array set a {1 2 3 4}
TCL
can't set "a(1)": variable isn't array
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"array get");
  array set a [list a b]
  puts [array get a]
TCL
a b
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"array get, with pattern");
  array set a [list a b c d]
  puts [array get a a]
TCL
a b
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"array get, with pattern");
  array set a [list apple 1 orange 2 aardvark 3]
  puts [array get a a*]
TCL
apple 1 aardvark 3
OUT

language_output_is("tcl",<<'TCL',<<'OUT',"array get, with bad pattern");
  array set a [list apple 1 orange 2 aardvark 3]
  puts [array get a zippy*]
TCL

OUT

language_output_is("tcl",<<'TCL',<<'OUT',"array get, bad array");
  puts [array get a]
TCL

OUT

language_output_is("tcl",<<'TCL',<<'OUT',"array get, bad array with pattern");
  puts [array get a a]
TCL

OUT

language_output_is("tcl",<<'TCL',<<'OUT',"array get, too many args");
  array get a b c
TCL
wrong # args: should be "array get arrayName ?pattern?"
OUT

language_output_is("tcl", <<'TCL', <<'OUT',"array unset");
  array set a [list a b]
  puts [array unset a]
  puts [array get a]
TCL


OUT

language_output_is("tcl", <<'TCL', <<'OUT',"array unset, with pattern");
  array set a [list a b c d]
  puts [array unset a a]
  puts [array get a]
TCL

c d
OUT

language_output_is("tcl", <<'TCL', <<'OUT',"array unset, with pattern");
  array set a [list apple 1 orange 2 aardvark 3]
  puts [array unset a a*]
  puts [array get a]
TCL

orange 2
OUT

language_output_is("tcl", <<'TCL', <<'OUT',"array unset, with bad pattern");
  array set a [list apple 1 orange 2 aardvark 3]
  puts [array unset a zippy*]
  puts [array get a]
TCL

apple 1 orange 2 aardvark 3
OUT

language_output_is("tcl", <<'TCL', <<'OUT',"array unset, bad array");
  puts [array unset badarray]
TCL

OUT

language_output_is("tcl", <<'TCL', <<'OUT',"array unset, bad array, pattern");
  puts [array unset badarray monkey*]
TCL

OUT

language_output_is("tcl", <<'TCL', <<'OUT',"array unset, too many args");
  array unset monkey my monkey monkey
TCL
wrong # args: should be "array unset arrayName ?pattern?"
OUT

TODO: {
  local $TODO = "[array names] isn't implemented yet.";

language_output_is("tcl", <<'TCL', <<'OUT',"array names, no array");
  puts [array names a]
TCL

OUT

language_output_is("tcl", <<'TCL', <<'OUT',"array names, bad option");
  array names a b c
TCL
bad option "b": must be -exact, -glob, or -regexp
OUT

language_output_is("tcl", <<'TCL', <<'OUT',"array names, too many args");
  array names a b c d
TCL
wrong # args: should be "array names arrayName ?mode? ?pattern?");
OUT

language_output_is("tcl", <<'TCL', <<'OUT',"array names, no pattern");
  set a(monkey) see
  puts [array names a]
TCL
monkey
OUT

language_output_is("tcl", <<'TCL', <<'OUT',"array names, default glob pattern");
  set a(monkey1) see
  set a(monkey2) do
  puts [array names a monkey*]
TCL
monkey1 monkey2
OUT

language_output_is("tcl", <<'TCL', <<'OUT',"array names, default glob pattern failure");
  set a(monkey1) see
  set a(monkey2) do
  puts [array names a cat*]
TCL

OUT

language_output_is("tcl", <<'TCL', <<'OUT',"array names, explicit glob pattern");
  set a(monkey1) see
  set a(monkey2) do
  puts [array names a -glob monkey*]
TCL
monkey1 monkey2
OUT

language_output_is("tcl", <<'TCL', <<'OUT',"array names, explicit glob pattern failure");
  set a(monkey1) see
  set a(monkey2) do
  puts [array names a -glob cat*]
TCL

OUT

language_output_is("tcl", <<'TCL', <<'OUT',"array names, explicit exact match");
  set a(monkey1) see
  set a(monkey2) do
  puts [array names a -exact monkey1]
TCL
monkey1
OUT

language_output_is("tcl", <<'TCL', <<'OUT',"array names, explicit exact match failure");
  set a(monkey1) see
  set a(monkey2) do
  puts [array names a -exact cat5]
TCL

OUT

}

TODO: {
  local $TODO = "don't have tcl style regexp in PGE yet.";

language_output_is("tcl", <<'TCL', <<'OUT',"array names, explicit regexp match");
  set a(monkey1) see
  set a(monkey2) do
  puts [array names a -regexp ^mon.*]
TCL
monkey1 monkey2
OUT

language_output_is("tcl", <<'TCL', <<'OUT',"array names, explicit regexp match failure");
  set a(monkey1) see
  set a(monkey2) do
  puts [array names a -regexp cat]
TCL

OUT
}
