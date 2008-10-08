require 'test'
plan 8

a = Array.new()
a << 1
a << 2
a << 3

n = 1
a.each() do |i|
    is i, n, '<< on Array'
    n += 1
end

a.clear
4.upto(8){ |i|
	a << i
}

n = 4
a.each() do |i|
    is i, n, '.clear on Array'
    n += 1
end
