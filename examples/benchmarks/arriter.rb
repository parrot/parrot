#! ruby

k = Array.new
nk = Array.new

ha = Hash.new

10.times { |i|
	s = (65 + i).chr
	k.push s
}

(0..3).each { |e|
	10.times { |i|
		k.each{ |s|
			_nk = s + (65 + i).chr
			nk.push _nk
		}
	}
	k = nk
	nk = Array.new
}
puts k.length

j = 0
k.each{ |s|
	j+=1
	ha[s] = 1
}
puts j
puts ha.keys.length

print ha["AAAAA"]
print ha["ABCDE"]
print ha["BBBBB"]
print ha["CCCCC"]
print ha["HHHHH"]
print ha["IIIII"]
puts


