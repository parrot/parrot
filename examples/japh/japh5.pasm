# JaPH utilizing an object
    newclass P0, "Japh"
    set P0[1], "Just"
    set P0[2], "another"
    set P0[3], "Parrot"
    set P0[0], "Hacker"
    end
.namespace ["Japh"]
.pcc_sub __set_string_keyed:
	get_params "(0,0,0)", P5, I5, S5
    print S5
    if I5, sp
    print "\n"
    returncc
sp:
    print " "
    returncc

