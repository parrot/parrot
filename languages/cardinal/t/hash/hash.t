puts "1..5"
a = { "a" => "ok ", "b" => 1}

puts a["a"], a["b"]

b = { }
b['foo'] = 2
b['bar'] = a['a']
a['a'] = 'foo'

puts b['bar'], b[a['a']]

c = Hash.new('ok ')
c['b'] = 3

puts c['a'], c['b']

d = Hash.new() { |hash, key| puts 'ok 4'; hash[key] = 5 }

puts 'ok ', d['foo']
