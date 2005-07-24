# Expression Evaluation routines
#
# Global Variables:
#    P25  -- The op stack
#    I24  -- Random number generator seed
#
# There are external dependancies on stackops, basicvars, and alpha.
#
# $Id$
# $Log: expr.pasm,v
# Revision 1.9  2002/06/16 21:23:28  clint
# Floating Point BASI
#
# Revision 1.8  2002/06/03 21:45:01  clintp
# FINALLY runs under new assembler
#
# Revision 1.7  2002/06/03 21:17:59  clintp
# Assembler fixes
#
# Revision 1.6  2002/06/03 14:33:05  clintp
# More assembler changes
#
# Revision 1.5  2002/06/01 18:23:01  clintp
# For new assembler
#
# Revision 1.4  2002/05/22 17:22:22  clintp
# Uses PerlHash for speed
#
# Revision 1.3  2002/04/30 17:39:42  clintp
# Changed terminator
#
# Revision 1.8  2002/04/21 22:58:57  Clinton
# Made Eliza compatable
#
# Revision 1.6  2002/04/08 02:37:40  Clinton
# Added conditionals and logical operators to expr and tests
#
# Revision 1.5  2002/04/07 00:52:47  Clinton
# The + operator now will concatenate if either arg looks non-numeric
#
# Revision 1.4  2002/04/06 23:33:49  Clinton
# Added the TIME() function to return Epoch Time
#
# Revision 1.3  2002/04/01 22:16:54  Clinton
# Changed RND() to be a bit more random
# Fixed code for nested parenthetical functions/variables
#
# Revision 1.2  2002/03/31 05:13:59  Clinton
# Id Keywords
#

# Width of things on the pseudo-stack
.constant FUNCMARK "\x00"
# Create an artificial "stack" so that I can shift from one stack to the other.
PUSHOPSTACK:
        pushi
        pushs
        set I0, P25[0]
        inc I0
        restore S0
        set P25[I0], S0
        set P25[0], I0
        popi
        pops
        ret
POPOPSTACK:
        pushi
        pushs
        set I0, P25[0]
        set S0, P25[I0]
        save S0
        dec I0
        set P25[0], I0
        popi
        pops
        ret
OPSTACKDEPTH:
        pushi
        set I0, P25[0]
        save I0
        popi
        ret
INITOPSTACK:
        new P25, .PerlArray
        set P25[0], 0
        ret

# Function Dispatcher and Test
#  Functions are dispatched from here.  BASIC functions have a *FIXED* number of
#  arguments.  When the function code is called one of two things will happen:
#     * If I10 is set to 1, the function just needs to acknowledge that it exists
#       by incrementing I10 to 2 and returning.  Don't look at the stack.
#     * The stack is well-formed
#       The top item on the stack is the first argument.  Next item, next arg.
#     * Function should exhaust the stack and leave its response on TOP as a STRING
#
# ERRORS:
#     When they get confused they put a "0" on the stack and issue a warning message.
#     Things are still clean.
#
# entrypoint....
# ISFUNC: Call with func name on stack, returns 1 or 0 on stack.
ISFUNC:
	pushi
	pushs
	pushn
	set I10, 1   # Only test and return.
	save 1	     # Falsify stack
	branch FUNCDISPATCH

# entrypoint....
# STFUNCDISPATCH: Call with canonical stack, function name first entry.
STFUNCDISPATCH:
	pushi
	pushs
	pushn
	set I10, 0   # Actually *DO* the function.

FUNCDISPATCH:
	restore I5
	restore S0   # Function to call.
	dec I5
	save I5

	# Okay, while the function's on the stack being processed it
	#   might have this FUNCMARK thing after it.  Remove it.
	set S3, ""
	length I0, S0
	dec I0
	substr S3, S0, I0, 1
	ne S3, .FUNCMARK, FUNCJUMP
	substr S0, S0, 0, I0

# To add a function, add to this jump table.  Follow the rules above.
#
FUNCJUMP:
	eq S0, "ABS", FUNC_ABS
	eq S0, "SQR", FUNC_SQR
	eq S0, "SIN", FUNC_SIN
	eq S0, "COS", FUNC_COS
	eq S0, "LOG", FUNC_LOG
	eq S0, "LEN", FUNC_LEN
	eq S0, "RND", FUNC_RND
	eq S0, "MID", FUNC_MID
	eq S0, "INT", FUNC_INT
	eq S0, "ASC", FUNC_ASC
	eq S0, "CHR", FUNC_CHR
	eq S0, "RIGHT", FUNC_RIGHT
	eq S0, "LEFT", FUNC_LEFT
	eq S0, "INSTR", FUNC_INSTR
	eq S0, "TIME", FUNC_TIME
	eq S0, "INTERPINFO", FUNC_INTERPINFO
	eq I10, 1, ENDISFUNC  # Just checking, must not have been there.

	# This is bad, mmkay.  We called a function that's not a function!
	#  It's probably *actually* a subscripted variable.  Assume that and
	#  jump to an evaluator to go lookup the array variable.
	branch DOSUBSCRIPT

