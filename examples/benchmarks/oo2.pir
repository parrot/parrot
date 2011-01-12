# Copyright (C) 2004-2009, Parrot Foundation.

# all timings Athlon 800, gcc 2.95.2

# parrot SVN-HEAD
# perl 5.8.0
# python 2.3.3

# perl oo2.pl                                 4.0
# python oo2.py                               2.9 (first time)
# python oo2.py                               2.4

# parrot -R jit oo2.pasm            -g           -O3
#   with reuse regsave mem                    6.1
# anchor P1                                   6.5
# Dan's new object layout                     4.9

# parrot -R jit oo2-prop.pasm                     2.6

.namespace [ "Foo" ]
.sub 'main' :main
    newclass $P1, "Foo"
    addattribute $P1, ".i"
    addattribute $P1, ".j"

    $I10 = 0
    $I11 = 50000
loop:
    new $P3, "Foo"
    inc $I10
    if $I10 < $I11 goto loop

    new $P3, "Foo"
    getattribute $P2, $P3, ".i"
    print $P2
    print "\n"
.end

.sub 'init' :vtable
.include "interpinfo.pasm"
    interpinfo $P2, .INTERPINFO_CURRENT_OBJECT
    $P10 = new 'Integer'
    $P10 = 10
    setattribute $P2, ".i", $P10
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
