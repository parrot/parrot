# all timings Athlon 800, gcc 2.95.2
# parrot CVS
# perl 5.8.0
# python 2.3.3

# perl oo1.pl                   0.8
# python pp1.py                 1.2 (first time)
# python pp1.py                 0.5

# parrot -C oo1.pasm
# original list fixed           4.9 leaks mem ~ 110 M used
# don't clone vtable            4.4
# Dan's vtable cache            4.3
# Dan's vtable cache -O3        3.8

    newclass P1, "Foo"
    find_global P2, "init"
    store_global "Foo", "__init", P2
    addattribute P1, ".i"
    addattribute P1, ".j"

    set I10, 0
    set I11, 100000
    find_type I12, "Foo"
loop:
    new P3, I12
    inc I10
    #sleep 0.0001
    lt I10, I11, loop

    new P3, I12
    classoffset I0, P3, "Foo"
    getattribute P2, P3, I0
    print P2
    print "\n"
    typeof I0, P3
    end

.pcc_sub init:
    classoffset I0, P2, "Foo"
    new P10, .PerlInt
    set P10, 10
    setattribute P2, I0, P10
    inc I0
    new P10, .PerlInt
    set P10, 20
    setattribute P2, I0, P10
    invoke P1
