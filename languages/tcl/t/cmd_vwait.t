#!perl

# the following lines re-execute this as a tcl script
# the \ at the end of these lines makes them a comment in tcl \
use lib qw(languages/tcl/lib tcl/lib lib ../lib ../../lib); # \
use Tcl::Test; #\
__DATA__

source lib/test_more.tcl

plan 2

set TODO {TODO "vwait not implemented yet"}

eval_is {vwait} \
  {wrong # args: should be "vwait name"} \
  {too few args} \
  $TODO

eval_is {vwait foo bar} \
  {wrong # args: should be "vwait name"} \
  {too many args} \
  $TODO
