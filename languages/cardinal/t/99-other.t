require 'test'
plan 8

n = 5

a = 1
n.downto(1) do |i|
    is 6-i, a, "downto"
    a += 1
end

def foo
    return [ 9, 6, 7 ]
end

foo[1].upto(7) { |i| is i, a, "method on array access of the result of calling a function"
                     a += 1}

a = do |a,&f|
    f(a)
end

a(8) do |i|
    pass "do block that accepts a block parameter"
end
