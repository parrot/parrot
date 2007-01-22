#!perl

# the following lines re-execute this as a tcl script
# the \ at the end of these lines makes them a comment in tcl \
use lib qw(languages/tcl/lib tcl/lib lib ../lib ../../lib); # \
use Tcl::Test; #\
__DATA__

source lib/test_more.tcl
plan 7

# https://sourceforge.net/tracker/index.php?func=detail&aid=1534628&group_id=10894&atid=110894 {RESOLVED}
eval_is {lassign} \
  {wrong # args: should be "lassign list varName ?varName ...?"} \
  {no args}

eval_is {lassign {a b}} \
  {wrong # args: should be "lassign list varName ?varName ...?"} \
  {one args}

eval_is {
  set b [lassign {x y} a]
  list $a $b
} {x y} {singleton with one leftover}

eval_is {
  set b [lassign {x y z} a]
  list $a $b
} {x {y z}} {singleton with two leftovers}

eval_is {
  set c [lassign {x y z} a b]
  list $a $b $c
} {x y z} {double with a leftover}

eval_is {
  set d [lassign {x y z} a b c]
  list $a $b $c $d
} {x y z {}} {triple, no leftovers}

eval_is {
  set e [lassign {x y z} a b c d]
  list $a $b $c $d $e
} {x y z {} {}} {4 variables, not enough values}

