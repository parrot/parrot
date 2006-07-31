#!/usr/bin/perl

use strict;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 79;
use Parrot::Config;
use Test::More;

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


language_output_is("tcl",<<'TCL',<<OUT,"string compare, different strings, len specified");
   string compare -length four aaabc aaabb
TCL
wrong # args: should be "string compare ?-nocase? ?-length int? string1 string2"
OUT


language_output_is("tcl",<<'TCL',<<OUT,"string compare, different strings, len specified");
   string compare -length -10 aaabc aaabb
TCL
wrong # args: should be "string compare ?-nocase? ?-length int? string1 string2"
OUT


language_output_is("tcl",<<'TCL',<<OUT,"string compare, different strings, len specified");
   string compare -length 4.2 aaabc aaabb
TCL
wrong # args: should be "string compare ?-nocase? ?-length int? string1 string2"
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

SKIP: {
    skip("not implemented yet", 3);
language_output_is("tcl", <<'TCL', <<'OUT', "string wordend, from beginning");
  puts [string wordend "foo bar baz" 0]
TCL
3
OUT

language_output_is("tcl", <<'TCL', <<'OUT', "string wordend, numerics and underscores");
  puts [string wordend "foo bar99_baz" 5]
TCL
13
OUT

language_output_is("tcl", <<'TCL', <<'OUT', "string wordend, space");
  puts [string wordend "foo bar" 3]
TCL
4
OUT
}
