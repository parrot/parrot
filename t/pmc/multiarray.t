#! perl -w

use Parrot::Test tests => 2;
use Test::More;

output_is(<<'CODE', <<'OUTPUT', "multiarray creation");
	new P1, .PerlArray
	# intial size
	set P1[0], 100
	# dimensions
	# XXX can this be done w/o push/append a key?
	new P2, .Key
	set P2, 10
	new P3, .Key
	set P3, 5
	push P2, P3
	set P1[1], P2
	new P0, .MultiArray, P1
	print "ok\n"
	end
CODE
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "multiarray access");
	new P1, .PerlArray
	# intial size
	set P1[0], 100
	# dimensions
	new P2, .Key
	set P2, 10
	new P3, .Key
	set P3, 5
	push P2, P3
	set P1[1], P2
	new P0, .MultiArray, P1
	set P0, 200

	set I10, 10
	set I11, 20
	set I0, 0
lp2:
	set I1, 0
lp1:
	mul I2, I0, I1
	set P0[I0;I1], I2
	inc I1
	lt I1, I11, lp1
	inc I0
	lt I0, I10, lp2
	print "ok 1\n"

	# read values
	set I0, 0
lp4:
	set I1, 0
lp3:
	mul I2, I0, I1
	set I3, P0[I0;I1]
	ne I2, I3, nok1
	inc I1
	lt I1, I11, lp3
	inc I0
	lt I0, I10, lp4
	print "ok 2\n"
	end
nok1:
	print "nok1: got "
	print I3
	print " wanted "
	print I2
	print "\n"
	end
CODE
ok 1
ok 2
OUTPUT

1;

