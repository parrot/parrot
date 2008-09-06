require 'test'
plan 1
s = "foo"
s << "bar"
is s, "foobar", "basic concat"
