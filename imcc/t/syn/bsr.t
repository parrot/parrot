#!perl
use strict;
use TestCompiler tests => 13;

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
   .result r	# restore results in order
   .result s

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
   .return mi		# from right to left
   .return pl		# return (pl, mi)
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
output_is(<<'CODE', <<'OUT', "fact with stack calling conventions");
.sub _main
    .local int counter
    counter = 5
    .arg counter
    call _fact
    .local int product
    .result product
    print product
    print "\n"
    end
.end

.sub _fact
    saveall
    .param int N
    .local int prod
    prod = 1
L1:
    prod = prod * N
    dec N
    if N > 0 goto L1
    .return prod
    restoreall
    ret
.end
CODE
120
OUT


##############################
# this is considered a non local bsr
#
output_is(<<'CODE', <<'OUT', "recursive bsr with saveall");
.sub _test
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
output_is(<<'CODE', <<'OUT', "tail recursive bsr");
.sub _test
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
output_is(<<'CODE', <<'OUT', "tail recursive bsr 2");
.sub _test
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
output_is(<<'CODE', <<'OUT', "tail recursive bsr - opt");
.sub _test
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
output_is(<<'CODE', <<'OUT', "tail recursive bsr, parrot cc");
.sub _test
   I6 = 5	# count
   I5 = 1	# product
   I0 = 1       # protoyped
   I1 = 2       # 2 int args
   P0 = new Sub
   P0 = addr _fact
   saveall
   invokecc
   save I5
   restoreall
   restore $I0
   print $I0
   print "\n"
   end
# the callers args I5, I6 are used to do the calculation and have
# the same state after, so instead of calling again the sub, just
# a branch to the entry is done
_fact:
   if I6 <= 1 goto fin
   I5 = I5 * I6
   dec I6
   branch _fact
fin:
   I0 = 1
   I1 = 1
   invoke P1
.end

CODE
120
OUT

##############################
# coroutine
output_is(<<'CODE', <<'OUT', "coroutine");
.sub _main
    .local Coroutine co
    co = new Coroutine
    co = addr _routine
    print "Hello"
    invoke co
    print "perl6"
    invoke co
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

output_is(<<'CODE', <<'OUT', "newsub");
    .sub _main
        newsub P0, .Sub, _foo	# PASM syntax only for now
        invokecc P0
        end
    .end

    .sub _foo
        print "foo\n"
	invoke P1
    .end
CODE
foo
OUT

# This is a workaround to suppress errors from POD::Checker.
my $head1 = '=head1';
my $cut = '=cut';

output_is(<<"CODE", <<'OUT', "pod before");
$head1 BLA

 fasel

$cut
.sub _main
	print "ok 1\\n"
	end
.end
CODE
ok 1
OUT

output_is(<<"CODE", <<'OUT', "pod before, after");
$head1 FOO

 fasel

$cut
.sub _main
	print "ok 1\\n"
	end
.end
$head1 BAR

 junk

CODE
ok 1
OUT

output_is(<<'CODE', <<'OUT', "bug #25948");
.sub _main
        goto L1
test:
        $I1 = 1
        ret
L1:
        $I2 = 2
        call test
        print $I2               # printed 1, not 2
	print "\n"
        end
.end
CODE
2
OUT
