# JaPH utilizing an object
    newclass P0, "Japh"
    find_type I0, "Japh"
    new P0, I0
    set P0[1], "Just"
    set P0[2], "another"
    set P0[3], "Parrot"
    set P0[0], "Hacker"
    end
.namespace ["Japh"]
.pcc_sub __set_string_keyed:
    print S5
    set I5, P5
    if I5, sp
    print "\n"
    invoke P1
sp:
    print " "
    invoke P1

