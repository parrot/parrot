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
.constant CellSize 65536

#
# Allocate registers
#

.constant CommandLength I23
.constant WordStart     I24
.constant WordEnd       I25
.constant WordLength    I26
.constant Mode          I28

.constant TempInt       I20
.constant TempInt2	I21
.constant TempInt3      I22

.constant InternalInt	I27

.constant Status	I19

# This may move elsewhere, hence the indirection
.constant NestLevel	I18
.constant PendingElse   I17
.constant LastCellUsed	I16
.constant LastConstant	I29

.macro NewNestLevel
  inc .NestLevel
.endm

.constant IntStack      I31

.constant TempNum	N16
.constant TempNum2	N17
.constant TempNum3	N18

.constant NumStack	N31

#

.constant Commands      S16
.constant CurrentWord   S17
.constant CompileWord   S18
.constant CompileBuffer S19
.constant TempString    S20
.constant WordBody	S21

.constant NewBodyString	S22

.constant TempStr2    	S23

.constant PendingConstant S24
.constant StringStack      S31

#

.constant CompiledWordPMC P15
.constant LinePMC	P14

.constant WorkTOS	P17

.constant TempPMC       P18
.constant TempPMC2	P19
.constant TempPMC3      P13

.constant PASMCompiler	P21
.constant PIRCompiler	P22
.constant ConstantTable P23
.constant CoreOps       P24
.constant UserOps       P25
.constant SpecialWords	P26

.constant LabelStack	P27
.constant TruePMC	P29
.constant FalsePMC	P28
.constant ReturnStack	P30
.constant PMCStack	P31
.constant CellPMC	P20

VeryBeginning:

    # We need a PMC for the compiler
    compreg .PASMCompiler, "PASM"
    store_global "__forth::PASMCompiler", .PASMCompiler
    compreg .PIRCompiler, "PIR"
    store_global "__forth::PIRCompiler", .PIRCompiler

    bsr InitializeCoreOps

    set .Mode, .InterpretMode
    getstdin .LinePMC

Prompt:
    eq .Mode, .InterpretMode, InterpretPrompt
    print .CompilePrompt
    branch DonePromptString
InterpretPrompt:
    print .InterpretPrompt
DonePromptString:
    readline .Commands, .LinePMC
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

.macro AddUserOp (OpName, OpBody)
    # Put the body definition into the S register that we compile from
    set .WordBody, .OpBody
    # Invoke the compiler
    bsr CompileString
    # Snag the address of the new body
    set .TempInt, .CompiledWordPMC[1]
    # Add the PMC to the user ops slot so it doesn't disappear
#    set .UserOps[.OpName], .CompiledWordPMC
    # Put the actual function address into the core ops hash, since
    # it is now a core op
    set .CoreOps[.OpName], .TempInt
.endm

.macro PopInt
    restore .WorkTOS
    set .IntStack, .WorkTOS    
.endm

.macro PushInt
    new .WorkTOS, .Integer
    set .WorkTOS, .IntStack
    save .WorkTOS
.endm

.macro PushTempInt
    new .WorkTOS, .Integer
    set .WorkTOS, .TempInt
    save .WorkTOS
.endm

.macro PopNum
    restore .WorkTOS
    set .NumStack, .WorkTOS        
.endm

.macro PushNum
    new .WorkTOS, .Float
    set .WorkTOS, .NumStack
    save .WorkTOS
.endm

.macro PopStr
    restore .WorkTOS
    set .StringStack, .WorkTOS        
.endm

.macro PushStr
    new .WorkTOS, .PerlString
    set .WorkTOS, .StringStack
    save .WorkTOS
.endm

.macro PopPMC
  restore .PMCStack    
.endm

.macro PushPMC
  save .PMCStack    
.endm

.macro PushFalse
  save .FalsePMC
.endm

.macro PushTrue
  save .TruePMC
.endm

.macro DoneInterpretWord
#  branch DoneInterpretWord
   ret
.endm

InitializeCoreOps:
    #
    # Arithmetic, Single precision
    #
    new .CoreOps, .PerlHash
    new .UserOps, .PerlHash
    new .SpecialWords, .PerlHash
    new .ReturnStack, .PerlArray
    new .ConstantTable, .PerlArray
    new .TruePMC, .Integer
    set .TruePMC, 1
    new .FalsePMC, .Integer
    set .FalsePMC, 0
    new .CellPMC, .Array
    set .CellPMC, .CellSize   # Our cell area is 64K by default
    set .LastCellUsed, 0
    new .LabelStack, .PerlArray
    set .LastConstant, 0
    new .TempPMC, .Integer # Cell 0 holds the current base
    set .TempPMC, 10
    set .CellPMC[0], .TempPMC

    store_global "__forth::CoreOps", .CoreOps
    store_global "__forth::UserOps", .UserOps
    store_global "__forth::SpecialWords", .SpecialWords
    store_global "__forth::ReturnStack", .ReturnStack
    store_global "__forth::ConstantTable", .ConstantTable
    store_global "__forth::True", .TruePMC
    store_global "__forth::False", .FalsePMC
    store_global "__forth::CellArray", .CellPMC
    store_global "__forth::LabelStack", .LabelStack

    set .SpecialWords["if"], 1
    set .SpecialWords["then"], 2
    set .SpecialWords["begin"], 3
    set .SpecialWords["until"], 4
    set .SpecialWords["again"], 5
    set .SpecialWords["exit"], 6
    set .SpecialWords["do"], 7
    set .SpecialWords["loop"], 8
    set .SpecialWords["+loop"], 9
    set .SpecialWords["compile,"], 10
    set .SpecialWords['p"'], 11
    .AddCoreOp(Parrot_String, 'p"') # Has a dual life
    set .SpecialWords["recurse"], 12
    set .SpecialWords['."'], 13

    .AddCoreOp(Thing_Dot,".")
    .AddCoreOp(Thing_Dot, "u.")
    .AddCoreOp(Thing_Dot_Stack,".s")
    .AddCoreOp(Quit,"quit")
    .AddCoreOp(Int_Add,"+")
    .AddCoreOp(Int_One_Plus,"1+")
    .AddCoreOp(Int_Sub,"-")
    .AddCoreOp(Int_One_Minus,"1-")
    .AddCoreOp(Int_Two_Minus,"2-")
    .AddCoreOp(Int_Mul,"*")
    .AddCoreOp(Int_Div,"/")
    .AddCoreOp(Int_Mod,"mod")
    .AddCoreOp(Int_Slash_Mod,"/mod")
    .AddCoreOp(Int_Slash_Mod,"um/mod")
    .AddCoreOp(Int_Negate,"negate")
    .AddCoreOp(Int_Abs,"abs")
    .AddCoreOp(Int_Min,"min")
    .AddCoreOp(Int_Max,"max")
    .AddUserOp("base", "0")

    #
    # Arithmetic, Double precision
    #

    .AddCoreOp(DoneInterpretWord, "s>d")
    .AddCoreOp(DoneInterpretWord, "d>s")
    .AddCoreOp(Int_Add, "d+")
    .AddCoreOp(Int_Sub, "d-")
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
    .AddCoreOp(Int_Invert, "invert")
    .AddCoreOp(Int_LShift, "lshift")
    .AddCoreOp(Int_RShift, "rshift")
    .AddUserOp("2*", "2 *")
