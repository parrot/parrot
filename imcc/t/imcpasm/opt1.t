#!perl
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use Parrot::Test tests => 73;

# these tests are run with -O1 by TestCompiler and show
# generated PASM code for various optimizations at level 1

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "branch opt if");
.sub _main
	if I0 goto L1
	branch L2
L1:	noop
L2:	end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
	unless I0, L2
	noop
L2:
	end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "branch opt gt");
.sub _main
	if I0 > 1 goto L1
	branch L2
L1:	noop
L2:	end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
	le I0, 1, L2
	noop
L2:
	end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "branch reorg");
.sub _main
	if I0 > 1 goto L1
	noop
	branch L2
L1:
        noop
	goto L3
L2:
        noop
        print "ok\n"
L3:
	end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
 lt 1, I0, L1
 noop
 noop
 print "ok\n"
L3:
 end
L1:
 noop
 branch L3
OUT

##############################
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

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "unused local label");
.sub _main
	branch L2
L2:	end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
	end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "unused global label");
.sub _main
	branch _L2
_L2:	end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
_L2:
	end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "branch_branch and dead code");
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
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_test:
   noop
   print "ok\n"
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "constant add");
.sub _main
   add I0, 10, 15
   add N0, 10.0, 15.0
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set I0, 25
   set N0, 25
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "constant sub");
.sub _main
   sub I0, 10, 15
   sub N0, 10.0, 15.0
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set I0, -5
   set N0, -5
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "constant mul");
.sub _main
   mul I0, 10, 15
   mul N0, 10.0, 15.0
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set I0, 150
   set N0, 150
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "constant div");
.sub _main
   div I0, 10, 5
   div N0, 10.0, 5.0
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set I0, 2
   set N0, 2
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "constant cmod");
.sub _main
   cmod I0, 33, 10
   cmod N0, 33.0, 10.0
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set I0, 3
   set N0, 3
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "constant mod");
.sub _main
   mod I0, 33, 10
   mod N0, 33.0, 10.0
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set I0, 3
   set N0, 3
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "constant eq taken");
.sub _main
   eq 10, 10, L1
   set I0, 5
L1:end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "constant eq not taken");
.sub _main
   eq 10, 20, L1
   set I0, 5
L1:end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set I0, 5
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "constant eq taken");
.sub _main
   eq 10.0, 10.0, L1
   set I0, 5
L1:end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "constant eq not taken");
.sub _main
   eq 10.0, 20.0, L1
   set I0, 5
L1:end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set I0, 5
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "constant eq taken");
.sub _main
   eq "xy", "xy", L1
   set I0, 5
L1:end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "constant eq not taken");
.sub _main
   eq "ab", "ba", L1
   set I0, 5
L1:end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set I0, 5
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "constant ne taken");
.sub _main
   ne 10, 20, L1
   set I0, 5
L1:end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "constant ne not taken");
.sub _main
   ne 10, 10, L1
   set I0, 5
L1:end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set I0, 5
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "constant gt taken");
.sub _main
   gt "xy", "ap", L1
   set I0, 5
L1:end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "constant gt not taken");
.sub _main
   gt "ab", "ba", L1
   set I0, 5
L1:end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set I0, 5
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "constant ge taken");
.sub _main
   ge "xy", "xy", L1
   set I0, 5
L1:end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "constant ge not taken");
.sub _main
   gt "ab", "ba", L1
   set I0, 5
L1:end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set I0, 5
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "constant lt taken");
.sub _main
   lt "xx", "xy", L1
   set I0, 5
L1:end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "constant lt not taken");
.sub _main
   lt "ba", "ba", L1
   set I0, 5
L1:end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set I0, 5
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "constant le taken");
.sub _main
   le "xy", "xy", L1
   set I0, 5
L1:end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "constant le not taken");
.sub _main
   le "bb", "ba", L1
   set I0, 5
L1:end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set I0, 5
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "constant if taken");
.sub _main
   if 10, L1
   set I0, 5
L1:end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "constant if not taken");
.sub _main
   if 0, L1
   set I0, 5
L1:end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set I0, 5
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "constant unless taken");
.sub _main
   unless 0, L1
   set I0, 5
L1:end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "constant unless not taken");
.sub _main
   unless 1, L1
   set I0, 5
