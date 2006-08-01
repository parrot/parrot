#!../../parrot tcl.pbc

source lib/test_more.tcl
plan 4

is [lindex [list a b c] 1] b {lindex with list}
is [lindex "a b c" 1] b {lindex with string}
is [lindex "a {a b} c" {1 1}] b {lindex with multiple indices}

eval_is {lindex a bogus} \
  {bad index "bogus": must be integer?[+-]integer? or end?[+-]integer?} \
  {non numeric index}
