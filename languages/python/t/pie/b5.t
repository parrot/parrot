# $Id$

use strict;
use lib '../../lib';

use Parrot::Test tests => 9;

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

test(<<'CODE', 'check_functions bool slices, aggregates');

show = True

def check(a, b):
    if __debug__:
        if show:
            print `a`, "==", `b`
    if not a == b:
        raise AssertionError("%.30r != %.30r" % (a, b))

def check_functions(i=0, j=0):
    check(bool([i, j][i:j]), False)
    check(bool({i: j}), True)
    check(bool({}), False)

def main():
    check_functions()
    check_functions(j=10, i=10)
    for i in range(0,500,249):
	print "i:", i
        check_functions(j=long(i*1000000), i=i*1000000)

if __name__ == '__main__':
    main()
CODE

test(<<'CODE', 'check_functions complex, dict');
show = True

def check(a, b):
    if __debug__:
        if show:
            print `a`, "==", `b`
    if not a == b:
        raise AssertionError("%.30r != %.30r" % (a, b))

def check_functions(i=0, j=0):
    check(complex(3*i, 4*j), 3*i+4j*j)
    check(dict([(1,2), (3,4)]), {1: 2, 3: 4})
    check(dict.fromkeys("abc"), {'a': None, 'b': None, 'c': None})

def main():
    check_functions()
    check_functions(j=10, i=10)
    for i in range(0,500,249):
	print "i:", i
        check_functions(j=long(i*1000000), i=i*1000000)

if __name__ == '__main__':
    main()
CODE

test(<<'CODE', 'check_functions divmod');
show = True

def check(a, b):
    if __debug__:
        if show:
            print `a`, "==", `b`
    if not a == b:
        raise AssertionError("%.30r != %.30r" % (a, b))

def check_functions(i=0, j=0):
    check(divmod(7, 4), (1, 3))

def main():
    check_functions()
    check_functions(j=10, i=10)
    for i in range(0,500,249):
	print "i:", i
        check_functions(j=long(i*1000000), i=i*1000000)

if __name__ == '__main__':
    main()
CODE

test(<<'CODE', 'check_functions lambda');
show = True

def check(a, b):
    if __debug__:
        if show:
            print `a`, "==", `b`
    if not a == b:
        raise AssertionError("%.30r != %.30r" % (a, b))

def check_functions(i=0, j=0):
    check(divmod(7, 4), (1, 3))

def main():
    check_functions()
    check_functions(j=10, i=10)
    for i in range(0,500,249):
	print "i:", i
	check(filter(lambda x: x < 5, range(10)), range(5))

if __name__ == '__main__':
    main()
CODE

test(<<'CODE', 'check_functions float');
show = True

def check(a, b):
    if __debug__:
        if show:
            print `a`, "==", `b`
    if not a == b:
        raise AssertionError("%.30r != %.30r" % (a, b))

def check_functions(i=0, j=0):
    check(divmod(7, 4), (1, 3))

def main():
    check_functions()
    check_functions(j=10, i=10)
    for i in range(0,500,249):
	print "i:", i
	check(float("1.5"), 1.5)
	check(float(15*i), 15.0*i)
	check(float(10**100), 1e100)

if __name__ == '__main__':
    main()
CODE
