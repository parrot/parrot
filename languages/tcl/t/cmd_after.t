#!perl

# the following lines re-execute this as a tcl script
# the \ at the end of these lines makes them a comment in tcl \
use lib qw(languages/tcl/lib tcl/lib lib ../lib ../../lib); # \
use Tcl::Test; #\
__DATA__

source lib/test_more.tcl
plan 2

eval_is {after} \
  {wrong # args: should be "after option ?arg arg ...?"} \
  {after - no args}

is [after 10; expr 1] 1 {after - simple delay}
