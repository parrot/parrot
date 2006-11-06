#!../../parrot tcl.pbc

source lib/test_more.tcl
plan 3

eval_is {gets} \
  {wrong # args: should be "gets channelId ?varName?"} \
  {no args}
 
eval_is {gets a b c} \
  {wrong # args: should be "gets channelId ?varName?"} \
  {too many args}

eval_is {gets #parrot} \
  {can not find channel named "#parrot"} \
  {bad channel}

# XXX (#40628): Need to test actually reading something in. 
