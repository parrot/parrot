#! parrot
# Copyright (C) 2011, Parrot Foundation.

.sub main :main
    .include 'test_more.pir'
    plan(1)

    ## get cwd in $S0.
    .include "iglobals.pasm"
    $P11 = getinterp
    $P12 = $P11[.IGLOBALS_CONFIG_HASH]
    $S0 = $P12["prefix"]

    ## convert cwd to an absolute pathname without the extension, and load it.
    ## this should always find the version in the build directory, since that's
    ## the only place "make test" will work.
    $S0 .= "/runtime/parrot/dynext/foo_group"
    loadlib $P1, $S0

    ## ensure that we can still make Foo instances.
    $P1 = new "Foo"
    $I1 = $P1
    is($I1, 42, 'loadlib with absolute pathname, no ext')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
