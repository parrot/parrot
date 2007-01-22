#!perl

# the following lines re-execute this as a tcl script
# the \ at the end of these lines makes them a comment in tcl \
use lib qw(languages/tcl/lib tcl/lib lib ../lib ../../lib); # \
use Tcl::Test; #\
__DATA__

source lib/test_more.tcl
plan 7

eval_is {
  set a [list a b]
  lappend a
  set a
} {a b} {append nothing}

eval_is {
  set a [list a b]
  lappend a c
  set a
} {a b c} {append one}

eval_is {
  set a [list a b]
  lappend a c d e f g
  set a
} {a b c d e f g} {append multiple}

is [lappend x 1] 1 {new variable}

eval_is {lappend} \
  {wrong # args: should be "lappend varName ?value value ...?"} \
  {no args}

eval_is {
  set l {}
  lappend l a
  lappend l a
  lappend l a
  set l
} {a a a} {avoid segfaulting parrot}

eval_is {
  set x \"
  lappend x 1
} {unmatched open quote in list} {invalid list structure}
