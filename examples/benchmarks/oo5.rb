#! ruby

class Foo
	attr_reader :i, :j

	def initialize()
		@i = 10
		@j = 20
	end
end

o = Foo.new
(1..500000).each{ x = o.i; y = o.j }
puts o.i



