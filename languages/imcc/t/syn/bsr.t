#!perl
use strict;
use TestCompiler tests => 3;
use Test::More qw(skip);

##############################
# this tests register allocation/preserving of local bsr calls
#
output_is(<<'CODE', <<'OUT', "bsr 1");
.sub _test
   $I0 = 2
   $I1 = 3
   bsr L
   print $I0
   print $I1
   print "\n"
   end
   noop
L: $I2 = 4
   $I3 = 5
   ret
.end
CODE
23
OUT

##############################
# this is considered a non local bsr
#
output_is(<<'CODE', <<'OUT', "recursive bsr with saveall");
.sub _test
   $I0 = 5
   $I1 = $I0
   bsr _fact
   print $I1
   print "\n"
   end
_fact:
   save $I0
   save $I1
   saveall
   restore $I1
   restore $I0
   if $I0 <= 1 goto fin
   dec $I0
   $I1 = $I1 * $I0
   bsr _fact
fin:
   save $I1
   restoreall
   restore $I1
   ret
.end

CODE
120
OUT


##############################
output_is(<<'CODE', <<'OUT', "stack calling conventions");
.sub _main
   .local int x
   x = 10
   .const int y = 20

   .arg y	# save args in reversed order
   .arg x
   call _foo	#(r, s) = _foo(x,y)
   .local int r
   .local int s
   .result s	# restore results in reversed order
   .result r

   print "r = "
   print r
   print "\n"
   print "s = "
   print s
   print "\n"
   end
.end

.sub _foo		# sub foo(int a, int b)
   saveall
   .param int a
   .param int b
   print "a = "
   print a
   print "\n"
   print "b = "
   print b
   print "\n"
   .local int pl
   .local int mi
   pl = a + b
   mi = a - b
   .return pl		# return (pl, mi)
   .return mi
   restoreall
   ret
.end

CODE
a = 10
b = 20
r = 30
s = -10
OUT
