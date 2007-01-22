#!perl

# the following lines re-execute this as a tcl script
# the \ at the end of these lines makes them a comment in tcl \
use lib qw(languages/tcl/lib tcl/lib lib ../lib ../../lib); # \
use Tcl::Test; #\
__DATA__

source lib/test_more.tcl
plan 3

eval_is {gets} \
  {wrong # args: should be "gets channelId ?varName?"} \
  {no args}

eval_is {gets a b c} \
  {wrong # args: should be "gets channelId ?varName?"} \
  {too many args}

eval_is {gets #parrot} \
  {can not find channel named "#parrot"} \
  {bad channel}

# RT#40628: Need to test actually reading something in.
