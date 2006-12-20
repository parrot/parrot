#!perl

# the following lines re-execute this as a tcl script
# the \ at the end of these lines makes them a comment in tcl \
use lib qw(languages/tcl/lib tcl/lib lib ../lib ../../lib); # \
use Tcl::Test; #\
__DATA__

source lib/test_more.tcl
plan 7

eval_is {llength} \
  {wrong # args: should be "llength list"} \
  {no arg}

eval_is {llength a b} \
  {wrong # args: should be "llength list"} \
  {too many args}


is [llength [list]] 0 {no elements}
is [llength [list a]] 1 {one elements}
is [llength [list a b]] 2 {two elements}
is [llength [list a b {c {d e}}]] 3 {braces}
is [llength [list a b "c {d e}"]] 3 {spaces}
