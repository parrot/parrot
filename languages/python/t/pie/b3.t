# $Id$

use strict;
use lib '../../lib';

use Parrot::Test tests => 9;

sub test {
    language_output_is('python', $_[0], '', $_[1]);
}

test(<<'CODE', 'rgen seed');
class Random:

    def __init__(self, x, y, z):
        self._seed = (x, y, z)

    def random(self):
        x, y, z = self._seed
        x = (171 * x) % 30269
        y = (172 * y) % 30307
        z = (170 * z) % 30323
        self._seed = x, y, z
        return (x/30269.0 + y/30307.0 + z/30323.0) % 1.0

    def randint(self, a, b):
        return a + int((b+1-a) * self.random())

rgen = Random(57, 86, 708 % 650)

def main():
    print rgen._seed

main()
CODE

test(<<'CODE', 'randint');
class Random:

    def __init__(self, x, y, z):
        self._seed = (x, y, z)

    def random(self):
        x, y, z = self._seed
        x = (171 * x) % 30269
        y = (172 * y) % 30307
        z = (170 * z) % 30323
        self._seed = x, y, z
        return (x/30269.0 + y/30307.0 + z/30323.0) % 1.0

    def randint(self, a, b):
        return a + int((b+1-a) * self.random())

rgen = Random(57, 86, 708 % 650)

def main():
    print rgen.randint(0, 0x7ffffffe)

main()
CODE

test(<<'CODE', 'randint data');
class Random:

    def __init__(self, x, y, z):
        self._seed = (x, y, z)

    def random(self):
        x, y, z = self._seed
        x = (171 * x) % 30269
        y = (172 * y) % 30307
        z = (170 * z) % 30323
        self._seed = x, y, z
        return (x/30269.0 + y/30307.0 + z/30323.0) % 1.0

    def randint(self, a, b):
        return a + int((b+1-a) * self.random())

rgen = Random(57, 86, 708 % 650)

N = 8

def main():
    data = [int(rgen.randint(0, 0x7ffffffe)) for x in xrange(N)]
    print data

main()
CODE

test(<<'CODE', 'TT class');
T = int

class TT(T):
    def __repr__(self):
        return "T(%d)" % self

def main():
    i = TT(5)
    print i, `i`

main()

CODE

test(<<'CODE', 'Int __new__');
T = int

class TT(T):
    def __repr__(self):
        return "T(%d)" % self

class Int(TT):
    def __new__(cls, value=None):
        if value is None:
            value = 42
        return TT.__new__(cls, value)

def main():
    i = Int(5)
    print i, `i`
    i = Int()
    print i, `i`

main()

CODE

test(<<'CODE', 'data slice');
def main():
    a = []
    N = 20000
    K = 1
    for i in range(N):
        a.append(i)
    for i in range(N):
        if a[i] != i:
            print a[i]
    print "A", a[:K], a[N//2:N//2+K], a[-K:]

main()

CODE
test(<<'CODE', 'overriden rept in list');
T = int

class TT(T):
    def __repr__(self):
        return "T(%d)" % self

class Int(TT):
    def __new__(cls, value=None):
        if value is None:
            value = 42
        return TT.__new__(cls, value)

def main():
    data = [ Int() for x in xrange(1)]
    print data

main()

CODE

test(<<'CODE', 'substituting different cmp functions');
class Random:

    def __init__(self, x, y, z):
        self._seed = (x, y, z)

    def random(self):
        x, y, z = self._seed
        x = (171 * x) % 30269
        y = (172 * y) % 30307
        z = (170 * z) % 30323
        self._seed = x, y, z
        return (x/30269.0 + y/30307.0 + z/30323.0) % 1.0

    def randint(self, a, b):
        return a + int((b+1-a) * self.random())

rgen = Random(57, 86, 708 % 650)

compares = 0

T = int

class TT(T):
    def __repr__(self):
        return "T(%d)" % self

class Int(TT):
    def __new__(cls, value=None):
        if value is None:
            value = rgen.randint(0, 0x7ffffffe)
        return TT.__new__(cls, value)

def icmp(a, b):
    global compares
    compares += 1
    return T.__cmp__(a, b)

K = 1

def sortum(data, cmp=None):
    global compares
    compares = 0
    data = data[:]
    if cmp is None:
        print "using None"
        if data[0] > data[1]:
            data[0], data[1] = data[1], data[0]
    else:
        print "using", cmp.__name__
        if cmp(data[0], data[1]) > 0:
            data[0], data[1] = data[1], data[0]
    print "Z", data
    print compares

def main():
    data = [Int() for x in xrange(6)][-2:]
    print "A", data
    sortum(data)
    sortum(data, cmp)
    sortum(data, icmp)
    TT.__cmp__ = icmp
    sortum(data)
    TT.__cmp__ = T.__cmp__
    sortum(data)
    print "A", data

if __name__ == '__main__':
    main()
CODE

test(<<'CODE', 'b3.py, reduced # iterations');
class Random:

    def __init__(self, x, y, z):
        self._seed = (x, y, z)

    def random(self):
        x, y, z = self._seed
        x = (171 * x) % 30269
        y = (172 * y) % 30307
        z = (170 * z) % 30323
        self._seed = x, y, z
        return (x/30269.0 + y/30307.0 + z/30323.0) % 1.0

    def uniform(self, a, b):
        return a + (b-a) * self.random()

    def randint(self, a, b):
        return a + int((b+1-a) * self.random())

    def choice(self, seq):
        return seq[int(self.random() * len(seq))]

rgen = Random(57, 86, 708 % 650)

compares = 0

T = int

class TT(T):
    def __repr__(self):
        return "T(%d)" % self

class Int(TT):
    def __new__(cls, value=None):
        if value is None:
            value = rgen.randint(0, 0x7ffffffe)
        return TT.__new__(cls, value)

def icmp(a, b):
    global compares
    compares += 1
    return T.__cmp__(a, b)

N = 2000
K = 1

##if __debug__: import time

def sortum(data, cmp=None):
    global compares
    compares = 0
    data = data[:]
    ##if __debug__: t0 = time.time()
    if cmp is None:
        print "using None"
        data.sort()
    else:
        print "using", cmp.__name__
        data.sort(cmp)
    ##if __debug__: t1 = time.time()
    print "Z", data[:K], data[N//2:N//2+K], data[-K:]
    ## 259811 for Python 260906 for qsort
    print compares > 2500,
    ##if __debug__:  print "%.3f" % (t1-t0),
    print

def main():
    ##if __debug__: t0 = time.time()
    data = [Int() for x in xrange(N)]
    ##if __debug__: t1 = time.time()
    ##if __debug__: print "%.3f" % (t1-t0)
    print "A", data[:K], data[N//2:N//2+K], data[-K:]
    sortum(data)
    sortum(data, cmp)
    sortum(data, icmp)
    TT.__cmp__ = icmp
    sortum(data)
    TT.__cmp__ = T.__cmp__
    sortum(data)

if __name__ == '__main__':
    main()
CODE
