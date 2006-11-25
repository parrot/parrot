#!../../parrot tcl.pbc

source lib/test_more.tcl

plan 3


# [file exists]
eval_is {file exists} \
  {wrong # args: should be "file exists name"} \
  {too few args}

eval_is {file exists foo bar} \
  {wrong # args: should be "file exists name"} \
  {too many args}

# this should fail everywhere
is [file exists :%:/bar] 0 {does not exist}
