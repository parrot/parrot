#
# parrot.pasm
# 
# Parrot compiler.
#
# $Id$
#

# It will compile any Parrot program written with fully qualified 
# opcode names, opcode arguments without their type (no I/N/S/P), 
# no spaces between arguments, no spaces between labels and opcode
# names, no empty lines, no comments and no lines without an opcode.


# Registers usage:
# I0  the position in the input line.
# I20 input file descriptor.
# I22 the size of the current opcode.
# I23 sizeof floats.
# I24 sizeof opcode_t.
# I29 the last label identifier.
# S28 the bytecode.
# S30 the constant table.
# P2  is a hash with the opcode full names as keys 
#     and opcode numbers as values.
# XXX This should be done using a hash of arrays, or something like that.
#     I31 is the label references count.
#     P3  is an array with labels.
#     P4  is an array with the labels positions (the address of the opcode).
#     P5  is an array with the position to apply the label within the opcode.
#     P6  is a hash with the labels as keys and the position they mark as values.
# P7  is an array with the addresses of the labels of each opcode handler.
# P31 escape secuences.

MAIN:
    set I23,8
    set I24,4

    new P2,.PerlHash
    new P3,.PerlArray
    new P4,.PerlArray
    new P5,.PerlArray
    new P6,.PerlHash
    new P7,.PerlArray
    new P31,.PerlHash
    set P31["a"],0x7
    set P31["n"],0xa
    set P31["r"],0xd
    set P31["t"],0x9
    set P31["\\"],0x5c

    bsr LOAD
    # Get the name of the input file
    set S15,P0[1]
    open P20,S15
    # Get the name of the output file
    set S15,P0[2]
    open P1,S15,">"
    bsr READ
    end
 
READ:
    readline S0,P20
    set I0, 0
    length I0,S0
    unless I0, FINISH
    index I0, S0, ":"
    chopn S0,1
    concat S0,","
    ne I0, -1, HANDLE_LABEL
    branch HANDLE_OPCODE

FINISH:
    bsr OUTPUT
    ret

HANDLE_LABEL:
    # get the label
    substr S1, S0, 0, I0
    # set the label position
    length I30,S28
    set P6[S1],I30

HANDLE_OPCODE:
    inc I0
    index I1, S0, " ", I0
    sub I1,I1,I0
    substr S1, S0, I0, I1
    add I0, I0, I1
    inc I0
    set I3,P2[S1]
    # pack the opcode number
    pack S28,I24,I3
    set I22,4
    # handle opcode arguments
    set I3,P7[I3]
    jsr I3

HANDLE_ARG_LABEL:
    # get the label
    index I4, S0, ",", I0
    sub I4, I4, I0
    substr S2, S0, I0, I4
    add I0, I0, I4
    inc I0
    # update the label count
    inc I31
    # save the label
    set P3[I31],S2
    length I30,S28
    sub I30,I22
    # save the address of the opcode
    set P4[I31],I30
    # save the address of label 
    set P5[I31],I22
    # add a noop
    pack S28,I24,0
    ret
   
HANDLE_ARG_REG:
    index I4, S0, ",", I0
    sub I4, I4, I0
    substr S2, S0, I0, I4
    add I0, I0, I4
    inc I0
    set I4, S2
    pack S28,I24,I4
    add I22,I24
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
    add I22,I24
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
    add I22,I24
    ret

ESCAPE:
    index I4,S2,"\\",I2
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
    set I6, P31[S12]
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
    # get the last label found
    set S11,P3[I31]
    # if the length is 0 return
    length I15,S11
    eq 0,I15,ENDFIXUP
    # get the address of the opcode to apply the fixup
    set I15,P4[I31]
    # get the address within the opcode to apply the fixup
    set I16,P5[I31]
    # get the position marked by the label
    set I17,P6[S11]
    # calculate the offset
    sub I18,I17,I15
    div I18,I18,I24
    # calculate the address to apply the fixup
    add I15,I16
    pack S28,4,I18,I15
    dec I31
    if I31,FIXUP
ENDFIXUP:
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
    print P1,S24

    length I10,S28
    pack S30,I24,I10 
    print P1,S30

    bsr FIXUP
    print P1,S28
    close P1
    ret

#
# $Log$
# Revision 1.5  2003/08/11 15:17:31  scog
# Get it to compile
#
# Revision 1.4  2002/08/26 14:31:46  grunblatt
# # New Ticket Created by  Mike Lambert
# # Please include the string:  [perl #16741]
# # in the subject line of all future correspondence about this issue.
# # <URL: http://rt.perl.org/rt2/Ticket/Display.html?id=16741 >
#
#
# The below patch fixes the languages/parrot_compiler/ code to work again
# with the new keyed syntax. It correctly compiles
# languages/parrot_compiler/sample.pasm and parrot executes it fine.
#
# The only change I'm unsure about it is the use of -e"" instead of -e'' to
# make activestate perl happy. ie, I'm not sure if it breaks other
# platforms.
#
# Thanks,
# Mike Lambert
#
# Revision 1.3  2002/06/03 20:25:07  grunblatt
# s/[gs]et_keyed/set/
#
# Revision 1.2  2002/06/01 08:15:03  grunblatt
# * Use and abuse of array and hashes.
# * Gets the input and output file names from the command line:
# 	./parrot pc.pbc <input> <output>
#
# Revision 1.1  2002/05/16 18:31:04  grunblatt
# The first version of the Parrot compiler written in Parrot.
# You must provide fully qualified opcode names.
#
#

# Everything from this line is autogenerated by gentable.pl