# Answer's on top, remember?
ENDFUNCDISPATCH:
	save I24
	popi
	pops
	popn
	restore I24     # Random number seed.
	ret

ENDISFUNC:
	restore I0	# The fake depth we used before
	dec I10		# 2->1  1->0
	save I10
	popi
	pops
	popn
	ret

# Here's some functions!
# Do *not* return.
#     Jump to ENDISFUNC for a query or ENDFUNCDISPATCH for a call.
#
FUNC_ABS:
	inc I10
	gt I10, 1, ENDISFUNC  # Only checking!
	restore I5            # pulling ABS's arguments (strings)
	ne I5, 1, FUNC_ERR    # Wrong number of args.
	bsr ATON
	restore N0
	save N0
	ge N0, 0.0, FUNCABS_POS
	restore N0
	mul N0, N0, -1.0
	save N0

FUNCABS_POS:
	bsr NTOA
	branch ENDFUNCDISPATCH

FUNC_SQR:
	inc I10
	gt I10, 1, ENDISFUNC
	restore I5
	ne I5, 1, FUNC_ERR
	bsr ATON
	restore N0
	pow N0, N0, 0.5
	save N0
	bsr NTOA
	branch ENDFUNCDISPATCH

FUNC_INTERPINFO:
	inc I10
	gt I10, 1, ENDISFUNC
	restore I5
	ne I5, 1, FUNC_ERR
	bsr ATOI
	restore I0
	interpinfo I1, I0
	save I1
	bsr ITOA
	branch ENDFUNCDISPATCH

FUNC_SIN:
	inc I10
	gt I10, 1, ENDISFUNC
	restore I5
	ne I5, 1, FUNC_ERR
	bsr ATON
	restore N0
	sin N0, N0
	save N0
	bsr NTOA
	branch ENDFUNCDISPATCH
FUNC_COS:
	inc I10
	gt I10, 1, ENDISFUNC
	restore I5
	ne I5, 1, FUNC_ERR
	bsr ATON
	restore N0
	cos N0, N0
	save N0
	bsr NTOA
	branch ENDFUNCDISPATCH
FUNC_LOG:
	inc I10
	gt I10, 1, ENDISFUNC
	restore I5
	ne I5, 1, FUNC_ERR
	bsr ATON
	restore N0
	ln N0, N0
	save N0
	bsr NTOA
	branch ENDFUNCDISPATCH

# instr(string, substring)  0=not found, otherwise offset
FUNC_INSTR:
	inc I10
	gt I10, 1, ENDISFUNC
	restore I5
	ne I5, 2, FUNC_ERR
	restore S0	# thing to look in
	restore S1   	# thing to look for
	save S0
	save S1
	save 0
	bsr STRSTR
	restore I0
	inc I0
	save I0
	bsr ITOA
	branch ENDFUNCDISPATCH

# Returns the Epoch seconds (core op TIME INT)
FUNC_TIME:
	inc I10
	gt I10, 1, ENDISFUNC
	restore I5
	ge I5, 1, FUNC_ERR	# No arguments for time()
	time I0
	save I0
	bsr ITOA
	branch ENDFUNCDISPATCH

FUNC_LEN:
	inc I10
	gt I10, 1, ENDISFUNC  # Only checking!
	restore I5
	ne I5, 1, FUNC_ERR
	restore S1
	length I0, S1
	save I0
	bsr ITOA
	branch ENDFUNCDISPATCH
# The old seed is kept in
# Uses X[n+1]=(a*x[n]+c) mod m
# Where, a=5, c=1, and m is the range
# I24 is the seed.  The period is 65536
# and probably isn't fair in the low bits.
#
.constant RANDMAX 65536
.constant RANDMAXF 65536.0
FUNC_RND:
	inc I10
	gt I10, 1, ENDISFUNC  	# Only checking!
	restore I5
	ne I5, 1, FUNC_ERR
	bsr ATOI
	restore I0  		# Range for random
	mul I24, I24, 5         # *a
	add I24, I24, 1         # +c
	mod I24, I24, .RANDMAX
	# % m
	set N0, I24            # Big 'ol number.
	div N0, N0, .RANDMAXF
	# <1.0 decimal
	set N1, I0
	mul N0, N0, N1   # Scale it to the argument
	save N0
	bsr NTOA
	branch ENDFUNCDISPATCH

