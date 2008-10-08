require 'test'
plan 3

r = 1..3
n = 1
r.each() do |i|
	is i, n, 'infix:.. for Range'
	n += 1
end
