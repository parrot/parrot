	# Display Expression (simple)
	#
	# Displays expression leftover from EVALEXPR
	#   (Which is P6!)
	#   S1		FD name or ""
	# Trashes S3
DISPLAY_EXPRESSION:
	bsr UNSTUFF
	#   N0/S0/I0	has the value
	#   S2		has the type
	set S3, ""
	eq S2, "STRING", DISP_STRING
	eq S2, "INT", DISP_INT
	eq S2, "FLO", DISP_FLO
	eq S2, "USER", DISP_USER
	print "Unknown display thingy: "
	print S2
	print "\n"
	branch GEN_ERROR
DISP_STRING:
	set S3, S0
	branch DISP_END
DISP_USER:
	set S3, "User-Type "
	set S0, P6["_type"]
	concat S3, S0
	branch DISP_END

DISP_INT:
	lt I0, 0, INT_NEG
	concat S3, " "
INT_NEG:set S0, I0
	concat S3, S0
	concat S3, " "
	branch DISP_END
	
DISP_FLO:lt N0, 0.0, FLO_NEG
	concat S3, " "
FLO_NEG:bsr NORMALIZE_FLO
	concat S3, S0
	concat S3, " "
	branch DISP_END

DISP_ARRAY:
	concat S3, "Array "
	bsr ARR_FINDPARENT  # Put array in P0
	set P1, P0["keys"]
	set I0, P1
	set I1, 0
	concat S3, " keys "
DISP_ARRAY_L:
	eq I0, I1, DISP_ARRAY_E
	set S0, P1[I1]
	concat S3, S0
	concat S3, " "
	inc I1
	branch DISP_ARRAY_L
DISP_ARRAY_E:
	concat S3, "\n"
	branch DISP_END
DISP_END:
	eq S1, "", DISP_SCREEN
	set I1, P17[S1]
	eq I1, 0, ERR_BADF
	set S0, S3
	bsr PRINTLINE
	ret

	# Keep track of what column we're in in I14
DISP_SCREEN:
	eq S3, "\n", DISP_RESET
	eq S3, "\t", DISP_TAB
	length I0, S3
	add I14, I14, I0
	print S3
	ret
DISP_TAB:
        set I0, I14
        mod I0, I0, 8
        sub I0, 7, I0
        set I1, 0
        eq I1, I0, ENDCOL
        print " "
	inc I14
        inc I1
        branch DISP_TAB
ENDCOL: ret
DISP_RESET:
	print "\n"
	set I14,0 
	ret

	# #########################
	# NORMALIZE_FLO
	# Takes N0 and returns S0
	#    S0 is a much saner float, with the trailing 0's removed, etc...
	#
	# Relies on Parrot displaying 0 as 0.0000000
NORMALIZE_FLO:
	pushi
	pushs
	set S0, N0
	length I0, S0
	substr S1, S0, I0, 1
	eq S1, ".", FLO_CHOP_DEC
	eq S1, "0", FLO_CHOP
	branch FLO_END
FLO_CHOP_DEC:
	substr S0, S0, 0, I0
	branch FLO_END
FLO_CHOP:
	substr S0, S0, 0, I0
	branch FLO_NEG
FLO_END:
	save S0
	popi
	pops
	restore S0
	ret
	
	# Function HOWTO
	#   Internals differ from externals by the fact that they
	#    * Don't need to do the re-entrancy stuff.
	#    * Are passed values, not references
	# Set I1 to 0 on completion (successful or not)!
	#
	# FOR MULTI-VALUE FUNCTIONS, REMEMBER: THEY'RE PASSED BACKWARDS
	#
	# ############################
	# ABS
BUILTIN_ABS:
	bsr GETARGS
	bsr CLEARARGS
	eq S1, "FLO", BI_ABSFLO
	eq S1, "INT", BI_ABSINT
	branch BI_WRONG_TYPE
BI_ABSFLO:
	abs N0, N0
	branch BI_ABSEND
BI_ABSINT:
	abs I0, I0
	branch BI_ABSEND
BI_ABSEND:
	bsr PUSHRET
	set I1, 0
	ret
	
	# ###########################
	# INT
BUILTIN_INT:
	bsr GETARGS
	bsr CLEARARGS
	bsr MAKEINT
	set S1, "INT"
	bsr PUSHRET	# int() returns INT always...
	set I1, 0
	ret
	
	# #############################
	# CHR$