FUNC_INT:
	inc I10
	gt I10, 1, ENDISFUNC
	restore I5
	ne I5, 1, FUNC_ERR
	bsr ATON
	restore N0
	set I0, N0
	save I0
	bsr ITOA
	branch ENDFUNCDISPATCH

FUNC_MID:
	inc I10
	gt I10, 1, ENDISFUNC
	restore I5
	ne I5, 3, FUNC_ERR
	restore S1		# the string
	bsr ATOI
	restore I0		# start
	dec I0			#    (1-based)
	bsr ATOI
	restore I1		# length
	length I2, S1
	gt I0, I2, FUNC_MID_ERR1
	add I3, I0, I1
	gt I3, I2, FUNC_MID_ERR2
	substr S2, S1, I0, I1
	save S2
	branch ENDFUNCDISPATCH

FUNC_LEFT:
	inc I10
	gt I10, 1, ENDISFUNC
	restore I5
	ne I5, 2, FUNC_ERR
	restore S1		# String
	bsr ATOI
	restore I0		# length
	substr S0, S1, 0, I0
	save S0
	branch ENDFUNCDISPATCH

FUNC_RIGHT:
	inc I10
	gt I10, 1, ENDISFUNC
	restore I5
	ne I5, 2, FUNC_ERR
	restore S0		# String
	bsr ATOI
	restore I0		# Length

	length I1, S0
	ge I0, I1, F_R_TOOSHORT
	sub I1, I1, I0
	substr S1, S0, I1, I0
	save S1
	branch ENDFUNCDISPATCH
F_R_TOOSHORT:
	save S0
	branch ENDFUNCDISPATCH

FUNC_CHR:
	inc I10
	gt I10, 1, ENDISFUNC
	restore I5
	ne I5, 1, FUNC_ERR
	bsr ATOI
	restore I0	# The number
	gt I0, 255, FUNC_ASCII_ERROR
	bsr SET_S1_ASCII
	substr S0, S1, I0, 1
	save S0
	branch ENDFUNCDISPATCH

FUNC_ASC:
	inc I10
	gt I10, 1, ENDISFUNC
	restore I5
	ne I5, 1, FUNC_ERR
	restore S0	# The character
	bsr SET_S1_ASCII
	save S1		# The set
	save S0		# The character
	save 0
	bsr STRNCHR
	restore I0
	eq I0, -1, FUNC_ASCII_ERROR
	set N0, I0
	save N0
	bsr NTOA
	branch ENDFUNCDISPATCH

	# Re-used a few places.  :)
	# Boy, is this handy.
SET_S1_ASCII:
	set S1, binary:"\x00\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f\x10\x11\x12\x13\x14\x15\x16\x17\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f\x20\x21\x22\x23\x24\x25\x26\x27\x28\x29\x2a\x2b\x2c\x2d\x2e\x2f\x30\x31\x32\x33\x34\x35\x36\x37\x38\x39\x3a\x3b\x3c\x3d\x3e\x3f\x40\x41\x42\x43\x44\x45\x46\x47\x48\x49\x4a\x4b\x4c\x4d\x4e\x4f\x50\x51\x52\x53\x54\x55\x56\x57\x58\x59\x5a\x5b\x5c\x5d\x5e\x5f\x60\x61\x62\x63\x64\x65\x66\x67\x68\x69\x6a\x6b\x6c\x6d\x6e\x6f\x70\x71\x72\x73\x74\x75\x76\x77\x78\x79\x7a\x7b\x7c\x7d\x7e\x7f\x80\x81\x82\x83\x84\x85\x86\x87\x88\x89\x8a\x8b\x8c\x8d\x8e\x8f\x90\x91\x92\x93\x94\x95\x96\x97\x98\x99\x9a\x9b\x9c\x9d\x9e\x9f\xa0\xa1\xa2\xa3\xa4\xa5\xa6\xa7\xa8\xa9\xaa\xab\xac\xad\xae\xaf\xb0\xb1\xb2\xb3\xb4\xb5\xb6\xb7\xb8\xb9\xba\xbb\xbc\xbd\xbe\xbf\xc0\xc1\xc2\xc3\xc4\xc5\xc6\xc7\xc8\xc9\xca\xcb\xcc\xcd\xce\xcf\xd0\xd1\xd2\xd3\xd4\xd5\xd6\xd7\xd8\xd9\xda\xdb\xdc\xdd\xde\xdf\xe0\xe1\xe2\xe3\xe4\xe5\xe6\xe7\xe8\xe9\xea\xeb\xec\xed\xee\xef\xf0\xf1\xf2\xf3\xf4\xf5\xf6\xf7\xf8\xf9\xfa\xfb\xfc\xfd\xfe\xff"
	ret

