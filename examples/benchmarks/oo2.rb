#! ruby

class Foo
	attr_reader :i, :j
	def initialize()
		@i = 10
		@j = 20
	end
end

(1..500000).each { o = Foo.new }
o = Foo.new
puts o.i
