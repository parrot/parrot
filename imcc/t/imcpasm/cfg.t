#!perl
use strict;
use TestCompiler tests => 3;

##############################
output_is(<<'CODE', <<'OUT', "unreachable 1");
.sub _test
   bsr L
   print "ok\n"
   end
   noop
   noop
L: print "sub\n"
   ret
.end
CODE
_test:
   bsr L
   print "ok\n"
   end
L:
   print "sub\n"
   ret
OUT

output_is(<<'CODE', <<'OUT', "unreachable 2");
.sub _test
  print "ok\n"
  end
  noop
  noop
.end
CODE
_test:
  print "ok\n"
  end
OUT

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
