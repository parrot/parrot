require 'test'
plan 12

i = 1
while i < 5
    ok(i < 5, 'while loop')
    i = i + 1
end

a = [ 5, 6, 7, 8 ]

for i in a
    ok(i < 9, 'for loop')
end

a = [1,2,3,4,5,6,7,8]

for i in a
    next if i % 2
    nok(i % 2, 'next in for loop')
end

