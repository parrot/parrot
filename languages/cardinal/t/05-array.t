puts "1..6"

a = [ 1, 2 ]

a.each() do |i|
    puts 'ok ', i
end

b = [ [ 3, 4 ], [ 5, 6 ] ]

b.each() do |x|
    x.each() do |y|
        puts 'ok ', y
    end
end
