require 'test'
plan 4

1.upto(2) { |x| is x, x, 'curly brace block' }
1.upto(2) do |x|
	is x, x, 'do block'
end

