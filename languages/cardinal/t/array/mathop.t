require 'test'
plan 8

a = [ 1, 2 ]
b = [ 3, 4]

c = a + b

index = 1
c.each() do |i|
    is i, index, "Array Addition"
    index += 1
end

c = b + a
c = c.collect{ |x| x + 4 }
c = c.sort
index = 5
c.each() do |i|
    is i, index, "collect"
    index += 1
end
