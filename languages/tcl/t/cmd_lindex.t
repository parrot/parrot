#!../../parrot tcl.pbc

source lib/test_more.tcl
plan 12

is [lindex {}] {} {no list, no indices}
is [lindex {a b c}] {a b c} {list, no indices}
is [lindex [list a b c] 1] b {lindex with list}
is [lindex "a b c" 1] b {lindex with string}
is [lindex {{a b} {b c}} 1] {b c} {multi-level, single index}
is [lindex "a {a b} c" {1 1}] b {multi-level, single 2-d index}
is [lindex "a {a b} c" 1 1] b {multi-level, multi index}
is [lindex "a b c" -1] {} {negative index}
is [lindex "a b c" 5]  {} {index larger than the list}

eval_is {lindex} \
  {wrong # args: should be "lindex list ?index...?"} \
  {lindex too few args}

eval_is {lindex a bogus} \
  {bad index "bogus": must be integer?[+-]integer? or end?[+-]integer?} \
  {non numeric index}

eval_is {lindex {1 2 3} \{} \
  "bad index \"{\": must be integer?\[+-]integer? or end?\[+-]integer?" \
  {try bad lists as indices}
