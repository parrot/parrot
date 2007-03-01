#!./parrot

print '1..7'

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


