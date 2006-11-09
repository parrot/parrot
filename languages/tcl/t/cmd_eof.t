#!../../parrot tcl.pbc

source lib/test_more.tcl
plan 4

eval_is {eof} \
  {wrong # args: should be "eof channelId"} \
  {no args}

eval_is {eof a b} \
  {wrong # args: should be "eof channelId"} \
  {too many args}

eval_is {eof espn-ocho} \
  {can not find channel named "espn-ocho"} \
  {invalid channel}

is [eof stdin] 0 {eof an open channel}

# TODO (#40776): create test files and read from them, testing the eof condition.
