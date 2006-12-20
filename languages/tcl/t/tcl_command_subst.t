#!perl

# the following lines re-execute this as a tcl script
# the \ at the end of these lines makes them a comment in tcl \
use lib qw(languages/tcl/lib tcl/lib lib ../lib ../../lib); # \
use Tcl::Test; #\
__DATA__

source lib/test_more.tcl
plan 13

eval_is {
 set a 5
 set b [set a]
} 5 {entire word}

eval_is {
 set a 5
 set b [set a]b
} 5b {beginning of word}

eval_is {
 set a 5
 set b b[set a]
} b5 {end of word}

eval_is {
 set a "St\[ring Parsing"
 set b $a
} {St[ring Parsing} {escaped bracket}

eval_is {
 set a "St\\\[ring Parsing"
 set b $a
} {St\[ring Parsing} {escaped backslash, escaped brace}

eval_is {
 set a [set b \[]
 set b $a
} {[} {embedded escaped open bracket}

eval_is {
 set a [set b \]]
 set b $a
} {]} {embedded escaped close bracket}

eval_is {
 set a "2 [set b 3]"
 set b $a
} {2 3} {command subst inside string}

eval_is {
 set b [set a [set b 2]]
} 2 {nested command sub}

eval_is {
 set b [set a "]"]
} {]} {] in quotes}

eval_is {
  set b [expr {4*[llength "]"]}]
} 4 {] in " in [expr]}

eval_is {
  set b [expr {4*"[llength "]"]"}]
} 4 {" in ] in " in [expr]}

eval_is {
  set b [
    set x {}
    set x 3
  ]
} 3 {newline after last command}
