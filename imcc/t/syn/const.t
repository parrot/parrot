#!perl
use strict;
use TestCompiler tests => 3;
use Test::More qw(skip);

##############################
output_is(<<'CODE', <<'OUT', "const 1");
	# file global const N
	.const int N = 5

.sub __main
	call _main
	end
.end

.sub _sub1
	print N
	print "\n"
	ret
.end

.sub _main
	call _sub1
	ret
.end
CODE
5
OUT

##############################
output_is(<<'CODE', <<'OUT', "const 2");
	# file global const N
	.const int N = 5

.sub __main
	call _main
	end
.end

.sub _sub1
	.local int x
	x = 10 + N
	print x
	print "\n"
	ret
.end

.sub _main
	call _sub1
	ret
.end
CODE
15
OUT

##############################
output_is(<<'CODE', <<'OUT', "escaped");
.sub MAIN
   $S0 = "\""
   print $S0
   print "\\"
   $S0 = "\"\\\"\n"
   print $S0
  end
.end
CODE
"\"\"
OUT

