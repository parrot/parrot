# $Id$

# hack interpreters internals
    bsr _init

    set P0[0;0;0;0;31], 13
    sets_ind I31, "Hacker"
    set P0[0;0;0;0;31], 12
    sets_ind I31, "Parrot "
    set P0[0;0;0;0;31], 11
    sets_ind I31, "another "
    set P0[0;0;0;0;31], 10
    sets_ind I31, "Just "

    print S10
    print S11
    print S12
    print S13
    chr S13, I31
    print S13
    end

_init:
    dlvar P0, P1, "interpreter_array"

    new P1, .PerlArray
    push P1, -100
    push P1, 32
    push P1, 0
    new P2, .UnManagedStruct, P1

    new P3, .PerlArray
    push P3, -68
    set P9, P3[-1]
    setprop P9, "_struct", P2
    push P3, 0
    push P3, 0
    new P4, .UnManagedStruct, P3

    new P5, .PerlArray
    push P5, -68
    set P9, P5[-1]
    setprop P9, "_struct", P4
    push P5, 0
    push P5, 0
    new P6, .UnManagedStruct, P5

    new P7, .PerlArray
    push P7, -68
    set P10, P7[-1]
    setprop P10, "_struct", P6
    push P7, 0
    push P7, 0
    assign P0, P7
    ret
