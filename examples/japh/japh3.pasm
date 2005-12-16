# the substr JaPH
    set S0, "Hacker\n"
    set S1, "Parrot "
    set S2, "another "
    set S3, "Just "
    set S31, S0
    substr S3, 5,  1, S2
    substr S3, 13, 1, S1
    substr S3, 20, 1, S0
    set I3, 3
    bsr I3
    end
	print S3
    ret
