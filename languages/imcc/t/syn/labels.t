#!perl
use strict;
use TestCompiler tests => 7;

##############################
output_is(<<'CODE', <<'OUT', "goto 1");
.sub _test
	goto foo
	end
foo:
	print "ok 1\n"
	end
.end

CODE
ok 1
OUT

##############################
output_is(<<'CODE', <<'OUT', "goto 2");
.sub _test
	goto foo
bar:	print "ok 2\n"
	end
foo:
	print "ok 1\n"
	goto bar
.end

CODE
ok 1
ok 2
OUT

##############################
output_is(<<'CODE', <<'OUT', "local labels");
# this code is illegal for assemble.pl
.sub __main
	bsr _sub1
	bsr _sub2
	end
.end
.sub _sub1
	if $I0 goto L1
	print "ok 1\n"
L1:
	ret
.end
.sub _sub2
	branch L1
L2:
	ret
L1:
	print "ok 2\n"
	unless $I0 goto L2
	print "nok\n"
	ret
.end
CODE
ok 1
ok 2
OUT

##############################
output_is(<<'CODE', <<'OUT', "local labels 2");
.sub _realmain
         bsr FOO
         call _function
         end

FOO:    print "in main\n"
         ret
.end
.sub _function
         bsr FOO
         ret
FOO:    print "in function\n"
         ret
.end
CODE
in main
in function
OUT

output_is(<<'CODE', <<'OUT', "perlish func label");
.sub _main::test
	print "ok 1\n"
	end
.end

CODE
ok 1
OUT

output_is(<<'CODE', <<'OUT', "perlish func label - .pcc_sub");
.pcc_sub _main::test prototyped
	print "ok 1\n"
	end
.end

CODE
ok 1
OUT

output_is(<<'CODE', <<'OUT', "perlish func label - bsr");
.sub _main::test
        bsr _main::sub
	print "ok 2\n"
	end
.end
.sub _main::sub
	print "ok 1\n"
	ret
.end


CODE
ok 1
ok 2
OUT
