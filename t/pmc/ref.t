#! perl -w

use Parrot::Test tests => 2;
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

