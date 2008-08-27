puts "1..12"

#a = [ 1, 2, 3, 4 ]
# For now we have to either use CardinalArray or [] until .HLL_map issues are worked out.
#a = Array.new()
a = []
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
