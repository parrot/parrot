#
# Forth interpreter
#

.constant STDIN 0
.constant InterpretPrompt "> "
.constant CompilePrompt ">> "

.constant InterpretMode 0
.constant CompileMode 1
.constant CommentMode 2

.constant Space 32
.constant Tab 9

#
# Allocate registers
#

.constant CommandLength I0
.constant WordStart     I1
.constant WordEnd       I2
.constant WordLength    I3
.constant Mode          I4

.constant TempInt       I5
.constant TempInt2	I6
.constant TempInt3      I7

.constant IntStack      I31

.constant TempNum	N5
.constant TempNum2	N6
.constant TempNum3	N7

.constant NumStack	N31

#

.constant Commands      S0
.constant CurrentWord   S1
.constant CompileWord   S2
.constant CompileBuffer S3
.constant TempString    S4

#

.constant CoreOps       P0
.constant UserOps       P1

#

    bsr InitializeCoreOps

    set .Mode, .InterpretMode
    getstdin P2

Prompt:
    eq .Mode, .InterpretMode, InterpretPrompt
    print .CompilePrompt
    branch DonePromptString
InterpretPrompt:
    print .InterpretPrompt
DonePromptString:
    readline .Commands, P2
    bsr Chop
    bsr Interpret
    branch Prompt
    end

#------------------------------------------------------------------------------
#
# InitializeCoreOps
#
.macro AddCoreOp ( OpAddress, Name )
    set_addr .TempInt, .OpAddress
    set .CoreOps[.Name], .TempInt
.endm
InitializeCoreOps:
    #
    # Arithmetic, Single precision
    #
    new .CoreOps, .PerlHash
    new .UserOps, .PerlHash

    .AddCoreOp(Int_Dot,".")
    .AddCoreOp(Int_Dot_Stack,".s")
    .AddCoreOp(Quit,"quit")
    .AddCoreOp(Int_Add,"+")
    .AddCoreOp(Int_One_Plus,"1+")
    .AddCoreOp(Int_Sub,"-")
    .AddCoreOp(Int_One_Minus,"1-")
    .AddCoreOp(Int_Mul,"*")
    .AddCoreOp(Int_Div,"/")
    .AddCoreOp(Int_Mod,"mod")
    .AddCoreOp(Int_Slash_Mod,"/mod")
    .AddCoreOp(Int_Negate,"negate")
    .AddCoreOp(Int_Abs,"abs")
    .AddCoreOp(Int_Min,"min")
    .AddCoreOp(Int_Max,"max")

    #
    # Arithmetic, Double precision
    #

# s>d
# d>s
# d+
# d-
# dnegate
# dabs
# dmin
# dmax

    #
    # Arithmetic, Bitwise operations
    #

    .AddCoreOp(Int_And, "and")
    .AddCoreOp(Int_Or, "or")
    .AddCoreOp(Int_XOr, "xor")
# invert
# lshift
# rshift
    set .UserOps["2*"], "2 *" # 2*
# d2*
    set .UserOps["2/"], "2 /" # 2/
# d2/

    #
    # Arithmetic, Numeric comparison
    #

    .AddCoreOp(Int_LT,"<")
    .AddCoreOp(Int_LE,"<=")
    .AddCoreOp(Int_NE,"<>")
    .AddCoreOp(Int_EQ,"=")
    .AddCoreOp(Int_GT,">")
    .AddCoreOp(Int_GE,">=")
    .AddCoreOp(Int_LT0,"0<")
    .AddCoreOp(Int_LE0,"0<=")
    .AddCoreOp(Int_NE0,"0<>")
    .AddCoreOp(Int_EQ0,"0=")
    .AddCoreOp(Int_GT0,"0>")
    .AddCoreOp(Int_GE0,"0>=")
# u<
# u<=
# u>
# u>=
# within
# d<
# d<=
# d<>
# d=
# d>
# d>=
# d0<
# d0<=
# d0<>
# d0=
# d0>
# d0>=
# du<
# du<=
# du>
# du>=

    #
    # Arithmetic, Mixed precision
    #

