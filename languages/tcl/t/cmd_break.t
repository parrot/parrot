#!../../parrot tcl.pbc

source lib/test_more.tcl

plan 2

eval_is {
 for {set a 0} {$a < 20} {incr a} {
   if {$a > 10} { break }
 }
 set a
} 11 {break from for}

eval_is {
 set a 20
 while {$a} {
   incr a -1
   if {$a < 10} { break }
 }
 set a
} 9 {break from while}
