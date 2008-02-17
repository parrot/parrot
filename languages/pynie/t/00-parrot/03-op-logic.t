#!./parrot pynie.pbc

print '1..8'

# &

print 'ok', (0 & 0) + 1
print 'ok', (1 & 0) + 2
print 'ok', (0 & 1) + 3
print 'ok', (1 & 1) + 3

# |

print 'ok', (0 | 0) + 5
print 'ok', (1 | 0) + 5
print 'ok', (0 | 1) + 6
print 'ok', (1 | 1) + 7
