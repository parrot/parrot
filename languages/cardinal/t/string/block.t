require 'test'
plan 6

s = String.new("ruby")
isnt s, nil, '.new for String'
is s.size, 4, '.size for String'
s = 'ruby'
ruby = "____"
i = 0
s.each_byte() do |c|
   ruby[i] = c
   i = i + 1
end
is ruby, 'ruby', '.each_byte for String'
parrot = 'parrot'
i = 0
parrot.each('r') do |split|
  if i == 0
	  is split, 'par', '.each(char) for String'
  end
  if i == 1
	is split, 'r', '.each(char) for String'
  end
  if i == 2
	is split, 'ot', '.each(char) for String'
  end
  i = i + 1
end


