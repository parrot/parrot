puts '1..7'

class OkayOnCreate
    def initialize(a)
        puts 'ok ', a
    end
end

a = OkayOnCreate.new(1)

class OkaySayer
    def speak
        puts 'ok ', @num
    end

    def setnum(n)
        @num = n
    end

    def initialize(n)
        @num = n
    end

    def inc
        @num = @num + 1
    end

    def num()
        @num
    end

    def num=(val)
        @num = val
    end
end

b = OkaySayer.new(2)

b.speak
b.setnum(3)
b.speak
b.inc
b.speak
b.num = b.num + 1
puts "ok ", b.num

class StaticTester
    def num()
        @@num
    end
    def num=(var)
        @@num = var
    end
    def speak()
        puts "ok ", @@num
    end
end

x = StaticTester.new
x.num = 6
y = StaticTester.new
y.speak
y.num = y.num + 1
x.speak
