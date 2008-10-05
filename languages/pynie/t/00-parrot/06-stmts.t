#!./parrot pynie.pbc

print '1..13'

# if

if 1: print 'ok 1'
if 0: print 'nok 2'
else: print 'ok 2'
if 0: print 'nok 3'
elif 1: print 'ok 3'
if 0: print 'nok 4'
elif 0: print 'nok 4'
else: print 'ok 4'

# while

i=5
while i < 7:
    print 'ok',i
    i=i+1
while 0:
    print 'nok 7'
else:
    print 'ok 7'

# for

lst = [ 1,2,3,4 ]
n = 0
ok = 1
for i in lst:
    n += 1
    if i != n: ok = 0
if ok: print 'ok 8'
else: print 'nok 8'

n = 0
ok = 1
for i in [ 1,2,3,4 ]:
    n += 1
    if i != n: ok = 0
if ok: print 'ok 9'
else: print 'nok 9'

n = 0
ok = 1
for i in 1,2,3,4:
    n += 1
    if i != n: ok = 0
if ok: print 'ok 10'
else: print 'nok 10'

# nested fors
lst = [ ]
for i in range(3):
    # XXX ResizablePMCArray has a 'push' method, use list.append
    for j in range(3):
        lst.push((i + 1) * (j + 1))
ok = 1
lst2 = [ 1, 2, 3,  2, 4, 6,  3, 6, 9 ]
for i in range(9):
    if lst[i] != lst2[i]: ok = 0
if ok: print 'ok 11'
else: print 'nok 11'

# multiple iterators
#ok = 0
#for i, j in ( (0, 0), (1, 2), (2, 4) ):
#    if j == i * 2: ok += 1
#if ok == 3: print 'ok 12'
#else: print 'nok 12'
print 'not ok 12  # TODO implement multiple iterators'

# nested scopes
i = 4
if 0:
    if 0: pass
    i = 2
if i == 2: print 'nok 13'
else: print 'ok 13'
