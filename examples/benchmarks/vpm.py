#! python

import string

big = 0
astring = "just another pyth hacker"

for i in range(100000):
    big = big + 1
    str = list(astring)
    f = str.pop(0)
    str.append(f)
    astring = string.join(str,"")

print big
print astring
