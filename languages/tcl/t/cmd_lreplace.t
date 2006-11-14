#!../../parrot tcl.pbc

source lib/test_more.tcl

plan 7

set TODO {TODO "[lreplace] is broken"}

eval_is {lreplace list first} \
  {wrong # args: should be "lreplace list first last ?element element ...?"} \
  {too few args}

is [lreplace {a b c} 1 1]   {a c}   {delete 1}
is [lreplace {a b c} 1 1 d] {a d c} {replace 1}

eval_is {lreplace list 1 0} \
  {list doesn't contain element 1} \
  {doesn't contain element} \
  $TODO

is [lreplace {a b c} -1  0] {b c}   {first negative}
is [lreplace {a b c} -1 -2] {a b c} {both negative} $TODO
is [lreplace {a b c} end-1 end d] {a d} {end replace} $TODO
