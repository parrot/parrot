puts "1..6"

a = [ 1, 2 ]

a.each() do |i|
    puts 'ok ', i
end

b = [ [ 3, 4 ], [ 5, 6 ] ]

puts "ok 3" if b[0].include?(3)
puts "ok 4" if b[0].include?(4)
puts "ok 5" if b[1].include?(5)
puts "ok 6" if b[1].include?(6)
