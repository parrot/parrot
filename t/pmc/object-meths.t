#! perl -w

use Parrot::Test tests => 2;
use Test::More;

output_like(<<'CODE', <<'OUTPUT', "callmeth - unknown");
    newclass P2, "Foo"
    set S0, "nada"
    callmeth
    print "nope\n"
    end
CODE
/Method 'nada' not found/
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "callmeth 1");
    newclass P2, "Foo"
    set S0, "meth"

    # cant mangle method names yet
    find_global P3, "meth"
    # so store ref to the sub with the real name
    store_global "Foo\x0meth", P3

    print "main\n"
    callmethcc
    print "back\n"
    end

# .mangle "::" "\x00"
# .pcc_sub Foo::meth:
#  or some such

.pcc_sub meth:
    print "in meth\n"
    invoke P1
CODE
main
in meth
back
OUTPUT

