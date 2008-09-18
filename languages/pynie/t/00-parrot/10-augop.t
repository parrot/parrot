#!./parrot pynie.pbc

# check augmented assignment ops
print '1..11'

i = 0
i += 10
if i == 10: print 'ok 1'

i = 10
i -= 5
if i == 5: print 'ok 2'

i = -5
i *= 2
if i == -10: print 'ok 3'

i = 10
i /= 2
if i == 5: print 'ok 4'

i = 10
i %= 4
if i == 2: print 'ok 5'

i = 3
i **= 3
if i == 27: print 'ok 6'

i = 128
i >>= 2
if i == 32: print 'ok 7'

i = 1
i <<= 10
if i == 1024: print 'ok 8'

i = 0x55
i &= 0x1f
if i == 0x15: print 'ok 9'

i = 0x55
i ^= 0x1f
if i == 0x4a: print 'ok 10'

i = 0x55
i |= 0x1f
if i == 0x5f: print 'ok 11'
