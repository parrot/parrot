#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 3;
use Test::More;


language_output_is("tcl",<<TCL,<<'OUT',"regexp no args");
regexp
TCL
wrong # args: should be "regexp ?switches? exp string ?matchVar? ?subMatchVar subMatchVar ...?"
OUT


TODO: {
  local $TODO="not implemented yet.";
  regexp_is  ("asdf","asdf","literal, t");
  regexp_isnt("asdf","fdsa","literal, f");
}


sub regexp_is   { regexp_check(@_,1); }
sub regexp_isnt { regexp_check(@_,0); }

sub regexp_check {
  my ($pattern,$string,$reason,$flag) = @_;

  language_output_is("tcl",<<"TCL",<<"OUT", $reason);

puts [regexp {$pattern} {$string}]

TCL
$flag
OUT

}

