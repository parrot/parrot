#!perl

# the following lines re-execute this as a tcl script
# the \ at the end of these lines makes them a comment in tcl \
use lib qw(languages/tcl/lib tcl/lib lib ../lib ../../lib); # \
use Tcl::Test; #\
__DATA__

source lib/test_more.tcl

plan 15

eval_is {
 set a 2
 incr a
 set a
} 3 simple

eval_is {
 set a 1
 incr a 5
 set a
} 6 offset

eval_is {
 set a 2
 incr a -1
 set a
} 1 {negative offset}

eval_is {
 set a 1
 incr a
} 2 {return value}

eval_is {
 set a -2
 incr a
 set a
} -1 {negative base}


eval_is {
 set a 2
 incr a +3
 set a
} 5 {explicit positive offset}

eval_is {
 set a 1
 incr a 3 2
 set a
} {wrong # args: should be "incr varName ?increment?"} {too many args}

eval_is {
 set a 1
 incr
 puts $a
} {wrong # args: should be "incr varName ?increment?"} {too few args}

eval_is {
  set a 1
  incr a a
} {expected integer but got "a"} {expected integer, got alpha}

# This test fails in tclsh8.5a5:
# https://sourceforge.net/tracker/?func=detail&atid=110894&aid=1602991&group_id=10894
eval_is {
  set a 1
  incr a 1.5
} {expected integer but got "1.5"} {expected integer, got float}

# as of 8.5, this autovivifies the variable
eval_is {
  catch {unset a}
  incr a
} 1 {no such variable} {TODO {not changed yet. this will require some work}}


# Uses the same parsing mechanism as
# [expr <octal>] - all the edge cases are tested there.
eval_is {
  set i 25
  incr i 000012345
  set i
} 5374 {octal offset}

eval_is {
  set x foo
  incr x
} {expected integer but got "foo"} {not an int}

eval_is {
  set x {   14   }
  incr x
  set x
} 15 {space padded int}

eval_is {
  set x 0xff
  incr x
  set x
} 256 {hex variable}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
