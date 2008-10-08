require 'test'
plan 5

ele = nil
is ele, nil, 'nil == nil'

ele2 = 100
isnt nil, ele2, 'nil == against a number'

ele3 = 'squaak!'
isnt ele3, nil, 'nil == against a string'

is nil.to_s, '', 'to_s on nil'

if ele.nil?
   pass '.nil? on nil'
else
   fail '.nil? on nil'
end
