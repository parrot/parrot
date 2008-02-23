print "1..4\n"

def first
    print "ok 1"
end

def second(n)
    print "ok ", n
end

def third(a,b)
    second(a)
    second(b)
end

first()
second(2)
third(3,4)
