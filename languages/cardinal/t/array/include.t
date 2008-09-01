puts "1..6"

a = [ 1, 2 ]

a.each() do |i|
    puts 'ok ', i
end

b = [ [ 3, 4 ], [ 5, 6 ] ]

puts "ok 3" if b[0].include?(3)
puts "ok 4" if not b[0].include?(400)
puts "ok 5" if !b[1].include?(500)
puts "ok 6" if b[1].include?(6)

#If working, the following lines will not print
puts "nok 7" if !b[1].include?(6)
puts "nok 8" if not b[0].include?(3)
puts "nok 9" if b[0].include?(100)
