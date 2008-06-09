puts '1..4'

class OkayOnCreate
    def initialize(a)
        puts 'ok ', a
        self
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
        self
    end

    def inc
        @num = @num + 1
    end
end

b = OkaySayer.new(2)

b.speak()
b.setnum(3)
b.speak()
b.inc()
b.speak()
