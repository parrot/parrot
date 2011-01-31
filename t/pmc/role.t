#!./parrot
# Copyright (C) 2007-2008, Parrot Foundation.

=head1 NAME

t/pmc/role.t - test the Role PMC

=head1 SYNOPSIS

    % prove t/pmc/role.t

=head1 DESCRIPTION

Tests the Role PMC.

=cut

# L<PDD15/Role PMC API>

.sub main :main
    .include 'test_more.pir'

    plan(10)


    $P0 = new ['Role']
    ok(1, 'Role type exists') # or we've already died.


    $I0 = isa $P0, 'Role'
    is($I0, 1, 'isa Role')

    $P0 = new ['Hash']
    $P0['name'] = 'Flob'
    $P0['namespace'] = 'Bob'
    $P1 = new ['Role'], $P0
    ok(1, 'Created a Role using an autobased namespace')

    $P0 = new ['Hash']
    $P0['name'] = 'Wob'
    $P1 = new ['Role'], $P0
    ok(1, 'Created a Role initialized with a Hash')

    $P2 = $P1.'inspect'('name')
    $S0 = $P2
    $I0 = $S0 == 'Wob'
    ok($I0, 'Role name was set correctly')


    $P2 = $P1.'inspect'('namespace')
    $S0 = $P2
    $I0 = $S0 == 'Wob'
    ok($I0, 'Role namespace was set correctly')

    $P3 = $P1.'inspect'()
    $S0 = $P3['name']
    is($S0, "Wob", "inspect hash name correct")

    $S0 = $P1
    is($S0, "Wob", "name through get_string correct")

    # Test init with attributes in the init hash.
    $P1 = new ['FixedStringArray']
    $P1 = 1
    $P1[0] = "test_attr"
    $P2 = new ['Hash']
    $P2['name'] = 'Attr Test'
    $P2['attributes'] = $P1

    $P0 = new ['Role'], $P2
    $P3 = $P0."inspect"('attributes')
    $I0 = exists $P3['test_attr']
    is($I0, 1, "Init with attributes")

    # Test init with just a namespace
    $P2 = new ['Hash']
    $P2['namespace'] = 'Bob'
    $P0 = new ['Role'], $P2
    $S0 = $P0."inspect"('namespace')
    is($S0, "Bob", "Init with just namespace")

    # Test mark()
    sweep 1
.end

## TODO add more tests as this is documented and implemented

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
