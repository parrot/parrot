#! ruby

class Foo
	def initialize()
		@i = 10
		@j = 20
	end
	def i
		@i
	end
	def i=(i)
		@i = i
	end
	def j=(j)
		@j = j
	end
end

o = Foo.new
for i in 1..500000
  o.i = i
  o.j = i
end
puts o.i