# d2*
    .AddUserOp("2/", "2 /")
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
    .AddCoreOp(Int_LT,"u<")
    .AddCoreOp(Int_LE,"u<=")
    .AddCoreOp(Int_GT,"u>")
    .AddCoreOp(Int_GE,"u>=")
    .AddCoreOp(Within, "within")
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
    # Arithmetic, Floating Point
    #

    .AddCoreOp(D_to_F, "d>f")
    .AddCoreOp(F_to_D, "f>d")
    .AddCoreOp(Float_Add, "f+")
    .AddCoreOp(Float_Sub, "f-")
    .AddCoreOp(Float_Mul, "f*")
    .AddCoreOp(Float_Div, "f/")
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

    .AddCoreOp(Thing_Drop,"drop")
    .AddUserOp("nip", "swap drop")
    .AddCoreOp(Thing_Dup,"dup")
    .AddCoreOp(Thing_Over, "over")
    .AddUserOp("tuck", "swap over")
    .AddCoreOp(Thing_Swap,"swap")
    .AddCoreOp(Stack_Depth, "depth")
    .AddCoreOp(Pick_Stack, "pick")
    .AddCoreOp(Rot_Stack, "rot")
    .AddCoreOp(Not_Rot_Stack, "-rot")
    .AddCoreOp(Maybe_Dup, "?dup")
    .AddCoreOp(Roll_Stack, "roll")
    .AddUserOp("2drop", "drop drop")
    .AddUserOp("2dup", "over over")
    .AddCoreOp(Two_Over, "2over")
    .AddCoreOp(Two_Swap, "2swap")
    .AddUserOp("2tuck", "2swap 2over")
    .AddUserOp("2nip", "2swap 2drop")
    .AddCoreOp(Two_Rot_Stack, "2rot")

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
    # Arithmetic, Mixed precision
    #

# m+

  .AddUserOp('*/', 'rot rot * swap /')
  .AddUserOp('*/mod', 'rot rot * swap /mod')
  .AddCoreOp(Int_Mul, "m*")
  .AddCoreOp(Int_Mul, "um*")
# m*/
# fm/mod
# sm/rem

    #
    # Stack Manipulation, Return stack
    #

  .AddCoreOp(To_R, ">r")
  .AddCoreOp(From_R, "r>")
  .AddCoreOp(Copy_From_R, "r@")
  .AddCoreOp(RDrop, "rdrop")
  .AddCoreOp(Two_To_R, "2>r")
  .AddCoreOp(Two_From_R, "2r>")
  .AddCoreOp(Two_R_Fetch, "2r@")
  .AddCoreOp(Two_RDrop, "2rdrop")

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

    .AddCoreOp(Here, "here")
    .AddCoreOp(Unused, "unused")
# f,
    .AddCoreOp(Comma, ",")
    .AddCoreOp(Comma, "c,")
    .AddCoreOp(Allot, "allot")
# 2,
# align
    .AddCoreOp(DoneInterpretWord, "align")
    .AddCoreOp(DoneInterpretWord, "aligned")
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

  .AddCoreOp(Store_Cell, "!")
  .AddCoreOp(Add_Cell, "+!")
  .AddCoreOp(Get_Cell, "@")
  .AddUserOp("cell+", "1 +")
  .AddUserOp("2!", "swap over ! cell+ !")
  .AddUserOp("2@", "dup cell+ @ swap @")
  .AddCoreOp(Store_Cell, "c!")
  .AddCoreOp(Get_Cell, "c@")
# f@
# f!
# sf@
# sf!
# df@
# df!

    .AddUserOp("decimal", "10 0 !")
    .AddUserOp("hex", "16 0 !")

    #
    # Memory, Address arithmetic
    #

  .AddUserOp("chars", "0 +")
  .AddUserOp("char+", "1 +")
  .AddUserOp("cells", "0 +")
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
    .AddCoreOp(Loop_Index_I, "i")
    .AddCoreOp(Loop_Index_J, "j")

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
    .AddCoreOp(New_Variable, "variable")
   
# 2variable
# fvariable
# user

    #
    # Constants
    #
