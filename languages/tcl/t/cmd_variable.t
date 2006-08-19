#!../../parrot tcl.pbc

source lib/test_more.tcl

plan 7

eval_is {
  variable
} {wrong # args: should be "variable ?name value...? name ?value?"} \
  {bad args}

eval_is {variable foo} {} {variable's return value}

eval_is {
  catch {unset foo}
  catch {unset bar}
  variable foo 3 bar 5
  list $foo $bar
} {3 5} {variable foo 3 bar 5}

eval_is {
  catch {unset foo}
  variable foo
  set foo
} {can't read "foo": no such variable} \
  {variable foo}

eval_is {
  catch {unset foo}
  catch {unset bar}
  variable foo 3 bar
  list $foo [catch {set bar} msg] $msg
} {3 1 {can't read "bar": no such variable}} \
  {variable foo 3 bar}

eval_is {variable foo(bar)} \
  {can't define "foo(bar)": name refers to an element in an array} \
  {variable with array}

eval_is {
  proc test {} {
    variable x 5
    set x
  }
  list [test] [set x]
} {5 5} {variable is always about globals} \
  {TODO {can't handle this yet}}