# Errors for the functions.
#
FUNC_MID_ERR1:
	print "MID(): start bound "
	print I0
	print " exceeds length of "
	print I2
	print "\n"
	save "0"
	branch ENDFUNCDISPATCH

FUNC_MID_ERR2:
	print "MID(): end bound of "
	print I3
	print " exceeds length of "
	print I2
	print "\n"
	save "0"
	branch ENDFUNCDISPATCH

FUNC_ASCII_ERROR:
	print "CHR/ASC: bounds error\n"
	save "0"
	branch ENDFUNCDISPATCH

FUNC_ERR:
	print "Improper arguments to "
	print S0
	print "\n"
	save "0"
	save I5	    # Now clear the stack!
	bsr CLEAR
	restore I5
	branch ENDFUNCDISPATCH

#
# End of functions

#
# This is the subscripted variable lookup, called by the function dispatcher.
#    We're still in its scope!  Don't forget to popi, pops, etc...
# We've got a well-formed stack here.
#   *** S0 WILL CONTAIN THE VARIABLE NAME ***
DOSUBSCRIPT:
			# S0 has the variable name.
	set I3, .NTYPE	# Numeric
	length I0, S0
	set S1, ""
	dec I0
	substr S1, S0, I0, 1  # Peel off last char
	ne S1, "$", DOSUBNUM
	set I3, .STYPE   # String
	substr S0, S0, 0, I0

DOSUBNUM:
	concat S0, "|"
	restore I5
DOSUBSL:
	eq I5, 0, ENDSUBS
	restore S1
	dec I5
	concat S0, S1
	eq I5, 0, ENDSUBS
	concat S0, ","
	branch DOSUBSL

ENDSUBS:
	save S0
	eq I3, .NTYPE, DOSUBFNUM
	bsr SFETCH
	branch DOSUBRET

DOSUBFNUM:
	bsr NFETCH
	bsr NTOA
DOSUBRET:
	save I24    # Random number seed.
	popi
	pops
	restore I24
	ret

# The expression evaluator
#
# Call with:
#    Stop word on top
#    Well-formed stack underneath
# Returns with:
#    The result on top
#    The unneeded part of the stack underneath (well-formed)
#
# Operator Precedence:
#           ~     (Function bind)
#           * /
#           + -
#           ,
#
# Unresolved expressions such as:  (4,5,6) will be returned as
#    is, reduced as far as things allow.
#
# The following features are allowed:
#        Integers
#        Unary -
#        Binary ops: * / + -
#        Functions: (defined above)
#        Variables: Numeric and string
#        Array variables: Numeric and string (strings cannot be set by LET, TODO)
#        Numbers and Strings are silently interchangeable
#
EVAL_EXPR:
	pushs
	pushi
	bsr INITOPSTACK
	restore S1	  # Stop word
	restore I5

	# Split the stack into two well-formed stacks:
	#   One before the stopword (not incl.) one after (incl.)
EVAL_SPLIT:
	eq I5, 0, ENDSPLIT
	restore S0
	save S0
	eq S0, S1, ENDSPLIT
	dec I5
	bsr PUSHOPSTACK
	branch EVAL_SPLIT

ENDSPLIT:
	save I5		  # Put what's left back
	set I5, 0

REBUILD:
	bsr OPSTACKDEPTH
	restore I0
	eq I0, 0, NOWCOOK
	bsr POPOPSTACK
	inc I5
	branch REBUILD

NOWCOOK:
	save I5
	bsr COOK_EXPR     # First cook it a bit

	bsr INFIXPOSTFIX  # Convert from Infix to Postfix

	bsr DOCALC
	save I24
	pops
	popi
	restore I24
	ret