# constant
# 2constant
# fconstant
    .AddCoreOp(Constant, "constant")

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

   #
   # Miscellaneous other stuff
   #
   .AddUserOp("false", "0")
   .AddUserOp("true", "0 invert")
   .AddCoreOp(Print_Space, "space")
   .AddCoreOp(Print_Spaces, "spaces")
   .AddCoreOp(Print_CR, "cr")
   .AddUserOp("bl", "32")
   .AddCoreOp(Emit, "emit")
   .AddCoreOp(Execute, "execute")
   .AddCoreOp(Type, "type")


   #
   # Parrot extension words
   #
   .AddCoreOp(IntReg, "ireg")
   .AddCoreOp(PMCReg, "preg")
   .AddCoreOp(NReg, "nreg")
   .AddCoreOp(SReg, "sreg")
   .AddCoreOp(Invoke, "invoke")
   .AddCoreOp(FindGlobal, "findglobal")
   .AddCoreOp(LoadAssembly, "loadpasm")  
   .AddCoreOp(LoadPIR, "loadpir")
   .AddCoreOp(SingleReturnP, "resultP")
   .AddCoreOp(SingleReturnI, "resultI")
   .AddCoreOp(SingleReturnS, "resultS")
   .AddCoreOp(SingleReturnN, "resultN")
   .AddCoreOp(ForthString_to_Parrot, "s2p")
   .AddCoreOp(ParrotString_to_Forth, "p2f")

   .AddCoreOp(Parrot_Substr, "substr")
   .AddCoreOp(Parrot_Concat, "concat")
   .AddCoreOp(Get_Params, "getparams")
   .AddCoreOp(Get_Time, "curtime")

   .AddCoreOp(Export_Word, "export")

    ret

#------------------------------------------------------------------------------
#
# Check to see if .CurrentWord is a number.
#
IsWordNumber:
    pushi

.constant CVOffset	I0
.constant CVLength	I1
.constant CVBase	I2
.constant CVDigit	I3
.constant CVTotal	I4
.constant CVNegative	I5

    set .NumStack, 0
    # First, get the base
    set .TempPMC, .CellPMC[0]
    set .CVBase, .TempPMC
 
    # Next look for signs of a float
    index .TempInt, .CurrentWord, "."
    ne .TempInt, -1, ConvertFloat

ConvertInt:
    eq .TempInt2, 10, ConvertDecimal

ConvertDecimal:
    # Okay, base 10. We can handle that.
    set .CVTotal, 0
    set .CVOffset, 0
#    length .CVLength, 
 decimalloop:
    set .NumStack, .CurrentWord
    branch WordIsNumber    

ConvertFloat:
    # Format of a float is:
 checkfloatsign:
 checkfloatdigit:
 checkfloatdecimal:
 checkE:
 checkESign:
 checkEDigit:

WordIsNumber:
  set .TempInt, 1
  save .NumStack
  save .TempInt
  branch DoneWordIsNumber

WordIsNotNumber:
  set .TempInt, 0
  save .NumStack
  save .TempInt
  branch DoneWordIsNumber

DoneWordIsNumber:
  popi
  restore .IntStack
  restore .NumStack
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
    .DoneInterpretWord
MaybeCompileWord:
    ne .Mode, .CompileMode, MaybeInterpretWord
    eq .CurrentWord, ":", DoneInterpretWord
    ne .CurrentWord, ";", DoCompileStuff
    set .Mode, .InterpretMode

    set .WordBody, .CompileBuffer
    bsr CompileString
    set .TempInt, .CompiledWordPMC[1]
    set .CoreOps[.CompileWord], .TempInt

    set .CompileWord, ""
    set .CompileBuffer, ""
    .DoneInterpretWord
DoCompileStuff:
    ne .CompileWord, "", FillCompileBuffer
    set .CompileWord, .CurrentWord
    branch EndCompileWord
FillCompileBuffer:
    concat .CompileBuffer, .CurrentWord
    concat .CompileBuffer, " "
EndCompileWord:
    .DoneInterpretWord
MaybeInterpretWord:
#    bsr IsWordNumber
#    unless .IntStack, NotNum
#    .PushNum
#    .DoneInterpretWord
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
    ne .CurrentWord, "'", NotTick
    bsr EatLeadingWhitespace
    eq .Commands, "", DoneInterpretWord
    bsr CollectWord
    set .IntStack, .CoreOps[.CurrentWord]
    .PushInt
    .DoneInterpretWord
    
NotTick:
    set .TempInt, .CoreOps[.CurrentWord]
    eq .TempInt, 0, UserWord
    jsr .TempInt
    .DoneInterpretWord

UserWord:
    set .TempString, .UserOps[.CurrentWord]
    concat .TempString, " "
    concat .Commands, .TempString, .Commands

    .DoneInterpretWord
PushInt:
    .PushInt
    .DoneInterpretWord

Int_One_Minus:
    .PopInt
    dec .IntStack
    .PushInt
    .DoneInterpretWord
Int_Two_Minus:
    .PopInt
    sub .IntStack, .IntStack, 2
    .PushInt
    .DoneInterpretWord
Int_One_Plus:
    .PopInt 
    inc .IntStack
    .PushInt 
    .DoneInterpretWord
Thing_Dot:
    .PopPMC
    print .PMCStack
    print " "
    .DoneInterpretWord
Thing_Dot_Stack:
    .DoneInterpretWord
Thing_Dup:
    .PopPMC 
    .PushPMC 
    .PushPMC 
    .DoneInterpretWord
Thing_Drop:
    .PopPMC
    .DoneInterpretWord
Thing_Swap:
    rotate_up 2
    .DoneInterpretWord
Quit:
    end
Int_Abs:
    .PopInt 
    ge .IntStack, 0, DoneIntAbs
    mul .IntStack, .IntStack, -1
