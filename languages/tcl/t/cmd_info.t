#!perl

# the following lines re-execute this as a tcl script
# the \ at the end of these lines makes them a comment in tcl \
use lib qw(languages/tcl/lib tcl/lib lib ../lib ../../lib); # \
use Tcl::Test; #\
__DATA__

source lib/test_more.tcl
plan 52

eval_is {info} \
  {wrong # args: should be "info option ?arg arg ...?"} \
  {info no subcommand}

eval_is {info bork} \
  {bad option "bork": must be args, body, cmdcount, commands, complete, default, exists, frame, functions, globals, hostname, level, library, loaded, locals, nameofexecutable, patchlevel, procs, script, sharedlibextension, tclversion, or vars} \
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

eval_is {info body ::say} {
  puts $a
  #fun
} {info body should respect fully qualified procs}

eval_is {info functions a b} \
  {wrong # args: should be "info functions ?pattern?"} \
  {info functions too many args}

is [lsort [info functions]] \
  {abs acos asin atan atan2 bool ceil cos cosh double entier exp floor fmod hypot int isqrt log log10 max min pow rand round sin sinh sqrt srand tan tanh wide} \
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

catch {unset a}
set a(3) 4
is [info exists a(3)] 1 {info exists array}

eval_is {info tclversion v} \
  {wrong # args: should be "info tclversion"} \
  {info tclversion too many args}

is [expr {[info tclversion]} eq {[set tcl_version]}] 1 {info tclversion}

eval_is {info patchlevel v} \
  {wrong # args: should be "info patchlevel"} \
  {info patchlevel too many args}

is [expr {[info patchlevel]} eq {[set tcl_patchLevel]}] 1 {info patchlevel}

eval_is {info library v} \
  {wrong # args: should be "info library"} \
  {info library too many args}

is [expr {[info library]} eq {[set tcl_library]}] 1 {info library}

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
} {a b c d} {info vars}

eval_is {
  proc test {a b} {
    set c 1
    set d 2
    set args 3
    lsort [info vars]
  }
  test 3 4
} {a args b c d} {info vars - with special args}

eval_is {
  set a:b 2
  proc a {} {
    set q 2
    return [info vars]
  }
  list [a] [info vars *:*]
} {q a:b} {scope of info vars in proc and global}

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

eval_is {
  proc test {{optional ""}} { info level 0 }
  list [test] [test foo]
} {test {test foo}} {info level 0 - proc}

eval_is {namespace eval test {info level 0}} \
  {namespace eval test {info level 0}} \
  {info level 0 - namespace eval}

# [info defaults] tests...
proc defaults1 {a {b c} d} {}
eval_is {
  info default
} {wrong # args: should be "info default procname arg varname"} {no args}
eval_is {
  info default a
} {wrong # args: should be "info default procname arg varname"} {1 args}
eval_is {
  info default a b
} {wrong # args: should be "info default procname arg varname"} {2 args}
eval_is {
  info default a b c d
} {wrong # args: should be "info default procname arg varname"} {4 args}
eval_is {
  info default bad_proc a a
} {"bad_proc" isn't a procedure} {invalid procedure}
eval_is {
  info default defaults1 x x
} {procedure "defaults1" doesn't have an argument "x"} \
  {invalid argument to a procedure}
eval_is {
  list [info default defaults1 b x] $x
} {1 c} {something with a default}
eval_is {
  catch {unset x}
  list [info default defaults1 a x] $x
} {0 {}} {something without a default}

like [info nameofexecutable] parrot {basic exec name}
eval_is {info nameofexecutable 1} \
  {wrong # args: should be "info nameofexecutable"} {too many args}

