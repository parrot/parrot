#! ruby
#
# does the perl variant count as oo?
#

class Foo
	attr_reader :i, :j

	def initialize()
		@i = 10
		@j = 20
	end
end

(1..100000).each{ o = Foo.new }
o = Foo.new
puts o.i

