# Copyright (C) 2004-2009, Parrot Foundation.

.sub bench :main
    .local pmc cl
    cl = newclass "Foo"
    addattribute cl, ".i"
    addattribute cl, ".j"

    .local int typ
    .local int i
    i = 1
    .local pmc o
    o = new "Foo"
loop:
    $P4 = o."i"()
    .local pmc x
    x = new 'Integer'
    assign x, $P4

    $P5 = o."j"()
    .local pmc y
    y = new 'Integer'
    assign y, $P5
    inc i
    if i <= 50000 goto loop

    $P2 = o."i"()
    print $P2
    print "\n"
    end
.end

.namespace ["Foo"]
.sub init :method :vtable
    new $P10, 'Integer'
    set $P10, 10
    setattribute self, ".i", $P10
    new $P10, 'Integer'
    set $P10, 20
    setattribute self, ".j", $P10
.end

.sub i :method
    .local pmc r
    r = getattribute self, ".i"
    .return( r )
.end

.sub j :method
    .local pmc r
    r = getattribute self, ".j"
    .return( r )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
