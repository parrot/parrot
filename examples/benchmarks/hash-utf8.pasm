    new P1, .PerlHash

    # add 26*26 = 676 entries
    set I0, 65
lp0:
    set I1, 65
lp1:
    chr S0, I0
    chr S1, I1
    concat S0, S1
    set P1[S0], I0
    inc I1
    le I1, 90, lp1
    inc I0
    le I0, 90, lp0

    set I0, P1
    print I0
    print " entries\n"

    # time 1e6 lookups
    time N1
    set I0, 1000000
lp2:
    set I1, P1["AA"]
    dec I0
    if I0, lp2
    time N0
    sub N0, N1
    print N0
    print "\n"

    # convert one key to utf8
    set S1, "AA"
    delete P1[S1]
    find_encoding I1, "utf8"
    transcode S2, S1, I1
    set P1[S2], 65

    # time 1e6 lookups
    time N1
    set I0, 1000000
lp3:
    set I1, P1["AA"]
    dec I0
    if I0, lp3
    time N0
    sub N0, N1
    print N0
    print "\n"
    print I1
    set I1, P1[S2]
    print I1
    print "\n"
    end


