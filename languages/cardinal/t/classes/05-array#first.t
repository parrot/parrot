puts "1..4"

a = [ 1, 2, 3, 4, 5, 6 ]

puts "ok 1" if a.first == 1
puts "ok 2" if a.first(1) == [1]
b = a.first(3)
puts "ok 3" if b.size == 3
puts "ok 4" if b == [1,2,3]
