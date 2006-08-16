#!../../parrot tcl.pbc

source lib/test_more.tcl
plan 33

eval_is {info} \
  {wrong # args: should be "info option ?arg arg ...?"} \
  {info no subcommand}

eval_is {info bork} \
  {bad option "bork": must be args, body, cmdcount, commands, complete, default, exists, functions, globals, hostname, level, library, loaded, locals, nameofexecutable, patchlevel, procs, script, sharedlibextension, tclversion, or vars} \
  {info bad subcommand}

eval_is {info args} \
  {wrong # args: should be "info args procname"} \
  {info args bad param}

eval_is {info args a b c} \
  {wrong # args: should be "info args procname"} \
  {info args bad param too many}

eval_is {
  proc me {} { puts 2 }
  info args me
} {} {info args no args}

eval_is {
  proc me {a} { puts 2 }
  info args me
} {a} {info args one var}

eval_is {
  proc me {a b c args} { puts 2 }
  info args me
} {a b c args} {info args multi args}

catch {rename me ""}
eval_is {
  info args me
} {"me" isn't a procedure} {info args no proc}

eval_is {
  proc foo {a {b 2}} {puts a; puts b}
  info args foo
} {a b} {info args default args}

eval_is {
  info body
} {wrong # args: should be "info body procname"} {info body no args}

eval_is {
  info body a b
} {wrong # args: should be "info body procname"} {info body too many args}

eval_is {
  info body bork
} {"bork" isn't a procedure} {info body bad proc}

eval_is {

proc say {a} {
  puts $a
  #fun
}

 info body say
} {
  puts $a
  #fun
} {info body normal proc}

eval_is {info functions a b} \
  {wrong # args: should be "info functions ?pattern?"} \
  {info functions too many args}

is [lsort [info functions]] \
  {abs acos asin atan atan2 bool ceil cos cosh double exp floor fmod hypot int log log10 pow rand round sin sinh sqrt srand tan tanh wide} \
  {info functions basic}

is [info functions s??t] {sqrt} {info functions pattern}

eval_is {info exists} \
  {wrong # args: should be "info exists varName"} \
  {info exists no args}

eval_is {info exists a b c} \
  {wrong # args: should be "info exists varName"} \
  {info exists too many args}

is [set a 1; info exists a] 1 {info exists true}
catch {unset a}
is [info exists a] 0 {info exists false}

eval_is {info tclversion v} \
  {wrong # args: should be "info tclversion"} \
  {info tclversion too many args}

is [expr [info tclversion] == [set tcl_version]] 1 {info tclversion}

eval_is {info commands a b} \
  {wrong # args: should be "info commands ?pattern?"} \
  {info commands too many args}

is [info commands info] info {info commands exact}
is [info commands inf?] info {info commands glob}

eval_is { info vars foo bar } \
  {wrong # args: should be "info vars ?pattern?"} \
  {info vars, bad args}

eval_is {
  proc test {a b} {
    set c 1
    set d 2
    lsort [info vars]
  }
  test 3 4
} {a b c d} {info vars} \
  {TODO "broken because of args"}

eval_is {
  proc test {a b} {
    set c 1
    set d 2
    set args 3
    lsort [info vars]
  }
  test 3 4
} {a args b c d} {info vars - with special args}

eval_is {info level a b} \
  {wrong # args: should be "info level ?number?"} \
  {info level - bad args}

eval_is {info level} 0 {info level - global}
eval_is {
  proc test {} { info level }
  test
} 1 {info level - 1}

eval_is {info level -1} {bad level "-1"} {info level - bad level}
eval_is {info level a} {expected integer but got "a"} {info level - not integer}
