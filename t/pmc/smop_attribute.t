#!perl
# Copyright (C) 2006, The Perl Foundation.
# $Id: /parrot/cc/t/pmc/pmethod_test.t 2562 2007-02-24T15:21:50.392350Z tewk  $

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 5;

=head1 NAME

t/pmc/smop_attribute.t - test the new SMOP Attribute PMC


=head1 SYNOPSIS

    % prove t/pmc/smop_attribute.t

=head1 DESCRIPTION

Tests the SMOP_Attribute PMC.

=cut

pir_output_is( <<'CODE', <<'OUT', 'create a SMOP_Attribute' );
.sub main :main
  $P0 = new 'SMOP_Attribute'
.end
CODE
OUT

pir_output_is( <<'CODE', <<'OUT', 'test the SMOP_Attribute name method' );
.sub main :main
  $P0 = new 'SMOP_Attribute'
  $S0 = $P0.'name'("TestClass1")
  print $S0
  print "\n"
  $S1 = $P0.'name'()
  print $S1
  print "\n"
.end
CODE
TestClass1
TestClass1
OUT

pir_output_is( <<'CODE', <<'OUT', 'test the SMOP_Attribute type method' );
.sub main :main
  $P0 = new 'SMOP_Attribute'
  $S0 = $P0.'type'("TestTypeClass1")
  print $S0
  print "\n"
  $S1 = $P0.'type'()
  print $S1
  print "\n"
.end
CODE
TestTypeClass1
TestTypeClass1
OUT

pir_output_is( <<'CODE', <<'OUT', 'test the SMOP_Attribute type method with a ResizableIntegerArray' );
.sub main :main
  $P1 = new 'ResizableIntegerArray'
  push $P1, 1
  push $P1, 2
  push $P1, 3

  $P0 = new 'SMOP_Attribute'
  $P2 = $P0.'class'($P1)
  get_repr $S0, $P2
  print $S0
  print "\n"
  $P3 = $P0.'class'()
  get_repr $S1, $P3
  print $S1
  print "\n"
.end
CODE
[ 1, 2, 3 ]
[ 1, 2, 3 ]
OUT

pir_output_is( <<'CODE', <<'OUT', 'test the SMOP_Attribute class method with a FixedIntegerArray' );
.sub main :main
  $P1 = new 'FixedIntegerArray'
  set $P1, 3
  $P1[0]= 1
  $P1[1]= 2
  $P1[2]= 3

  $P0 = new 'SMOP_Attribute'
  $P2 = $P0.'class'($P1)
  get_repr $S0, $P2
  print $S0
  print "\n"
  $P3 = $P0.'class'()
  get_repr $S1, $P3
  print $S1
  print "\n"
.end
CODE
[ 1, 2, 3 ]
[ 1, 2, 3 ]
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
