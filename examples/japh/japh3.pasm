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
    substr S2,  772, I3, S31
    substr S1,  772, I2, S31
    substr S0,  772, I1, S31
    substr S31, 772, I0, S31
    end
    print S0
    ret
