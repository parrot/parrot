#!../../parrot tcl.pbc

source lib/test_more.tcl
plan 4

eval_is {
 set result ""
 for {set a 0} {$a < 10} {incr a} {
   if {$a > 5} { continue }
   set result [append result $a]
 }
 list $a $result
} {10 012345} {continue from for}

eval_is {
 set result ""
 set a 0
 while {$a <= 10} {
   incr a
   if {$a < 5} { continue }
   set result [append result $a]
 }
 list $a $result
} {11 567891011} {continue from while}

eval_is {
  proc test {} {continue}
  test
} {invoked "continue" outside of a loop} \
  {continue outside of a loop}

eval_is {
  proc test {} {continue}
  for {set i 0} {$i < 5} {incr i} {test}
} {invoked "continue" outside of a loop} \
  {continue in a proc called in a loop}
