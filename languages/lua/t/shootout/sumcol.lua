-- http://www.bagley.org/~doug/shootout/

local sum = 0
for line in io.lines() do
    sum = sum + line
end
print(sum)