DoneIntAbs:
    .PushInt 
    .DoneInterpretWord
Int_Max:
    .PopInt 
    set .TempInt, .IntStack
    .PopInt 
    ge .IntStack, .TempInt, Done_IntMax
    set .IntStack, .TempInt
Done_IntMax:
    .PushInt 
    .DoneInterpretWord
Int_Min:
    .PopInt 
    set .TempInt, .IntStack
    .PopInt 
    le .IntStack, .TempInt, Done_IntMin
    .PushInt 
    set .IntStack, .TempInt
Done_IntMin:
    .PushInt 
    .DoneInterpretWord
Int_Add:
    .PopInt 
    set .TempInt, .IntStack
    .PopInt 
    add .IntStack, .IntStack, .TempInt
    .PushInt 
    .DoneInterpretWord
Int_Sub:
    .PopInt 
    set .TempInt, .IntStack
    .PopInt 
    sub .IntStack, .IntStack, .TempInt
    .PushInt 
    .DoneInterpretWord
Int_Negate:
    .PopInt 
    mul .IntStack, .IntStack, -1
    .PushInt 
    .DoneInterpretWord
Int_Mul:
    .PopInt 
    set .TempInt, .IntStack
    .PopInt 
    mul .IntStack, .IntStack, .TempInt
    .PushInt 
    .DoneInterpretWord
Int_Div:
    .PopInt 
    set .TempInt, .IntStack
    .PopInt 
    div .IntStack, .IntStack, .TempInt
    .PushInt 
    .DoneInterpretWord
Int_Mod:
    .PopInt 
    set .TempInt, .IntStack
    .PopInt 
    mod .IntStack, .IntStack, .TempInt
    .PushInt 
    .DoneInterpretWord
Int_Slash_Mod:
    .PopInt 
    set .TempInt, .IntStack
    .PopInt 
    set .TempInt2, .IntStack
    mod .IntStack, .TempInt2, .TempInt
    .PushInt 
    div .IntStack, .TempInt2, .TempInt
    .PushInt 
    .DoneInterpretWord
Int_GT:
    .PopInt 
    set .TempInt, .IntStack
    .PopInt 
    gt .IntStack, .TempInt, Int_is_GT
    set .IntStack, 0
    branch Int_GT_end
 Int_is_GT:
    set .IntStack, 1
 Int_GT_end:
    .PushInt 
    .DoneInterpretWord
Int_GE:
    .PopInt 
    set .TempInt, .IntStack
    .PopInt 
    ge .IntStack, .TempInt, Int_is_GE
    set .IntStack, 0
    branch Int_GE_end
 Int_is_GE:
    set .IntStack, 1
 Int_GE_end:
    .PushInt 
    .DoneInterpretWord
Int_NE:
    .PopInt 
    set .TempInt, .IntStack
    .PopInt 
    ne .TempInt, .IntStack, Int_is_NE
    set .IntStack, 0
    branch Int_NE_end
 Int_is_NE:
    set .IntStack, 1
 Int_NE_end:
    .PushInt 
    .DoneInterpretWord
Int_EQ:
    .PopInt 
    set .TempInt, .IntStack
    .PopInt 
    eq .TempInt, .IntStack, Int_is_EQ
    set .IntStack, 0
    branch Int_EQ_end
 Int_is_EQ:
    set .IntStack, 1
 Int_EQ_end:
    .PushInt 
    .DoneInterpretWord
Int_LT:
    .PopInt 
    set .TempInt, .IntStack
    .PopInt 
    lt .IntStack, .TempInt, Int_is_LT
    set .IntStack, 0
    branch Int_LT_end
 Int_is_LT:
    set .IntStack, 1
 Int_LT_end:
    .PushInt 
    .DoneInterpretWord
Int_LE:
    .PopInt 
    set .TempInt, .IntStack
    .PopInt 
    le .IntStack, .TempInt, Int_is_LE
    set .IntStack, 0
    branch Int_LE_end
 Int_is_LE:
    set .IntStack, 1
 Int_LE_end:
    .PushInt 
    .DoneInterpretWord
Int_LT0:
    .PopInt 
    lt .IntStack, 0, Int_is_LT0
    set .IntStack, 0
    branch Int_LT0_end
 Int_is_LT0:
    set .IntStack, 1
 Int_LT0_end:
    .PushInt 
    .DoneInterpretWord
Int_LE0:
    .PopInt 
    le .IntStack, 0, Int_is_LE0
    set .IntStack, 0
    branch Int_LE0_end
 Int_is_LE0:
    set .IntStack, 1
 Int_LE0_end:
    .PushInt 
    .DoneInterpretWord
Int_NE0:
    .PopInt 
    ne .IntStack, 0, Int_is_NE0
    set .IntStack, 0
    branch Int_NE0_end
 Int_is_NE0:
    set .IntStack, 1
 Int_NE0_end:
    .PushInt 
    .DoneInterpretWord
Int_EQ0:
    .PopInt 
    eq .IntStack, 0, Int_is_EQ0
    set .IntStack, 0
    branch Int_EQ0_end
 Int_is_EQ0:
    set .IntStack, 1
 Int_EQ0_end:
    .PushInt 
    .DoneInterpretWord
Int_GT0:
    .PopInt 
    gt .IntStack, 0, Int_is_GT0
    set .IntStack, 0
    branch Int_GT0_end
 Int_is_GT0:
    set .IntStack, 1
 Int_GT0_end:
    .PushInt 
    .DoneInterpretWord
Int_GE0:
    .PopInt 
    ge .IntStack, 0, Int_is_GE0
    set .IntStack, 0
    branch Int_GE0_end
 Int_is_GE0:
    set .IntStack, 1
 Int_GE0_end:
    .PushInt 
    .DoneInterpretWord

