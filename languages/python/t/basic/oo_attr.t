# $Id$

use strict;
use lib '../../lib';

use Parrot::Test tests => 1;

sub test {
    language_output_is('python', $_[0], '', $_[1]);
}

test(<<'CODE', 'func attribs');
def f(x):
    print x
if __name__ == '__main__':
    print "a".__repr__()
    print dict.fromkeys("abc")
    it = iter("abcde")
    print it.next()
    print f("Ok")
CODE
