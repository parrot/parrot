#!perl

# the following lines re-execute this as a tcl script
# the \ at the end of these lines makes them a comment in tcl \
use lib qw(languages/tcl/lib tcl/lib lib ../lib ../../lib); # \
use Tcl::Test; #\
__DATA__

source lib/test_more.tcl
plan 5

eval_is {time} \
  {wrong # args: should be "time command ?count?"} \
  {no args}

eval_is {time a b c} \
  {wrong # args: should be "time command ?count?"} \
  {too many args}

eval_is {time {set a} 3.2} \
  {expected integer but got "3.2"} \
  {float count}

like [time {expr 2+2}] {[0-9]+ microseconds per iteration} {return value}

eval_is {
 time {set a 2} 3
 set a
} 2 {verify code executed}
