#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

t/pmc/prop.t - Properties

=head1 SYNOPSIS

    % prove t/pmc/prop.t

=head1 DESCRIPTION

Tests property access on PMCs.

=cut

.sub main :main
    .include 'test_more.pir'
    plan(15)

    setprop_getprop_tests()
    prop_vals_are_refs()
    prop_reset()
    get_unset_prop()
    delprop_tests()
    prophash_tests()
.end


.sub setprop_getprop_tests
    new $P0, ['Integer']
    set $P0, 10
    new $P1, ['String']
    set $P1, "ten"
    setprop $P0, "en", $P1
    new $P2, ['String']
    set $P2, "zehn"
    setprop $P0, "de", $P2
    is($P0, "10", "setprop is ok")
    getprop $P3, $P0, "en"
    is($P3, "ten", "getprop is ok")
    getprop $P3, $P0, "de"
    is($P3, "zehn", "getprop is ok")
.end

.sub prop_vals_are_refs
    new $P0, ['String']
    new $P1, ['String']
    set $P0, "Dog"

    set $S0, "Brown"
    set $P1, "Yes"
    setprop $P0, $S0, $P1

    set $S0, "Black"
    set $P1, "No"
    setprop $P0, $S0, $P1
    new $P2, ['String']
    getprop $P2, $P0, "Black"
    is($P2, "No", "'Black' property refers to right string")
    getprop $P2, $P0, "Brown"
    is($P2, "No", "'Brown' property refers to same string as 'Black'")
.end

.sub prop_reset
    new $P0, ['ResizablePMCArray']
    new $P1, ['String']
    new $P2, ['String']
    new $P3, ['String']

    set $S0, "Type"
    set $P1, "Integer"
    setprop $P0, $S0, $P1
    getprop $P2, $P0, $S0
    is($P2, "Integer", "'Type' property successfully set to Integer'")
    set $P3, "Float"
    setprop $P0, $S0, $P3
    getprop $P2, $P0, $S0
    is($P2, "Float", "'Type' property successfully changed to Float'")
.end

.sub get_unset_prop
    new $P1, ['Float']
    new $P2, ['Integer']

    getprop $P2, $P1, "Wibble"
    defined $I2, $P2
    is($I2, 0, "unset property isn't defined")
.end

.sub delprop_tests
    new $P0, ['Integer']
    set $P0, 10
    new $P1, ['String']
    set $P1, "ten"
    setprop $P0, "en", $P1
    new $P2, ['String']
    set $P2, "zehn"
    setprop $P0, "de", $P2
    is($P0, "10", "ok")
    getprop $P3, $P0, "en"
    is($P3, "ten", "ok")
    getprop $P3, $P0, "de"
    is($P3, "zehn", "ok")
    delprop $P0, "de"
    getprop $P3, $P0, "de"
    if_null $P3, ok
    ok(0, "'de' property not deleted")
    goto end
ok:
    ok(1, "'de' property deleted")
end:
.end

.sub prophash_tests
    new $P0, ['Integer']
    set $P0, 10
    new $P1, ['String']
    set $P1, "ten"
    setprop $P0, "en", $P1
    new $P2, ['String']
    set $P2, "zehn"
    setprop $P0, "de", $P2
    prophash $P3, $P0
    set $S0, $P3["en"]
    is($S0, "ten", "getprop via prophash works")
    set $S0, $P3["de"]
    is($S0, "zehn", "getprop via prophash works")
    set $S0, $P3["xx"]
    is($S0, "", "getprop via prophash works for unset prop")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
