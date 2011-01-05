# Copyright (C) 2004-2009, Parrot Foundation.

.namespace [ "Foo" ]

.pcc_sub :main main:
    newclass P1, "Foo"
    addattribute P1, ".i"
    addattribute P1, ".j"

    set I10, 1
    set I11, 500000
    new P3, "Foo"
loop:
    new P4, 'Integer'
    set P4, I10
    setattribute P3, ".i", P4
    new P4, 'Integer'
    set P4, I10
    setattribute P3, ".j", P4
    inc I10
    le I10, I11, loop

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
    new P10, 'Integer'
    set P10, 20
    setattribute P2, ".j", P10
    returncc

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
