#!perl

# the following lines re-execute this as a tcl script
# the \ at the end of these lines makes them a comment in tcl \
use lib qw(languages/tcl/lib tcl/lib lib ../lib ../../lib); # \
use Tcl::Test; #\
__DATA__

source lib/test_more.tcl
plan 9

is [lrepeat 1 a]   a         {1x1}
is [lrepeat 1 a b] {a b}     {1x2}
is [lrepeat 2 a]   {a a}     {2x1}
is [lrepeat 2 a b] {a b a b} {2x2}

is [lrepeat 2 [list a b]] {{a b} {a b}} {nested lists}


eval_is {lrepeat} \
  {wrong # args: should be "lrepeat positiveCount value ?value ...?"} \
  {too few args}

eval_is {lrepeat -1 2} \
  {must have a count of at least 1} \
  {negative count}

eval_is {lrepeat 0 2} \
  {must have a count of at least 1} \
  {zero count}

eval_is {lrepeat 0.2 2} \
  {expected integer but got "0.2"} \
  {noninteger count}







