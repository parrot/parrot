# pie-thonic object with properties

    find_global P0, "__init"
    set I10, 0
    set I11, 100000
loop:
    set I0, 0
    set I3, 1
    new P5, .PerlUndef
    invokecc			# invokecc
retl:
    inc I10
    lt I10, I11, loop

    new P5, .PerlUndef
    set I0, 0
    set I3, 1
    invokecc
    getprop P2, "i", P5
    print P2
    print "\n"
    end

.pcc_sub __init:
    new P10, .PerlInt
    set P10, 10
    setprop P5, "i", P10
    new P10, .PerlInt
    set P10, 20
    setprop P5, "j", P10
    returncc
