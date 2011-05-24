#! parrot
# Copyright (C) 2011, Parrot Foundation.

.sub main :main
    .include 'test_more.pir'
    plan(1)

    .local pmc F, f, d, r
    loadlib F, "foo_group"
    f = new "Foo"
    f = 1
    d = new 'Integer'
    r = new 'Integer'
    r = 2
    d = f - r
    is(d, 144, 'Foo subclass isa Integer')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
