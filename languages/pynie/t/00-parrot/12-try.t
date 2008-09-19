#!./parrot pynie.pbc

print '1..5'

try:
    x = 1
    raise Exception
except:
    x = 2
if x == 2: print 'ok 1'
else: print 'not ok 1'

try:
    x = 1
except:
    x = 2
if x == 1: print 'ok 2'
else: print 'not ok 2'

# make sure asserts are on
# XXX in real Python, you can't set __debug__
__debug__ = 1

try:
    x = 1
    assert 0
except:
    x = 2
if x == 2: print 'ok 3'
else: print 'not ok 3'

try:
    x = 1
    assert 1
except:
    x = 2
if x == 1: print 'ok 4'
else: print 'not ok 4'

__debug__ = 0
try:
    x = 1
    assert 0
except:
    x = 2
if x == 1: print 'ok 5'
else: print 'not ok 5'
