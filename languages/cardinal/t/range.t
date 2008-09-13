require 'test'
plan 7

find_me = 1337
rule = case find_me
	when 0..400
		'1st rule'
	when 401..800
		'2nd rule'
	when 801..1200
		'3rd rule'
	when 1201..1600
		'cardinal rule'
	when 1601..2000
		'last rule'
	else
		'default rule'
	end
is rule, 'cardinal rule', 'case when and range'
		
prev = 1
(2...4).each do |cur|
   if(cur == (prev + 1))
    	pass 'range .each' 
   end
   prev = cur
end

r = (5..6)
proclaim r.include?(5), '.include? for Range'
proclaim !r.include?(100), '.include? for Range'
proclaim r.member?(6), '.member? for Range'

arr = (7..9).to_a
is arr, [7, 8, 9], 'to_a for Range'
