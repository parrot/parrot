require 'test'
plan 6

a = [ 1, 2 ]

x = 1
a.each() do |i|
    ok i == x, 'Array#each'
    x += 1
end

b = [ [ 3, 4 ], [ 5, 6 ] ]

ok b[0].include?(3), 'Array#include'
nok b[0].include?(400), 'Array#include'
nok b[1].include?(500), 'Array#include'
ok b[1].include?(6), 'Array#include'
