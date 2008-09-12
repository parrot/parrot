require 'test'
plan 2
s = "foo"
s << "bar"
is s, "foobar", "basic concat"

s2 = "P4"
s2.concat('rr07!')
is s2, "P4rr07!", ".concat"
