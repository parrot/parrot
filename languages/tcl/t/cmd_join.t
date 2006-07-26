#!../../parrot tcl.pbc

source lib/test_more.tcl

plan 7

eval_is {join} {wrong # args: should be "join list ?joinString?"} \
  {too few args}
eval_is {join 1 2 3} {wrong # args: should be "join list ?joinString?"} \
  {too many args}

is [join [list]]       {}      {join nothing}
is [join [list a]]     {a}     {join one}
is [join [list a b c]] {a b c} {join few}

is [join [list a b c] X]    {aXbXc}       {join with string}
is [join [list a b c] XXXX] {aXXXXbXXXXc} {join with long string}
