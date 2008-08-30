puts "1..2"

a = [ 1, 2, 3 ]
b = a.join("-")
puts "ok 1" if b == "1-2-3"
b = a.join
puts "ok 2" if b == "123"
