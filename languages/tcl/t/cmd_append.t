#!../../parrot tcl.pbc

source lib/test_more.tcl

plan 8

is [set a 2; append a]       2 {var only}
is [set a 1; append a 2]    12 {append once}
is [set a 1; append a 2 3] 123 {append twice}
                               #append chicken soup with rice.

is [set x ""; append x 1 2 abc "long string"] \
  {12abclong string} {empty with several args}

eval_is {
  catch {unset x}
  append x 1 2 abc "long string"
} {12abclong string} {unset variable}

eval_is {append} \
  {wrong # args: should be "append varName ?value value ...?"} \
  {no args}

eval_is {
 set x ""
 append x(0) 44
} {can't set "x(0)": variable isn't array} {no args}

# Tcl currently throws an error for this code
# but a bug has been filed for it at http://tcl.sf.net (#1227172)
eval_is {
 catch {unset x}
 append x
} {can't read "x": no such variable} {append unset variable}