Int_And:
    .PopInt 
    set .TempInt, .IntStack
    .PopInt 
    band .IntStack, .TempInt
    .PushInt 
    .DoneInterpretWord
Int_Or:
    .PopInt 
    set .TempInt, .IntStack
    .PopInt 
    bor .IntStack, .TempInt
    .PushInt 
    .DoneInterpretWord
Int_XOr:
    .PopInt 
    set .TempInt, .IntStack
    .PopInt 
    bxor .IntStack, .TempInt
    .PushInt 
    .DoneInterpretWord
Int_Invert:
    .PopInt 
    bnot .IntStack, .IntStack
    .PushInt 
    .DoneInterpretWord
Int_LShift:
    .PopInt 
    set .TempInt, .IntStack
    .PopInt 
    shl .IntStack, .IntStack, .TempInt
    .PushInt 
    .DoneInterpretWord
Int_RShift:
    .PopInt 
    set .TempInt, .IntStack
    .PopInt 
    shr .IntStack, .IntStack, .TempInt
    .PushInt 
    .DoneInterpretWord
Int_Over:
    .PopInt 
    set .TempInt, .IntStack
    .PopInt 
    .PushInt 
    .PushTempInt
    .PushInt 
    .DoneInterpretWord

Print_Space:
    print " "
    .DoneInterpretWord

Print_Spaces:
    .PopInt
    lt .IntStack, 1, DoneInterpretWord
  spaceloop:
    print " "
    dec .IntStack
    gt .IntStack, 0, spaceloop
    .DoneInterpretWord

Stack_Depth:
    depth .IntStack
    .PushInt
    .DoneInterpretWord

Rot_Stack:
    rotate_up -3
    .DoneInterpretWord

Two_Rot_Stack:
    rotate_up -6
    rotate_up -6
    .DoneInterpretWord

Not_Rot_Stack:
    rotate_up 3
    .DoneInterpretWord

Roll_Stack:
    .PopInt
    sub .IntStack, 0, .IntStack
    rotate_up .IntStack
    .DoneInterpretWord

Two_Over:
    lookback .PMCStack, 3
    save .PMCStack
    lookback .PMCStack, 3
    save .PMCStack
    .DoneInterpretWord

Two_Swap:
    rotate_up -4
    rotate_up -4
    .DoneInterpretWord

Maybe_Dup:
    .PopPMC
    if .PMCStack, dupit
    new .PMCStack, .Integer
    set .PMCStack, 0
    .PushPMC
    .DoneInterpretWord
    .PushPMC
    .PushPMC
    .DoneInterpretWord

Print_CR:
    print "\n"
    .DoneInterpretWord

Emit:
    .PopInt
    chr .TempString, .IntStack
    print .TempString
    .DoneInterpretWord

Execute:
    .PopInt
    jsr .IntStack
    .DoneInterpretWord

Pick_Stack:
    .PopInt
    dec .IntStack
    lookback .PMCStack, .IntStack
    .PushPMC
    .DoneInterpretWord

To_R:
    .PopPMC
    push .ReturnStack, .PMCStack
    .DoneInterpretWord

From_R:
    pop .PMCStack, .ReturnStack
    .PushPMC
    .DoneInterpretWord

Copy_From_R:
    pop .PMCStack, .ReturnStack
    push .ReturnStack, .PMCStack
    .PushPMC
    .DoneInterpretWord

Two_To_R:
    restore .TempPMC
    restore .PMCStack
    push .ReturnStack, .PMCStack
    push .ReturnStack, .TempPMC
    .DoneInterpretWord
  
Two_From_R:
    pop .TempPMC, .ReturnStack
    pop .PMCStack, .ReturnStack
    save .PMCStack
    save .TempPMC
    .DoneInterpretWord
  
Two_R_Fetch:
    set .TempPMC, .ReturnStack[-2]
    save .TempPMC
    set .TempPMC, .ReturnStack[-1]
    save .TempPMC
    .DoneInterpretWord

Loop_Index_I:
    set .PMCStack, .ReturnStack[-1]
    .PushPMC
    .DoneInterpretWord

Loop_Index_J:
    set .PMCStack, .ReturnStack[-3]
    .PushPMC
    .DoneInterpretWord

Two_RDrop:
    pop .PMCStack, .ReturnStack
RDrop:
    pop .PMCStack, .ReturnStack
    .DoneInterpretWord

Within:
    restore .TempPMC3
    restore .TempPMC2
    restore .TempPMC
    le .TempPMC3, .TempPMC2, three_two
 two_three:
    lt .TempPMC, .TempPMC2, Is_not_within
    ge .TempPMC, .TempPMC3, Is_not_within
    branch Is_within
 three_two:
    le .TempPMC2, .TempPMC, Is_within 
    lt .TempPMC, .TempPMC3, Is_within
    branch Is_not_within
 Is_within:
    .PushTrue
    .DoneInterpretWord
 Is_not_within:
    .PushFalse
    .DoneInterpretWord

Store_Cell:
    .PopInt
    .PopPMC
    set .CellPMC[.IntStack], .PMCStack
    .DoneInterpretWord

Get_Cell:
    .PopInt
    set .PMCStack, .CellPMC[.IntStack]
    .PushPMC
    .DoneInterpretWord

Add_Cell:
    .PopInt
    .PopPMC
    set .TempPMC, .CellPMC[.IntStack]
    set .TempInt2, .TempPMC
    set .TempInt, .PMCStack
    add .TempInt, .TempInt, .TempInt2
    new .TempPMC, .Integer
    set .TempPMC, .TempInt
    set .CellPMC[.IntStack], .TempPMC
    .DoneInterpretWord

