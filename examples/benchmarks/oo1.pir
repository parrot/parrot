# Copyright (C) 2004-2009, Parrot Foundation.

# all timings Athlon 800, gcc 2.95.2

# parrot SVN-HEAD
# perl 5.8.0
# python 2.3.3

# perl oo1.pl                   0.8
# python oo1.py                 1.2 (first time)
# python oo1.py                 0.51

# original list fixed           4.9     (leaks mem ~ 110 M used)
# don't clone vtable            4.4
# Dan's vtable cache            4.3           3.8
# list MIN_ITEMS 4->16          2.25
# find_global hack              2.16          1.6
# reuse exception               2.00          1.37
# reuse regsave mem                           1.25
# anchor P1                                   1.36
# Dan's new object layout                     1.05

# parrot -R jit oo1.pasm
# find_global hack                            1.51
# reuse exception                             1.30
# reuse regsave mem                           1.23
# anchor P1                                   1.32
# Dan's new object layout                     1.00


# parrot -R jit oo1-prop.pasm                     0.54

.namespace [ "Foo" ]
.sub 'main' :main
    newclass $P1, "Foo"
    addattribute $P1, ".i"
    addattribute $P1, ".j"

    set $I10, 0
    set $I11, 100000
loop:
    new $P3, "Foo"
    inc $I10
    #sleep 0.0001
    if $I10 < $I11 goto loop

    new $P3, "Foo"
    getattribute $P2, $P3, ".i"
    print $P2
    print "\n"
.end

.sub 'init' :vtable
.include "interpinfo.pasm"
    interpinfo $P2, .INTERPINFO_CURRENT_OBJECT
    new $P10, 'Integer'
    set $P10, 10
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
