puts "1..7"

n = 5

n.downto(1) do |i|
    puts "ok ", 6-i
end

def foo
    return [ 9, 6, 7 ]
end

foo()[1].upto(7) { |i| puts "ok ", i }