# m+
# */
# */mod
# m*
# um*
# m*/
# um/mod
# fm/mod
# sm/rem

    #
    # Arithmetic, Floating Point
    #

# d>f
# f>d
# f+
# f-
# f*
# f/
# fnegate
# fabs
# fmax
# fmin
# floor
# fround
# f**
# fsqrt
# fexp
# fexpm1
# fln
# flnp1
# flog
# falog
# f2*
# f2/
# 1/f
# precision
# set-precision
# fsin
# fcos
# fsincos
# ftan
# fasin
# facos
# fatan
# fatan2
# fsinh
# fcosh
# ftanh
# fasinh
# facosh
# fatanh
# pi
# f-rel
# f-abs
# f-
# f=
# f<>
# f<
# f<=
# f>
# f>=
# f0<
# f0<=
# f0<>
# f0=
# f0>
# f0>=

    #
    # Stack Manipulation, Data stack
    #

    .AddCoreOp(Int_Drop,"drop")
    set .UserOps["nip"], "swap drop" # nip
    .AddCoreOp(Int_Dup,"dup")
# over
# tuck
    .AddCoreOp(Int_Swap,"swap")
# pick
# rot
# -rot
# ?dup
# roll
    set .UserOps["2drop"], "drop drop" # 2drop
# 2nip
# 2dup
# 2over
# 2tuck
# 2swap
# 2rot

    #
    # Stack Manipulation, Floating point stack
    #

# floating-stack
# fdrop
# fnip
# fdup
# fover
# ftuck
# fswap
# fpick
# frot

    #
    # Stack Manipulation, Return stack
    #

# >r
# r>
# r@
# rdrop
# 2>r
# 2r>
# 2r@
# 2rdrop

    #
    # Stack Manipulation, Stack pointer manipulation
    #

# sp0
# sp@
# sp!
# fp0
# fp@
# fp!
# rp@
# rp!
# lp0
# lp@
# lp!

    #
    # Memory, Dictionary allocation
    #

# here
# unused
# allot
# c,
# f,
# ,
# 2,
# align
# falign
# sfalign
# dfalign
# maxalign
# cfalign

    #
    # Memory, Heap allocation
    #

# allocate
# free
# resize

    #
    # Memory, Memory Access
    #

# @
# !
# +!
# c@
# c!
# 2@
# 2!
# f@
# f!
# sf@
# sf!
# df@
# df!

    #
    # Memory, Address arithmetic
    #

# chars
# char+
# cells
# cell+
# cell
# aligned
# floats
# float+
# faligned
# sfloats
# sfloat+
# sfaligned
# dfloats
# dfloat+
# dfaligned
# maxaligned
# cfaligned
# ADDRESS-UNIT-BITS

    #
    # Memory, Memory Blocks
    #

# move
# erase
# cmove
# cmove>
# fill
# blank
# compare
# search
# -trailing
# /string
# bounds

    #
    # Control Structures, Arbitrary control structures
    #
# IF
# AHEAD
# THEN
# BEGIN
# UNTIL
# AGAIN
# CS-PICK
# CS-ROLL
# ELSE
# WHILE
# REPEAT
# ENDIF
# ?DUP-IF
# ?DUP-0=-IF
# ?DO
# +DO
# U+DO
# -DO
# U-DO
# DO
# FOR
# LOOP
# +LOOP
# -LOOP
# NEXT
# LEAVE
# ?LEAVE
# unloop
# DONE
# case
# endcase
# of
# endof

    #
    # Control Structures, Calls and returns
    #
# recursive
# recurse
# Defer
# EXIT
# ;s

    #
    # Control Structures, Exception Handling
    #
# throw
# exception
# catch
# try
# recover
# endtry
# abort"
# abort

    #
    # Defining Words
    #
# CREATE

    #
    # Variables
    #
# variable
# 2variable
# fvariable
# user

    #
    # Constants
    #
# constant
# 2constant
# fconstant

    #
    # Values
    #

# value
# TO

    #
    # Anonymous definitions
    #

# :noname
# noname
# lastxt

    #
    # Supplying the name of a defined word
    #

