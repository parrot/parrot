require 'test'
plan 4

a = Array.new(2)

is a, [ nil, nil ], '.new on Array'

a = a.fill('-')
is a, [ '-', '-' ], '.fill on Array'

a = a.fill(':-)', 1)
is a, ['-', ':-)'], '.fill with start index'

a = a.fill(':-o', 0, 1)
is a, [':-o', ':-)'],  '.fill with start and end index'
