#! perl -w

use Parrot::Test tests => 1;
use Test::More;
use Parrot::PMC qw(%pmc_types);

output_is(<<'CODE', <<'OUTPUT', "arraystress");
	print "starting\n"
	new P0, .PerlInt
	print "ending\n"
	end
CODE
starting
ending
OUTPUT

1;
