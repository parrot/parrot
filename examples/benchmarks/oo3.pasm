# Copyright (C) 2004-2009, Parrot Foundation.
# $Id$

.namespace [ "Foo" ]

    newclass P1, "Foo"
    addattribute P1, ".i"
    addattribute P1, ".j"

    set I10, 0
    set I11, 500000
    new P3, "Foo"
loop:
    getattribute P2, P3, ".i"
    new P10, 'Integer'	# x = Foo.i
    assign P10, P2
    getattribute P2, P3, ".j"
    new P11, 'Integer'	# y = Foo.j
    assign P11, P2
    inc I10
    lt I10, I11, loop

    getattribute P2, P3, ".i"
    print P2
    print "\n"
    end

.pcc_sub __init:
.include "interpinfo.pasm"
    interpinfo P2, .INTERPINFO_CURRENT_OBJECT
    new P10, 'Integer'
    set P10, 10
    setattribute P2, ".i", P10
    inc I0
    new P10, 'Integer'
    set P10, 20
    setattribute P2, ".j", P10
    returncc

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
