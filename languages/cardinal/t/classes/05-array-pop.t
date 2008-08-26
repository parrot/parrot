puts "1..6"

a = [6, 5, 4]
a.push(3)
a.push(2, 1)
cur = a.pop
puts "ok 1" if cur == 1
cur = a.pop
puts "ok 2" if cur == 2
cur = a.pop
puts "ok 3" if cur == 3
cur = a.pop
puts "ok 4" if cur == 4
cur = a.pop
puts "ok 5" if cur == 5
cur = a.pop
puts "ok 6" if cur == 6
