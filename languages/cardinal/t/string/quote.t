require 'test'
plan 2

s1 = %q[Quoted string]
is s1, 'Quoted string', 'quoted String'
s2 = %Q|yet another quoted string|
is s2, 'yet another quoted string', 'quoted String'
