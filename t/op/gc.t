#! perl -w

use Parrot::Test tests => 1;

output_is(<<'CODE', <<OUTPUT, "sweepoff with newpmcs");
    print "starting\n"

    sweepoff
    set I0, 0

LOOP: new P0, .PerlString
    set P0, "ABC"
    save P0
    inc I0
    lt I0, 127, LOOP

    print "ending\n"
	
    end
CODE
starting
ending
OUTPUT
