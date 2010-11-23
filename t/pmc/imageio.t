#!./parrot
# Copyright (C) 2010, Parrot Foundation.

=head1 NAME

t/pmc/imageio.t - test ImageIOFreeze and ImageIOThaw PMC

=head1 SYNOPSIS

    % prove t/pmc/imagio.t

=head1 DESCRIPTION

Tests the ImageIO PMC.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(12)

    .local pmc frz, thw
    frz = new ['ImageIOFreeze']
    ok(1, 'instantiated ImageIOFreeze')

    thw = new ['ImageIOThaw']
    ok(1, 'instantiated ImageIOThaw')

    .local pmc test_pmc
    test_pmc = 'get_test_simple'()
    setref frz, test_pmc
    $S0 = frz
    ok($S0, 'frozen PMC is true (simple)')
    $S1 = freeze test_pmc
    is($S0, $S1, 'freeze gives same image as ImageIO (simple)')

    thw = $S0
    $P0 = deref thw
    ok($P0, 'thawed PMC is true (simple)')
    $P1 = thaw $S1
    is($P0, $P1, 'thaw gives same PMC as ImageIO (simple)')
    is($P0, test_pmc, 'round trip gives same PMC (simple)')

    frz = new ['ImageIOFreeze']
    test_pmc = 'get_test_aggregate'()
    setref frz, test_pmc
    $S0 = frz
    ok($S0, 'frozen PMC is true (aggregate)')
    $S1 = freeze test_pmc
    is($S0, $S1, 'freeze gives same image as ImageIO (aggregate)')

    thw = new ['ImageIOThaw']
    thw = $S0
    $P0 = deref thw
    ok($P0, 'thawed PMC is true (aggregate)')
    $P1 = thaw $S1
    is_deeply($P0, $P1, 'thaw gives same PMC as ImageIO (aggregate)')
    is_deeply($P0, test_pmc, 'round trip gives same PMC (aggregate)')
.end

.sub get_test_simple
    $P0 = new ['Integer']
    $P0 = -99
    .return ($P0)
.end

.sub get_test_aggregate
    $P0 = new ['ResizableStringArray']
    $P0[0] = 'parrot'
    $P0[1] = '???'
    $P0[2] = 'profit'
    .return ($P0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