D_to_F:
    .PopInt
    set .NumStack, .IntStack
    .PushNum
    .DoneInterpretWord

F_to_D:
    .PopNum
    set .IntStack, .NumStack
    .PushInt
    .DoneInterpretWord

Float_Add:
    .PopNum
    set .TempNum, .NumStack
    .PopNum
    add .NumStack, .TempNum
    .PushNum
    .DoneInterpretWord

Float_Sub:
    .PopNum
    set .TempNum, .NumStack
    .PopNum
    sub .NumStack, .NumStack, .TempNum
    .PushNum
    .DoneInterpretWord

Float_Mul:
    .PopNum
    set .TempNum, .NumStack
    .PopNum
    mul .NumStack, .NumStack, .TempNum
    .PushNum
    .DoneInterpretWord

Float_Div:
    .PopNum
    set .TempNum, .NumStack
    .PopNum
    div .NumStack, .NumStack, .TempNum
    .PushNum
    .DoneInterpretWord

IntReg:
    .PopInt
    set .TempInt, .IntStack
    .PopInt
    seti_ind .TempInt, .IntStack
    .DoneInterpretWord

NReg:
    .PopInt
    .PopNum
    setn_ind .IntStack, .NumStack
    .DoneInterpretWord

SReg:
    .PopInt
    .PopStr
    sets_ind .IntStack, .StringStack
    .DoneInterpretWord

PMCReg:
    .PopInt
    .PopPMC
    setp_ind .IntStack, .PMCStack
    .DoneInterpretWord

Invoke:
    savetop
    invoke
    restoretop
    .DoneInterpretWord

FindGlobal:
    .PopStr
    find_global .PMCStack, .StringStack
    .PushPMC
    .DoneInterpretWord

LoadAssembly:
    .PopStr
    set .TempString, ".pcc_sub _MAIN prototyped\n"
    concat .TempString, '.include "'
    concat .TempString, .StringStack
    concat .TempString, '"'
    concat .TempString, "\n.end\n"
    compile .CompiledWordPMC, .PIRCompiler, .TempString
    invoke .CompiledWordPMC
    .DoneInterpretWord

SingleReturnP:
    set .PMCStack, P5
    .PushPMC
    .DoneInterpretWord

SingleReturnN:
    set .NumStack, N5
    .PushNum
    .DoneInterpretWord

SingleReturnI:
    set .IntStack, I5
    .PushInt
    .DoneInterpretWord

SingleReturnS:
    set .StringStack, S5
    .PushStr
    .DoneInterpretWord

Constant:
    bsr CollectWord
    .PopPMC
    inc .LastConstant
    set .ConstantTable[.LastConstant], .PMCStack
    set .TempStr2, "set P31, P15["
    set .TempString, .LastConstant
    concat .TempStr2, .TempString
    concat .TempStr2, "]\n"
    concat .TempStr2, "save P31\nret\n"
    compile .CompiledWordPMC, .PASMCompiler, .TempStr2
    set .TempInt, .CompiledWordPMC[1]
    set .CoreOps[.CurrentWord], .TempInt
    .DoneInterpretWord

New_Variable:
    bsr CollectWord
    inc .LastCellUsed
    set .TempStr2, "new P31, .Integer\nset P31, "
    set .TempString, .LastCellUsed
    concat .TempStr2, .TempString
    concat .TempStr2, "\nsave P31\nret\n"
    compile .CompiledWordPMC, .PASMCompiler, .TempStr2
    set .TempInt, .CompiledWordPMC[1]
    set .CoreOps[.CurrentWord], .TempInt
    .DoneInterpretWord

Comma:
    .PopPMC
    inc .LastCellUsed
    set .CellPMC[.LastCellUsed], .PMCStack
    .DoneInterpretWord

Allot:
    .PopInt
    add .LastCellUsed, .IntStack
    .DoneInterpretWord

Here:
    set .IntStack, .LastCellUsed
    .PushInt
    .DoneInterpretWord

Unused:
    set .IntStack, .CellSize
    sub .IntStack, .IntStack, .LastCellUsed
    dec .IntStack
    .PushInt
    .DoneInterpretWord

Type:
    .PopInt
    set .TempInt, .IntStack
    .PopInt
    # .TempInt has the count to emit, .IntStack the beginning offset
    set .TempInt2, 0
  TypeLoop:
    ge .TempInt2, .TempInt, DoneInterpretWord
    add .TempInt3, .IntStack, .TempInt2
    set .TempInt3, .CellPMC[.TempInt3]
    chr .TempString, .TempInt3
    print .TempString
    inc .TempInt2
    branch TypeLoop
	
Parrot_Substr:
    .PopInt
    set .TempInt, .IntStack
    .PopInt
    .PopStr
    substr .TempString, .StringStack, .IntStack, .TempInt
    set .StringStack, .TempString
    .PushStr
    .DoneInterpretWord

Parrot_Concat:
    .PopStr
    set .TempString, .StringStack
    .PopStr
    concat .StringStack, .StringStack, .TempString
    .PushStr
    .DoneInterpretWord

Get_Params:
    # If the regs indicate call with prototyped parameters
    if I0, dump_Ns
    # No prototypes, so note we have no N, I, or S parameters
    set .IntStack, 0
    .PushInt
    .PushInt
    .PushInt
    branch dump_Ps
  dump_Ns:
#    set .IntStack, 
  dump_Ss:
#     set .IntStack, 
  dump_Ps:
    # First the overflow
    unless I1, p_regs
  p_regs:
    
    .DoneInterpretWord

Get_Time:
    time .NumStack
    .PushNum
    .DoneInterpretWord

