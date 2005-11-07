#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 7;
use Test::More;

language_output_is("tcl",<<TCL,<<'OUT',"regexp no args");
regexp
TCL
wrong # args: should be "regexp ?switches? exp string ?matchVar? ?subMatchVar subMatchVar ...?"
OUT

# http://www.tcl.tk/man/tcl8.5/TclCmd/re_syntax.htm

TODO: {
  local $TODO="not implemented yet.";
  regexp_is  ("asdf","asdf","literal, t");
  regexp_isnt("asdf","fdsa","literal, f");

  regexp_is  ("a*","bbb",   "*, true");
  regexp_is  ("a*","bab",   "*, true");
  regexp_is  ("a*","baab",  "*, true");
  regexp_is  ("a*","baaab", "*, true");

  # +
  
  # ?

  # {m}

  # {m,}

  # {m,n}

  # *?

  # +?

  # {m}?

  # {m,}?

  # {m,n}?

  # m,n - restricted to 0, 255

  #(re)

  #(?:re) 

  #()

  #(?:)

  #[]

  #[^]

  #[a-z]

  #[a-c-e] (boom)

  #[:joe:]

  #[[:<:]]

  #[[:>:]]

  #.

  #\k

  #\c

  #{

  #x

  #^

  #$

  #(?=re)

  #(?!re)

  # Re may NOT end with \

  # \a

  # \b

  # \B

  # \cX

  # \e

  # \f

  # \n

  # \r

  # \t

  # \uwxyz

  # \Ustuvwxyz

  # \v

  # \xhhh 

  # \0

  # \xy
  
  # \xyz

  # \d
  
  # \s

  # \w

  # \D

  # \S

  # \W

  # Interaction of [] and \d: e.g. [a-c\d] vs. [a-c\D]

  # \A

  # \m

  # \M

  # \y

  # \Y

  # \Z

  # \m

  # \mnn

  # ***  (ARE)

  # ***= (literal)

  # (?b)

  # (?c)

  # (?e)

  # (?i)

  # (?m)

  # (?n)

  # (?p)

  # (?q)

  # (?s)

  # (?t)

  # (?w)

  # (?x)

  # Match earliest.

  # Match longest

  # BRE: |

  # BRE: +

  # BRE: ?

  # BRE: \{

  # BRE: \}

  # BRE: \(

  # BRE: \)

  # BRE: ^

  # BRE: $

  # BRE: *

  # BRE: \<

  # BRE: \>

  # -expanded

  # -indices

  # -line

  # -linestop

  # -lineanchor

  # -nocase

  # -all

  # -inline

  # -start

  # --

}



# Helper 

sub regexp_is   { regexp_check(@_,1) }
sub regexp_isnt { regexp_check(@_,0) }

sub regexp_check {
  my ($pattern,$string,$reason,$flag) = @_;

  language_output_is("tcl",<<"TCL",<<"OUT", $reason);
  
puts [regexp {$pattern} {$string}]

TCL
$flag
OUT
   }

