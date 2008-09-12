require 'test'
plan 3

class NumberHolder
    def initialize(n)
        @num = n
    end

    def inc
        @num = @num + 1
    end
    alias_method :increment, :inc

    def num
      	@num
    end
end

obj = NumberHolder.new(0)
is obj.inc, 1, 'alias_method'
is obj.increment, 2, 'alias_method'
