# $Id$

use strict;
use lib '../../lib';

use Parrot::Test tests => 11;

sub test {
    language_output_is('python', $_[0], '', $_[1]);
}

test( <<'CODE', 'subtract' );
print 1-2-3-4
CODE

test( <<'CODE', 'add' );
print 1+2+3+4
CODE

test( <<'CODE', 'print P' );
a=41
print a
CODE


test( <<'CODE', 'add P' );
a=41
print a+1
CODE

test( <<'CODE', 'add P, sub' );
a=41
print a+1-2-3
CODE

test( <<'CODE', 'assign twice' );
a=41
a=1-2-3
print a
CODE

test( <<'CODE', 'floor div' );
a= 5//3
print a
a=77/10
print a
CODE

test( <<'CODE', 'assign a,b' );
a = b = 2
print a, b
CODE

SKIP: {
   skip("Not yet", 3);

test( <<'CODE', 'subscr' );
print "abcde"[2]
i =3
print "abcde"[i]
CODE

test( <<'CODE', 'in hash' );
tests = {
 2: 22,
 3: 33,
 7: 77
}

def main():
    for x in range(5):
	if x in tests:
	    print 1,
	else:
	    print 0,
    print

if __name__ == '__main__':
    main()
CODE

test( <<'CODE', 'neg' );
a = 3
print -a
print +a - -a
CODE
}
