# $Id$

use strict;
use lib '../../lib';

use Parrot::Test tests => 11;

sub test {
    language_output_is('python', $_[0], '', $_[1]);
}

test(<<'CODE', 'True');
show = True

if show:
	print "ok"
	print True
CODE


test(<<'CODE', 'complex');
if __name__ == '__main__':
	i=-10j
	print abs(i)
CODE

test(<<'CODE', 'complex add c + i');
if __name__ == '__main__':
	i=-10j
	print abs(i)
	i=-3j + 4
	print abs(i)
CODE

test(<<'CODE', 'complex()');
if __name__ == '__main__':
    print complex(3, 4), 3+4j
    print `3+4j`

CODE

test(<<'CODE', 'long() function and conversion');
if __name__ == '__main__':
    print 20 == long(20), 123456789012L == long(123456789012)
    print 32 == long("0x20", 0), 8 == long("010", 0)
CODE

test(<<'CODE', 'repr of basic types');
if __name__ == '__main__':
    print `42L`, 42L
    print `42`, 42
    print `"ab"`, "ab"
CODE

test(<<'CODE', 'repr of strings');
if __name__ == '__main__':
    print `"ab"`, "ab"
    print `u"ab"`, u"ab"
CODE

test(<<'CODE', 'array slice');
if __name__ == '__main__':
    a = [0,1,2,3,5,6,7][2:4]
    print a[0], a[1]
CODE

test(<<'CODE', 'string slice');
if __name__ == '__main__':
    a = "abcdef" [2:4]
    print a[0], a[1]
CODE

test(<<'CODE', 'tuple vs list');
if __name__ == '__main__':
    print (1,2,3)
    print range(3)
    print list(range(3))
    print tuple(range(3))
CODE

test(<<'CODE', 'float');
if __name__ == '__main__':
    print float(1e100)
    print 1.5, float("1.5")
CODE


