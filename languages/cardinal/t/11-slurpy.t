require 'test'
plan 4

def foo(*n)
    is n.WHAT, Array, "slurpy param is an array"
    i = 0
    n.each do |a|
        is a, i, "slurpy item"
        i += 1
    end
end

foo(0,1,2)