# First, cook the expression a bit for easy digestion
#   * Unary - is properly joined with its argument
#   * $'s are re-attached to their string variable names
#   * Functions and array lookups are converted from:
#          FUNC(x,y,z)    ARR(a,b,c)    to:
#          FUNC!~(x,y,z)    ARR!~(a,b,c)
#     When converted to RPN, this makes matching the func with its
#     arguments sane again
#
COOK_EXPR:
	pushi
	pushs
	restore I5
	bsr INITOPSTACK
	set I6, 1	# Unary flag
	set I7, 0	# func flag
	set I8, 0	# Seen < flag

FIXUNARY:
	eq I5, 0, ENDFIXU
	restore S0
	dec I5
	ne S0, "$", NOTDOLLAR
	bsr POPOPSTACK
	restore S1
	concat S1, "$"
	savec S1
	bsr PUSHOPSTACK
	branch FIXUNARY

NOTDOLLAR:
	ne S0, "(", CHECKUM    # Got a (
	eq I7, 0, CHECKUM      #  and the funcflag is set!
	bsr POPOPSTACK
	restore S3
	concat S3, .FUNCMARK
	savec S3
	bsr PUSHOPSTACK
	savec "~"
	bsr PUSHOPSTACK
	# Fall through Ok.

CHECKUM:
	ne S0, "-", GTCHECK   # Got a -
	eq I6, 0, UNCHECK     #   and the unary flag is set!
	restore S0
	dec I5
	set S1, "-"
	concat S1, S0
	set S0, S1
	branch ADDUSTACK

GTCHECK:
	ne S0, ">", UNCHECK
	ne I8, 1, UNCHECK
	bsr POPOPSTACK
	restore S0
	concat S0, ">"
	save S0
	bsr PUSHOPSTACK
	branch FIXUNARY

	# Decide if a trailing - can or cannot be unary.
UNCHECK:
	set I6, 0
	set I7, 0
	eq S0, "/", POSSUN   # If any of these are
	eq S0, "*", POSSUN   #  found then the next "-"
	eq S0, "-", POSSUN   #  is syntatically a unary -
	eq S0, "+", POSSUN
	eq S0, "(", POSSUN
	eq S0, "<", POSSUN
	eq S0, ">", POSSUN
	eq S0, "=", POSSUN
	eq S0, ",", POSSUN
	eq S0, "<>", POSSUN
	eq S0, "OR", POSSUN
	eq S0, "AND", POSSUN
	eq S0, ")", ADDUSTACK  # Not this.  :)

	# We have a variable, function, token of some kind.
	#   if an open paren follows, this is a function call
	set I7, 1
	branch ADDUSTACK
POSSUN:
	set I6, 1	# The next thing may be a unary minus
	set I8, 0
	ne S0, "<", ADDUSTACK
	set I8, 1
ADDUSTACK:
	savec S0
	bsr PUSHOPSTACK
	branch FIXUNARY

# Stack transfer.
ENDFIXU:
	bsr OPSTACKDEPTH
	restore I0
	eq I0, 0, COOKEXIT
	bsr POPOPSTACK
	restore S0
	save S0
	inc I5
	branch ENDFIXU

COOKEXIT:
	save I5
	popi
	pops
	ret

# Infix -> Postfix conversion
#
#  Input: Well-formed stack leftmost on top
# Output: Well-formed stack, first to be processed on top
#
# Bit-O-Magic, | is used to separate tokens on output stream

.constant SEPARATOR "|"

INFIXPOSTFIX:
	pushi
	pushs
	restore I5  # Stack depth

	bsr INITOPSTACK
	set S0, ""  # The postfix stack
	set S7, ""  # Input

GETTOP:
	le I5, 0, FINISH
	restore S7
	dec I5

	eq S7, "-", SPECIAL
	eq S7, "+", SPECIAL
	eq S7, "*", SPECIAL
	eq S7, "/", SPECIAL
	eq S7, "(", SPECIAL
	eq S7, ")", SPECIAL
	eq S7, "~", SPECIAL
	eq S7, ">", SPECIAL
	eq S7, "<", SPECIAL
	eq S7, "=", SPECIAL
	eq S7, "<>", SPECIAL
	eq S7, "AND", SPECIAL
	eq S7, "OR", SPECIAL
	concat S0, S7		# An identifier
	concat S0, .SEPARATOR
	branch GETTOP

SPECIAL:
	eq S7, "(", OPENPAREN
	branch CLOSEPARENCK
OPENPAREN:
	save "("
	bsr PUSHOPSTACK
	branch GETTOP

CLOSEPARENCK:
	eq S7, ")", CLOSEPAREN
	branch CANPUSH

