require 'test'
plan 2

def debug(s) 
	print "string=", s, "\n"
end

s1 = "testset!"
s2 = s1.reverse
is s2, '!testset', '.reverse for String'
s2 = "!testset"
#s2.reverse!
#debug(s2)
#is s2, 'testset!', '.reverse! for String'

