#! ruby


def buildarray()
	foo = Array.new
	10000.times { |i|
		foo[i] = i
	}
	foo
end

a1 = Array.new
10.times { |i|
	a1[i] = buildarray
}

a2 = Array.new
10.times { |i|
	a2[i] = buildarray
}

a3 = Array.new
10.times { |i|
	a3[i] = buildarray
}

