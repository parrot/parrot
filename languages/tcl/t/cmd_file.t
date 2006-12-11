#!../../parrot tcl.pbc

source lib/test_more.tcl

plan 4

# [file exists]
eval_is {file exists} \
  {wrong # args: should be "file exists name"} \
  {too few args}

eval_is {file exists foo bar} \
  {wrong # args: should be "file exists name"} \
  {too many args}

# this should fail everywhere
is [file exists :%:/bar] 0 {does not exist}

# we really should create a file to test this, but since our "source" line
# above means we have to have that path to this file..
is [file exists lib/test_more.tcl] 1 {does exist}
