#!perl

# the following lines re-execute this as a tcl script
# the \ at the end of these lines makes them a comment in tcl \
use lib qw(languages/tcl/lib tcl/lib lib ../lib ../../lib); # \
use Tcl::Test; #\
__DATA__

source lib/test_more.tcl
plan 6

eval_is {while} \
  {wrong # args: should be "while test command"} \
  {while no arg}

eval_is {while we} \
  {wrong # args: should be "while test command"} \
  {while one arg}

eval_is {while we wait outside} \
  {wrong # args: should be "while test command"} \
  {while too many args}

eval_is {while {"foo"} {}} \
  {expected boolean value but got "foo"} \
  {boolean test}

eval_is {
  set a 3
  set r {}
  while {$a} {
    set r "$r$a"
    incr a -1
  }
  set r
} {321} {simple while}

eval_is {
 set a ""
 set i 1
 while {$i < 6} "append a *;  incr i"
 set a
} {*****} {while with semicolons, command in quotes}
