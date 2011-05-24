#! parrot
# Copyright (C) 2011, Parrot Foundation.

.sub main :main
    .include 'test_more.pir'
    plan(3)

    .include "iglobals.pasm"
    .local pmc config_hash, interp
    .local pmc d, l, r
    interp = getinterp
    config_hash = interp[.IGLOBALS_CONFIG_HASH]
    $S0 = config_hash['gmp']
    unless $S0 goto no_bigint

    $P0 = loadlib "foo_group"
    ok(1, 'inherited add - loadlib')
    l = new "Foo"
    l = 42
    r = new 'BigInt'
    r = 0x7ffffff
    d = new 'Undef'
    add d, l, r
    is(d, 134217769, 'inherited add')
    $S0 = typeof d
    is($S0, 'BigInt', 'inherited add - typeof')
    .return()
  no_bigint:
    skip( 3, 'No BigInt Lib configured' )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
