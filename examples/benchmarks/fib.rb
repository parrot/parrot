#! ruby
#
# this algorithm is so dumb!
# it even hurts to write this equivalent to fib.pl

def fib(n)
	return n if (n < 2)
	return fib(n - 1) + fib(n - 2)
end

N = Integer( ARGV.shift || 28 )

puts "fib(#{N}) = #{ fib(N) }"
