# $Id$

use strict;
use lib '../../lib';

use Parrot::Test tests => 2;

sub test {
    language_output_is('python', $_[0], '', $_[1]);
}

test(<<'CODE', 'object isa');

class C(int):
    pass

def main():
    i = C()
    print isinstance(i, C)
    print isinstance(i, int)
    print isinstance(i, long)

if __name__ == '__main__':
    main()

CODE

test(<<'CODE', 'object init from int parent class');
class C(int):
    pass

def main():
    i = C(2)
    print i

if __name__ == '__main__':
    main()
CODE
