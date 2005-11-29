#!perl
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use Parrot::Test tests => 3;

pir_2_pasm_is(<<'CODE', <<'OUT', "unreachable 1");
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
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_test:
   bsr L
   print "ok\n"
   end
L:
   print "sub\n"
   ret
OUT

pir_2_pasm_is(<<'CODE', <<'OUT', "unreachable 2");
.sub _test
  print "ok\n"
  end
  noop
  noop
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_test:
  print "ok\n"
  end
OUT

pir_2_pasm_is(<<'CODE', <<'OUT', "unreachable 3");
.sub _test
  goto L
  print "ok\n"
L:
  end
  noop
  noop
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_test:
  end
OUT
