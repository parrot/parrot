puts "1..12"

#a = [ 1, 2, 3, 4 ]
a = Array.new()
a << 1
a << 2
a << 3
a << 4

a.each() do |i|
    puts 'ok ', i
end

a.clear
5.upto(12){ |i|
	a << i

}

a.each() do |i|
    puts 'ok ', i
end
