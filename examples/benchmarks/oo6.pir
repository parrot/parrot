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
    $P4 = new 'Integer'
    $P4 = i
    o."i"($P4)
    o."j"($P4)
    inc i
    if i <= 500000 goto loop

    $P2 = o."i"()
    print $P2
    print "\n"
    end
.end

.namespace ["Foo"]
.sub init :method :vtable
    new $P10, 'Integer'
    set $P10, 10
    setattribute self, '.i', $P10
    new $P10, 'Integer'
    set $P10, 20
    setattribute self, '.j', $P10
.end

.sub i :method
    .param pmc v     :optional
    .param int has_v :opt_flag
    .local pmc r
    r = getattribute self, '.i'
    unless has_v goto get
    assign r, v
get:
    .return( r )
.end

.sub j :method
    .param pmc v     :optional
    .param int has_v :opt_flag
    .local pmc r
    r = getattribute self, '.j'
    unless has_v goto get
    assign r, v
get:
    .return( r )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
