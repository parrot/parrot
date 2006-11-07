#!perl
# Copyright (C) 2005, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
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

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