CLOSECOMMA:
	bsr OPSTACKDEPTH
	restore I0
	eq I0, 0, FINISHCOMMA
	bsr POPOPSTACK
	restore S1
	eq S1, "(", FINISHCOMMA
	concat S0, S7
	concat S0, .SEPARATOR
	branch CLOSECOMMA

FINISHCOMMA:
	ne S7, "(", FC2   # Really processing a (?
	save "("
	bsr PUSHOPSTACK
FC2:
	concat S0, ",<"
	concat S0, .SEPARATOR
	branch GETTOP

CLOSEPAREN:
	bsr OPSTACKDEPTH
	restore I0
	eq I0, 0, GETTOP
	bsr POPOPSTACK
	set S1, ""
	restore S1
	eq S1, "(", TILDECK
	concat S0, S1
	concat S0, .SEPARATOR
	branch CLOSEPAREN

	# Okay, found an ) went back to (, is the next thing a ~ ?
TILDECK:
	bsr OPSTACKDEPTH
	restore I0
	eq I0, 0, GETTOP  # Nope, apparently not.
	bsr POPOPSTACK
	set S1, ""
	restore S1
	eq S1, "~", GOTTILDE
	save S1
	bsr PUSHOPSTACK   # Oops, sorry.
	branch GETTOP
GOTTILDE:
	concat S0, S1	  # Mash that tilde on there.
	concat S0, .SEPARATOR
	branch GETTOP

CANPUSH:
	bsr OPSTACKDEPTH
	restore I0
	ne I0, 0, NOTMTSTACK
	save S7
	bsr PUSHOPSTACK
	branch GETTOP

NOTMTSTACK:
	bsr POPOPSTACK
	set S10, ""
	restore S10	# Last op
	ne S10, "(", NOTPAREN
	save S10
	bsr PUSHOPSTACK
	save S7
	bsr PUSHOPSTACK
	branch GETTOP

NOTPAREN:
	set I2, 1	# Medium (default) precedence
	set I3, 1
	eq S7, "~", IN_10
	eq S7, "*", IN_8
	eq S7, "/", IN_8
	eq S7, "+", IN_6
	eq S7, "-", IN_6
	eq S7, "<", IN_4
	eq S7, ">", IN_4
	eq S7, "<>", IN_4
	eq S7, "=", IN_4
	eq S7, "AND", IN_2
	eq S7, "OR", IN_2
	branch CKLASTOP

IN_10:  inc I2
IN_8:   inc I2
IN_6:   inc I2
IN_4:   inc I2
IN_2:	inc I2

CKLASTOP:
	eq S10, "~", LT_10
	eq S10, "*", LT_8
	eq S10, "/", LT_8
	eq S10, "+", LT_6
	eq S10, "-", LT_6
	eq S10, "<", LT_4
	eq S10, ">", LT_4
	eq S10, "<>", LT_4
	eq S10, "=", LT_4
	eq S10, "AND", LT_2
	eq S10, "OR", LT_2
	branch CKPREC
LT_10:  inc I3
LT_8:   inc I3
LT_6:   inc I3
LT_4:   inc I3
LT_2:   inc I3

CKPREC:
	le I2, I3, APPOP
	save S10
	bsr PUSHOPSTACK
	save S7
	bsr PUSHOPSTACK
	branch GETTOP

APPOP:
	concat S0, S10
	concat S0, .SEPARATOR
	branch CANPUSH

FINISH:
	bsr OPSTACKDEPTH
	restore I0
	eq I0, 0, ALLDONE
	bsr POPOPSTACK
	restore S7
	concat S0, S7
	bsr OPSTACKDEPTH
	restore I0		# Bug fix...
	concat S0, .SEPARATOR
	eq I0, 0, ALLDONE
	branch FINISH

	# The RPN is finished here, stored in S0 as a stream.
	#   we need to produce a valid stack from that.  DON'T
	#   USE TOKENIZE.  It's too smart for this.
ALLDONE:
	##print "RPN:"
	#print S0
	#print "\n"
	set I5, 0
	set I0, 0  # Offset
	set I1, 0  # Oldstart
NEXTTOK:
	save S0
	save .SEPARATOR
	save I0
	bsr STRNCHR
	set I1, I0
	restore I0
	eq I0, -1, ENDINFIX
	set S1, ""
	sub I2, I0, I1
	substr S1, S0, I1, I2
	save S1
	add I0, I1, I2
	inc I0
	inc I5
	branch NEXTTOK

ENDINFIX:
	save I5  # Stack's proper
	popi
	pops
	ret

