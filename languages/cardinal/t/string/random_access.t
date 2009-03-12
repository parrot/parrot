require 'test'
plan 6
#test against 1.9

s = 'parrot pwns'
is s.length, 11, '.length'
elem = s[s.length]
is elem, nil, '[] with no bounds checking'
#returns 115 for 1.8
is s[1], 'a', '[+] with positive int' 
is s[-2], 'n', '[-] with negative int'
is s[0,6], 'parrot', '[index,length] for substring'
s[-4] = "rules!" 
is s, 'parrot rules!', '[] for substring replace' 
#s[0..7] = "cardinal!"
#puts s
#puts s[1..7]
#is s, 'cardinal rules!', '[] for Range (index to index) access'
