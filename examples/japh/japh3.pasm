# the substr JaPH
    bounds 1
    trace 0
    set S0, "Hacker\n"
    set S1, "Parrot "
    set S2, "another "
    set S3, "Just "
    set S31, S0
    set I3, 4
    bsr I3
    substr S24, 380, I3, S31
    substr S1,  380, I2, S31
    substr S0,  380, I1, S31
    substr S31, 380, I0, S24
    end
    print S0
    ret

