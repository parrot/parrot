#!perl

# the following lines re-execute this as a tcl script
# the \ at the end of these lines makes them a comment in tcl \
use lib qw(languages/tcl/lib tcl/lib lib ../lib ../../lib); # \
use Tcl::Test; #\
__DATA__

source lib/test_more.tcl
plan 7

eval_is {
  catch {unset q}
  proc a {} {
    global q
    return ok
 }
 a
} ok {missing unreferenced global}

eval_is {
  catch {unset q}
  proc a {} {
    global q
    puts $q
 }
 a
} {can't read "q": no such variable} {missing global}

eval_is {
  catch {unset q}
  proc a {} {
    global q
    return $q
 }
 set q 2
 a
} 2 {one global}

eval_is {
  catch {unset q r s}
  proc a {} {
    global q r s
    return "$q $r $s"
 }
 set q 1
 set r 2
 set s 3
 a
} {1 2 3} {few globals}

eval_is {
  catch {unset a}
  proc j {} {
    global a
    set a 1
  }
  j
  set a
} 1 {vivify global}

eval_is {
 set a 4
 proc inca2 {} {
  global a
  set a [expr $a + 2]
 }
 set b $a
 inca2
 list $b $a
} {4 6} {changing value}

eval_is {
  catch {unset a}
  proc j {} {
    global a
  }
  j
  set a
} {can't read "a": no such variable} {nonvivifying global}
