#!perl
use strict;
use TestCompiler tests => 2;
use Test::More qw(skip);

##############################
output_is(<<'CODE', <<'OUT', "branch opt if");
.sub _main
	if I0 goto L1
	branch L2
L1:	noop
L2:	end
.end
CODE
_main:
	unless I0, L2
	noop
L2:
	end
OUT

##############################
output_is(<<'CODE', <<'OUT', "branch opt gt");
.sub _main
	if I0 > 1 goto L1
	branch L2
L1:	noop
L2:	end
.end
CODE
_main:
	le I0, 1, L2
	noop
L2:
	end
OUT

