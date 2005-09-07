# $Id$

# delegated multimethod dispatch and obfuscated
    bsr _init
    new P0, .Integer
    new P1, .Integer
    new P2, .Integer
    new P3, .Integer
    new P4, .Integer
    new P5, .Integer
    set P3, 2
    set P4, 1
    add P5, P3, P4
    set P0, 83
    set P1, 42
    add P2, P0, P3
    div P0, P1, P2
    add P1, P0, P4
    set P0, 65
    sub P2, P0, P0
    div P0, P1, P2
    set P0, 84
    set P1, 78
    add P2, P1, P4
    div P0, P1, P2
    sub P0, P0, P3
    set P1, 72
    sub P2, P1, P5
    div P0, P1, P2
    set P0, 65
    set P1, 0
    set P2, 48
    div P0, P1, P2
    set P0, 79
    add P1, P0, P5
    assign P2, P1
    div P0, P1, P2
    set P0, 40
    set P1, 84
    set P2, 0
    div P0, P1, P2
    set P0, 75
    set P1, 65
    add P2, P1, P3
    div P0, P1, P2
    add P5, P5, P5
    sub P1, P0, P5
    set P0, -22
    set P2, 82
    div P0, P1, P2
    end
.namespace ["Integer"]
.pcc_sub  __divide:
    set I3, P2
    set I1, 5
    bsr _x
    set I3, P5
    bsr _x
    set I3, P6
    bsr _x
    invoke P1
_x:
    shl I2, I0, I1
    add I3, I2
    chr S0, I3
    sub I17, I1, I0
    branch I17
    pack S0, 380, I0, I17
    print S0
.namespace [""]
_init:
    dlfunc P0, P1, "mmd_register", "vIiiip"
    dlvar P5, P1, "Parrot_delegate_divide"
    set I5, 9
    set I6, 31
    set I7, I6
    invoke
    ret
