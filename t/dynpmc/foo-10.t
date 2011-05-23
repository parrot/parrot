#! parrot
# Copyright (C) 2011, Parrot Foundation.

# load our Foo test (pseudo) language
# it defines one PMC type "Foo"
.HLL "Fool"
.loadlib "foo_group"

.sub main :main
    .include 'test_more.pir'
    plan(1)

    new $P1, 'Foo'      # load by index
    $I1 = $P1
    is($I1, 42, '.HLL 2')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
