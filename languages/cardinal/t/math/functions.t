require 'test'
plan 3


n = Math.cos(0)
p n
is n, 1, '.cos on Math'

n = Math.sin(0)
p n
is n, 0, '.sin on Math'

n = Math.sqrt(25.0)
p n
is n, 5.0, '.sqrt on Math' 
