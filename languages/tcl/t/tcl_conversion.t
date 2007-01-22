#!perl

# the following lines re-execute this as a tcl script
# the \ at the end of these lines makes them a comment in tcl \
use lib qw(languages/tcl/lib tcl/lib lib ../lib ../../lib); # \
use Tcl::Test; #\
__DATA__

source lib/test_more.tcl
plan 12

is [llength {a
  "a b"
  		b {b c}		  c {c d}
  }] 6 {{} conversion to list" }

is [llength "a
  \"a b\"
  		b {b c}		  c {c d}
  "] 6 {"\ conversion to list}

set a "a {b c}  d"
is [ llength $a ]  3     {" conversion to list 1}
is [ lindex $a 1 ] {b c} {" conversion to list 1}
is [ lindex $a 2 ] d     {" conversion to list 1}
catch {unset a}

eval_is {lindex {{a b}3 4} 1} \
  {list element in braces followed by "3" instead of space} \
  "non space after }"

eval_is { lindex {{a b}3} 1} \
  {list element in braces followed by "3" instead of space} \
  "non space after }"

eval_is {lindex {"a b"3 4} 1} \
  {list element in quotes followed by "3" instead of space} \
  {non space after "}

eval_is {lindex {"a b"3} 1} \
  {list element in quotes followed by "3" instead of space} \
  {non space after "}


is [list \{\[] {\{\[} {[ in list}

is [lindex {"a \" b"} 0] {a " b} {escaped quote in quotes in list}

is [lindex {{a \" b}} 0] {a \" b} {escaped quote in sub-list}
