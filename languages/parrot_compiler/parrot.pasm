#
# parrot.pasm
# 
# Parrot compiler.
#
# $Id$
#

MAIN:
    set I23,8
    set I24,4

    new P31,PerlHash
    set_keyed P31,"a",0x7
    set_keyed P31,"n",0xa
    set_keyed P31,"r",0xd
    set_keyed P31,"t",0x9
    set_keyed P31,"\",0x5c

    bsr LOAD
    print "Input file: "
    readline S15,0
    chopn S15,1
    open I20,S15
    print "Output file: "
    readline S15,0
    chopn S15,1
    open P0,S15, ">"
    bsr READ
    end

READ:
    readline S0,I20
    set I0, 0
    length I0,S0
    unless I0, FINISH
    index I0, S0, ":"
    eq I0, -1, HANDLE_OPCODE
    bsr HANDLE_LABEL 
    branch HANDLE_OPCODE

END_HO:    
    branch READ

FINISH:
    bsr OUTPUT
    ret

# Make from the line something I can understand
LINE:
    index I6, S0, " ", I0
    eq I0, I6, INCI0
    length I6, S0
    dec I6
    eq I0, I6, NEXTLINE
    index I6, S0, "#", I0
    eq I6, -1, RETURN
    eq I0, I6, DISCARD
RETURN:
    chopn S0, 1
    concat S0, ","
    ret

DISCARD:
    set I0,-1
    ret

INCI0:
    inc I0
    branch LINE

NEXTLINE:
    readline S6, I20
    chopn S0,1
    concat S0, S6
    branch LINE
    
# Get the opcode name.

HANDLE_OPCODE:
    inc I0
    bsr LINE
    # There are better ways but ...
    eq I0, -1, READ
    index I1, S0, " ", I0
    sub I1,I1,I0
    substr S1, S0, I0, I1
    add I0, I0, I1
    inc I0
    bsr GET_OPCODE_NUMBER
    bsr HANDLE_OPCODE_ARGS

    length I3,S1
    branch END_HO

HANDLE_LABEL:
    substr S1, S0, 0, I0
    concat S29, S1
    concat S29, "#"
    length I30, S28
    set S2, I30 
    concat S29, S2
    concat S29, "#"
    ret

GET_OPCODE_NUMBER:
    index I2, S31, S1
    index I2, S31, "#", I2
    inc I2
    index I3, S31, "#", I2
    sub I3, I3, I2
    substr S2, S31, I2, I3 
    set I3, S2
    pack S28,I24,I3
    set I22,I24
    ret

HANDLE_ARG_LABEL:
    index I4, S0, ",", I0
    sub I4, I4, I0
    substr S2, S0, I0, I4
    add I0, I0, I4
    inc I0
    concat S2, "#"
    concat S27, S2
    length I4, S28
    sub I4,I4,I22
    set S2, I4
    concat S2, "#"
    concat S27,S2
    set S2, I22
    concat S2, "#"
    concat S27,S2
    pack S28,I24,0
    add I22,I22,I24
    ret
    
HANDLE_ARG_REG:
HANDLE_ARG_INT:
    index I4, S0, ",", I0
    sub I4, I4, I0
    substr S2, S0, I0, I4
    add I0, I0, I4
    inc I0
    set I4, S2
    pack S28,I24,I4
    add I22,I22,I24
    ret 

HANDLE_ARG_NUM:
    pack S28,I24,I25
    inc I25
    index I4, S0, ",", I0
    sub I4, I4, I0
    substr S2, S0, I0, I4
    add I0, I0, I4
    inc I0
    set N5, S2
    # type
    pack S30,I24,0x6e
    # size
    pack S30,I24,I23
    pack S30,I23,N5
    add I22,I22,I24
    ret
    
HANDLE_ARG_STR:
    pack S28,I24,I25
    inc I25
    substr S2, S0, I0, 1
    add I2, I0, 1
    index I4, S0, S2, I2
    sub I5, I4, I2
    substr S2, S0, I2, I5
    set I2,0
    bsr ESCAPE
    set I8, I5
    mod I7,I5,I24
    unless I7, DONTFILL
    sub I7,I24,I7
    add I8,I8,I7
DONTFILL:
    add I7,I8,16
    # type
    pack S30,I24,0x73
    # size 
    pack S30,I24,I7
    # flags 
    pack S30,I24,0
    # encoding 
    pack S30,I24,0
    # type of string 
    pack S30,I24,0
    # size 
    pack S30,I24,I5
    # string
    pack S30,I8,S2
    add I22,I22,I24
    ret

ESCAPE:
    index I4,S2,"\",I2
    eq I4,-1,FINISH_ESCAPE
    add I7,I4,1
    index I6,S2,"a",I4
    eq I6,I7,ESCAPE_IT
    index I6,S2,"n",I4
    eq I6,I7,ESCAPE_IT
    index I6,S2,"r",I4
    eq I6,I7,ESCAPE_IT
    index I6,S2,"t",I4
    eq I6,I7,ESCAPE_IT
    index I6,S2,"\\",I7
    eq I6,I7,ESCAPE_IT
    set I2,I7
    branch ESCAPE

ESCAPE_IT:
    substr S12,S2,I7,1
    get_keyed I6, P31, S12
    pack S2,1,I6,I4
    inc I4
    substr S12,S2,0,I4
    length I6,S2
    inc I7
    sub I6,I6,I7
    substr S13,S2,I7,I6
    concat S2,S12,S13
    dec I5
    sub I2,I7,1
    branch ESCAPE


FINISH_ESCAPE:
    ret

FIXUP:
    index I12,S27,"#",I11 
    eq I12,-1,ENDFIXUP
    sub I17,I12,I11
    substr S11,S27,I11,I17
    bsr GET_LABEL_ADDRESS
    inc I12
    index I14, S27, "#", I12
    sub I18,I14,I12
    substr S11,S27,I12,I18
    set I15,S11
    inc I14
    index I16, S27, "#", I14
    set I11,I16
    inc I11
    sub I16,I16,I14
    substr S11,S27,I14,I16
    set I16,S11
    add I16,I16,I15
    sub I15,I13,I15
    div I15,I15,I24
    pack S28, 4, I15, I16
    branch FIXUP
ENDFIXUP:
    ret
    
GET_LABEL_ADDRESS:
    index I2, S29, S11
    index I2, S29, "#", I2
    inc I2
    index I13, S29, "#", I2
    sub I13, I13, I2
    substr S2, S29, I2, I13 
    set I13, S2
    ret
 
OUTPUT:
    # This is not portable, yet.
    pack S24,I24,I24
    pack S24,I24,0x7a7a0000        
    pack S24,I24,0x7a7a7a7a
    pack S24,I24,0x7a7a7a7a
    # The magic
    pack S24,I24,0x013155a1        
    # Opcodetype
    pack S24,I24,0x5045524c
    # No fixup_ss for the moment
    pack S24,I24,0
    length I10,S30
    add I10,I10,I24
    pack S24,I24,I10
    pack S24,I24,I25
    print P0, S24

    length I10,S28
    pack S30,I24,I10 
    print P0, S30

    bsr FIXUP
    print P0, S28
    close P0
    ret

#
# $Log$
# Revision 1.1  2002/05/16 18:31:04  grunblatt
# The first version of the Parrot compiler written in Parrot.
# You must provide fully qualified opcode names.
#
#

# Everything from this line is autogenerated by gentable.pl