# Calulate
#  Input: A well-formed stack in RPN notation
# Output: The value evaluated on top of the stack or 0 if an error occurred.
#         (a message will be emitted separately)
#
DOCALC:
	pushi
	pushs
	pushn
	bsr INITOPSTACK
	bsr REVERSESTACK
	restore I5
	set S0, ""

CALCLOOP:
	le I5, 0, CALCFINISH
	restore S0
	dec I5

	save S0
	bsr ISNUM
	restore I1
	ne I1, 1, NOTNUM
	save S0
	bsr PUSHOPSTACK
	branch CALCLOOP

NOTNUM:
	# Thing here is func, var, op, string, multidim var
	eq S0, "*", DOOP
	eq S0, "/", DOOP
	eq S0, "+", DOOP
	eq S0, "-", DOOP
	eq S0, "<", DOOP
	eq S0, ">", DOOP
	eq S0, "=", DOOP
	eq S0, "<>", DOOP
	eq S0, "AND", DOOP
	eq S0, "OR", DOOP
	eq S0, "~", DOFUNC
	eq S0, ",", PUSHVAR  # ?

	# Is it a builtin?
	save S0
	bsr ISFUNC
	restore I0
	ne I0, 1, NOTBUILTIN

	# Pulled a function, go take care of it
	save S0
	bsr PUSHOPSTACK
	branch CALCLOOP

	# Now, we've got one of
	#   var(index[, index...])
	#   var
        #   "string"
NOTBUILTIN:
	set S1, ""
	substr S1, S0, 0, 1
	eq S1, "'", STRING
	eq S1, '"', STRING
	branch NOTSTRINGLIT
STRING: length I0, S0
	sub I0, I0, 2
	substr S0, S0, 1, I0
	save S0
	bsr PUSHOPSTACK
	branch CALCLOOP

NOTSTRINGLIT:
	# Okay, the thing here is either
	#   1. var
	#   2. var(....)  w/trailing FUNCMARK
	set S3, ""
	length I0, S0
	dec I0
	substr S3, S0, I0, 1
	ne S3, .FUNCMARK, NORMVAR
	save S0			# A var(...), resolve later.
	bsr PUSHOPSTACK
	branch CALCLOOP

	# It's a variable.  Resolve it now, please.
NORMVAR:
	set S3, ""
	length I0, S0
	dec I0
	substr S3, S0, I0, 1
	eq S3, "$", RES_STRINGVAR
	# Numeric var
	save S0
	bsr NFETCH	# Get the numeric value
	bsr NTOA
	restore S0
	branch PUSHVAR

RES_STRINGVAR:
	substr S0, S0, 0, I0  # Now has an alpha var
	save S0
	bsr SFETCH
	restore S0
	branch PUSHVAR

PUSHVAR:save S0
	bsr PUSHOPSTACK
	branch CALCLOOP

# Actually perform a math operation
#    strings on the stack are silently converted to numeric
#    variables and functions should already have been resolved
# Joy!  If either thing is *not* a number, then + should concatenate.
#
DOOP:   set N2, 0
	set N3, 0
	set I8, 0          # Perform normal addition
	set S12, ""
	set S13, ""
	bsr OPSTACKDEPTH
	restore I0
	eq I0, 0, NOSTACK
	bsr POPOPSTACK
	restore S12
	save S12
	bsr ISNUM
	restore I0
	eq I0, 1, OPNUM1
	inc I8
OPNUM1:
	save S12
	bsr ATON
	restore N2

	bsr OPSTACKDEPTH
	restore I0
	eq I0, 0, NOSTACK
	bsr POPOPSTACK
	restore S13
	save S13
	bsr ISNUM
	restore I0
	eq I0, 1, OPNUM2
	inc I8
OPNUM2:
	save S13
	bsr ATON
	restore N3

	# Okay, at this point we've got either
	#   S12  N2  (alpha/num)
	#   S13  N3
NOSTACK:ne S0, "+", SUB
	eq I8, 0, NUMADD
	set S4, ""
	concat S13, S12
	set S4, S13
	branch ENDOP # Note different branch

	# Numeric ops
NUMADD: add N4, N2, N3
	branch ENDNOP
SUB:	ne S0, "-", MUL
	sub N4, N3, N2
	branch ENDNOP
MUL:	ne S0, "*", DIV
	mul N4, N3, N2
	branch ENDNOP
DIV:    ne S0, "/", EQ
	div N4, N3, N2
	branch ENDNOP

	# Mixed ops
	#    set to 0 or 1, branch to ENDNOP when done
