# $Id$

use strict;
use lib '../../lib';

use Parrot::Test tests => 4;

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

test(<<'CODE', 'object init from int grandparent class');
class C(int):
    def foo(self): return 'foo'

class D(C):
    def foo(self): return 'foo'
    def bar(self): return 'bar'

def main():
    i = D(2)
    print i, i.foo(), i.bar()

if __name__ == '__main__':
    main()
CODE

test(<<'CODE', 'methods as properties');
class one: 
  def __str__(self): return "one"

class two(one):
  def __str__(self): return "two"
  def alternate(self): return "dos"

class three(one):
  def __str__(self): return "three"
  def alternate(self): return "tres"

list = [one(), two(), three()]

for item in list:
  print item.__class__.__name__, ":", item

print

list[0].__class__ = two
list[1].__str__ = list[1].alternate
three.__str__ = three.alternate

for item in list:
  print item.__class__.__name__, ":", item 
CODE
