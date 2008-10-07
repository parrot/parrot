require 'test'
plan 2

a = [ "a", "b", "c", "d" ]
b = a.collect {|x| x + "!" } 

is a, [ "a", "b", "c", "d" ], ".collect on Array returns new array"
is b, [ "a!", "b!", "c!", "d!" ], ".collect on Array returns new array"

