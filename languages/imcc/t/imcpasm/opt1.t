#!perl
use strict;
use TestCompiler tests => 49;
use Test::More qw(skip);

# these tests are run with -O1 by TestCompiler and show
# generated PASM code for various optimizations at level 1

##############################
output_is(<<'CODE', <<'OUT', "branch opt if");
.sub _main
	if I0 goto L1
	branch L2
L1:	noop
L2:	end
.end
CODE
_main:
	unless I0, L2
	noop
L2:
	end
OUT

##############################
output_is(<<'CODE', <<'OUT', "branch opt gt");
.sub _main
	if I0 > 1 goto L1
	branch L2
L1:	noop
L2:	end
.end
CODE
_main:
	le I0, 1, L2
	noop
L2:
	end
OUT

##############################
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

##############################
output_is(<<'CODE', <<'OUT', "unused local label");
.sub _main
	branch L2
L2:	end
.end
CODE
_main:
	end
OUT

##############################
output_is(<<'CODE', <<'OUT', "unused global label");
.sub _main
	branch _L2
_L2:	end
.end
CODE
_main:
_L2:
	end
OUT

##############################
output_is(<<'CODE', <<'OUT', "branch_branch and dead code");
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
_test:
   noop
   print "ok\n"
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant add");
   add I0, 10, 15
   add N0, 10.0, 15.0
   end
CODE
   set I0, 25
   set N0, 25
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant sub");
   sub I0, 10, 15
   sub N0, 10.0, 15.0
   end
CODE
   set I0, -5
   set N0, -5
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant mul");
   mul I0, 10, 15
   mul N0, 10.0, 15.0
   end
CODE
   set I0, 150
   set N0, 150
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant div");
   div I0, 10, 5
   div N0, 10.0, 5.0
   end
CODE
   set I0, 2
   set N0, 2
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant cmod");
   cmod I0, 33, 10
   cmod N0, 33.0, 10.0
   end
CODE
   set I0, 3
   set N0, 3
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant mod");
   mod I0, 33, 10
   mod N0, 33.0, 10.0
   end
CODE
   set I0, 3
   set N0, 3
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant eq taken");
   eq 10, 10, L1
   set I0, 5
L1:end
CODE
L1:
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant eq not taken");
   eq 10, 20, L1
   set I0, 5
L1:end
CODE
   set I0, 5
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant eq taken");
   eq 10.0, 10.0, L1
   set I0, 5
L1:end
CODE
L1:
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant eq not taken");
   eq 10.0, 20.0, L1
   set I0, 5
L1:end
CODE
   set I0, 5
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant eq taken");
   eq "xy", "xy", L1
   set I0, 5
L1:end
CODE
L1:
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant eq not taken");
   eq "ab", "ba", L1
   set I0, 5
L1:end
CODE
   set I0, 5
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant ne taken");
   ne 10, 20, L1
   set I0, 5
L1:end
CODE
L1:
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant ne not taken");
   ne 10, 10, L1
   set I0, 5
L1:end
CODE
   set I0, 5
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant gt taken");
   gt "xy", "ap", L1
   set I0, 5
L1:end
CODE
L1:
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant gt not taken");
   gt "ab", "ba", L1
   set I0, 5
L1:end
CODE
   set I0, 5
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant ge taken");
   ge "xy", "xy", L1
   set I0, 5
L1:end
CODE
L1:
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant ge not taken");
   gt "ab", "ba", L1
   set I0, 5
L1:end
CODE
   set I0, 5
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant lt taken");
   lt "xx", "xy", L1
   set I0, 5
L1:end
CODE
L1:
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant lt not taken");
   lt "ba", "ba", L1
   set I0, 5
L1:end
CODE
   set I0, 5
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant le taken");
   le "xy", "xy", L1
   set I0, 5
L1:end
CODE
L1:
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant le not taken");
   le "bb", "ba", L1
   set I0, 5
L1:end
CODE
   set I0, 5
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant if taken");
   if 10, L1
   set I0, 5
L1:end
CODE
L1:
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant if not taken");
   if 0, L1
   set I0, 5
L1:end
CODE
   set I0, 5
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant unless taken");
   unless 0, L1
   set I0, 5
L1:end
CODE
L1:
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant unless not taken");
   unless 1, L1
   set I0, 5
L1:end
CODE
   set I0, 5
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant mix add");
   add N0, 10.0, 15
   end
CODE
   set N0, 25
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant unary abs");
   abs I0, -10
   end
CODE
   set I0, 10
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant set");
   set N0, 5
   end
CODE
   set N0, 5
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "strength mul I, 0");
   mul I0, 0
   end
CODE
   set I0, 0
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "strength mul I, I, 0");
   mul I0, I1, 0
   end
CODE
   set I0, 0
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "strength mul I, 0, I");
   mul I0, 0, I1
   end
CODE
   set I0, 0
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "strength mul N, 0, N");
   mul N0, 0.0, N1
   end
CODE
   set N0, 0
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "strength mul I, 1");
   mul I0, 1
   end
CODE
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "strength mul I, I, 1");
   mul I0, I1, 1
   end
CODE
   set I0, I1
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "strength mul I, 1, I");
   mul I0, 1, I1
   end
CODE
   set I0,  I1
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "strength mul N, 1, N");
   mul N0, 1.0, N1
   end
CODE
   set N0, N1
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "strength div I, 1");
   div I0, 1
   end
CODE
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "strength div I, I, 1");
   div I0, I1, 1
   end
CODE
   set I0, I1
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "strength div N, N, 1");
   div N0, N1, 1
   end
CODE
   set N0, N1
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "multiple const syms");
   set I0, 0
   set I1, 1
   add N0, -1.0, 2
   add N0, -1.0, 1
   add N0, 1.0, 0
   end
CODE
   set I0, 0
   set I1, 1
   set N0, 1
   set N0, 0
   set N0, 1
   end
OUT

##############################
output_is(<<'CODE', <<'OUT', "constant add big nums");
   add N0, 10.0e20, 15.0e21
   end
CODE
   set N0, 1.6e+22
   end
OUT


##############################
SKIP: {
skip("constant concat N/Y", 1);
output_is(<<'CODE', <<'OUT', "constant concat");
   concat S0, "Parrot ", "rocks"
   end
CODE
   set S0, "Parrot rocks"
   end
OUT
}

