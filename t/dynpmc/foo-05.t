#! parrot
# Copyright (C) 2011, Parrot Foundation.

.sub main :main
    .include 'test_more.pir'
    plan(1)

    ## get load_ext in $S0.
    .include "iglobals.pasm"
    $P11 = getinterp
    $P12 = $P11[.IGLOBALS_CONFIG_HASH]
    $S0 = $P12["load_ext"]

    ## load a relative pathname with an extension.
    $S0 = concat "runtime/parrot/dynext/foo_group", $S0
    loadlib $P1, $S0

    ## ensure that we can still make Foo instances.
    $P1 = new "Foo"
    $I1 = $P1
    is($I1, 42, 'loadlib with relative pathname & ext')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
