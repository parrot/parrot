#! parrot
# Copyright (C) 2011, Parrot Foundation.

.sub main :main
    .include 'test_more.pir'
    plan(1)

    ## load a relative pathname without the extension.  loadlib will convert the
    ## '/' characters to '\\' on windows.
    $S0 = "runtime/parrot/dynext/foo_group"
    loadlib $P1, $S0

    ## ensure that we can still make Foo instances.
    $P1 = new "Foo"
    $I1 = $P1
    is($I1, 42, 'test loadlib with relative pathname, no ext')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
