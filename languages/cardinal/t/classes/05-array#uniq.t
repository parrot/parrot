puts "1..6"

a = [ 1, 1, 2, 2, 3, 3, 1, 2, 3, 1, 2, 3]
a = a.uniq
a.each() do |i|
	puts 'ok ', i
end

b = [ 4, 4, 5, 5, 5, 6, 4, 5, 6]
b.uniq!
b.each() do |y|
	puts 'ok ', y
end
