#!../../parrot tcl.pbc

source lib/test_more.tcl
plan 4

eval_is {eval} \
  {wrong # args: should be "eval arg ?arg ...?"} \
  {no args}

eval_is {
 eval "set a 2"
} 2 {single arg}

eval_is {
 eval set a 2
} 2 {multiple args}

eval_is {
 eval set a 2
 set a
} 2 {multiple args, verify side effects}
