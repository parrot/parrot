require 'test'
plan 2

def invokeLikeSo(a)
	yield a
	yield 2
end


invokeLikeSo(1) { |x| is x, x, 'yield block test' }
