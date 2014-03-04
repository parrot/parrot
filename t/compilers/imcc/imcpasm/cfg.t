#!perl
# Copyright (C) 2005, 2014 Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Parrot::Test tests => 2;

pir_2o1_pasm_is( <<'CODE', <<'OUT1', "unreachable 1" );
.sub _test
   print "ok\n"
   end
   noop
   noop
.end
CODE
.pcc_sub _test:
print "ok\n"
end
OUT1

pir_2o1_pasm_is( <<'CODE', <<'OUT1', "unreachable 3" );
.sub _test
  goto L
  print "ok\n"
L:
  end
  noop
  noop
.end
CODE
.pcc_sub _test:
end
OUT1

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
