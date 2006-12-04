#! ../../parrot tcl.pbc

source lib/test_more.tcl
plan 6

is [::set a ok]      {ok} {explicit global command}
is [:::::::set b ok] {ok} {explicit global command, extra colons}

proc ::: {} {return ok}
is [{}] ok {command name, all colons}

eval_is {
  :set c ok
} {invalid command name ":set"}\
{not enough colons, explicit global command}

eval_is {
  foo::bar
} {invalid command name "foo::bar"} \
{invalid ns command}

eval_is {
  proc test {} {return ok1}
  set a [namespace eval lib {test}]
  proc ::lib::test {} {return ok2}
  list $a [namespace eval lib {test}]
} {ok1 ok2} {relative namespace}
