#!perl
use strict;
use TestCompiler tests => 1;
use Test::More qw(skip);

##############################
output_is(<<'CODE', <<'OUT', "used once lhs");
.sub _main
	$I1 = 1
	$I2 = 2
	print $I2
	end
.end
CODE
_main:
	set I0, 2
	print I0
	end
OUT

