#!perl
use strict;
use TestCompiler tests => 2;
use Test::More qw(skip);

##############################
output_is(<<'CODE', <<'OUT', "goto 1");
.sub _test
	goto _foo
	end
_foo:
	print "ok 1\n"
	end
.end

CODE
ok 1
OUT

##############################
output_is(<<'CODE', <<'OUT', "goto 2");
.sub _test
	goto _foo
bar:	print "ok 2\n"
	end
_foo:
	print "ok 1\n"
	goto bar
.end

CODE
ok 1
ok 2
OUT

