# $Id$

use strict;
use lib '../../lib';

use Parrot::Test tests => 3;

sub test {
    language_output_is('python', $_[0], '', $_[1]);
}

test(<<'CODE', 'iter string');
if __name__ == '__main__':
    for i in "abc":
	print i
CODE

test(<<'CODE', 'iter tuple');
if __name__ == '__main__':
    for i in (1,2,3):
	print i
CODE

test(<<'CODE', 'iter map');
if __name__ == '__main__':
    for i in {"a":1,"b":2,"c":3}:
	if i == 'a' or i == 'b' or i == 'c':
	    print "ok"
CODE