# nextname

    ret

#------------------------------------------------------------------------------
#
# Test Interpret routine
#
Interpret:
    bsr EatLeadingWhitespace
StartInterpret:
    bsr CollectWord
    bsr EatLeadingWhitespace

    ne .CurrentWord, "\\", MaybeComment
    set .Commands, ""
    branch DoneInterpret
MaybeComment:
    ne .CurrentWord, "(", MaybeCompile
    save .Mode
    set .Mode, .CommentMode
    branch DoneSettingMode
MaybeCompile:
    ne .CurrentWord, ":", MaybeInterpret
    set .Mode, .CompileMode
    branch DoneSettingMode
MaybeInterpret:


DoneSettingMode:
    bsr InterpretWord

    length .TempInt, .Commands
    eq .TempInt, 0, DoneInterpret
    branch StartInterpret
DoneInterpret:
    ret

#------------------------------------------------------------------------------
#
# InterpretWord
#
InterpretWord:
    ne .Mode, .CommentMode, MaybeCompileWord
    ne .CurrentWord, ")", DoneInterpretWord
    restore .Mode
    branch DoneInterpretWord
MaybeCompileWord:
    ne .Mode, .CompileMode, MaybeInterpretWord
    eq .CurrentWord, ":", DoneInterpretWord
    ne .CurrentWord, ";", DoCompileStuff
    set .Mode, .InterpretMode
    print "compiled "
    print .CompileWord
    print " "
    print " from "
    print .CompileBuffer
    set .UserOps[.CompileWord], .CompileBuffer
    set .CompileWord, ""
    set .CompileBuffer, ""
    branch DoneInterpretWord
DoCompileStuff:
    ne .CompileWord, "", FillCompileBuffer
    set .CompileWord, .CurrentWord
    branch EndCompileWord
FillCompileBuffer:
    concat .CompileBuffer, .CurrentWord
    concat .CompileBuffer, " "
EndCompileWord:
    branch DoneInterpretWord
MaybeInterpretWord:
    set .IntStack, .CurrentWord
    length .TempInt, .CurrentWord
    dec .TempInt
    eq .CurrentWord, "", DoneInterpret
    ord .TempInt, .CurrentWord, .TempInt
    lt .TempInt, 48, NotInt
    gt .TempInt, 58, NotInt
    ne .IntStack, 0, PushInt
    eq .CurrentWord, "0", PushInt

NotInt:
    set .TempInt, .CoreOps[.CurrentWord]
    eq .TempInt, 0, UserWord
    jsr .TempInt
    branch DoneInterpretWord

UserWord:
    set .TempString, .UserOps[.CurrentWord]
    concat .TempString, " "
    concat .Commands, .TempString, .Commands

    branch DoneInterpretWord
PushInt:
    save .IntStack
    branch DoneInterpretWord

Int_One_Minus:
    restore .IntStack
    dec .IntStack
    save .IntStack
    branch DoneInterpretWord
Int_One_Plus:
    restore .IntStack
    inc .IntStack
    save .IntStack
    branch DoneInterpretWord
Int_Dot:
    restore .IntStack
    print .IntStack
    print " "
    branch DoneInterpretWord
Int_Dot_Stack:
    branch DoneInterpretWord
Int_Dup:
    restore .IntStack
    save .IntStack
    save .IntStack
    branch DoneInterpretWord
Int_Drop:
    restore .IntStack
    branch DoneInterpretWord
Int_Swap:
    restore .IntStack
    set .TempInt, .IntStack
    restore .IntStack
    set .TempInt2, .IntStack
    set .IntStack, .TempInt
    save .IntStack
    set .IntStack, .TempInt2
    save .IntStack
    branch DoneInterpretWord
Quit:
    end
Int_Abs:
    restore .IntStack
    ge .IntStack, 0, DoneIntAbs
    mul .IntStack, .IntStack, -1
DoneIntAbs:
    save .IntStack
    branch DoneInterpretWord
