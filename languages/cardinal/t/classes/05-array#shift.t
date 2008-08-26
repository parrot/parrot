puts "1..6"

a = [4, 5, 6]

a.unshift(3)
a.unshift(1, 2)
cur = a.shift
puts "ok 1" if cur == 1
cur = a.shift
puts "ok 2" if cur == 2
cur = a.shift
puts "ok 3" if cur == 3
cur = a.shift
puts "ok 4" if cur == 4
cur = a.shift
puts "ok 5" if cur == 5
cur = a.shift
puts "ok 6" if cur == 6
