#!perl
use strict;
use TestCompiler tests => 3;
use Test::More qw(skip);

##############################
output_is(<<'CODE', <<'OUT', "scope 1");
_main:
	# file global x
	.local int x
.sub __main
	call _main
	end
.end

.sub _sub1
	print x
	print "\n"
	ret
.end

	x = 5
	call _sub1
	ret
CODE
5
OUT

output_is(<<'CODE', <<'OUT', "scope 2");
_main:
	# file global x
	.local int x
	.local int z
	.local int b
	b = 200
.sub __main
	call _main
	end
.end

.sub _sub1
	saveall
	.local int z
	x = 99
	z = 100
	print x
	print "\n"
	print z
	print "\n"
	print b
	print "\n"
	restoreall
	ret
.end
	z = 9
	z = z + 1
	x = z + 10
	call _sub1
	print x
	print "\n"
	print z
	print "\n"
	print b
	print "\n"
	ret
CODE
99
100
200
20
10
200
OUT

##############################
output_is(<<'CODE', <<'OUT', "scope 3");
_main:
	# file globals
	.sym int x	# same as .local
	.sym int y	# same as .local
.sub __main
	call _main
	end
.end

.sub _sub1
	print x
	print "\n"
	print y
	print "\n"
	ret
.end

.sub _sub2
	x = x + 1
	y = y + 1
	ret
.end
	x = 5
	y = 10
	call _sub1
	call _sub2
	call _sub1
	ret
CODE
5
10
6
11
OUT

