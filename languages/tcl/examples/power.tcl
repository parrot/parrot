#!/bin/sh
# \
exec ../../../parrot ../tcl.pbc "$0" "$@"

proc power {number power} {
  set val 1
  #puts "here"
  while {$power != 0} {
    set val [expr $val * $number]
    incr power -1
    #puts $val
  }
  return $val
}

power 10 2
set a [power 10 2]
puts "10**2 is $a"
set a [power 2 10]
puts "2**10 is $a"
