require 'test'
plan 4

ele = nil
is ele, nil, 'nil == nil'

ele2 = 100
isnt nil, ele2, 'nil == against a number'

ele3 = 'squaak!'
isnt ele3, nil, 'nil == against a string'

puts nil.to_s
is nil.to_s, '', 'to_s for nil'
