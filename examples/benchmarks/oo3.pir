# Copyright (C) 2004-2009, Parrot Foundation.

.namespace [ "Foo" ]
.sub 'main' :main
    newclass $P1, "Foo"
    addattribute $P1, ".i"
    addattribute $P1, ".j"

    $I10 = 0
    $I11 = 500000
    $P3  = new "Foo"
loop:
    getattribute $P2, $P3, ".i"
    $P10 = new 'Integer'	# x = Foo.i
    assign $P10, $P2
    getattribute $P2, $P3, ".j"
    $P11 = new 'Integer'	# y = Foo.j
    assign $P11, $P2
    inc $I10
    if $I10 < $I11 goto loop

    getattribute $P2, $P3, ".i"
    print $P2
    print "\n"
.end

.sub init :vtable
.include "interpinfo.pasm"
    Parrot_interp_info $P2, .INTERPINFO_CURRENT_OBJECT
    $P10 = new 'Integer'
    $P10 = 10
    setattribute $P2, ".i", $P10
    inc $I0
    $P10 = new 'Integer'
    $P10 = 20
    setattribute $P2, ".j", $P10
    .return ()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
