#!perl
# Copyright (C) 2006-2007, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 2;

=head1 NAME

t/pmc/pmethod_test.t - test the PCCMETHOD_Test PMC


=head1 SYNOPSIS

    % prove t/pmc/pmethod_test.t

=head1 DESCRIPTION

Tests the PCCMETHOD_Test PMC.

=cut

pir_output_is( <<'CODE', <<'OUT', 'named args' );
.sub main :main
  $P0 = new 'PCCMETHOD_Test'
  $P0.'test_method3'( 'a1name' => 10, 'a2name' => 20 )
.end
CODE
test_method3
10, 20
OUT

pir_output_is( <<'CODE', <<'OUT', 'optional args and multiple returns' );
.sub main :main
  $P0 = new 'PCCMETHOD_Test'
  $P0.'test_method0'(1)
  $P0.'test_method1'(1, 2, 3, 4, 5, 6)
  $P0.'test_method2'()
  $P0.'test_method2'(1)
  $P0.'test_method2'(1,2)
  $P0.'test_method2'(1,2,3)
  ($P1,$P2) = $P0.'test_method2'(101)
  print "BACK - "
  print $P1
  print " - "
  print $P2
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
