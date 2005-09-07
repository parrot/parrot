# $Id$

# a JapH compiler "_japhc" compiles this program:
    set S5, "pJ pa pP pH pn e "
# into executable bytecode and runs it
    find_global P0, "_japhc"
    # compile program
    set I0, 1
    set I2, 1
    invokecc
    # run program
    invoke P5
    end

# compile program in S5, return executable
.pcc_sub _japhc:
    ## print S5
    ## print "\n"
    length I1, S5
    null I0
    set S6, ""  # program
lp:
    substr S0, S5, I0, 1
    ne S0, "p", not_p
    concat S6, "print "
    branch next
not_p:
    ne S0, "e", not_e
    concat S6, "end"
    branch next
not_e:
    ne S0, "n", not_n
    concat S6, '"\n"'
    branch next
not_n:
    ne S0, " ", not_sp
    concat S6, "\n"
    branch next
not_sp:
    ne S0, "J", not_J
    concat S6, '"Just "'
    branch next
not_J:
    ne S0, "a", not_a
    concat S6, '"another "'
    branch next
not_a:
    ne S0, "P", not_P
    concat S6, '"Parrot "'
    branch next
not_P:
    ne S0, "H", not_H
    concat S6, '"Hacker"'
    branch next
not_H:
    printerr "Unknown token '"
    printerr S0
    printerr "'\n"

next:
    inc I0
    lt I0, I1, lp
    # now compile S6
    ## print S6
    compreg P0, "PASM"
    compile P5, P0, S6
    set I0, 0
    set I3, 1
    invoke P1
