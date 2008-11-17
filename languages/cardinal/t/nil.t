require 'test'
plan 8

ele = nil
is ele, nil, 'nil == nil'

ele2 = 100
isnt nil, ele2, 'nil == against a number'

ele3 = 'squaak!'
isnt ele3, nil, 'nil == against a string'

is nil.to_s, '', '.to_s on nil'

if ele.nil?
   pass '.nil? on nil'
else
   fail '.nil? on nil'
end

is nil.to_i, 0, '.to_i on nil'

isnt nil, 0, 'nil cmp against 0'
isnt nil, '', 'nil cmp against a empty str'