Int_Max:
    restore .IntStack
    set .TempInt, .IntStack
    restore .IntStack
    ge .IntStack, .TempInt, Done_IntMax
    set .IntStack, .TempInt
Done_IntMax:
    save .IntStack
    branch DoneInterpretWord
Int_Min:
    restore .IntStack
    set .TempInt, .IntStack
    restore .IntStack
    le .IntStack, .TempInt, Done_IntMin
    save .IntStack
    set .IntStack, .TempInt
Done_IntMin:
    save .IntStack
    branch DoneInterpretWord
Int_Add:
    restore .IntStack
    set .TempInt, .IntStack
    restore .IntStack
    add .IntStack, .IntStack, .TempInt
    save .IntStack
    branch DoneInterpretWord
Int_Sub:
    restore .IntStack
    set .TempInt, .IntStack
    restore .IntStack
    sub .IntStack, .IntStack, .TempInt
    save .IntStack
    branch DoneInterpretWord
Int_Negate:
    restore .IntStack
    mul .IntStack, .IntStack, -1
    save .IntStack
    branch DoneInterpretWord
Int_Mul:
    restore .IntStack
    set .TempInt, .IntStack
    restore .IntStack
    mul .IntStack, .IntStack, .TempInt
    save .IntStack
    branch DoneInterpretWord
Int_Div:
    restore .IntStack
    set .TempInt, .IntStack
    restore .IntStack
    div .IntStack, .IntStack, .TempInt
    save .IntStack
    branch DoneInterpretWord
Int_Mod:
    restore .IntStack
    set .TempInt, .IntStack
    restore .IntStack
    mod .IntStack, .IntStack, .TempInt
    save .IntStack
    branch DoneInterpretWord
Int_Slash_Mod:
    restore .IntStack
    set .TempInt, .IntStack
    restore .IntStack
    set .TempInt2, .IntStack
    mod .IntStack, .TempInt2, .TempInt
    save .IntStack
    div .IntStack, .TempInt2, .TempInt
    save .IntStack
    branch DoneInterpretWord
Int_GT:
    restore .IntStack
    set .TempInt, .IntStack
    restore .IntStack
    gt .TempInt, .IntStack, Int_is_GT
    set .IntStack, 0
    branch Int_GT_end
 Int_is_GT:
    set .IntStack, 1
 Int_GT_end:
    save .IntStack
    branch DoneInterpretWord
Int_GE:
    restore .IntStack
    set .TempInt, .IntStack
    restore .IntStack
    ge .TempInt, .IntStack, Int_is_GE
    set .IntStack, 0
    branch Int_GE_end
 Int_is_GE:
    set .IntStack, 1
 Int_GE_end:
    save .IntStack
    branch DoneInterpretWord
Int_NE:
    restore .IntStack
    set .TempInt, .IntStack
    restore .IntStack
    ne .TempInt, .IntStack, Int_is_NE
    set .IntStack, 0
    branch Int_NE_end
 Int_is_NE:
    set .IntStack, 1
 Int_NE_end:
    save .IntStack
    branch DoneInterpretWord
Int_EQ:
    restore .IntStack
    set .TempInt, .IntStack
    restore .IntStack
    eq .TempInt, .IntStack, Int_is_EQ
    set .IntStack, 0
    branch Int_EQ_end
 Int_is_EQ:
    set .IntStack, 1
 Int_EQ_end:
    save .IntStack
    branch DoneInterpretWord
Int_LT:
    restore .IntStack
    set .TempInt, .IntStack
    restore .IntStack
    lt .TempInt, .IntStack, Int_is_LT
    set .IntStack, 0
    branch Int_LT_end
 Int_is_LT:
    set .IntStack, 1
 Int_LT_end:
    save .IntStack
    branch DoneInterpretWord
Int_LE:
    restore .IntStack
    set .TempInt, .IntStack
    restore .IntStack
    le .TempInt, .IntStack, Int_is_LE
    set .IntStack, 0
    branch Int_LE_end
 Int_is_LE:
    set .IntStack, 1
 Int_LE_end:
    save .IntStack
    branch DoneInterpretWord
