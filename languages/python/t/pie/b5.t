# $Id$

use strict;
use lib '../../lib';

use Parrot::Test tests => 1;

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

