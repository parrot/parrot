#!perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use Parrot::Test tests => 3;

# POD

pir_output_is(<<'CODE', <<'OUT', "simple pod");
.sub test :main
    print "pass\n"
    end
.end
=head1 Some POD
This should be ignored, incl. digit 1
=cut
CODE
pass
OUT

pir_output_is(<<'CODE', <<'OUT', "pod with decimal digits");
.sub test :main
    print "pass\n"
    end
.end
=head1 Some POD
This should be ignored, incl. number 1.0
=cut
CODE
pass
OUT

pir_output_is(<<'CODE', <<'OUT', "pod inside sub");
.sub test :main
     print "pass\n"
     _x()
     end
.end

.sub _x
=head1 Some POD
 This should be ignored, incl. digit 1.0
=cut
  print "ok\n"
.end
CODE
pass
ok
OUT

