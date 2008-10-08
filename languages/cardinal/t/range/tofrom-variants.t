require 'test'
plan 6

r = Range.new(1,10)
is r.min, 1, '.min on Range'
is r.first, 1, '.first on Range'
todo 'test .min/.max on exclusive range tests, fix parse for exclusive syntax first'
is r.begin, 1, '.begin on Range'
is r.max, 10, '.max on Range'
is r.last, 10, '.last on Range'
is r.end, 10, '.end on Range'
