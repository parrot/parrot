# JaPH utilizing delegate
    new P0, .delegate
    set P0[1], "Just"
    set P0[2], "another"
    set P0[3], "Parrot"
    set P0[0], "Hacker"
    end
.pcc_sub __set_string_keyed_int:
    print S5
    if I5, sp
    print "\n"
    invoke P1
sp:
    print " "
    invoke P1

