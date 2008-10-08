require 'test'
plan 1

r = Range.new(1,10)
pass '.new on Range'
todo 'fix parsing for all syntax of a new Range, to include discrete and continous ranges, (<to>..<from>), <to>..<from>, <from_exclusive>...<to_exclusive', 2
