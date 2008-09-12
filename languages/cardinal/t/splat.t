require 'test'
plan 15
# 1.8 syntax does not test more elaborate 1.9 splat syntax

def nosplat(first, rest)
  rest.each() do |x| 
     is x, x, 'splat'
  end
  first
end

def splat(first, *rest)
  rest.each() do |x| 
     is x, x, 'splat'
  end
  first
end

a = [ 1, 2, 3 ]
returned = nosplat(4, a)
is returned, 4, 'splat'

returned = splat(7, 5, 6)
is returned, 7, 'splat'
returned = splat(8)
is returned , 8, 'splat'

b = [11, 10, 9]
returned = splat(*b)
is returned, 11, 'splat'

returned = splat(b)
is returned, [11, 10, 9], 'splat'

def dec_three_ary(start) 
	a = []
	a << start
	a << start - 1
	a << start - 2
	a
end

returned = splat(*dec_three_ary(15))
is returned, 15, 'splat'