EQ:	ne S0, "=", NE
	set N4, 1.0		# Assume true
	eq I8, 0, NEQ
	eq S12, S13, TRUE
	set N4, 0.0
	branch FALSE
NEQ:    eq N2, N3, TRUE
	set N4, 0.0
        branch FALSE

NE:	ne S0, "<>", GT
	set N4, 1.0
	eq I8, 0, NNE
	ne S12, S13, TRUE
	set N4, 0.0
	branch FALSE
NNE:	ne N2, N3, TRUE
	set N4, 0.0
	branch FALSE


GT:	ne S0, "<", LT
	set N4, 1.0
	eq I8, 0, NGT
	gt S12, S13, TRUE
	set N4, 0.0
	branch FALSE
NGT:	gt N2, N3, TRUE
	set N4, 0.0
	branch FALSE

LT:	ne S0, ">", AND
	set N4, 1.0
	eq I8, 0, NLT
	lt S12, S13, TRUE
	set N4, 0.0
	branch FALSE
NLT:	lt N2, N3, TRUE
	set N4, 0.0
	branch FALSE

	# TRUTH and false are still integers
AND:	ne S0, "AND", OR
	set N4, 1.0	# Assume true
	save S12
	bsr TRUTH
	restore I2
	save S13
	bsr TRUTH
	restore I3
	eq I3, 0, ANDF
	eq I2, 0, ANDF
	branch TRUE
ANDF:	set N4, 0.0
	branch FALSE

OR:	ne S0, "OR", UNKOP
	set N4, 1.0
	save S12
	bsr TRUTH
	restore I2
	save S13
	bsr TRUTH
	restore I3
	eq I3, 1, TRUE
	eq I2, 1, TRUE
ORF:	set N4, 0
	branch FALSE

UNKOP:  branch DOFUNC

	# Convenience labels
TRUE:
	noop
FALSE:
	noop
ENDNOP:
# Convert result to string again
	save N4
	bsr NTOA
	set S4, ""
	restore S4
	branch ENDOP

	# Do a built-in function or multidimensional
	#   variable lookup
DOFUNC:
# Stack's now kosher
	save I5

	# Pull things from the opstack down to the
	#   function name.  You should get either
	#   values or commas until the function name is hit.
	set I4, 0
PULLOP: bsr OPSTACKDEPTH
	restore I0
	eq I0, 0, ERRFUNC
	bsr POPOPSTACK
	restore S1
	eq S1, ",", PULLOP
	length I1, S1
	dec I1
	lt I1, 0, NOTOP
	substr S2, S1, I1, 1   # Last char
	eq S2, .FUNCMARK, RUNFUNC
NOTOP:
	save S1
	inc I4
	branch PULLOP

RUNFUNC:length I1, S1
	dec I1
	substr S1, S1, 0, I1
	save S1
	inc I4
	save I4   # Stack's proper
	bsr STFUNCDISPATCH
	restore S4	# The return value.
	restore I5	# Depth
	branch ENDOP

# The only Should Not Happen function.
ERRFUNC:print "Unexpected stack exhaustion\n"
	end

ENDOP:  save S4
	bsr PUSHOPSTACK
	branch CALCLOOP

	# In a well-formed expression only the *last* think on the opstack
	#  is what should be returned.  However because of tuples, we're going
	#  do de-construct the opstack back into a single value in case.
CALCFINISH:
	set S0, ""
	set I5, 0

CALCFINLOOP:
	bsr OPSTACKDEPTH
	restore I0
	eq I0, 0, CALCEXIT1
	bsr POPOPSTACK
	inc I5
	branch CALCFINLOOP

	# But of course, the stack is *backwards* now.
CALCEXIT1:
	save I5
	bsr REVERSESTACK
	set S1, ""
	restore I5

CALCEXITLOOP:
	eq I5, 0, CALCEXIT2
	restore S1
	dec I5
	concat S1, S0
	set S0, S1
	branch CALCEXITLOOP

CALCEXIT2:
	save S0
	save I24
	popi
	pops
	popn
	restore I24
	ret

# And now, for something completely different
#
# Truth
#  Inputs: A string on the stack
# Outputs: 0 or 1, numeric on the stack
#
#  "0" False
#  ""  False
#  Anything else true.
TRUTH:	pushs
	pushi
	restore S0
	eq S0, "0", LIE
	eq S0, "", LIE
	save 1
	branch ENDTRUTH
LIE:	save 0
ENDTRUTH:
	popi
	pops
	ret



