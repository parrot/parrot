# $Id$

use strict;
use lib '../../lib';

use Parrot::Test tests => 3;

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
