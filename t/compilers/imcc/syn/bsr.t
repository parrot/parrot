#!perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Config;
use Parrot::Test tests => 7;

pir_output_is( <<'CODE', <<'OUT', "bsr 1" );
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
# bsr recursion - caller saves
pir_output_is( <<'CODE', <<'OUT', "recursive bsr" );
.sub test :main
   $P0 = new 'ResizableIntegerArray'
   $I0 = 5	# count
   $I1 = 1	# product
   bsr _fact
   print $I1
   print "\n"
   end
_fact:
   if $I0 <= 1 goto fin
   push $P0, $I0
   $I1 = $I1 * $I0
   dec $I0
   bsr _fact
   pop $I0, $P0
fin:
   ret
.end

CODE
120
OUT

##############################
# bsr recursion - parrot calling convention
pir_output_is( <<'CODE', <<'OUT', "tail recursive callcc" );
.sub test :main
   $I0 = _fact(1, 5)
   print $I0
   print "\n"
   end
.end

.sub _fact
   .param int f
   .param int n
   if n <= 1 goto fin
   f = f * n
   dec n
   .tailcall _fact(f, n)
fin:
   .return(f)
.end

CODE
120
OUT

##############################
# coroutine
pir_output_is( <<'CODE', <<'OUT', "coroutine" );
.sub test :main
    print "Hello"
    _routine()
    print "perl6"
    _routine()
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
my $cut   = '=cut';

pir_output_is( <<"CODE", <<'OUT', "pod before" );
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

pir_output_is( <<"CODE", <<'OUT', "pod before, after" );
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

pir_output_is( <<'CODE', <<'OUT', "bug #25948" );
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

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
