#!perl
use strict;
use TestCompiler tests => 5;
use Test::More qw(skip);

##############################
output_is(<<'CODE', <<'OUT', "if/unless");
.sub _test
	$I0 = 0
	if $I0 goto nok1
	print "ok 1\n"
nok1:
	unless $I0 goto ok1
	print "nok 1\n"
ok1:
	if I0, nok2
	print "ok 2\n"
nok2:
	unless I0 goto ok2
	print "nok 2\n"
ok2:
	end
.end
CODE
ok 1
ok 2
OUT

##############################
output_is(<<'CODE', <<'OUT', "new");
.sub _test
	$P1 = new PerlString
	$P1 = "ok 1\n"
	new P1, .PerlString
	set P1, "ok 2\n"
	print $P1
	print P1
	end
.end
CODE
ok 1
ok 2
OUT

##############################
output_is(<<'CODE', <<'OUT', "clone");
.sub _test
	$P1 = new PerlString
	$P1 = "ok 1\n"
	$P0 = clone $P1
	new P1, .PerlString
	set P1, "ok 2\n"
	clone P0, P1
	print $P0
	print P0
	end
.end
CODE
ok 1
ok 2
OUT

##############################
output_is(<<'CODE', <<'OUT', "defined");
.sub _test
	$P1 = new PerlHash
	$I0 = defined $P1
	new P1, .PerlHash
	defined I0, P1
	print $I0
	print "\n"
	print I0
	print "\n"
	end
.end
CODE
1
1
OUT

##############################
SKIP: {
 skip("no core ops yet", 1);

output_is(<<'CODE', <<'OUT', "defined keyed");
.sub _test
	$P1 = new PerlHash
	$P1["a"] = "ok 1\n"
	$I0 = defined $P1["a"]
	new P1, .PerlHash
	set P1["a"], "ok 2\n"
	defined I0, P1["a"]
	defined I1, P1["b"]
	print $I0
	print "\n"
	print I0
	print "\n"
	print I1
	print "\n"
	end
.end
CODE
1
1
0
OUT
}


1;


