#!perl

# the following lines re-execute this as a tcl script
# the \ at the end of these lines makes them a comment in tcl \
use lib qw(languages/tcl/lib tcl/lib lib ../lib ../../lib); # \
use Tcl::Test; #\
__DATA__

source lib/test_more.tcl
plan 19

eval_is {
 set a [proc me {} {
  return 2
 }]
 list [me] [set a]
} {2 {}} {return value}

eval_is {
 proc foo {} {
   append x {foo bar}
 }
 foo
} {foo bar} {return value from user-defined command}

eval_is {
 proc me {} {
  return 2
 }
 me
} 2 {no args}

eval_is {
 proc me {a} {
  return $a
 }
 me 2
} 2 {one arg}

eval_is {
 proc me {a b} {
  list $a $b
 }
 me 2 3
} {2 3} {two args}

eval_is {
 proc me {a b} {
  list $a $b
 }
 me 2 3 4
} {wrong # args: should be "me a b"} {too many args}

eval_is {
 proc me {a b} {
  list $a $b
 }
 me 2
} {wrong # args: should be "me a b"} {too few args}

eval_is {
  proc test {} {}
  test foo bar
} {wrong # args: should be "test"} {bad args - expected none}

eval_is {
 proc me {a b args} {
  list $a $b
 }
 me 2
} {wrong # args: should be "me a b ..."} {bad varargs}

eval_is {
 proc me {a args} {
  list $a $args
 }
 me 2 3 4 5 6
} {2 {3 4 5 6}} {vararg}

eval_is {
 proc me {a args} {
  list $a $args
 }
 me 2
} {2 {}} {vararg empty}

eval_is {
  rename incr incr_old
  proc incr {varName} {return $varName}
  proc test {} { incr a }
  set a [test]
  rename incr {}
  rename incr_old incr
  set a
} {a} {using a renamed builtin}

eval_is {
  proc a::b {} {puts a::b}
  a::b
} {can't create procedure "a::b": unknown namespace} {unknown namespace}

eval_is {
 proc me {{a 2}} {
  return $a
 }
 list [me] [me 7]
} {2 7} {default args}

eval_is {
 proc me {{a 2 3}} {
  return $a
 }
} {too many fields in argument specifier "a 2 3"} {bad default arg spec}

eval_is {
  proc test {{a 2} b} {list $a $b}
  test 3
} {wrong # args: should be "test ?a? b"} {default arg with too few args}

eval_is {
  proc test {{a 2}} {return $a}
  test 3 4
} {wrong # args: should be "test ?a?"} {default too many args}

eval_is {
  proc test {} {}
  set a 4
  catch {test foo}
  set a
} 4 {reset call_level on bad args}

eval_is {
 proc nothing {} {
    # empty proc
 }
} {} {empty procs are ok}
