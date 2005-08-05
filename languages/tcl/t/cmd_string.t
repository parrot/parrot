#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 38;
use Test::More;
use vars qw($TODO);

language_output_is("tcl",<<TCL,<<OUT,"first, initial");
 string
TCL
wrong # args: should be "string option arg ?arg ...?"
OUT

language_output_is("tcl",<<TCL,<<OUT,"first, initial");
 puts [string first a abcdef]
TCL
0
OUT

language_output_is("tcl",<<TCL,<<OUT,"first, middle");
 puts [string first a federal]
TCL
5
OUT

language_output_is("tcl",<<TCL,<<OUT,"first, failure");
 puts [string first c green]
TCL
-1
OUT

language_output_is("tcl",<<TCL,<<OUT,"first, index, failure");
 puts [string first c green 0]
TCL
-1
OUT

language_output_is("tcl",<<TCL,<<OUT,"first, index, end");
 puts [string first c abcd end-3]
TCL
2
OUT

language_output_is("tcl",<<TCL,<<OUT,"first, index, overshot");
 puts [string first c abcd 20]
TCL
-1
OUT

language_output_is("tcl",<<TCL,<<OUT,"first, index");
 puts [string first c abcd 1]
TCL
2
OUT

language_output_is("tcl",<<TCL,<<OUT,"first, index, invalid index");
 puts [string first c abcd joe]
TCL
bad index "joe": must be integer or end?-integer?
OUT

language_output_is("tcl",<<TCL,<<OUT,"first, not enough args");
 string first
TCL
wrong # args: should be "string first subString string ?startIndex?"
OUT

language_output_is("tcl",<<TCL,<<OUT,"first, too many args");
 string first a b c d
TCL
wrong # args: should be "string first subString string ?startIndex?"
OUT

language_output_is("tcl",<<TCL,<<OUT,"index, too many args");
 string index a b c
TCL
wrong # args: should be "string index string charIndex"
OUT

language_output_is("tcl",<<TCL,<<OUT,"index, too few args");
 string index
TCL
wrong # args: should be "string index string charIndex"
OUT

language_output_is("tcl",<<TCL,<<OUT,"index, initial");
 puts [string index abcde 0]
TCL
a
OUT

language_output_is("tcl",<<TCL,<<OUT,"index, end");
 puts [string index abcde end]
TCL
e
OUT

language_output_is("tcl",<<TCL,<<OUT,"index, overshot");
 puts [string index abcde 10]
TCL

OUT

TODO: {
local $TODO="__string_index can't handle negative numbers yet.";

language_output_is("tcl",<<TCL,<<OUT,"index, undershot");
 puts [string index abcde -1]
TCL

OUT
}

language_output_is("tcl",<<TCL,<<OUT,"length, too many args");
 puts [string length a b]
TCL
wrong # args: should be "string length string"
OUT

language_output_is("tcl",<<TCL,<<OUT,"length, too few args");
 string length
TCL
wrong # args: should be "string length string"
OUT

language_output_is("tcl",<<TCL,<<OUT,"length, simple");
 puts [string length 10]
TCL
2
OUT

language_output_is("tcl",<<TCL,<<OUT,"length, empty");
 puts [string length ""]
TCL
0
OUT

language_output_is("tcl",<<TCL,<<OUT,"range, too many args");
 string range a b c d 
TCL
wrong # args: should be "string range string first last"
OUT

language_output_is("tcl",<<TCL,<<OUT,"range, too few args");
 string range
TCL
wrong # args: should be "string range string first last"
OUT

language_output_is("tcl",<<TCL,<<OUT,"range, total");
 puts [string range abcde 0 end]
TCL
abcde
OUT

language_output_is("tcl",<<TCL,<<OUT,"range, partial");
 puts [string range abcde 1 end-1]
TCL
bcd
OUT

language_output_is("tcl",<<TCL,<<OUT,"range, overextended");
 puts [string range abcde end-20 20]
TCL
abcde
OUT

language_output_is("tcl",<<TCL,<<OUT,"string match * only");
  puts [string match * foo]
TCL
1
OUT

language_output_is("tcl",<<TCL,<<OUT,"string match ?");
  puts [string match a?c abc]
TCL
1
OUT

language_output_is("tcl",<<TCL,<<OUT,"string match charset");
  puts [string match {a[bc]c} abc]
TCL
1
OUT

language_output_is("tcl",<<TCL,<<OUT,"string match charset, fail");
  puts [string match {a[ac]c} abc]
TCL
0
OUT

language_output_is("tcl",<<TCL,<<OUT,"string match \*");
  puts [string match {\*} *]
TCL
1
OUT

language_output_is("tcl",<<TCL,<<OUT,"string match \?");
  puts [string match {\?} ?]
TCL
1
OUT

language_output_is("tcl",<<TCL,<<OUT,"string match case failure");
  puts [string match ABC abc]
TCL
0
OUT

TODO: {
 local $TODO = "PGE doesn't support no case yet, though we could just fake it.";
language_output_is("tcl",<<TCL,<<OUT,"string match nocase");
  puts [string match -nocase ABC abc ]
TCL
1
OUT
}

TODO: {
local $TODO = "Parser error";
language_output_is("tcl",<<TCL,<<OUT,"string match \[");
  puts [string match {\[} {[}]
TCL
1
OUT

language_output_is("tcl",<<TCL,<<OUT,"string match \]");
  puts [string match {\]} {]}]
TCL
1
OUT
}

language_output_is("tcl",<<TCL,<<OUT,"string repeat: simple");
  puts [string repeat a 5]
TCL
aaaaa
OUT

language_output_is("tcl",<<TCL,<<OUT,"string repeat: bad args");
  string repeat a\

TCL
wrong # args: should be "string repeat string count"
OUT