Parrot_String:
    # Okay, we need to yank the string out of the input stream
    bsr CollectToQuote
    new .PMCStack, .PerlString
    set .PMCStack, .CurrentWord
    save .PMCStack
    .DoneInterpretWord

Export_Word:
    .PopStr
    .PopInt
    new .TempPMC, .Sub
#    setaddr .TempPMC, .TempInt
    new .TempPMC2, .Integer
    set .TempPMC2, .IntStack
    setprop .TempPMC, "__forth_spot", .TempPMC2
#    store_global .StrStack, .TempPMC
    .DoneInterpretWord

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
# CollectToQuote
#
CollectToQuote:
    index .TempInt, .Commands, '"'                     # " Highlight fix
    eq .TempInt, -1, NoQuote
    substr .CurrentWord, .Commands, 0, .TempInt, ""
    branch DoneCollectToQuote
NoQuote:
    set .CurrentWord, .Commands
    set .Commands, ""
DoneCollectToQuote:
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

#------------------------------------------------------------------------------
#
# CompileString
#
# This little sub takes the string in .WordBody and compiles it, returning
# a PMC that corresponds to the newly compiled word. This is pretty si
#
CompileString:
    # In case someone's using it
    save .NewBodyString
    # Probably ultimately going to go
    save .Commands
    set .Commands, .WordBody
    set .NewBodyString, "wordtop:\n"

#    print "Being asked to compile:"
#    print .WordBody
#    print ":\n"

CompileWord:
    # No space!
    bsr EatLeadingWhitespace

    # If we're out of stuff, just leave
    eq .Commands, "", DoTheCompile

    # Get the next word in the command buffer
    bsr CollectWord

    # Identify it and add the text for it into the 
    bsr IdentifyAndCompileWord

    # If the buffer's not empty, then go back and process it
    length .TempInt, .Commands    
    if .TempInt, CompileWord

 DoTheCompile:
    # Add in the return
    concat .NewBodyString, "ret\n"

    # Compile the string
#    print "Compiling:\n"
#    print .NewBodyString
    compile .CompiledWordPMC, .PASMCompiler, .NewBodyString

    # And we're done
    restore .Commands
    restore .NewBodyString
    ret

IdentifyAndCompileWord:
    bsr CheckForWord
    if .Status, NotWord
    bsr AddPlainWord
    ret
NotWord:
    bsr CheckForSpecialWord
    if .Status, NotSpecial
    bsr AddSpecialWord
    ret
NotSpecial:
    bsr CheckForInt
    if .Status, NotAnInt
    bsr AddIntConstant
    ret
NotAnInt:
    bsr CheckForFloat
    if .Status, NotFloat
    bsr AddFloatConstant
    ret
NotFloat:
    bsr CheckForString
    if .Status, NotString
    bsr AddStringConstant
    ret
NotString:
    # Just ignore it
    ret

CheckForWord:
    set .TempInt, .CoreOps[.CurrentWord]
    set .Status, 0
    if .TempInt, GoodWord
    set .Status, 1
  GoodWord:
    ret

CheckForSpecialWord:
    set .TempInt, .SpecialWords[.CurrentWord]
    set .Status, 0
    if .TempInt, GoodSpecialWord
    set .Status, 1
  GoodSpecialWord:
    ret
# We cheat and do an string->int->string conversion and see
# if the results are the same. If so, it's an integer. (This is, I should
# note, very very wrong for non-decimal bases, which Forth is happy
# to do)
CheckForInt:
    set .TempInt, .CurrentWord
    set .TempString, .TempInt
    set .Status, 0
    eq .TempString, .CurrentWord, LeaveIntCheck
    set .Status, 1
  LeaveIntCheck:
    ret

CheckForFloat:
    # No float for you!
    set .Status, 1
    ret
CheckForString:
    set .Status, 1
    ret

