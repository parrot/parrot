puts "1..8"
a = [ 6, 2, 1, 4, 3, 5 ]
a = a.sort
a.each_with_index() do |x, i|
	if i != (x - 1) 
		break
	end
	puts 'ok ', x
end
b = [ 5, 4, 2, 3, 1, 6 ]
b.sort!
b.each_with_index() do |x, i|
	if i != (x - 1) 
		break
	end
	if i >= 3
		puts 'ok ', x
	end 
end
c = [ 10, 9, 7, 5, 4, 3, 6, 2, 1, 8]
c = c.sort { |x, y| x <=> y }
puts "ok 7" if c[-4] == 7
puts "ok 8" if c[-3] == 8
