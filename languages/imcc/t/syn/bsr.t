#!perl
use strict;
use TestCompiler tests => 2;
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


