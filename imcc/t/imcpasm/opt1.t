#!perl
use strict;
use TestCompiler tests => 6;
use Test::More qw(skip);

# these tests are run with -O1 by TestCompiler and show
# generated PASM code for various optimizations at level 1

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

##############################
output_is(<<'CODE', <<'OUT', "unreachable 3");
.sub _test
  goto L
  print "ok\n"
L:
  end
  noop
  noop
.end
CODE
_test:
  end
OUT

##############################
output_is(<<'CODE', <<'OUT', "unused local label");
.sub _main
	branch L2
L2:	end
.end
CODE
_main:
	end
OUT

##############################
output_is(<<'CODE', <<'OUT', "unused global label");
.sub _main
	branch _L2
_L2:	end
.end
CODE
_main:
_L2:
	end
OUT

##############################
output_is(<<'CODE', <<'OUT', "branch_branch and dead code");
.sub _test
   goto l1
l2:
   noop
   print "ok\n"
   end
l1:
   goto l3
l4:
   eq I1, 0, l2
l3:
   goto l2
.end
CODE
_test:
   noop
   print "ok\n"
   end
OUT

