#!perl

# the following lines re-execute this as a tcl script
# the \ at the end of these lines makes them a comment in tcl \
use lib qw(languages/tcl/lib tcl/lib lib ../lib ../../lib); # \
use Tcl::Test; #\
__DATA__

source lib/test_more.tcl
plan 5

eval_is {error} \
  {wrong # args: should be "error message ?errorInfo? ?errorCode?"} \
  {error no args}

eval_is {error a b c d} \
  {wrong # args: should be "error message ?errorInfo? ?errorCode?"} \
  {error too many args}

eval_is {error dead} dead {simple error}

eval_is {
  global errorInfo
  global errorCode
  catch { error "dead" eek }
  list $errorInfo $errorCode
} {eek NONE} {error with info}

eval_is {
  global errorInfo
  global errorCode
  catch { error "dead" eek mouse}
  list $errorInfo $errorCode
} {eek mouse} {error with code}
