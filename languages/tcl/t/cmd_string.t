#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);

use Parrot::Test tests => 133;
use Parrot::Config;
use Test::More;


language_output_is("tcl",<<TCL,<<OUT,"first, initial");
 string
TCL
wrong # args: should be "string option arg ?arg ...?"
OUT

language_output_is("tcl",<<TCL,<<OUT,"first, initial");
 puts [string first a abcdefa]
TCL
0
OUT

language_output_is("tcl",<<TCL,<<OUT,"first, middle");
 puts [string first a federala]
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
 puts [string first c abcdc end-4]
TCL
2
OUT

language_output_is("tcl",<<TCL,<<OUT,"first, index, overshot");
 puts [string first c abcd 20]
TCL
-1
OUT

language_output_is("tcl",<<TCL,<<OUT,"first, index");
 puts [string first c abcdc 1]
TCL
2
OUT

language_output_is("tcl",<<TCL,<<OUT,"first, index, invalid index");
 puts [string first c abcd joe]
TCL
bad index "joe": must be integer?[+-]integer? or end?[+-]integer?
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

language_output_is("tcl",<<TCL,<<OUT,"last, initial");
 puts [string last a abcdefa]
TCL
6
OUT

language_output_is("tcl",<<TCL,<<OUT,"last, middle");
 puts [string last a federala]
TCL
7
OUT

language_output_is("tcl",<<TCL,<<OUT,"last, failure");
 puts [string last c green]
TCL
-1
OUT

language_output_is("tcl",<<TCL,<<OUT,"last, index, failure");
 puts [string last c green 0]
TCL
-1
OUT

language_output_is("tcl",<<TCL,<<OUT,"last, index, end");
 puts [string last c abcdc end-2]
TCL
2
OUT

## Overshot is ignored in this case as the maximum between the string
## of the offset is considered
language_output_is("tcl",<<TCL,<<OUT,"last, index, overshot");
 puts [string last c abcd 20]
TCL
2
OUT

language_output_is("tcl",<<TCL,<<OUT,"last, index");
 puts [string last c abcdc 1]
TCL
-1
OUT

language_output_is("tcl",<<TCL,<<OUT,"last, index, invalid index");
 puts [string last c abcd joe]
TCL
bad index "joe": must be integer?[+-]integer? or end?[+-]integer?
OUT

language_output_is("tcl",<<TCL,<<OUT,"last, not enough args");
 string last
TCL
wrong # args: should be "string last subString string ?lastIndex?"
OUT

language_output_is("tcl",<<TCL,<<OUT,"last, too many args");
 string last a b c d
TCL
wrong # args: should be "string last subString string ?lastIndex?"
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

language_output_is("tcl",<<TCL,<<OUT,"index, undershot, neg.");
 puts [string index abcde -1]
TCL

OUT

language_output_is("tcl",<<TCL,<<OUT,"index, overshot, neg.");
 puts [string index abcde end--1]
TCL

OUT

language_output_is("tcl",<<TCL,<<OUT,"index, float");
 puts [string index abcde 1.2]
TCL
bad index "1.2": must be integer?[+-]integer? or end?[+-]integer?
OUT

language_output_is("tcl",<<TCL,<<OUT,"index, end-float");
 puts [string index abcde end-1.2]
TCL
bad index "end-1.2": must be integer or end?-integer?
OUT

language_output_is("tcl",<<TCL,<<OUT,"index, overshot, neg.");
 puts [string index abcde bogus]
TCL
bad index "bogus": must be integer or end?-integer?
OUT

language_output_is("tcl",<<TCL,<<OUT,"index, bad -end");
 puts [string index abcde end-bogus]
TCL
bad index "end-bogus": must be integer?[+-]integer? or end?[+-]integer?
OUT

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

language_output_is("tcl",<<TCL,<<OUT,"length, ascii");
 puts [string length 10]
TCL
2
OUT

language_output_is("tcl",<<'TCL',<<OUT,"length, unicode");
 set a \u6666
 puts [string length $a]
TCL
1
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

SKIP: {
  skip("Parrot not configured with ICU",2) unless $PConfig{has_icu};
language_output_is("tcl",<<TCL,<<OUT,"string match nocase");
  puts [string match -nocase ABC abc]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string match nocase: unicode (Greek alphas)");
  puts [string match -nocase \u03b1 \u0391]
TCL
1
OUT
}

