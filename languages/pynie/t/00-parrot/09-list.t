#!./parrot

print '1..5'

a = ["parrot"]
if a: print 'ok', a
else: print 'nok 1'
b = ["ok 2", ["ok 3"]]
print b[0]
print b[1][0]

c = ("ok 4")
d = ("ok 5",)
print c
print d[0]
