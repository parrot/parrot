#!./parrot
# Copyright (C) 2009-2011, Parrot Foundation.

=head1 NAME

t/pmc/packfilebytecodesegment.t - test the PackfileBytecodeSegment PMC


=head1 SYNOPSIS

    % prove t/pmc/packfilebytecodesegment.t

=head1 DESCRIPTION

Tests the PackfileBytecodeSegment PMC.

=cut

.sub 'test' :main
.include 'test_more.pir'
    plan(9)

    $P0 = new 'PackfileBytecodeSegment'
    isa_ok($P0, 'PackfileBytecodeSegment')

    test_basics()
    test_keyed_access()
.end

.sub test_basics
    $P0 = new 'PackfileBytecodeSegment'

    $P1 = new ['ResizablePMCArray']
    $P1[0] = 'say_sc' # full name of the op
    $P1[1] = 2 # random arguments
    push $P0, $P1

    $I0 = $P0
    is( $I0, 2, 'test get_integer' )

    $I0 = elements $P0
    is( $I0, 2, 'test elements' )

    $N0 = $P0
    is( $N0, 2, 'test get_number' )

    sweep 1 # test mark
.end

.sub test_keyed_access
    $P0 = new 'PackfileBytecodeSegment'

    $P1 = new ['ResizablePMCArray']
    $P1[0] = 'say_sc' # full name of the op
    $P1[1] = 2 # random arguments
    push $P0, $P1

    $I0 = $P0[1]
    is( $I0, 2, 'test get_integer_keyed_int' )

    $P0[1] = 4
    $I0 = $P0[1]
    is( $I0, 4, 'test set_integer_keyed_int' )

    $P2 = $P0[1]
    is( $P2, 4, 'test get_pmc_keyed_int' )

    $P3 = new ['Integer']
    $P3 = 1

    $P4 = new ['Integer']
    $P4 = 6

    $P0[$P3] = $P4
    $I0 = $P0[1]
    is( $I0, 6, 'test set_pmc_keyed_pmc' )

    $P2 = $P0[$P3]
    is( $P2, 6, 'test get_pmc_keyed_pmc' )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
