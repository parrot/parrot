#
# Exercise the various substitution and quoting modes
#

set a "St\[ring Parsing"
puts $a
puts -nonewline "[set a]XX[set a]"
puts " "
puts [set a] 

# Command substituion

append b [set a] " stuff\n" ;

puts $b

set a {
  set b {
    set c
  }
  set d
}

puts $a
exit
