#!../../parrot tcl.pbc

source lib/test_more.tcl
plan 3

eval_is {format} \
  {wrong # args: should be "format formatString ?arg arg ...?"} \
  {format no args}

is [format "%05d" 12]              00012              {zero padding}
is [format "%-*s - %s" 10 foo bar] {foo        - bar} {format width check}
