# JaPH utilizing object
    newclass P1, "Japh"
    find_type I1, "Japh"
    new P0, I1
    set S0, P0[I0]
    print S0
    inc I0
    set S0, P0[I0]
    print S0
    end
.namespace ["Japh"]
.pcc_sub __get_string_keyed:
    set I3, 0
    set I5, P5
    unless I5, x
    set S5, "Parrot Hacker\n"
    invoke P1
x:  set S5, "Just another "
    invoke P1

