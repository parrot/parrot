puts "1..8"

n = 5

n.downto(1) do |i|
    puts "ok ", 6-i
end

def foo
    return [ 9, 6, 7 ]
end

foo[1].upto(7) { |i| puts "ok ", i }

a = do |a,&f|
    f(a)
end

a(8) do |i|
    puts 'ok ', i
end
