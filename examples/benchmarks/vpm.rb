#! ruby

big = 0
string = "just another ruby hacker"

100000.times {
	big += 1
	str = string.split(//)
	f = str.shift
	str.push f
	string = str.join('')
}

puts big, string

