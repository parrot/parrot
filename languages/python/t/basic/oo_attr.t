# $Id$

use strict;
use lib '../../lib';

use Parrot::Test tests => 13;

sub test {
    language_output_is('python', $_[0], '', $_[1]);
}

test(<<'CODE', 'object is');
if __name__ == '__main__':
    print "a" is "b"
    i=5
    print i is i
    if i is i:
        print "ok"
    if not i is 2:
        print "ok"
CODE

test(<<'CODE', 'object id');
if __name__ == '__main__':
    i=5
    j=6
    print id(i) == id(i)
    print id(i) != id(j)
CODE

test(<<'CODE', 'func attribs');
def f(x):
    print x
if __name__ == '__main__':
    print "a".__repr__()
    print dict.fromkeys("abc")
    it = iter("abcde")
    print it.next()
    print f("Ok")
CODE

test(<<'CODE', 'str.lower()');
if __name__ == '__main__':
    print "AbCYZ".lower()
CODE

test(<<'CODE', 'object attr');
class C(object):
    def f(self):
        print self.i

def main():
    c = C()
    c.i=2
    c.f()

main()
CODE

test(<<'CODE', 'override __repr__');

class C(int):
    def __repr__(self):
        return "C(%d)" % self.i

def main():
    c = C()
    c.i = 2
    print `c`

main()
CODE

test(<<'CODE', 'override __iter__');
class C(object):
    def __iter__(self):
        print "in iter"
        yield 1

def main():
    c = C()
    for i in c:
        print i

main()
CODE

test(<<'CODE', 'override __iter__ 2');
class C(object):
    def __iter__(self):
        print "in iter"
        yield 1
        yield 2
        yield 3
        yield 4

def main():
    c = C()
    for i in c:
        print i,
    print "ok"

main()
CODE

test(<<'CODE', 'override __iter__  next');
class C(object):
    def __iter__(self):
        print "in iter"
        yield 1
        yield 2
        yield 3
        yield 4

def main():
    c = C()
    i = iter(c)
    print i.next()
    print i.next()
    print "ok"

main()
CODE

test(<<'CODE', 'override __iter__  next, self.a');
class C(object):
    def __iter__(self):
        print "in iter"
        self.a = 42
        yield 1
        yield 2
        yield 3
        yield 4

def main():
    c = C()
    i = iter(c)
    print i.next()
    print c.a
    print i.next()
    print "ok"

main()
CODE

test(<<'CODE', '__init__ method');
class C:
    def __init__(self, x):
        self.a = x

def main():
    c = C(42)
    print c.a

main()
CODE

test(<<'CODE', '__init__ method, args');
class C:
    def __init__(self, x, y, z):
        self.a = x
        self.b = y
        self.c = z

def main():
    c = C(42, -2, "ok")
    print c.a, c.b, c.c

main()
CODE

test(<<'CODE', 'repr in parent');

class C(int):
    def __repr__(self):
        return "C(%d)" % self.i
class D(C):
    pass
def main():
    d = D()
    d.i = 2
    print `d`

main()
CODE
