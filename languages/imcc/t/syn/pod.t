#!perl
use strict;
use TestCompiler tests => 3;

# POD

output_is(<<'CODE', <<'OUT', "simple pod");
.sub _main
    print "pass\n"
    end
.end
=head1 Some POD
This should be ignored, incl. digit 1
=cut
CODE
pass
OUT

output_is(<<'CODE', <<'OUT', "pod with decimal digits");
.sub _main
    print "pass\n"
    end
.end
=head1 Some POD
This should be ignored, incl. number 1.0
=cut
CODE
pass
OUT

output_is(<<'CODE', <<'OUT', "pod inside sub");
.sub _main
     print "pass\n"
     bsr _x
     end
.end

.sub _x
=head1 Some POD
 This should be ignored, incl. digit 1.0
=cut
  print "ok\n"
  ret
.end
CODE
pass
ok
OUT

