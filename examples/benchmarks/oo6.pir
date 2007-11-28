# $Id$

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
.sub __init :method
    .local int ofs
    ofs = classoffset self, "Foo"
    new $P10, 'Integer'
    set $P10, 10
    setattribute self, ofs, $P10
    inc ofs
    new $P10, 'Integer'
    set $P10, 20
    setattribute self, ofs, $P10
.end

.sub i :method
    .param pmc v     :optional
    .param int has_v :opt_flag
    .local int ofs
    ofs = classoffset self, "Foo"
    .local pmc r
    r = getattribute self, ofs
    unless has_v goto get
    assign r, v
get:
    .begin_return
    .return r
    .end_return
.end

.sub j :method
    .param pmc v     :optional
    .param int has_v :opt_flag
    .local int ofs
    ofs = classoffset self, "Foo"
    inc ofs
    .local pmc r
    r = getattribute self, ofs
    unless has_v goto get
    assign r, v
get:
    .begin_return
    .return r
    .end_return
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