L1:end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set I0, 5
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "constant mix add");
.sub _main
   add N0, 10.0, 15
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set N0, 25
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "constant unary abs");
.sub _main
   abs I0, -10
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set I0, 10
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "constant set");
.sub _main
   set N0, 5
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set N0, 5
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength set I, 0");
.sub _main
   set I0, 0
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   null I0
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength set N, 0");
.sub _main
   set N0, 0.0
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   null N0
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength add I, 0");
.sub _main
   add I0, 0
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength add I, I, 0");
.sub _main
   add I0, I1, 0
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set I0, I1
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength add I, 0, I");
.sub _main
   add I0, 0, I1
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set I0,  I1
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength add I, 1");
.sub _main
   add I0, 1
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   inc I0
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength add N, 0, N");
.sub _main
   add N0, 0.0, N1
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set N0, N1
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength add N, 1");
.sub _main
   add N0, 1
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   inc N0
   end
OUT

###############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength sub I, 0");
.sub _main
   sub I0, 0
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength sub I, I, 0");
.sub _main
   sub I0, I1, 0
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set I0, I1
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength sub I, 0, I");
.sub _main
   sub I0, 0, I1
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   sub I0, 0, I1
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength sub I, 1");
.sub _main
   sub I0, 1
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   dec I0
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength sub N, N, 0");
.sub _main
   sub N0, N1, 0
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set N0, N1
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength sub N, 1");
.sub _main
   sub N0, 1
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   dec N0
   end
OUT

#############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength mul I, 0");
.sub _main
   mul I0, 0
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   null I0
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength mul I, I, 0");
.sub _main
   mul I0, I1, 0
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   null I0
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength mul I, 0, I");
.sub _main
   mul I0, 0, I1
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   null I0
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength mul N, 0, N");
.sub _main
   mul N0, 0.0, N1
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   null N0
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength mul I, 1");
.sub _main
   mul I0, 1
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength mul I, I, 1");
.sub _main
   mul I0, I1, 1
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set I0, I1
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength mul I, 1, I");
.sub _main
   mul I0, 1, I1
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set I0,  I1
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength mul N, 1, N");
.sub _main
   mul N0, 1.0, N1
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set N0, N1
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength div I, 1");
.sub _main
   div I0, 1
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength div I, I, 1");
.sub _main
   div I0, I1, 1
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set I0, I1
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength div I, 1, I");
.sub _main
   div I0, 1, I1
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   div I0, 1, I1
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength div N, 1");
.sub _main
   div N0, 1
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength div N, N, 1");
.sub _main
   div N0, N1, 1
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set N0, N1
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength fdiv I, 1");
.sub _main
   fdiv I0, 1
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength fdiv I, I, 1");
.sub _main
   fdiv I0, I1, 1
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set I0, I1
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength fdiv I, 1, I");
.sub _main
   fdiv I0, 1, I1
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   fdiv I0, 1, I1
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength fdiv N, 1");
.sub _main
   fdiv N0, 1
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "strength fdiv N, N, 1");
.sub _main
   fdiv N0, N1, 1
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set N0, N1
   end
OUT

##############################
pir_2_pasm_is(<<'CODE', <<'OUT', "multiple const syms");
.sub _main
   set I0, 0
   set I1, 1
   add N0, -1.0, 2
   add N0, -1.0, 1
   add N0, 1.0, 0
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   null I0
   set I1, 1
   set N0, 1
   null N0
   set N0, 1
   end
OUT

##############################

pir_2_pasm_like(<<'CODE', <<'OUT', "constant add big nums");
.sub _main
   add N0, 10.0e20, 15.0e21
   end
.end
CODE
/^# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html\?id=32392
_main:
   set N0, 1\.6e\+0?22
   end$/
OUT

##############################
SKIP: {
skip("constant concat N/Y", 1);
pir_2_pasm_is(<<'CODE', <<'OUT', "constant concat");
.sub _main
   concat S0, "Parrot ", "rocks"
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_main:
   set S0, "Parrot rocks"
   end
OUT
}

pir_2_pasm_like(<<'CODE', <<'OUT', "segv - last ins changed");
.sub main @MAIN
    func()
.end
.sub func
    $I0 += 1
.end
CODE
/func:
 inc I\d+
 set_returns
 returncc
/
OUT

pir_2_pasm_like(<<'CODE', <<'OUT', "segv - last ins deleted");
.sub main @MAIN
    func()
.end
.sub func
    $I0 += 0
.end
CODE
/func:
 set_returns
 returncc
/
OUT
