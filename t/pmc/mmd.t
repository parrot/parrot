#! perl -w

use Parrot::Test tests => 1;

output_is(<<'CODE', <<'OUTPUT', "type");
    new P0, .Integer
    new P1, .Integer
    new P2, .Integer
    set P1, 10
    set P2, 3
    div P0, P1, P2
    print P0
    print "\n"
    end
CODE
3
OUTPUT

