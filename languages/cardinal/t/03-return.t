puts "1..2"

def noargs
    return 1
end

puts "ok ", noargs()

def onearg(a)
    return a
end

puts onearg("ok "), onearg(2)
