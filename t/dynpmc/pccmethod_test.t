#!perl
# Copyright (C) 2006-2007, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 2;

=head1 NAME

t/dynpmc/pmethod_test.t - test the PCCMETHOD_Test PMC


=head1 SYNOPSIS

    % prove t/dynpmc/pccmethod_test.t

=head1 DESCRIPTION

Tests the PCCMETHOD_Test PMC.

=cut

pir_output_is( <<'CODE', <<'OUT', 'named args' );
.sub main :main
  $P0 = loadlib 'pccmethod_test'
  $P1 = new 'PCCMETHOD_Test'
  $P1.'test_method3'( 'a1name' => 10, 'a2name' => 20 )
.end
CODE
test_method3
10, 20
OUT

pir_output_is( <<'CODE', <<'OUT', 'optional args and multiple returns' );
.sub main :main
  $P0 = loadlib 'pccmethod_test'
  $P1 = new 'PCCMETHOD_Test'
  $P1.'test_method0'(1)
  $P1.'test_method1'(1, 2, 3, 4, 5, 6)
  $P1.'test_method2'()
  $P1.'test_method2'(1)
  $P1.'test_method2'(1,2)
  $P1.'test_method2'(1,2,3)
  ($P2,$P3) = $P1.'test_method2'(101)
  print "BACK - "
  print $P2
  print " - "
  print $P3
  print " -\n"
.end
CODE
test_method0
1
test_method1
1,2,3,4,5,6
test_method2
0, 0, ResizablePMCArray [  ]
test_method2
1, 1, ResizablePMCArray [  ]
test_method2
1, 1, ResizablePMCArray [ 2 ]
test_method2
1, 1, ResizablePMCArray [ 2, 3 ]
test_method2
101, 1, ResizablePMCArray [  ]
BACK - 1000 - KEVIN -
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