BUILTIN_CHR:
	bsr GETARGS
	bsr CLEARARGS
	bsr MAKEINT
	chr S0, I0
	set S1, "STRING"
	bsr PUSHRET
	set I1, 0
	ret
	
	# #############################
	# ASC
BUILTIN_ASC:
	bsr GETARGS
	bsr CLEARARGS
	ne S1, "STRING", BI_WRONG_TYPE
	ord I0, S0
	set S1, "INT"
	bsr PUSHRET
	set I1, 0
	ret
	
	# #############################
	# STR$
BUILTIN_STR:
	bsr GETARGS
	bsr CLEARARGS
	eq S1, "FLO", STR_FLO
	eq S1, "INT", STR_INT
	branch BI_WRONG_TYPE
STR_FLO:set S0, N0
	branch STR_END
STR_INT:set S0, I0
STR_END:set S1, "STRING"
	bsr PUSHRET
	set I1, 0
	ret
	
	# ###############################
	# VAL
BUILTIN_VAL:
	bsr GETARGS
	bsr CLEARARGS
	ne S1, "STRING", BI_WRONG_TYPE
	set N0, S0
	set S1, "FLO"
	bsr PUSHRET
	set I1, 0
	ret
	
	# ################################
	# LEN
BUILTIN_LEN:
	bsr GETARGS
	bsr CLEARARGS
	ne S1, "STRING", BI_WRONG_TYPE
	length I0, S0
	set S1, "INT" 
	bsr PUSHRET
	set I1, 0
	ret
	
	# ###############################
	# MID$   (function)
BUILTIN_MID:
	bsr GETARGS
	bsr MAKEINT	
	set I1, I0	# This is either the extent or the start in I1
	bsr GETARGS
	eq S1, "STRING", MID_TWO
	bsr MAKEINT
	set I2, I0	# I2 has the start
	bsr GETARGS	# S0 now has the string
	branch MID
MID_TWO:set I2, I1	# I2 has the start
	length I1, S0   # I1 has the extent
MID:	dec I2
	lt I2, 0, ERR_STRRANGE
	add I3, I2, I1
	length I4, S0
	gt I3, I4, ERR_STRRANGE
	bsr CLEARARGS
	substr S0, S0, I2, I1
	set S1, "STRING"
	bsr PUSHRET
	set I1, 0
	ret

LR_SETUP:bsr GETARGS
	bsr MAKEINT
	set I1, I0	# The extent
	bsr GETARGS
	bsr CLEARARGS
	ne S1, "STRING", BI_WRONG_TYPE
	ret
	
	# #################################
	# LEFT$
BUILTIN_LEFT:
	bsr LR_SETUP
	length I0, S0
	le I1, I0, LEFT_OK
	set I1, I0
LEFT_OK:substr S0, S0, 0, I1
	set S1, "STRING"
	bsr PUSHRET
	set I1, 0
	ret
	
	# #################################
	# RIGHT$
BUILTIN_RIGHT:
	bsr LR_SETUP
	length I0, S0
	le I1, I0, RIGHT_OK
	set I1, I0
RIGHT_OK:
	sub I3, I0, I1
	substr S0, S0, I3, I1
	set S1, "STRING"
	bsr PUSHRET
	set I1, 0
	ret

ERR_STRRANGE:
	print "Value out of range for string"
	branch GEN_ERROR

	# #################################
	# INPUT$
BUILTIN_INPUT:
	bsr GETARGS
	eq S1, "STRING", INP_TWO_ARG
	bsr MAKEINT	# Sets I0 to len
	set I1, 0	# use STDIN
	branch DOREAD
INP_TWO_ARG:
	length I0, S1
	dec I0
	substr S1, S1, 1, I0   # Now has FD number
	set I1, S1
	bsr GETARGS
	bsr MAKEINT	# Sets I0
DOREAD: bsr CLEARARGS
	set I2, I0
	bsr READCHARS
	set S1, "STRING"
	bsr PUSHRET
	set I1, 0
	ret

	# ##################################
	# INSTR
BUILTIN_INSTR:
	set I4, 1	# Start Position
	bsr GETARGS
	ne S1, "STRING", BI_WRONG_TYPE
	set S6, S0	# string two
	bsr GETARGS
	ne S1, "STRING", BI_WRONG_TYPE
	set S3, S0	# string one
	bsr ARGCK
	eq I3, 1, INSTR_ENDARG
	bsr GETARGS
	bsr MAKEINT
	set I4, I0
