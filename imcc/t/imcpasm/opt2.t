#!perl
use strict;
use TestCompiler tests => 2;

# these tests are run with -O2 by TestCompiler and show
# generated PASM code for various optimizations at level 2

##############################
output_is(<<'CODE', <<'OUT', "used once lhs");
.sub _main
	$I1 = 1
	$I2 = 2
	print $I2
	end
.end
CODE
_main:
	set I0, 2
	print I0
	end
OUT

##############################
output_is(<<'CODE', <<'OUT', "move invariant out of loop");
.sub _main
       set I0, 5
loop:
       set I1, 2
       add I0, I1
       lt I0, 20, loop
       print I0
       end
.end
CODE
_main:
  set I0, 5
  set I1, 2
loop:
  add I0, I1
  lt I0, 20, loop
  print I0
  end
OUT
