require 'test'
plan 1


langs = [ "ruby", "perl", "java", "c++", "python" ].grep(/r/) do |ele|
	ele.capitalize
end 
is langs, [ "Ruby", "Perl" ], '.grep on Array'
