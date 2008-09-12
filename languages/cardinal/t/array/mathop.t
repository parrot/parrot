require 'test'
plan 10

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

a = [ 25, 50, 75, 100, 125 ]
b = [ 25, 50 ]
c = a - b
is c, [ 75, 100, 125 ], 'Array subtraction'
langs = [ "parrot", "perl", "erlang", "java" ]
minus = [ "java", "perl", "erlang" ]
langs = langs - minus
is langs, ["parrot"], 'Array subtraction'

