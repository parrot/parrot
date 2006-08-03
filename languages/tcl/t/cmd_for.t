#!../../parrot tcl.pbc

source lib/test_more.tcl
plan 8

eval_is {
 set r ""
 for {set a 0} {$a < 5} {incr a} {
   set r [append r $a]
 }
 set r
} 01234 {simple for}

eval_is {
 set r ""
 set a {set r [append r $i]}
 for {set i 0} {$i < 5} {set i [expr $i+1]} $a
 set r
} 01234 {variable for last arg}

eval_is {
  set r ""
  for {set x 11} {$x < 10} {incr x} {set r [append r $x]}
  set r
} {} {test not met initially}

eval_is {for} \
  {wrong # args: should be "for start test next command"} \
  {no args}

eval_is {for pete's} \
  {wrong # args: should be "for start test next command"} \
  {one args}

eval_is {for pete's sake} \
  {wrong # args: should be "for start test next command"} \
  {two args}

eval_is {for pete's sake don't} \
  {wrong # args: should be "for start test next command"} \
  {three args}

eval_is {for pete's sake don't do that.} \
  {wrong # args: should be "for start test next command"} \
  {too many args}

