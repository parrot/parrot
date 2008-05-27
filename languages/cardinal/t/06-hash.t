puts "1..1"
a = { "a" => "ok ", "b" => 1}

puts a["a"], a["b"]

b = { }
b['foo'] = 2
b['bar'] = a['a']
a['a'] = 'foo'

puts b['bar'], b[a['a']]