INSTR_ENDARG:		# S1, S2, and I4 (start)
	set S2, S6
	bsr CLEARARGS
	set I3, 0	#    Match position
	set S1, S3	# Programmer sanity.
	length I1, S1
	eq I1, 0, INSTR_DONE	# S1 is null
	gt I4, I1, INSTR_DONE	# start > len S1
	set I3, I4		
	length I1, S2
	eq I1, 0, INSTR_DONE	# S2 is null
	length I1, S1
	length I2, S2
	dec I4
INSTR_LOOP:
	add I0, I4, I2
	gt I0, I1, INSTR_NOTFOUND
	substr S0, S1, I4, I2
	eq S0, S2, INSTR_FOUND
	inc I4
	branch INSTR_LOOP
INSTR_FOUND:
	set I3, I4
	inc I3
	branch INSTR_DONE
INSTR_NOTFOUND:
	set I3, 0
INSTR_DONE:
	set I0, I3
	set S1, "INT"
	bsr PUSHRET
	set I1, 0	# Return OK
	ret
	
	# ############################################
	# UCASE$
BUILTIN_UCASE:
	bsr GETARGS
	set I6, 97
	set I7, 122
	set I4, 32
	branch BUILTIN_XCASE
	# ############################################
	# LCASE$
BUILTIN_LCASE:
	bsr GETARGS
	set I6, 65
	set I7, 90
	set I4, -32
	branch BUILTIN_XCASE

BUILTIN_XCASE:
	ne S1, "STRING", BI_WRONG_TYPE
	bsr CLEARARGS
	length I5, S0
	set S3, ""
	set I0, 0
XCASE_LOOP:
	ge I0, I5, XCASE_DONE
	substr S1, S0, I0, 1
	ord I2, S1
	ge I2, I6, XCASE_OK1
	branch XCASE_INSERT
XCASE_OK1:
	le I2, I7, XCASE_SHIFT
	branch XCASE_INSERT
XCASE_SHIFT:
	sub I2, I2, I4
XCASE_INSERT:
	chr S1, I2
	concat S3, S1
	inc I0
	branch XCASE_LOOP
XCASE_DONE:
	set S0, S3
	set S1, "STRING"
	bsr PUSHRET
	set I1, 0
	ret

	# ###################################
	# STRING$
BUILTIN_STRING:
	bsr GETARGS
	eq S1, "STRING", REPEAT_STRING
	bsr MAKEINT
	set I6, I0
	bsr GETARGS
	bsr MAKEINT	# Repeat chr(i6) I0 times
	bsr CLEARARGS
	set I5, 0
	set S3, ""
BIS_REP:eq I5, I0, REP_DONE
	chr S0, I6
	concat S3, S0
	inc I5
	branch BIS_REP
REPEAT_STRING:
	set S6, S0	# String to repeat
	bsr GETARGS
	bsr MAKEINT
	bsr CLEARARGS
	set S3, ""
	set I5, 0
REP:    eq I5, I0, REP_DONE
	concat S3, S6
	inc I5
	branch REP
REP_DONE:
	set S0, S3
	set S1, "STRING"
	bsr PUSHRET
	set I1, 0
	ret
	
	# ############################################
	# LTRIM
BUILTIN_LTRIM:
	bsr GETARGS
	ne S1, "STRING", BI_WRONG_TYPE
	bsr CLEARARGS
BI_LTRIM:
	length I0, S0
	eq I0, 0, LTRIM_END
	substr S1, S0, 0, 1
	ne S1, " ", LTRIM_END
	dec I0
	substr S0, S0, 1, I0
	branch BI_LTRIM
LTRIM_END:
	set S1, "STRING"
	bsr PUSHRET
	set I1, 0
	ret

	# ############################################
	# RTRIM
BUILTIN_RTRIM:
	bsr GETARGS
	ne S1, "STRING", BI_WRONG_TYPE
	bsr CLEARARGS
BI_RTRIM:
	length I0, S0
	eq I0, 0, RTRIM_END
	dec I0
	substr S1, S0, I0, 1
	ne S1, " ", RTRIM_END
	substr S0, S0, 0, I0
	branch BI_RTRIM
RTRIM_END:
	set S1, "STRING"
	bsr PUSHRET
	set I1, 0
	ret
	
	# ############################################
	# RND
	# I12 has the seed!
