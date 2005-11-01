#!perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use Parrot::Test tests => 12;

pir_output_is(<<'CODE', <<'OUT', "bsr 1");
# this tests register allocation/preserving of local bsr calls
.sub test :main
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
pir_output_is(<<'CODE', <<'OUT', "stack calling conventions");
.sub test :main
   .local int x
   x = 10
   .const int y = 20

   save y	# save args in reversed order
   save x
   bsr _foo	#(r, s) = _foo(x,y)
   .local int r
   .local int s
   restore r	# restore results in order
   restore s

   print "r = "
   print r
   print "\n"
   print "s = "
   print s
   print "\n"
   end

_foo:		# sub foo(int a, int b)
   saveall
   .local int a, b
   restore  a
   restore  b
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
   save mi		# from right to left
   save pl		# return (pl, mi)
   restoreall
   ret
.end

CODE
a = 10
b = 20
r = 30
s = -10
OUT

##############################
#
pir_output_is(<<'CODE', <<'OUT', "fact with stack calling conventions");
.sub test :main
    .local int counter
    counter = 5
    save counter
    bsr _fact
    .local int product
    restore product
    print product
    print "\n"
    end

_fact:
    saveall
    .local int N
    restore  N
    .local int prod
    prod = 1
L1:
    prod = prod * N
    dec N
    if N > 0 goto L1
    save prod
    restoreall
    ret
.end
CODE
120
OUT


##############################
# this is considered a non local bsr
#
pir_output_is(<<'CODE', <<'OUT', "recursive bsr with saveall");
.sub test :main
   $I0 = 5	# count
   $I1 = 1	# product
   save $I0
   save $I1
   bsr _fact
   restore $I1
   print $I1
   print "\n"
   end
_fact:
   saveall
   restore $I1
   restore $I0
   if $I0 <= 1 goto fin
   $I1 = $I1 * $I0
   dec $I0
   save $I0
   save $I1
   bsr _fact
   restore $I1
fin:
   save $I1
   restoreall
   ret
.end

CODE
120
OUT

##############################
# tail recursion - caller saves
pir_output_is(<<'CODE', <<'OUT', "another recursive bsr");
.sub test :main
   $I0 = 5	# count
   $I1 = 1	# product
   saveall
   bsr _fact
   save $I1
   restoreall
   restore $I1
   print $I1
   print "\n"
   end
_fact:
   if $I0 <= 1 goto fin
   $I1 = $I1 * $I0
   dec $I0
   saveall
   bsr _fact
   save $I1
   restoreall
   restore $I1
fin:
   ret
.end

CODE
120
OUT

##############################
# tail recursion - caller saves
pir_output_is(<<'CODE', <<'OUT', "tail recursive bsr 2");
.sub test :main
   $I0 = 5	# count
   $I1 = 1	# product
   saveall
   bsr _fact
   save $I1
   restoreall
   restore $I1
   print $I1
   print "\n"
   end
_fact:
   if $I0 <= 1 goto fin
   $I1 = $I1 * $I0
   dec $I0
   bsr _fact
fin:
   ret
.end

CODE
120
OUT

##############################
# tail recursion - caller saves
pir_output_is(<<'CODE', <<'OUT', "tail recursive bsr - opt");
.sub test :main
   $I0 = 5	# count
   $I1 = 1	# product
   saveall
   bsr _fact
   save $I1
   restoreall
   restore $I1
   print $I1
   print "\n"
   end
_fact:
   if $I0 <= 1 goto fin
   $I1 = $I1 * $I0
   dec $I0
   branch _fact
fin:
   ret
.end

CODE
120
OUT

##############################
# tail recursion - caller saves - parrot calling convention
pir_output_is(<<'CODE', <<'OUT', "tail recursive bsr, parrot cc");
.sub test :main
   $I0 = _fact(1, 5)
   print $I0
   print "\n"
   end
.end

# the callers args I5, I6 are used to do the calculation and have
# the same state after, so instead of calling again the sub, just
# a branch to the entry is done
.sub _fact
   .param int f
   .param int n
   if n <= 1 goto fin
   f = f * n
   dec n
   .return _fact(f, n)
fin:
   .return(f)
.end

CODE
120
OUT

##############################
# coroutine
pir_output_is(<<'CODE', <<'OUT', "coroutine");
.sub test :main
    .local Coroutine co
    co = new Coroutine
    co = addr _routine
    print "Hello"
    invokecc co
    print "perl6"
    invokecc co
    print "\n"
    end
.end
.sub _routine
   .local pmc co
    print " "
    .yield()
    print "."
    .yield()

.end
CODE
Hello perl6.
OUT


# This is a workaround to suppress errors from POD::Checker.
my $head1 = '=head1';
my $cut = '=cut';

pir_output_is(<<"CODE", <<'OUT', "pod before");
$head1 BLA

 fasel

$cut
.sub test :main
	print "ok 1\\n"
	end
.end
CODE
ok 1
OUT

pir_output_is(<<"CODE", <<'OUT', "pod before, after");
$head1 FOO

 fasel

$cut
.sub test :main
	print "ok 1\\n"
	end
.end
$head1 BAR

 junk

CODE
ok 1
OUT

pir_output_is(<<'CODE', <<'OUT', "bug #25948");
.sub main :main
        goto L1
test:
        $I1 = 1
        ret
L1:
        $I2 = 2
        bsr test
        print $I2               # printed 1, not 2
	print "\n"
        end
.end
CODE
2
OUT
