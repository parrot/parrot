# $Id$

use strict;
use lib '../../lib';

use Parrot::Test tests => 9;

sub test {
    language_output_is('python', $_[0], '', $_[1]);
}

test(<<'CODE', 'func()');
def foo():
	print 0.1, 0.02
	print 1.1, 1.02

if __name__ == "__main__":
	foo()
CODE

test(<<'CODE', 'func(a, b)');
def foo(a,b):
	c = 3
	print a,b,c

if __name__ == "__main__":
	a = 1
	b = 2
	foo(a, b)
	print foo(1, 2)
CODE

test(<<'CODE', 'func(a, b=x, c=y)');
def foo(a,b="x",c=3+4):
	print a,b,c

if __name__ == "__main__":
	a = 1
	b = 2
	foo(a)
	foo(a, b)
	foo(a, b, 2)
CODE

test(<<'CODE', 'abs() builtin opcode');
def check(a,b):
    print a,b

def check_functions(i=0, j=0):
    check(abs(42*i), 42*j)

if __name__ == '__main__':
    check_functions()
    check_functions(-1, 2)
CODE

test(<<'CODE', 'callable() builtin function');
if __name__ == '__main__':
    o = callable
    i = callable(o)
    print i
    a = 5
    i = callable(a)
    print i
CODE

test(<<'CODE', 'chr() builtin function');
if __name__ == '__main__':
    print chr(65), chr(97)
CODE

test(<<'CODE', 'hash() builtin function');
if __name__ == '__main__':
    print hash(65), hash(97L)
CODE

test(<<'CODE', 'hash() builtin function, num, complex');
if __name__ == '__main__':
    print hash(42.0), hash(42+0j)
CODE

test(<<'CODE', 'range 1');
if __name__ == '__main__':
    for i in range(10):
	print i,
    print
CODE
