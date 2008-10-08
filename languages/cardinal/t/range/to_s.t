require 'test'
plan 1

r = Range.new(1,10)
range_str = r.to_s
is range_str, '1..10', '.to_s on Range'