.constant RANDMAX 65536
.constant RANDMAXF 65536.0
BUILTIN_RND:
	bsr ARGCK
	eq I3, 1, RND_GEN	# There are no more args
	bsr GETARGS
	bsr MAKEINT
	eq I0, 0, RND_REPEAT
	# Okay, this is probably wrong.  < 0 I don't understand.
RND_GEN:bsr CLEARARGS
	mul I12, I12, 5         # *a
	add I12, I12, 1         # +c	
	mod I12, I12, .RANDMAX  
	# % m
	set N0, I12            # Big 'ol number.
	div N0, N0, .RANDMAXF 
	branch RND_BAIL
RND_REPEAT:
	bsr CLEARARGS
	set N0, I12
	div N0, N0, .RANDMAXF
RND_BAIL:
	set S1, "FLO"
	bsr PUSHRET
	set I1, 0
	ret

	# ############################################
	# TIMER
BUILTIN_TIMER:
	bsr CLEARARGS
	time N0
	set S1, "FLO"
	bsr PUSHRET
	set I1, 0
	ret

SETUP_TRIG:
	bsr GETARGS
	bsr MAKEFLO
	bsr CLEARARGS
	ret
FINISH_TRIG:
	set S1, "FLO"
	bsr PUSHRET
	set I1, 0
	ret

BUILTIN_LOG:
	bsr SETUP_TRIG
	ln N0, N0
	branch FINISH_TRIG
BUILTIN_EXP:
	bsr SETUP_TRIG
	exp N0, N0
	branch FINISH_TRIG
BUILTIN_SIN:
	bsr SETUP_TRIG
	sin N0, N0
	branch FINISH_TRIG
BUILTIN_COS:
	bsr SETUP_TRIG
	cos N0, N0
	branch FINISH_TRIG
BUILTIN_TAN:
	bsr SETUP_TRIG
	tan N0, N0
	branch FINISH_TRIG
BUILTIN_ATN:
	bsr SETUP_TRIG
	atan N0, N0
	branch FINISH_TRIG
	
	# ########################################
	# SQR
	# Newton's Method
.constant EPSILON 0.000001
BUILTIN_SQR:
	bsr GETARGS
	bsr MAKEFLO
	bsr CLEARARGS
	lt N0, 0.0, ERR_RANGE
	eq N0, 0.0, SQR_END
	div N1, N0, 3.0		# First guess
SQR_AGAIN:
	div N2, N0, N1
	add N2, N2, N1
	mul N2, N2, 0.5
	sub N3, N2, N1
	gt N3, 0.0, INV
	mul N3, N3, -1.0
INV:	set N1, N2
	gt N3, .EPSILON, SQR_AGAIN

	set N0, N1	
SQR_END:set S1, "FLO"
	bsr PUSHRET
	set I1, 0
	ret
ERR_RANGE:
	print "Number out of range"
	branch GEN_ERROR
	

	# ############################################
	# SGN
BUILTIN_SGN:
	bsr GETARGS
	bsr MAKEFLO
	bsr CLEARARGS
	set I0, 0
	eq N0, 0.0, SGN_END
	lt N0, 0.0, SGN_NEG
	set I0, 1
	branch SGN_END
SGN_NEG:set I0, -1
SGN_END:set S1, "INT"
	bsr PUSHRET
	set I1, 0
	ret

	# ############################################
	# TAB
BUILTIN_TAB:
	bsr GETARGS
	bsr MAKEINT
	bsr CLEARARGS
	dec I0
	set S0, ""
	eq I0, I14, TAB_RET
	lt I0, I14, TAB_NL
	set I1, I14
	branch TAB_SP
TAB_NL: concat S0, "\n"
	set I0, 0
	set I1, 0
TAB_SP: eq I1, I0, TAB_RET
	concat S0, " "
	inc I1
	branch TAB_SP
TAB_RET:set S1, "STRING"
	bsr PUSHRET
	set I1, 0
	ret

	##############################################
	# Jump table for builtin functions
	#   BSR to here please...
	# 
	# Because I can't figure out how to do a 
	#     computed jump in PASM :)
	##############################################
