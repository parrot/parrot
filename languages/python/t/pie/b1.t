# $Id$

use strict;
use lib '../../lib';

use Parrot::Test tests => 1;

sub test {
    language_output_is('python', $_[0], '', $_[1]);
}

test(<<'CODE', 'b1.py');
def depth0(n):
    try:
        n = depth0(n+1)
    except RuntimeError:
        pass
    return n

def depth1(n, pea):
    p = (pea, pea)
    for i in xrange(n):
        p = (p, pea)
    try:
        n, p = depth1(n+1, p)
    except RuntimeError:
        pass
    return n, p

def main():
    print depth0(0) >= 996
    pea = []
    base, p = depth1(0, pea)
    print base >= 996
    pea.append(p)
    while p[1] is not pea:
        q = p[1]
        n = 0
        while p[1] is q:
            n += 1
            p = p[0]
        if n != base+1:
            raise RuntimeError, (n, base)
        base -= 1
    print base
    del pea[:]

if __name__ == '__main__':
    main()
CODE
