#!./parrot
# Copyright (C) 2007, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/smop_attribute.t - test the new SMOP Attribute PMC


=head1 SYNOPSIS

    % prove t/pmc/smop_attribute.t

=head1 DESCRIPTION

Tests the SMOP_Attribute PMC.

=cut

.macro IMPORT ( lib, subname, TEMP )
	.TEMP = find_global .lib, .subname
	store_global .subname, .TEMP
.endm

.sub _main :main
    load_bytecode 'library/Test/More.pir'

    .local pmc _
    .IMPORT( 'Test::More', 'plan', _ )
    .IMPORT( 'Test::More', 'ok',   _ )
    .IMPORT( 'Test::More', 'is',   _ )

    plan( 9 )

    $P0 = new 'SMOP_Attribute'
#    ok ($P0, 'create a SMOP_Attribute')
    ok (1, 'create a SMOP_Attribute')


  $P0 = new 'SMOP_Attribute'
  $S0 = $P0.'name'("TestClass1")
  is ($S0, 'TestClass1', 'test the SMOP_Attribute name method')

  $S1 = $P0.'name'()
  is ($S1, 'TestClass1', 'test the SMOP_Attribute name method')

  $P0 = new 'SMOP_Attribute'
  $S0 = $P0.'type'("TestTypeClass1")
  is ($S0, 'TestTypeClass1', 'test the SMOP_Attribute name method')
  $S1 = $P0.'type'()
  is ($S1, 'TestTypeClass1', 'test the SMOP_Attribute name method')

  $P1 = new 'ResizableIntegerArray'
  push $P1, 1
  push $P1, 2
  push $P1, 3

  $P0 = new 'SMOP_Attribute'
  $P2 = $P0.'class'($P1)
  get_repr $S0, $P2
  is ($S0, '[ 1, 2, 3 ]', 'test the SMOP_Attribute type method with a ResizableIntegerArray' )
  $P3 = $P0.'class'()
  get_repr $S1, $P3
  is ($S1, '[ 1, 2, 3 ]', 'test the SMOP_Attribute type method with a ResizableIntegerArray' )


  $P1 = new 'FixedIntegerArray'
  set $P1, 3
  $P1[0]= 1
  $P1[1]= 2
  $P1[2]= 3

  $P0 = new 'SMOP_Attribute'
  $P2 = $P0.'class'($P1)
  get_repr $S0, $P2
  is( $S0, '[ 1, 2, 3 ]', 'test the SMOP_Attribute class method with a FixedIntegerArray' )
  $P3 = $P0.'class'()
  get_repr $S1, $P3
  is( $S1, '[ 1, 2, 3 ]', 'test the SMOP_Attribute class method with a FixedIntegerArray' )

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
