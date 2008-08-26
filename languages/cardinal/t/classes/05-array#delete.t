puts "1..3"

a = [ "a", "b", "c", "d" ]

puts "ok 1" if a.delete("d") == "d"
puts "ok 2" if a.delete("z") == nil
puts "ok 3" if a.delete("zZ"){ "no such element" } ==  "no such element"
