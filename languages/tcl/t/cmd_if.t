#!perl

# the following lines re-execute this as a tcl script
# the \ at the end of these lines makes them a comment in tcl \
use lib qw(languages/tcl/lib tcl/lib lib ../lib ../../lib); # \
use Tcl::Test; #\
__DATA__

source lib/test_more.tcl
plan 20

eval_is {
 set a ""
 if { 1 == 1 } {
   set a true
 } {
   set a false
 }
 set a
} true {simple if}

eval_is {
 set a ""
 if { 1 == 1 } {
   set a true
 } else {
   set a false
 }
 set a
} true {if/else}

eval_is {
 set a ""
 if { 1 != 1 } then {
   set a true
 } {
   set a false
 }
 set a
} false {simple if with then}

eval_is {
 set a ""
 if { 1 == 1 } then {
   set a true
 } else {
   set a false
 }
 set a
} true {simple if with then, else}

eval_is {
 set a ""
 if { 1 != 1 } then {
   set a true
 } elseif { 2==2 } {
   set a blue
 }
 set a
} blue {if with then, elseif}

eval_is {
  set a ""
  if 0 then {
    set a if
  } elseif 1 then {
    set a elseif
  }
  set a
} elseif {if with then, elseif with then}

eval_is {
 set a ""
 if { 1 != 1 } then {
   set a true
 } elseif { 2 != 2 } {
   set a blue
 } else {
   set a whee
 }
 set a
} whee {if with then, elseif, else}

eval_is {
 set a ""
 if { 1 != 1 } {
   set a 1
 } elseif { 2 != 2 } {
   set a 2
 } {
   set a 3
 }
 set a
} 3 {if with elseif, implicit else}

eval_is {
 set a ""
 if { 1 != 1 } {
   set a no
 }
 set a
} {} {if with implicit then, false}

eval_is {
 set a ""
 if { 1 == 1 } {
   set a true
 }
 set a
} true {if with implicit then, true}

eval_is {
  set a ""
  if 0 then {
    set a then
  } elseif 0 {
    set a elseif
  }
  set a
} {} {nothing is true}

eval_is {
  if {"foo"} then {error moo}
} {expected boolean value but got "foo"} \
  {expected boolean}

eval_is {
  set a ""
  if 2 then {set a true}
  set a
} true {numeric non-0 is true}


eval_is {
  namespace eval lib {
    set val {}
    proc a {} {error ok}
    if {[a]} {}
  }
} ok {namespace resolution in cond}

eval_is {
  namespace eval lib {
    set val {}
    proc a {} {error ok}
    if 1 a
  }
} ok {namespace resolution in body}

eval_is {
  if {[error moo]&&1} {error oink} else
} {wrong # args: no expression after "else" argument} \
  {no expression after else, occurs before command invocation} \
  {SKIP {doesn't pass in tclsh8.5...}}

eval_is {
  if {[error moo]&&1} {error oink} elseif
} {wrong # args: no expression after "elseif" argument} \
  {no expression after elseif, occurs before command invocation} \
  {SKIP {doesn't pass in tclsh8.5...}}

eval_is {if {}} \
  {syntax error in expression "": premature end of expression} \
  {expression errors before [if] errors}

eval_is {if 0 then} \
  {wrong # args: no script following "then" argument} \
  {no script following then}

eval_is {if 0} \
  {wrong # args: no script following "0" argument} \
  {no script following conditional}

