# $Id$

use strict;

use Parrot::Test tests => 1;

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
