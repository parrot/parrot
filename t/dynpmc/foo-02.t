#! parrot
# Copyright (C) 2011, Parrot Foundation.

.sub main :main
    .include 'test_more.pir'
    plan(1)

    loadlib $P1, 'foo_group'
    sweep 1
    $P2 = getprop '_type', $P1
    $S0 = $P2
    is($S0, 'PMC', 'ParrotLibrary props survive GC')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
