# $Id$

use strict;
use lib '../../lib';

use Parrot::Test tests => 5;

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