language_output_is("tcl",<<'TCL',<<OUT,"string match \[");
  puts [string match {\[} {[}]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string match \]");
  puts [string match {\]} {]}]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string match \*");
  puts [string match {\*} {*}]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string match \?");
  puts [string match {\?} {?}]
TCL
1
OUT

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

language_output_is("tcl",<<TCL,<<OUT,"string bytelength: no args");
  string bytelength
TCL
wrong # args: should be "string bytelength string"
OUT

language_output_is("tcl",<<TCL,<<OUT,"string bytelength: too many args");
  string bytelength a b
TCL
wrong # args: should be "string bytelength string"
OUT

language_output_is("tcl",<<TCL,<<OUT,"string bytelength: ascii");
  puts [string bytelength hi]
TCL
2
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string bytelength: unicode 1");
  puts [string bytelength \u6666]
TCL
3
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string bytelength: unicode 2");
  puts [string bytelength \u666]
TCL
2
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string equal, bad args");
  string equal banana
TCL
wrong # args: should be "string equal ?-nocase? ?-length int? string1 string2"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string equal, two diff strings");
  puts [string equal oranges apples]
TCL
0
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string equal, two diff strings");
  puts [string equal oranges orANGes]
TCL
0
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string equal, two equal strings");
  set a banana
  puts [string equal banana $a]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string equal, diff with -length");
  puts [string equal -length 5 ferry ferrous]
TCL
0
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string equal, diff with -length");
  puts [string equal -length 4 ferry ferrous]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string equal, diff with length -1");
  puts [string equal -length -1 banana bananarum]
TCL
0
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string equal, same with length -1");
  puts [string equal -length -1 banana banana]
TCL
1
OUT

SKIP: {
  skip("Parrot not configured with ICU",3) unless $PConfig{has_icu};

language_output_is("tcl",<<'TCL',<<OUT,"string equal, diff with -nocase");
  puts [string equal -nocase APPLEs oranGES]
TCL
0
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string equal, same with -nocase");
  puts [string equal -nocase baNAna BAnana]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string equal, -length and -nocase");
  puts [string equal -nocase -length 4 fERry FeRroUs]
TCL
1
OUT
}

language_output_is("tcl",<<'TCL',<<OUT,"string tolower, Simple");
  puts [string tolower "AabcD ABC"]
TCL
aabcd abc
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string tolower, bad args");
   string tolower
TCL
wrong # args: should be "string tolower string ?first? ?last?"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string tolower, both limits");
    puts [string tolower PARROT end-4 4]
TCL
ParroT
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string tolower, single index");
    puts [string tolower PARROT 4]
TCL
PARRoT
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string tolower, single index, out of string");
    puts [string tolower PARROT 40]
TCL
PARROT
OUT



language_output_is("tcl",<<'TCL',<<OUT,"string toupper, Simple");
  puts [string toupper "AabcD ABC"]
TCL
AABCD ABC
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string toupper, bad args");
   string toupper
TCL
wrong # args: should be "string toupper string ?first? ?last?"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string toupper, both limits");
    puts [string toupper parrot end-4 4]
TCL
pARROt
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string toupper, single index");
    puts [string toupper parrot 4]
TCL
parrOt
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string toupper, single index, out of string");
    puts [string tolower parrot 40]
TCL
parrot
OUT



language_output_is("tcl",<<'TCL',<<OUT,"string totitle, Simple");
  puts [string totitle "AabcD ABC"]
TCL
Aabcd abc
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string totitle, bad args");
   string totitle
TCL
wrong # args: should be "string totitle string ?first? ?last?"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string totitle, both limits");
    puts [string totitle PARROT end-4 4]
TCL
PArroT
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string totitle, single index");
    puts [string totitle parrot 4]
TCL
parrOt
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string totitle, single index, out of string");
    puts [string totitle PARROT 40]
TCL
PARROT
OUT


language_output_is("tcl",<<'TCL',<<OUT,"string replace, bad args");
    string replace
TCL
wrong # args: should be "string replace string first last ?string?"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string replace, simple");
    puts [string replace parrcamelot 4 8]
TCL
parrot
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string replace, negative index");
    puts [string replace junkparrot -10 3]
TCL
parrot
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string replace, index bigger than string");
    puts [string replace parrotjunk 6 20]
