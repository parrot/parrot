#! ruby

class Foo
	def initialize()
		@i = 10
		@j = 20
	end
	def i
		@i
	end
	def j
		@j
	end
end

o = Foo.new
(1..500000).each{ x = o.i; y = o.j }
puts o.i



