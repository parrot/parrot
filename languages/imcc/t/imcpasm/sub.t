#!perl
use strict;
use TestCompiler tests => 1;
use Test::More qw(skip);

##############################
output_is(<<'CODE', <<'OUT', "nested sub");
.sub __main
	bsr _sub1
	bsr _sub2
	end
.end
.sub _sub1
	print "ok 1\n"
    .sub _sub3
        print "ok 2\n"
	ret
    .end
        bsr _sub3
	print "ok 3\n"
	ret
.end
.sub _sub2
	print "ok 4\n"
	ret
.end
CODE
__main:
	bsr _sub1
	bsr _sub2
	end
_sub3:
	print "ok 2\n"
	ret
_sub1:
	print "ok 1\n"
	bsr _sub3
	print "ok 3\n"
	ret
_sub2:
	print "ok 4\n"
	ret
OUT

