#!./parrot pynie.pbc

print '1..5'

#len
n = len([1,2,3,4])
if n == 4: print 'ok 1'
else: print 'not ok 1'

#list
lst1 = [ 1,2,3,4 ]
lst2 = list(lst1)
lst1.pop()
lst1.pop()
lst1.pop()
lst1.pop()
if lst2[2] == 3: print 'ok 2'
else: print 'not ok 2'

#range
lst = range(4)
ok = 0
n = -1
for i in lst:
    n += 1
    if n == i: ok += 1
if ok == 4: print 'ok 3'
else: print 'not ok 3'

#str
if str(5) == '5': print 'ok 4'
else: print 'not ok 4'

if len(str(861)) == 3: print 'ok 5'
else: print 'not ok 5'
