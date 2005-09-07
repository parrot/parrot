# $Id$

# another one with an object
    newclass P0, "Japh"
    find_type I0,"Japh"
    new P0, I0
    delete P0[S0;"another";S0;"Parrot";S0]
    end
.namespace ["Japh"]
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

