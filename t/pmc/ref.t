#! perl -w

use Parrot::Test tests => 4;
use Test::More qw(skip);

output_is(<<'CODE', <<'OUTPUT', "new ref");
	new P2, .PerlInt
	new P1, .Ref, P2
	print "ok 1\n"
	end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "inc ref");
	new P2, .PerlInt
	new P1, .Ref, P2
	inc P1
	print P1
	print P2
	print "\n"
	end
CODE
11
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "deref");
	new P2, .PerlInt
	new P1, .Ref, P2
	print "ok 1\n"
	deref P3, P1
	typeof S0, P3
	print S0
	print "\n"
	end
CODE
ok 1
PerlInt
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "assign ref");
	new P2, .PerlInt
	new P3, .PerlNum
	set P3, 0.5
	new P1, .Ref, P2
	inc P1
	print P1
	print "\n"
	assign P1, P3
	inc P1
	print P1
	print "\n"
	print P3
	print "\n"
	end
CODE
1
1.500000
1.500000
OUTPUT
