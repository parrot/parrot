require 'test'
plan 1

r = Range.new(1,10)
range_arr = r.to_a
test_arr = [1,2,3,4,5,6,7,8,9,10]
is range_arr, test_arr, '.to_a on Range'
