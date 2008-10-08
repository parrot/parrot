require 'test'
plan 5
j = 0
5.times do |i|
	is i, j, '.times on Integer'
	j += 1
end
