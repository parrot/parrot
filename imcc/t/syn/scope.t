#!perl
use strict;
use TestCompiler tests => 1;

##############################
output_is(<<'CODE', <<'OUT', "global const");
.sub _main
	.globalconst string ok = "ok\n"
	print ok
	bsr _sub
	end
.end
.sub _sub
	print ok
	ret
.end
CODE
ok
ok
OUT
