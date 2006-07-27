#!../../parrot tcl.pbc

source lib/test_more.tcl
plan 12

# simple scalars
is [expr 42]     42   {int}
is [expr 4.2]     4.2 {float}
is [expr 4.0]     4.0 {float stays float}
is [expr 3e2]   300.0 {scientific}
is [expr 3e0]     3.0 {scientific with 0 exponent}
is [expr 2.3e2] 230.0 {scientific with float base}
eval_is {expr 3e2.0} \
 {syntax error in expression "3e2.0": extra tokens at end of expression} \
 {can only e with an integer exponent}

# simple unary ops.
is [expr -2]  -2 {unary -}
is [expr +2]   2 {unary +}
is [expr ~0]  -1 {unary ~}
is [expr !2]   0 {unary !}
is [expr !!2]  1 {double unary !}
