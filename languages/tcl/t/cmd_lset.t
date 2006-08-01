#!../../parrot tcl.pbc

source lib/test_more.tcl
plan 11

eval_is {
  set a a
  lset a b
  set a
} b {two arg replace, check variable replacement}

eval_is {
  set a a
  lset a {} b
} b {three arg replace}


eval_is {
  set a "a b c"
  lset a 1 c
} {a c c} {one index}

eval_is {
  set a "a {b c} d"
  lset a 1 0 c
} {a {c c} d} {multiple indices}

eval_is {
  set a "a b c d"
  lset a end e
} {a b c e} {end}

eval_is {lset} \
  {wrong # args: should be "lset listVar index ?index...? value"} \
  {too few args}

eval_is {lset a} \
  {wrong # args: should be "lset listVar index ?index...? value"} \
  {too few args}

eval_is {lset frob b} \
  {can't read "frob": no such variable} \
  {bad variable}

eval_is {
  set a b
  lset a 3 b
} {list index out of range} \
  {list index out of range}

eval_is {
  set a "a b c d"
  lset a end--1 e
} {list index out of range} \
  {list index out of range}

eval_is {
  set a b
  lset a 3.2 b
} {bad index "3.2": must be integer?[+-]integer? or end?[+-]integer?} \
  {float index} 
