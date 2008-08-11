puts '1..10'

def okay (n) 
    puts 'ok ', n
end

a = [ 1, 2, 3, 4 ]

okay a.first
okay a.first(2).last
okay a.last(2).first
okay a.elems

a = [ 5, 6 ]

a.each() do |i|
    puts 'ok ', i
end

b = [ [ 7, 8 ], [ 9, 10 ] ]

b.each() do |x|
    x.each() do |y|
        puts 'ok ', y
    end
end
