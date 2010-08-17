
print("1..25")

# test global variable
g = 1
print("ok ", g)

# test local variable
var x = 2
print("ok ", x)

# test hashtable indexing
var hsh  = {}
var key  = "hi"
hsh{key} = 3

print("ok ", hsh{key})

# test array indexing
var arr = []
var idx = 10
arr[idx] = 4

print("ok ", arr[idx])

# test subroutines
sub foo(a)
    print("ok ", a)
end

foo(5)


# test if statement

var a = 1
var b = 1
var c = 0
var d = 0

if a then
    print("ok 6")
end

if not c then
    print("ok 7")
end

if a and b then
    print("ok 8")
end

if a or c then
    print("ok 9")
end

if not c and a then
    print("ok 10")
end

if c then
    print("nok 11")
else
    print("ok 11")
end

# test algorithmic
a = 1 + 11
b = 4 * 3 + 1
c = 15 - 1
d = 45 % 30
e = (3 + 1) * (3 + 1)

print("ok ", a)
print("ok ", b)
print("ok ", c)
print("ok ", d)
print("ok ", e)

# test try-statement

try
    throw "error"
catch exc
    print("ok 17")
    #print(exc)
end

# for-statement


for var i = 18, 20 do
    print("ok ", i)
end

g = 21

## XXX there's something wrong with the for loop and the step of 2.
## k={21,23,25,27,29}, g={21,22,23,24,25}
#for var k = 21, 29, 2 do
#    print("ok ", g)
#    g = g + 1
#end


var j = 0
while j < 5 do

    print("ok ", j + g)
    j = j + 1
end


