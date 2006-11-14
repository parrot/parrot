#!../../parrot tcl.pbc

source lib/test_more.tcl

plan 2

set TODO {TODO "vwait not implemented yet"}

eval_is {vwait} \
  {wrong # args: should be "vwait name"} \
  {too few args} \
  $TODO

eval_is {vwait foo bar} \
  {wrong # args: should be "vwait name"} \
  {too many args} \
  $TODO
