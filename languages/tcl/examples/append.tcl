set a bar
append a " baz " "whee"
puts $a
append a this is fun, isn't it?
puts $a
set a 2
puts [append a]
puts "---"
set a 1
puts [append a 2 3 ]
puts "---"
set a 1
set b [append a 2]
puts $b

