    newclass P1, "Foo"
    find_global P2, "init"
    store_global "Foo", "__init", P2
    addattribute P1, ".i"
    addattribute P1, ".j"

    set I10, 1
    set I11, 500000
    find_type I12, "Foo"
    new P3, I12
loop:
    classoffset I0, P3, "Foo"
    new P4, .PerlInt
    set P4, I10
    setattribute P3, I0, P4
    inc I0
    new P4, .PerlInt
    set P4, I10
    setattribute P3, I0, P4
    inc I10
    le I10, I11, loop

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
    returncc