TCL
parrot
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string replace, by something");
    puts [string replace perl 1 3 arrot]
TCL
parrot
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string replace, swapped indexes");
    puts [string replace perl 3 1 arrot]
TCL
perl
OUT


language_output_is("tcl",<<'TCL',<<OUT,"string trimleft, bad args");
   string trimleft
TCL
wrong # args: should be "string trimleft string ?chars?"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string trimleft, no chars");
   puts [string trimleft "  \nfoo"]
TCL
foo
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string trimleft, char set");
   puts [string trimleft "abcfaoo" abc]
TCL
faoo
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string trimleft, char set, no match");
   puts [string trimleft "abcfaoo" z]
TCL
abcfaoo
OUT



language_output_is("tcl",<<'TCL',<<OUT,"string trimright, bad args");
   string trimright
TCL
wrong # args: should be "string trimright string ?chars?"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string trimright, no chars");
   puts [string trimright " foo  "]
TCL
 foo
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string trimright, char set");
   puts [string trimright "abcfaoo" ao]
TCL
abcf
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string trimright, char set, no match");
   puts [string trimright "abcfaoo" z]
TCL
abcfaoo
OUT





language_output_is("tcl",<<'TCL',<<OUT,"string trim, bad args");
   string trim
TCL
wrong # args: should be "string trim string ?chars?"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string trim, no chars");
   puts [string trim " \n foo  "]
TCL
foo
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string trim, char set");
   puts [string trim "ooabacfaoo" ao]
TCL
bacf
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string trim, char set, no match");
   puts [string trim "abcfaoo" z]
TCL
abcfaoo
OUT

# XXX - many of the classes are NOT tested here, and we rely
# on the cvs tests from tcl for that.

my %doubles = qw(
  2.1    1    
  7.0    1
  7      1
  1e1    1
  .1     1
  no     0
  .      0
  +2.    1
  -2.    1
);

foreach my $double (keys %doubles) {
  language_output_is("tcl",<<"TCL",<<"OUT","string is double: $double");
    puts [string is double $double]
TCL
$doubles{$double}
OUT

}


language_output_is("tcl",<<'TCL',<<OUT,"string compare, bad args (1)");
   string compare
TCL
wrong # args: should be "string compare ?-nocase? ?-length int? string1 string2"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string compare, bad args (2)");
   string compare -length "aaa" "bbb"
TCL
wrong # args: should be "string compare ?-nocase? ?-length int? string1 string2"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string compare, bad args (3)");
   string compare -length 4 -length 8 "aaa" "bbb"
TCL
wrong # args: should be "string compare ?-nocase? ?-length int? string1 string2"
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string compare, same string");
   puts [string compare aaa aaa]
TCL
0
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string compare, \"lower\" string");
   puts [string compare aaa aab]
TCL
-1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string compare, \"higher\" string");
   puts [string compare aab aaa]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string compare, bigger string");
   puts [string compare aaaa aaa]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string compare, smaller string");
   puts [string compare aaa aaaa]
TCL
-1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string compare, different sizes, len specified");
   puts [string compare -length 3 aaa aaaa]
TCL
0
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string compare, different strings, len specified");
   puts [string compare -length 4 aaabc aaabb]
TCL
0
OUT


language_output_is("tcl",<<'TCL',<<OUT,"string compare, same string, different case");
   puts [string compare -nocase AAA aaa]
TCL
0
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string compare, \"lower\" string, different case");
   puts [string compare -nocase aaa AAB]
TCL
-1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string compare, \"higher\" string, different case");
   puts [string compare -nocase AAB aaa]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string compare, bigger string, different case");
   puts [string compare -nocase AAAA aaa]
TCL
1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string compare, smaller string, different case");
   puts [string compare -nocase AAA aaaa]
TCL
-1
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string compare, different sizes, len specified, different case");
   puts [string compare -length 3 -nocase aaa AAAA]
TCL
0
OUT

language_output_is("tcl",<<'TCL',<<OUT,"string compare, different strings, len specified, different case");
   puts [string compare -length 4 -nocase AAABC aaabb]
TCL
0
OUT


language_output_is("tcl",<<'TCL',<<OUT,"string compare, same string, different case");
   puts [string compare AAAA aaaa]
TCL
-1
OUT

