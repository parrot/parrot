#! ruby

class A
   def fib(n)
       return n if (n < 2)
       return fibA(n - 1) + fibB(n - 2)
   end
   def fibA(n)
       return n if (n < 2)
       return fib(n - 1) + fibB(n - 2)
   end
end

class B < A
   def fibB(n)
       return n if (n < 2)
       return fib(n - 1) + fibA(n - 2)
   end
end

b = B.new

N = Integer( ARGV.shift || 28 )

puts "fib(#{N}) = #{ b.fib(N) }"
