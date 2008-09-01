require 'test'
plan 6

a = [ 1, 1, 2, 2, 3, 3, 1, 2, 3, 1, 2, 3]
a = a.uniq

counter = 1
a.each() do |i|
	is i, counter, 'uniq'
    counter += 1
end

b = [ 4, 4, 5, 5, 5, 6, 4, 5, 6]
b.uniq!
b.each() do |y|
	is y, counter, 'uniq!'
    counter += 1
end
