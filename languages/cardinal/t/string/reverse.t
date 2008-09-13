require 'test'
plan 2

s1 = "testset!"
s2 = s1.reverse
is s2, '!testset', '.reverse for String'
s2 = "!testset"
s2.reverse!
is s2, 'testset!', '.reverse! for String'
