require 'test'
plan 10

a = [ 1, 2, 3, 4 ]

is a.first, 1
is a.first(2).last, 2
is a.last(2).first, 3
is a.elems, 4

a = [ 5, 6 ]

n = 5

a.each() do |i|
    is i, n
    n += 1
end

b = [ [ 7, 8 ], [ 9, 10 ] ]

b.each() do |x|
    x.each() do |y|
        is y, n
        n += 1
    end
end
