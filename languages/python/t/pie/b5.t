# $Id$

use strict;
use lib '../../lib';

use Parrot::Test tests => 4;

sub test {
    language_output_is('python', $_[0], '', $_[1]);
}

test(<<'CODE', 'check()');

show = True

def check(a, b):
    if __debug__:
        if show:
            print `a`, "==", `b`
    if not a == b:
        raise AssertionError("%.30r != %.30r" % (a, b))

def check_functions(i=0, j=0):
    check(abs(42*i), 42*j)

def main():
    check_functions()
    check_functions(j=10, i=10)

if __name__ == '__main__':
    main()
CODE

test(<<'CODE', 'check_functions abs, long');
show = True

def check(a, b):
    if __debug__:
        if show:
            print `a`, "==", `b`
    if not a == b:
        raise AssertionError("%.30r != %.30r" % (a, b))

def check_functions(i=0, j=0):
    check(abs(42*i), 42*j)
    check(abs(-42*i), 42*j)
    check(abs(-12345678910*i), 12345678910*j)

def main():
    check_functions()
    check_functions(j=10, i=10)
    for i in range(0,500,249):
	print "i:", i
        check_functions(j=long(i*1000000), i=i*1000000)

if __name__ == '__main__':
    main()

CODE

test(<<'CODE', 'check_functions abs, complex');
show = True

def check(a, b):
    if __debug__:
        if show:
            print `a`, "==", `b`
    if not a == b:
        raise AssertionError("%.30r != %.30r" % (a, b))

def check_functions(i=0, j=0):
    check(abs(-3.14*i), 3.14*i)
    check(abs((3j+4)*i), 5*j)

def main():
    check_functions()
    check_functions(j=10, i=10)
    for i in range(0,500,249):
	print "i:", i
        check_functions(j=long(i*1000000), i=i*1000000)

if __name__ == '__main__':
    main()

CODE

test(<<'CODE', 'check_functions bool basic types');
show = True

def check(a, b):
    if __debug__:
        if show:
            print `a`, "==", `b`
    if not a == b:
        raise AssertionError("%.30r != %.30r" % (a, b))

def check_functions(i=0, j=0):
    check(bool(1+i), True)
    check(bool(100+j), True)
    check(bool(i-j), False)

def main():
    check_functions()
    check_functions(j=10, i=10)
    for i in range(0,500,249):
	print "i:", i
        check_functions(j=long(i*1000000), i=i*1000000)

if __name__ == '__main__':
    main()
CODE


