require 'test'
plan 5

a = { "a" => "ok", "b" => 1}

is a["a"], "ok", "basic hash access"

b = { }
b['foo'] = 2
a['a'] = 'foo'

is b[a['a']], 2, "basic hash access"

c = Hash.new('ok')

is c['a'], 'ok', "hash static default"

d = Hash.new() { |hash, key| pass "hash block default"; hash[key] = 5 }

is d['foo'], 5, "hash block default"
