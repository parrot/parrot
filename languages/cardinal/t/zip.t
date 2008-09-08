require 'test'
plan 3


a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]

is [1,2,3].zip(a, b), [[1,4,7], [2,5,8], [3,6,9]], 'zip'       
is [1,2].zip(a,b), [[1,4,7], [2,5,8]], 'zip larger arrays into smaller'
is a.zip([1,2],[8]), [[4,1,8], [5,2,nil], [6,nil,nil]], 'zip smaller arrays into larger'
