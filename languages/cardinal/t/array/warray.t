require 'test'
plan 3

a = %w{ fe fi fo }
is a[0], "fe"
is a[1], "fi"
is a[2], "fo"