JUMPTABLE:
	eq S0, "abs", BUILTIN_ABS
	eq S0, "int", BUILTIN_INT
	eq S0, "chr$", BUILTIN_CHR
	eq S0, "asc", BUILTIN_ASC
	eq S0, "str$", BUILTIN_STR
	eq S0, "val", BUILTIN_VAL
	eq S0, "len", BUILTIN_LEN
	eq S0, "mid$", BUILTIN_MID
	eq S0, "left$", BUILTIN_LEFT
	eq S0, "right$", BUILTIN_RIGHT
	eq S0, "input$", BUILTIN_INPUT
	eq S0, "instr", BUILTIN_INSTR
	eq S0, "ucase$", BUILTIN_UCASE
	eq S0, "lcase$", BUILTIN_LCASE
	eq S0, "string$", BUILTIN_STRING
	eq S0, "ltrim$", BUILTIN_LTRIM
	eq S0, "rtrim$", BUILTIN_RTRIM
	eq S0, "rnd", BUILTIN_RND
	eq S0, "timer", BUILTIN_TIMER
	eq S0, "log", BUILTIN_LOG
	eq S0, "exp", BUILTIN_EXP
	eq S0, "sin", BUILTIN_SIN
	eq S0, "cos", BUILTIN_COS
	eq S0, "tan", BUILTIN_TAN
	eq S0, "atn", BUILTIN_ATN
	eq S0, "sqr", BUILTIN_SQR
	eq S0, "sgn", BUILTIN_SGN
	eq S0, "tab", BUILTIN_TAB
	set I1, -1
	ret
	
BI_WRONG_TYPE:
	print "Wrong type ("
	print S1
	print ") passed to function"
	branch GEN_ERROR


	# Gets the argument from the P8 stack required for 
	#    functions:
	# I0/N0/S0   Argument's value
	# S1	     Argument's type
	# 
GETARGS:set I5, P8
	eq I5, 0, ERRBADARGS
	pop P0, P8   # Type
	set S1, P0["type"]
	#print "Pulling a "
	#print S1
	#print " as a function argument\n"
	eq S1, "FLO", GETFLO
	eq S1, "STRING", GETSTRING
	eq S1, "INT", GETINT
	eq S1, "BARE", GETBARE
	print "Unknown argument type '"
	print S1
	print "'\n"
	branch GEN_ERROR
GETFLO: set N0, P0["value"]
	#print "Got "
	#print N0
	#print "\n"
	branch ENDARGS
GETINT: set I0, P0["value"]
	#print "Got "
	#print I0
	#print "\n"
	branch ENDARGS
GETSTRING: set S0, P0["value"]
	#print "Got "
	#print S0
	#print "\n"
	branch ENDARGS
GETBARE: 
	set S0, P0["value"]
	bsr VARLOOKUP
	branch ENDARGS

ENDARGS:	
	ret

	# Takes something that's just been GET'argd 
	# and makes it an INT.  Err for FLO.
MAKEINT:eq S1, "INT", MAKEINT_END
	ne S1, "FLO", BI_WRONG_TYPE
	set I0, N0
	set S1, "INT"
MAKEINT_END:
	ret
MAKEFLO:eq S1, "FLO", MAKEFLO_END
	ne S1, "INT", BI_WRONG_TYPE
	set N0, I0
	set S1, "INT"
MAKEFLO_END:
	ret
	
	# Clears the ARG marker from the expression stack
	#
CLEARARGS:
	set P8, 0
	ret

	# ###################################
	# ARGCK
	#   Sets I3 = 1 End of arguments
	#           = 0 There's more arguments
ARGCK:	set I3, P8
	eq I3, 0, ARGCKEND
	set I3, 1
ARGCKEND:ret

ERRBADARGS:
	print "Not enough arguments on stack "
	print S0
	branch GEN_ERROR

	# Pushes something of the type in S1 onto the stack
	# from I0/N0/S0
PUSHRET:
 	#print "Pushing result "
 	#print S1
 	#print " back to stack\n"
 	new P6, .PerlHash
 	set P6["type"], S1
	eq S1, "INT", BI_PUSHINT
	eq S1, "FLO", BI_PUSHFLO
	eq S1, "STRING", BI_PUSHSTRING
	print "Cannot push type '"
	print S1
	print "' onto arg stack\n"
	branch GEN_ERROR
BI_PUSHINT:
	set P6["value"], I0
	ret
BI_PUSHFLO:
	set P6["value"], N0
	ret
BI_PUSHSTRING:
	set P6["value"], S0
	ret
