# JaPH utilizing delegate
    new P0, .delegate
    set S0, P0[I0]
    print S0
    inc I0
    set S0, P0[I0]
    print S0
    end
.pcc_sub __get_string_keyed_int:
    unless I5, x
    set S5, "Parrot Hacker\n"
    invoke P1
x:  set S5, "Just another "
    invoke P1

