    .include "iglobals.pasm"
    print "in test\n"
    loadlib P1, "myops_ops"
    print "loaded\n"
    loadlib P10, "foo"
    print "loaded\n"
    getinterp P2
    set P3, P2[.IGLOBALS_DYN_LIBS]
    print "found "
    set I1, P3
    print I1
    print " libs\n"
    null I0
lp: ge I0, I1, fin
    set P4, P3[I0]
    getprop P5, "_filename", P4
    print P5
    print "\n"
    inc I0
    branch lp
fin:

    end
