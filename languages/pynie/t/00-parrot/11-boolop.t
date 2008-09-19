#!./parrot pynie.pbc

print '1..9'

if 1 and 2 and 3:
    print 'ok 1'
else:
    print 'not ok 1'

if 0 and 1 and 2:
    print 'not ok 2'
else:
    print 'ok 2'

if 0 or 1 or 2:
    print 'ok 3'
else:
    print 'not ok 3'

if 0 or 0 or 0:
    print 'not ok 4'
else:
    print 'ok 4'

if not 0:
    print 'ok 5'
else:
    print 'not ok 5'

if not 1:
    print 'not ok 6'
else:
    print 'ok 6'

if 1 or 0 and 0:   # and should be tighter than or
    print 'ok 7'
else:
    print 'not ok 7'

if (1 or 0) and 0:   # test parentheses
    print 'not ok 8'
else:
    print 'ok 8'

#if not not 1:
#   print 'ok 9'
#else:
#   print 'not ok 9'
print 'not ok 9   # TODO fix double nots'
