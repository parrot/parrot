    #bounds 1	# be sure we run with plain func core
    .include "iglobals.pasm"
    print "in test\n"
    loadlib P1, "myops_ops"
    defined I0, P1
    if I0, ok1
    print "not "
ok1:
    print "loaded myops_ops\n"
    loadlib P10, "foo"
    defined I0, P10
    if I0, ok2
    print "not "
ok2:
    print "loaded foo\n"
    loadlib P11, "libnci_test"
    defined I0, P11
    if I0, ok3
    print "not "
ok3:
    print "loaded libnci_test\n"
    getinterp P2
    set P3, P2[.IGLOBALS_DYN_LIBS]
    print "found "
    set I1, P3
    print I1
    print " libs\n"
    null I0
lp: ge I0, I1, fin
    set P4, P3[I0]
    getprop P5, "_type", P4
    print P5
    print "   "
    getprop P5, "_filename", P4
    print P5
    print "\n"
    inc I0
    branch lp
fin:

    # now the fun can start
    print "the answer is: "
    fortytwo I0
    print I0
    what_do_you_get_if_you_multiply_six_by_nine S0
    print " aka "
    print S0
    print "\n"
    end
