puts "1..4"

a = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
b = a.slice(1, 4)
if b.size == 4
	puts "ok 1" if b[0] == 1
	puts "ok 2" if b[1] == 2
	puts "ok 3" if b[2] == 3
	puts "ok 4" if b[3] == 4
end

#puts "todo 5" if a.slice(100) == nil
