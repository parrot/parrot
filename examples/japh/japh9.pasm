# another one with delegate
    new P0, .delegate
    delete P0[S0;"another";S0;"Parrot";S0]
    end
.pcc_sub __delete_keyed:
    set S0, " "
l:
    print P5
    shift P5, P5
    isnull P5, e
    branch l
e:
    inc P2
    invoke P1
.pcc_sub __init:
    print "Just"
    invoke P1
.pcc_sub __increment:
    print "Hacker\n"
    invoke P1

