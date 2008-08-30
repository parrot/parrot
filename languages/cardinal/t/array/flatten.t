puts "1..8"

a = [ 1, 2 ]

b = [ [ 3, 4 ], [ 5, 6 ] ]

c = [ a, b, 7, 8]


c = c.flatten

if c.length == 8
	c.each() do |x|
		puts 'ok ', x
	end
else
	puts "nok 1..8"
end
