#! perl -w

use lib '../../../lib';
use Parrot::Test tests => 1;
use Test::More;
output_is(<<'CODE', <<'OUTPUT', "Testing the empty list");
    .include "../plot.pasm"
    find_lex P0, "nil?"
    find_lex P5, "()"
    invokecc
    find_lex P0, "print"
    invokecc
    print "\n"
    end
CODE
#t
OUTPUT