Int_LT0:
    restore .IntStack
    lt .IntStack, 0, Int_is_LT0
    set .IntStack, 0
    branch Int_LT0_end
 Int_is_LT0:
    set .IntStack, 1
 Int_LT0_end:
    save .IntStack
    branch DoneInterpretWord
Int_LE0:
    restore .IntStack
    le .IntStack, 0, Int_is_LE0
    set .IntStack, 0
    branch Int_LE0_end
 Int_is_LE0:
    set .IntStack, 1
 Int_LE0_end:
    save .IntStack
    branch DoneInterpretWord
Int_NE0:
    restore .IntStack
    ne .IntStack, 0, Int_is_NE0
    set .IntStack, 0
    branch Int_NE0_end
 Int_is_NE0:
    set .IntStack, 1
 Int_NE0_end:
    save .IntStack
    branch DoneInterpretWord
Int_EQ0:
    restore .IntStack
    eq .IntStack, 0, Int_is_EQ0
    set .IntStack, 0
    branch Int_EQ0_end
 Int_is_EQ0:
    set .IntStack, 1
 Int_EQ0_end:
    save .IntStack
    branch DoneInterpretWord
Int_GT0:
    restore .IntStack
    gt .IntStack, 0, Int_is_GT0
    set .IntStack, 0
    branch Int_GT0_end
 Int_is_GT0:
    set .IntStack, 1
 Int_GT0_end:
    save .IntStack
    branch DoneInterpretWord
Int_GE0:
    restore .IntStack
    ge .IntStack, 0, Int_is_GE0
    set .IntStack, 0
    branch Int_GE0_end
 Int_is_GE0:
    set .IntStack, 1
 Int_GE0_end:
    save .IntStack
    branch DoneInterpretWord

Int_And:
    restore .IntStack
    set .TempInt, .IntStack
    restore .IntStack
    band .IntStack, .TempInt
    save .IntStack
    branch DoneInterpretWord
Int_Or:
    restore .IntStack
    set .TempInt, .IntStack
    restore .IntStack
    bor .IntStack, .TempInt
    save .IntStack
    branch DoneInterpretWord
Int_XOr:
    restore .IntStack
    set .TempInt, .IntStack
    restore .IntStack
    bxor .IntStack, .TempInt
    save .IntStack
    branch DoneInterpretWord

DoneInterpretWord:
    ret

#------------------------------------------------------------------------------
#
# CollectWord
#
CollectWord:
    length .TempInt, .Commands
    eq .TempInt, 0, DoneCollectWord
    set .TempInt3, 0
NextCharCollectWord:
    eq .TempInt3, .TempInt, EndDarkspace
    ord .TempInt2, .Commands, .TempInt3
    eq .TempInt2, .Space, EndDarkspace
    eq .TempInt2, .Tab, EndDarkspace
    inc .TempInt3
    branch NextCharCollectWord
EndDarkspace:
    substr .CurrentWord, .Commands, 0, .TempInt3, ""
DoneCollectWord:
    ret

#------------------------------------------------------------------------------
#
# EatLeadingWhitespace
#
EatLeadingWhitespace:
    length .TempInt, .Commands
    eq .TempInt, 0, DoneLeadingWhitespace
    set .TempInt3, 0
    ord .TempInt2, .Commands, .TempInt3
    eq .TempInt2, .Space, StartLeadingWhitespace
    eq .TempInt2, .Tab, StartLeadingWhitespace
    branch DoneLeadingWhitespace
StartLeadingWhitespace:
    inc .TempInt3
    eq .TempInt, .TempInt, FinishLeadingWhitespace
    ord .TempInt2, .Commands, .TempInt3
    eq .TempInt2, .Space, StartLeadingWhitespace
    eq .TempInt2, .Tab, StartLeadingWhitespace
FinishLeadingWhitespace:
    substr .Commands, 0, .TempInt3, ""
DoneLeadingWhitespace:
    ret

#------------------------------------------------------------------------------
#
# Chop
#
Chop:
    length .TempInt, .Commands
    dec .TempInt
    substr .Commands, .Commands, 0, .TempInt
    ret
