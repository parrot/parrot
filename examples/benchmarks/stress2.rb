#! ruby


def buildarray()
	foo = Array.new
	10000.times { |i|
		foo[i] = i
	}
	foo
end

20.times { 
	a = Array.new
	10.times { |i|
		a[i] = buildarray
	}
}