# Control flow and such, where a simple substitution won't do
AddSpecialWord:
    ne .CurrentWord, "if", NotIf
    .NewNestLevel
    concat .NewBodyString, "restore P17\n"
    concat .NewBodyString, "unless P17, endif"
    set .TempString, .NestLevel
    concat .NewBodyString, .TempString
    concat .NewBodyString, "\n" 
    concat .TempString, "endif", .TempString
    push .LabelStack, .TempString
    branch EndSpecWord
  NotIf:
    ne .CurrentWord, "then", NotThen
    pop .TempString, .LabelStack
    concat .NewBodyString, .TempString
    concat .NewBodyString, ":\n" 
    branch EndSpecWord
  NotThen:
    ne .CurrentWord, "else", NotElse
    branch EndSpecWord    
  NotElse:
    ne .CurrentWord, "exit", NotExit
    concat .NewBodyString, "ret\n"
    branch EndSpecWord    
  NotExit:
    ne .CurrentWord, "begin", NotBegin
    .NewNestLevel
    concat .NewBodyString, "begin"
    set .TempString, .NestLevel
    concat .NewBodyString, .TempString
    concat .NewBodyString, ":\n" 
    concat .TempString, "begin", .TempString
    push .LabelStack, .TempString
    branch EndSpecWord    
  NotBegin:
    ne .CurrentWord, "again", NotAgain
    concat .NewBodyString, "branch "
    pop .TempString, .LabelStack
    concat .NewBodyString, .TempString
    concat .NewBodyString, "\n"
    branch EndSpecWord    
  NotAgain:
    ne .CurrentWord, "until", NotUntil
    concat .NewBodyString, "restore P17\n"
    concat .NewBodyString, "unless P17, "
    pop .TempString, .LabelStack
    concat .NewBodyString, .TempString
    concat .NewBodyString, "\n"
    branch EndSpecWord    
  NotUntil:
    ne .CurrentWord, "do", NotDo
    .NewNestLevel
    concat .NewBodyString, "restore P31\n"
    concat .NewBodyString, "restore P18\n"
    concat .NewBodyString, "push P30, P18\n"
    concat .NewBodyString, "push P30, P31\n"
    set .TempString, .NestLevel
    concat .TempString, "dolabel", .TempString
    push .LabelStack, .TempString
    concat .NewBodyString, .TempString
    concat .NewBodyString, ":\n"    
    branch EndSpecWord    
  NotDo:
    ne .CurrentWord, "loop", NotLoop
    concat .NewBodyString, "pop P18, P30\n"
    concat .NewBodyString, "inc P18\n"
    concat .NewBodyString, "pop P31, P30\n"
    concat .NewBodyString, "push P30, P31\n"
    concat .NewBodyString, "push P30, P18\n"
    concat .NewBodyString, "ne P18, P31, "
    pop .TempString, .LabelStack
    concat .NewBodyString, .TempString
    concat .NewBodyString, "\n"
    concat .NewBodyString, "pop P31, P30\npop P31, P30\n"
    branch EndSpecWord    
  NotLoop:
    ne .CurrentWord, "+loop", NotPlusLoop
    concat .NewBodyString, "pop P18, P30\n"
    concat .NewBodyString, "restore P24\n"
    concat .NewBodyString, "add P18, P18, P24\n"
    concat .NewBodyString, "pop P31, P30\n"
    concat .NewBodyString, "push P30, P31\n"
    concat .NewBodyString, "push P30, P18\n"
    concat .NewBodyString, "ne P18, P31, "
    pop .TempString, .LabelStack
    concat .NewBodyString, .TempString
    concat .NewBodyString, "\n"
    concat .NewBodyString, "pop P31, P30\npop P31, P30\n"
    branch EndSpecWord    
  NotPlusLoop:
    ne .CurrentWord, "compile,", NotCompileComma
    concat .NewBodyString, "restore P31\n"
    concat .NewBodyString, "set I31, P31\n"
    concat .NewBodyString, "jsr I31\n"
    branch EndSpecWord

  NotCompileComma:
    ne .CurrentWord, 'p"', NotParrotString            # " Highlight fix

    # Okay, we need to yank the string out of the input stream
    bsr EatLeadingWhitespace
    bsr CollectToQuote

    inc .LastConstant
    set .ConstantTable[.LastConstant], .CurrentWord
    concat .NewBodyString, "set S31, P15["
    set .TempString, .LastConstant
    concat .NewBodyString, .TempString
    concat .NewBodyString, "]\n"
    concat .NewBodyString, "new P17, .PerlString\n"
    concat .NewBodyString, "set P17, S31\n"
    concat .NewBodyString, "save P17\n"
    branch EndSpecWord

  NotParrotString:
    ne .CurrentWord, "recurse", NotRecurse
    concat .NewBodyString, "bsr wordtop\n"
    branch EndSpecWord    

  NotRecurse:
    ne .CurrentWord, '."', NotPrintString          #" darned highlighting...

    # Okay, we need to yank the string out of the input stream
    bsr EatLeadingWhitespace
    bsr CollectToQuote

    inc .LastConstant
    set .ConstantTable[.LastConstant], .CurrentWord
    concat .NewBodyString, "set P31, P15["
    set .TempString, .LastConstant
    concat .NewBodyString, .TempString
    concat .NewBodyString, "]\n"
    concat .NewBodyString, "print P31\n"
    branch EndSpecWord

    branch EndSpecWord


EndSpecWord:
    ret

AddIntConstant:
    concat .NewBodyString, "new P17, .Integer\n"
    concat .NewBodyString, "set P17, "
    concat .NewBodyString, .CurrentWord
    concat .NewBodyString, "\n"
    concat .NewBodyString, "save P17\n"
    ret

AddFloatConstant:
    concat .NewBodyString, "new P17, .Float\n"
    concat .NewBodyString, "set P17, "
    concat .NewBodyString, .CurrentWord
    concat .NewBodyString, "\n"
    concat .NewBodyString, "save P17\n"
    ret

AddStringConstant:
    # Should really be a String, but we don't have that yet
    concat .NewBodyString, "new P17, .PerlString\n"
    concat .NewBodyString, "set P17, "
    concat .NewBodyString, .CurrentWord
    concat .NewBodyString, "\n"
    concat .NewBodyString, "save P17\n"
    ret

AddPlainWord:
    set .TempInt, .CoreOps[.CurrentWord]
    concat .NewBodyString, "set I27, "
    set .TempString, .TempInt
    concat .NewBodyString, .TempString
    concat .NewBodyString, "\njsr I27"
    concat .NewBodyString, "\n"
    ret

AddControlStruct:
    ret

#------------------------------------------------------------------------------
#
# External entry point
#
# This is where any sub call goes. All Forth exported words come here,
# and this routine pulls out the information from the sub PMC,
# as stored in P0, to figure out where  it should go. This bit handles
# all the restoration of Forth's environment, dispatching off to the
# word being called, and invoking the return continuation when its 
# all done
ExternalEntry:
   save P1

   # Figure out where we're supposed to go, while we still have free PMCs
   getprop P16, "__forth_spot", P0
   set .TempInt, P16

   find_global .CoreOps, "__forth::CoreOps"
   find_global .UserOps, "__forth::UserOps"
   find_global .SpecialWords, "__forth::SpecialWords"
   find_global .ReturnStack, "__forth::ReturnStack"
   find_global .ConstantTable, "__forth::ConstantTable"
   find_global .TruePMC, "__forth::True"
   find_global .FalsePMC, "__forth::False"
   find_global .CellPMC, "__forth::CellArray"
   find_global .LabelStack, "__forth::LabelStack"

   bsr .TempInt

   restore P0
   invoke


VeryEnd:
    end
