# $Id$

use strict;
use lib '../../lib';

use Parrot::Test tests => 2;

sub test {
    language_output_is('python', $_[0], '', $_[1]);
}

test(<<'CODE', 'b6 - mul array x');
# from b5 import check
show=True
def check(a, b):
    if __debug__:
        if show:
            print `a`, "==", `b`
    if not a == b:
        raise AssertionError("%.30r != %.30r" % (a, b))

def main():
    L = [1]*100
    L[-1] = 42
    n = 0
    for i in L:
        n += i
    check(i, 42)

if __name__ == '__main__':
    main()
CODE

test(<<'CODE', 'b6 - iter');
# from b5 import check
show=True
def check(a, b):
    if __debug__:
        if show:
            print `a`, "==", `b`
    if not a == b:
        raise AssertionError("%.30r != %.30r" % (a, b))

def main():
    L = [1]*1000000
    L[-1] = 42
    n = 0
    for i in L:
        n += i
    check(i, 42)
    check(n, 1000041)

if __name__ == '__main__':
    main()
CODE
