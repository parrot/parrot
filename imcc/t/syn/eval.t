#!perl
use strict;
use TestCompiler tests => 2;
use Test::More qw(skip);

##############################
output_is(<<'CODE', <<'OUT', "eval pasm");
.sub _test
	$S0 = 'set S1, "in eval\n"'
	concat $S0, "\n"
	concat $S0, "print S1\nend\n"
	compreg $P0, "PASM"
	compile P0, $P0, $S0
	invoke
	print "back\n"
	end
.end
CODE
in eval
back
OUT

output_is(<<'CODE', <<'OUT', "eval pir");
.sub _test
	$S1 = ".sub _foo\n"
	concat $S1, '$S1 = "42\n"'
	concat $S1, "\nprint $S1\nend\n"
	concat $S1, "\n.end\n"
	compreg $P0, "PIR"
	compile P0, $P0, $S1
	invoke
	print "back\n"
	noop	# filler to avoid realloc of code ;-)
	end
.end
CODE
42
back
OUT
