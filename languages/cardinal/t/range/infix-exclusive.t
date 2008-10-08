require 'test'
plan 3

r = 100...103
n = 100
r.each do |i|
p i
	is i, n, 'infix:... for Range'
	n += 1
end
