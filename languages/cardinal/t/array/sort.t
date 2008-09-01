require 'test'
plan 8

a = [ 2, 1, 3 ]
a = a.sort
a.each_with_index() do |x, i|
    is i, x - 1, 'sort'
end
b = [ 6, 4, 5 ]
b.sort!
b.each_with_index() do |x, i|
    is i, x - 4, 'sort!'
end
c = [ 10, 9, 7, 5, 4, 3, 6, 2, 1, 8]
c = c.sort { |x, y| x <=> y }
is c[-4], 7, 'custom sort function'
is c[-3], 8, 'custom sort function'
