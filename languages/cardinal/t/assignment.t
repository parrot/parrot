require 'test'
plan 4

a = 1
is a, 1, 'single assignment per line'
a = 2
is a, 2, 'single assignment per line'

x, y, z = 3, 4, 5
is x, 3, 'multiple assignment per line'
is y, 4, 'multiple assignment per line'
is z, 5, 'multiple assignment per line'


x, y = y, x
x = x + 2
y = y + 4 
is x, 6, 'single line swap'
is y, 7, 'single line swap'


contra = "u", "u", "d", "d"
is contra, ["u", "u", "d", "d"], 'single lvalue multiple rvalue'

#uno, dos = "one", *["two", "deux"]
#is uno, "one", 'single line lvalue splat'
#puts dos
#is dos, ["two", "duex"], 'single line lvalue splat'
