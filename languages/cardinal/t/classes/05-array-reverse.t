puts "1..12"

a = Array.new()
a << 6
a << 5
a << 4
a << 3
a << 2
a << 1

a = a.reverse
unless a[0] != 1
	a.each() do |i|
	    puts 'ok ', i
	end
end

a = a.reverse
unless a[0] != 6
	a.reverse!
	a.each() do |i|
	    puts 'ok ', i + 6
	end
end
