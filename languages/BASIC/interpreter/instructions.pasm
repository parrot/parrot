# This is where all of the instructions are
# for the BASIC interpreter
#
#  On the way into *EVERY ONE* of these the stack looks like
#  Line Number (integer, -1 if immediate mode)
#  (# tokens)
#  Tokenstack
#  (# entries)
#  Runtime stack (gosub/return, for/next)
#
#  On the way *back* just the runtime stack should be there.

#  If you need to modify varaibles, see the save/restore trick for LET
#
# $Id$
# $Log: instructions.pasm,v
# Revision 1.9  2002/06/16 21:23:28  clint
# Floating Point BASI
#
# Revision 1.8  2002/06/03 21:45:01  clintp
# FINALLY runs under new assembler
#
# Revision 1.7  2002/06/03 14:33:05  clintp
# More assembler changes
#
# Revision 1.6  2002/06/01 18:23:01  clintp
# For new assembler
#
# Revision 1.5  2002/05/25 02:36:14  clintp
# Added autorun.bas, removed LOAD message, renamed intermediate compile files
#
# Revision 1.4  2002/05/22 17:54:21  clintp
# Removed unneeded code, refactored
#
# Revision 1.3  2002/05/22 17:22:22  clintp
# Uses PerlHash for speed
#
# Revision 1.2  2002/04/29 01:10:04  clintp
# Speed changes, new language features
#
# Revision 1.15  2002/04/28 01:09:36  Clinton
# Added speedups by using set Ix, Sx and avoiding a lot of
# STRIPSPACE calls.  Compensated for weird read-data bug.
#
# Revision 1.13  2002/04/21 22:58:57  Clinton
# Made Eliza compatable
#
# Revision 1.12  2002/04/17 20:10:49  Clinton
# Fixed?
#
# Revision 1.11  2002/04/15 21:22:32  Clinton
# Added quick lookups for FOR/NEXT GOSUB/RETURN
#
# Revision 1.1  2002/04/11 01:25:59  jgoff
# Adding clintp's BASIC interpreter.
#
# Revision 1.10  2002/04/09 03:14:31  Clinton
# Optimized line lookups by using I18 and I19 as a line number
# cache and pointer
#
# Revision 1.9  2002/04/08 02:37:40  Clinton
# Added conditionals and logical operators to expr and tests
#
# Revision 1.8  2002/04/06 22:57:21  Clinton
# Added multidimensional ability to INPUT and READ
#
# Revision 1.7  2002/04/06 21:25:20  Clinton
# Enhanced LET a bit
#
# Revision 1.6  2002/04/06 20:24:44  Clinton
# Don't recall
#
# Revision 1.5  2002/04/06 17:24:02  Clinton
# Before 3rd party variable decoding for LET/READ
#
# Revision 1.4  2002/04/01 22:16:54  Clinton
# Added DUMP copcode, protection for random seed
#
# Revision 1.3  2002/03/31 17:35:22  Clinton
# Added ability to cross-nest loops and subroutines
#
# Revision 1.2  2002/03/31 05:13:56  Clinton
# Id Keywords
#
#

#
I_REM:  pushi
	pushs
	restore I0   # Line number
	bsr CLEAR    # Clear the token stack
	restore I0   # Pull the 0
END_I_REM:
	popi
	pops
	ret

I_END:  pushi
	pushs
	restore I0
	bsr CLEAR
	restore I0
	popi
	pops
	set I22, 1   # No errors!
	ret

I_DUMP: pushi
	pushs
	restore I0
	bsr CLEAR
	restore I0
	print "STACK DUMP\n"
	bsr DUMPSTACK
	popi
	pops
	ret

# RESTORE
# RESTORE expr
# (Resets read/data)
I_RESTORE:
	pushi
	pushs
	restore I0   # Line number

	restore I5
	restore S0   # "RESTORE"
	dec I5
	le I5, 0, RESTEXPR

	# Hey, there's something here.
	save I5
	save "REM"
	bsr EVAL_EXPR
	bsr ATOI
	restore I26
	bsr CLEAR
	restore I0
	set I27, 0
	branch END_I_RESTORE

RESTEXPR:
	save I5
	bsr CLEAR
	restore I0   # Empty pointer
	set I26, -1
	set I27, 0

END_I_RESTORE:
	save I27
	save I26
	popi
	pops
	restore I26
	restore I27
	ret

# DATA
# (A no-op normally)
I_DATA: pushi
	pushs
	restore I0
	bsr CLEAR
	restore I0
END_I_DATA:
	popi
	pops
	ret


# READ numvar
# READ numvar(index...)
# READ stringvar
# READ stringvar(index...)
#
I_READ: pushi
	pushs
	restore I0   # Line number
	restore I5
	restore S0   # "READ"
	dec I5
	save I5
	save "REM"   # No stopword
	bsr VARDECODE

	restore I3   # Type
	restore S0   # Variable name
	bsr CLEAR
	restore I0   # Stack's clean

DO_READ_DATA:
	save I26   # Current indexed line number
	bsr CFETCH
	restore I0 # Line Number
	eq I0, -1, ERR_DATA_EXHAUSTED
	restore S3 # We'll need this in a sec.
	save S3
	bsr TOKENIZER
	bsr REVERSESTACK
	restore I5
	restore S1 # Line number
	dec I5
	restore S2 # Statement
	dec I5
	save I5    # Stack's cool.

	set I26, I0  # Line number, exactly
	ne S2, "DATA", BAD_READ
	eq I5, 0, BAD_READ	  # Empty data statement?
	branch DATA_FOUND

BAD_READ:
	bsr CLEAR
	restore I6	# Dummy
	branch DO_READ_DATA_AGAIN

DATA_FOUND:
	# Woo!  The tokens we want are on the stack
	# Get the I27th thing on the stack and store it
	# in S2
	restore I5
	mul I0, I27, 2
	ge I5, I0, READ_PEEK
	save I5
	branch BAD_READ  # Exhausted
READ_PEEK:
	inc I0
	save I0
	bsr PEEK
	restore S2

	save I5
	bsr CLEAR
	restore I6  # Dummy

	save S2
	save 1
	save ""
	bsr EVAL_EXPR
	restore S2
	restore I6  # Another Dummy

	# So store S2 into variable S0 type I3 (N=1 A=0)
	inc I4
	inc I27
	save S0  # Name
	save S2  # Value
	eq I3, .STYPE, DATA_STR
	bsr ATON
	bsr NSTORE
	branch END_I_READ

DATA_STR:
	bsr SSTORE
	branch END_I_READ

DO_READ_DATA_AGAIN:
	inc I26
	set I27, 0   # Index to use, reset
	branch DO_READ_DATA

END_I_READ:
	save I26
	save I27
	popi
	pops
	restore I27
	restore I26
	ret

# PRINT		 (just a newline)
# PRINT expr     (anything else)
#   I6 is the trailing newline marker
I_PRINT: pushi
	pushs
	set I6, 1
	restore I0  # Line number
	restore I5  # Depth
	restore S0  # The print
	dec I5
	eq I5, 0, PRINTNL  # Just the newline

	save I5
	bsr REVERSESTACK  # Last arg is first
	restore I5
	restore S0
	save S0
	save I5
	bsr REVERSESTACK  # Put it back in order

	ne S0, ";", FIGURETYPE
	bsr REVERSESTACK
	restore I5
	dec I5
	restore S0
	save I5
	bsr REVERSESTACK

	set I6, 0

FIGURETYPE:
	# What we have here is an expression.
	save ""  # No stopwords
	bsr EVAL_EXPR
	restore S0
	print S0
	bsr CLEAR
	restore I0  # dummy

PRINTNL:
	eq I6, 0, I_PRINT_EXIT
	print "\n"
I_PRINT_EXIT:
	save I24
	popi
	pops
	restore I24
	ret

# LET NUMVAR=EXPR
# LET NUMVAR(EXPR[,EXPR]...)=EXPR
# LET STRINGVAR$=EXPR
# LET STRINGVAR$(EXPR[,EXPR]...)=EXPR
#
I_LET:  pushi
	pushs
	restore I0   # Line number
	restore I5   # Depth
	restore S0   # Keyword  "LET"
	dec I5
	save I5
	save "="     # Don't pull this!
	bsr VARDECODE

	restore I3  # Type
	restore S1  # Name

	restore I5
	restore S2   # The "="
	dec I5
	ne S2, "=", ERR_I_LET

	save I5
	save "REM"
	bsr EVAL_EXPR
	restore S0
	eq I3, .NTYPE, LETNUM
	save S1
	save S0
	bsr SSTORE
	branch END_I_LET

LETNUM: save S1
	save S0
	bsr ATON
	bsr NSTORE

END_I_LET:
	bsr CLEAR    # Clear the token stack
	restore I0   # Pull the 0

	save I24
	popi
	pops
	restore I24
	ret

ERR_I_LET:
	# Recover
	save I5
	bsr CLEAR
	restore I5
	branch SYNTAX_ERROR

# DIM STRINGVAR(EXPR)
# Dimension is now a no-op.
I_DIM:  pushi
	pushs
	restore I0   # Line number
	bsr CLEAR    # Clear the token stack
	restore I0   # Pull the 0
	popi
	pops
	ret

# GOTO EXPR
# GO TO EXPR
I_GOTO: pushi
	pushs
	restore I0  # Line Number

	restore I5  # Depth
	restore S0  # Keyword "GO" or "GOTO"
	dec I5
	eq S0, "GOTO", I_NOTGO_TO
	restore S0  # Hope this is a "TO"  :)
	dec I5
I_NOTGO_TO:
	save I5
	save ""	     #  Stopwords
	bsr EVAL_EXPR
	bsr ATOI
	restore I23  # PROGRAM COUNTER.  :)
	bsr CLEAR
	restore I0
END_I_GOTO:
	save I23
	popi
	pops
	restore I23
	ret

# ON expr GOTO
# ON expr GOSUB
I_ON:	pushi
	pushs
	restore I10 # My line # (important here)

	restore I5
	restore S0  # "ON"
	dec I5

	set I0, 0
ON_OPTYP:
	gt I0, I5, ERR_SYN_CLEAR
	save I0
	bsr PEEK
	restore S12
	eq S12, "GOSUB", GOTOP
	eq S12, "GOTO", GOTOP
	inc I0
	branch ON_OPTYP

GOTOP:  save I5
	save S12	# Stopword
	bsr EVAL_EXPR
	bsr ATOI
	restore I0      # Which branch to take
	le I0, 0, ERR_ON_FAIL

	restore I5
	restore S1    # Goto or Gosub
	dec I5
	save I5
	save "REM"
	bsr EVAL_EXPR
	restore S2    # List of lines
	bsr CLEAR
	restore I5    # Dummy

	save S2
	bsr TOKENIZER
	bsr REVERSESTACK
	restore I5

	dec I0
	mul I0, I0, 2
	save I5
	gt I0, I5, ERR_ON_FAIL
	restore I5

	save I0
	bsr PEEK
	restore S1   	# Line number for jump

	save I5
	bsr CLEAR
	restore I0

	save S1
	bsr ATOI	# ... as a number

	# Thing on the stack is where we're going
	# Now to determine *how* we're going there.
	restore I23

	# Needs I10, I23 (set)
	eq S12, "GOSUB", ON_GOSUB_ENTRY

	save I23
	popi
	pops
	restore I23
	ret


# IF EXPR COND EXPR THEN STATEMENT
# (This should be a total mindfuck)
I_IF:	pushi
	pushs

	restore I6  # Line #
	restore I5  # Depth
	set I0, 0
	restore S0  # "IF"
	dec I5
	save I5
	save "THEN"
	bsr EVAL_EXPR  # True or false?
	restore S0     # The return value...
	restore I5
	restore S1     # THEN
	dec I5
	ne S1, "THEN", ERR_SYN_CLEAR
	save I5

	save S0
	bsr TRUTH      # Change return value to truth
	restore I0     # Truth value
	eq I0, 1, IF_WORKED

	# The stack *is* kosher at this point
IF_FAILED:
	bsr CLEAR
	restore I0	  # BAIL!
	branch END_I_IF   # The assertion failed

IF_WORKED:
	# The idea is, to throw the runtime into 1-line mode
	#     temporarily.  We've got the next statement tokenized
	#     on the stack, but we've got to jump back into the RUNLINE
	#     logic like nothing happened.  :)
	# This took me forever to get right.  Be careful here.
	eq I20, 0, IF_IMM
	restore I5      # Stack depth
	save I6		# Fake my own line number
	bsr ITOA
	inc I5
	save I5
IF_IMM:
	save I23
	save I20
	save I24
	popi
	pops
	restore I24
	restore I20
	restore I23

	pushi   # To emulate the one at the beginning of RUNLINE
	pushs
	bsr RUN_INSERT
	restore I0      # Status of the statement called
	eq I0, 0, IF_BAIL
	branch  ERR_IF
IF_BAIL:
	ret
END_I_IF:
	save I24
	popi
	pops
	restore I24
	ret

IFERR:  print "FATAL: Unexpected comparison operator mismatch\n"
	end


# All of these instructions deal with the runtime stack.
# The runtime stack lives *just below* the stack used by the
#    program counter, tokenizer, etc..
# Format (top to bottom, all strings)
#
#      "GOS"                 "FOR"
#      LINECALLED	     LINECALLED
# *new LINEPOS (int)         LINEPOS (int)
#      ""                    TESTVAR
#      ""                    FINAL
#      ""                    STEP

# With FOR you *always* get one loop for free
I_FOR:	pushi
	pushs
	pushn
	restore I10  # My line number.

	restore I5
	restore S1   # "FOR"
	restore S0   # Variable Name
	restore S1   # "="
	sub I5, I5, 3
	ne S1, "=", ERR_SYN_CLEAR

	save I5
	save "TO"    # Stopword
	bsr EVAL_EXPR
	bsr ATON
	restore N0

	restore I5
	save I5
	eq I5, 0, ERR_SYN_CLEAR  # If the "TO" is missing

	save S0	     # Variable name
	save N0      # Begin value
	bsr NSTORE

	restore I5
	restore S1   # "TO"
	dec I5

	set S2, ""  # Accumulate
FORFINAL:
	le I5, 0, NOSTEPKEY
	restore S1
	eq S1, "STEP", PUTBACKSTEP
	dec I5
	concat S2, S1
	concat S2, " "
	branch FORFINAL

NOSTEPKEY:

	save I5
	branch NOARGSFOR

PUTBACKSTEP:

	save "STEP"
	save I5

NOARGSFOR:
	# Okay, what's on the stack now?  A step?
	restore I5
	save I5
	set N3, 1    # Assume step 1
	eq I5, 0, NOSTEP
	restore I5
	restore S1
	dec I5
	ne S1, "STEP", ERR_SYN_CLEAR # SNH

	save I5
	save ""
	bsr EVAL_EXPR
	restore S31
	save S31
	bsr ATON
	restore N3   # The step
	eq N3, 0.0, FOR_SYNTAX1

NOSTEP:
	bsr CLEAR    # clear instruction stack
	restore I1   # dummy...


	# Meddle with runtime stack
	restore I5   # The old depth

	save N3
	bsr NTOA   # Step
	inc I5

	save S2	   # Final (this is an expression!)
	inc I5

	save S0    # Var
	inc I5

	save 0     # Cached position  (*unused)
	bsr ITOA

	inc I10
	save I10
	bsr ITOA   # Line number +1
	inc I5

	save "FOR"
	inc I5

	save I5

END_I_FOR:
	save I24
	popi
	pops
	popn
	restore I24
	ret

FOR_SYNTAX1:
	print "FOR cannot have Step of 0\n"
	branch SYNTAX_ERROR

# NEXT
#
I_NEXT: pushi
	pushs
	pushn
	restore I10  # My Line #
	restore I5

	restore S0   # "NEXT"
	dec I5
	restore S0   # Variable Name
	save S0
	bsr NFETCH
	restore N0   # Current value
	dec I5
	save I5      # Clear rest of INSTRUCTION stack
	bsr CLEAR
	restore I5   # dummy

	save "FOR"
	save S0
	bsr STACKSEARCH

	# Okay, now dip into the runtime stack
	restore I5
	le I5, 0, ERR_I_UNDERFLOW
	# Remove 5!

	restore S7
	dec I5
	ne S7, "FOR", ERR_I_NEXT_MS

	bsr ATOI
	restore I11  # Potential new line #
	dec I5

	bsr ATOI
	restore I4   # Cached position

	restore S1   # Variable expected (sanity only)
	dec I5
	ne S1, S0, ERR_I_NEXT_CROSS

	restore S8   # Final expression
	save S8
	bsr TOKENIZER	  # With the ending-expression
	bsr REVERSESTACK
	save ""		  # No stopwords
	bsr EVAL_EXPR
	bsr ATON
	restore N2
	dec I5
	bsr CLEAR
	restore I1   # dummy

	bsr ATON
	restore N3   # Step
	dec I5

	# FOR LOOP CONTINUE (logic used by NEXT)
	#     N3  - step
	#     N2  - end value
	#     N0  - current value
	#     I11 - branch target (if succeed)
	#
	#   STEP > 0    IF N0 > N2  BAIL
	#               IF N0 <= N2 CONTINUE
	#   STEP < 0    IF N0 < N2  BAIL
	#               IF N0 >= N2 CONTINUE
	add N0, N0, N3

	save S0
	save N0
	bsr NSTORE

	lt N3, 0.0, FOR_BACK
	gt N0, N2, GO_FORWARD
	branch GO_BACK
FOR_BACK:
	lt N0, N2, GO_FORWARD
	branch GO_BACK

GO_BACK:
	save N3  # Step
	bsr NTOA

	save S8  # Final Expr
	save S0  # Var name
	save I4  # Cached position
	bsr ITOA
	save I11
	bsr ITOA # Line number
	save "FOR"
	add I5, I5, 5
	save I5  # Stack's back to kosher

	set I23, I11  # New line #

	save I23
	save I24
	popi
	pops
	popn
	restore I24
	restore I23
	ret

GO_FORWARD:
	save I5   # Put the runtime stack back (forget the FOR)
	save I24
	popi
	pops
	popn
	restore I24
	ret       # Go to next instruction normally


# GOSUB EXPR
# Yes, it's a computed GOSUB.  :)
I_GOSUB:
	pushi
	pushs
	restore I10  # Line number
	restore I5
	restore S0   # GOSUB
	dec I5
	save I5
	save ""
	bsr EVAL_EXPR
	bsr ATOI
	restore I23  # Program Counter
	bsr CLEAR
	restore I0   # dummy


	# Build the return information
	# Also the on-gosub entry point
ON_GOSUB_ENTRY:
	restore I5	# Runtime stack depth
	inc I10		# Return to my followers
	save ""
	save ""
	save ""
	save 0          # Cached position
	bsr ITOA
	save I10
	bsr ITOA	# Return target
	save "GOS"
	add I5, I5, 5
	save I5
	save I23
	popi
	pops
	restore I23
	ret

# RETURN
I_RETURN:
	pushi
	pushs
	restore I10	# Line number
	bsr CLEAR
	restore I0   # dummy

	save "GOS"
	save ""
	bsr STACKSEARCH  # Pitches unneeded things.

	restore I5
	le I5, 0, ERR_I_UNDERFLOW
	restore S0
	dec I5
	ne S0, "GOS", ERR_I_NEXT_MS
	bsr ATOI
	restore I23
	bsr ATOI
	restore I18     # Cached position (*unused)
	restore S0
	restore S0
	restore S0
	sub I5, I5, 4

	save I5
	save I23
	popi
	pops
	restore I23
	ret

#LIST
I_LIST:
	pushi
	pushs
	restore I10    # Not important
	restore I5
	restore S0     # "LIST"
	dec I5

	set I2, 0   # Start
	set I3, -1  # End
	eq I5, 0, DO_I_LIST
	save I5
	save "-"
	bsr EVAL_EXPR
	bsr ATOI
	restore I2     # Either the start of a range, or one line #

	restore I5
	eq I5, 0, LIST_ONE_LINE  # All tokens used.
	branch LIST_RANGE




LIST_ONE_LINE:
	set S0, I2
	set S0, P22[S0]
	print S0
	print "\n"
	branch END_LIST

LIST_RANGE:
	restore S0  	# -
	dec I5
	save I5
	save ""
	bsr EVAL_EXPR
	bsr ATOI
	restore I3      # This is the top end of the range

	# List from I2 to I3
	#  If I3 is -1 then no range applies.
DO_I_LIST:  set I0, 0
DOLISTL: gt I0, I28, END_LIST
        set I1, P24[I0]   # Get the next line
	set S0, I1
        set S0, P22[S0]   # Get the line code itself
	eq I3, -1, LIST_SHOW
	lt I2, I1, LIST_NEXT
	gt I3, I1, LIST_NEXT

LIST_SHOW:
        print S0
        print "\n"

LIST_NEXT:
        inc I0
        branch DOLISTL

END_LIST:
	popi
	pops
	ret

# RUN
# Note: there's no localizations here.
I_RUN:  restore I10   # Line number
	bsr CLEAR
	restore I0    # Dummy

	set I20, 1    # Runline mode
        set I23, -1   # Program Counter
	new P20, .PerlHash   # PerlHash  # Clear Numerics
	new P21, .PerlHash   # PerlHash  # Clear Alphas

	set I26, -1   # Reset READ/DATA line number
	set I27, 0    # And thingy.

CODELOOP:
        save I23
        bsr CFETCH
        restore I23
        eq I23, -1, END
	restore S0
	save S0
        inc I23
        bsr RUNLINE
        restore I1    # Status
        ne I1, 0, ERROR
        branch CODELOOP


# Okay, it's not actually an error branch anymore.
ERROR:
	noop

END:    set I20, 0   # Normal mode
	ret

# NEW
I_NEW:  pushi
	pushs
	restore I10
	bsr CLEAR
	restore I10
	# Initialize program area
        new P22, .PerlHash     # The lines themselves  (Keyed on Line #)
        new P23, .PerlHash     # Pointers from the lines to the array  (Keyed on Line #)
        new P24, .PerlArray    # Array of line numbers
        set I28, -1	      # Array length
	set I22, 1	      # Please stop executing
	save I28
	save I22
	popi
	pops
	restore I22
	restore I28
	ret

# LOAD
# This isn't particularly robust until the I/O gets
#   more rounded out.  It's particularly strange becase there's
#   no line-based I/O from filehandles.  Instead buffer it all and
#   split based on \n's
I_LOAD:
	pushi
	pushs
	restore I10   # Line number
	restore I5
	restore S0    # "NEW"
	dec I5
	eq I5, 0, SYNTAX_ERROR
	restore S0
	dec I5
	save I5
	bsr CLEAR
	restore I5	# dummy
	concat S0, ".bas"

	open P0, S0, "<"
	unless P0, ERR_IO
	set S1, ""        # Accumulator

LOAD_READ:
	read S0, P0, 256
	length I0, S0
	le I0, 0, LOAD_FIN
	concat S1, S0
	branch LOAD_READ

	# Break into lines
LOAD_FIN:
        set I0, 0
	set I5, 0

MAKELINES:
        save S1
        save "\n"
        save I0
        bsr STRNCHR
        restore I1
        eq I1, -1, ENDLINES

        sub I2, I1, I0
	print ""
        substr S2, S1, I0, I2

        save S2		# The line
	inc I5
        bsr STRIPSPACE  # Just leave it...
FIN_LINES:
        set I0, I1
        inc I0
        branch MAKELINES

ENDLINES:
	close P0
	save I5
	eq I20, 1, ENDLINES2

	# Initialize program area
        new P22, .PerlHash     # The lines themselves  (Keyed on Line #)
        new P23, .PerlHash     # Pointers from the lines to the array  (Keyed on Line #)
        new P24, .PerlArray    # Array of line numbers
        set I28, -1

ENDLINES2:
	bsr CENDLOAD
	ret

# INPUT numvar
# INPUT stringvar
I_INPUT:
	pushi
	pushs
	restore I10	# Line number
	restore I5
	restore S0	# "INPUT"
	dec I5
	eq I5, 0, SYNTAX_ERROR
	save I5
	save "REM"
	bsr VARDECODE

	restore I3	# Type
	restore S0	# Variable
	bsr CLEAR
	restore I0	# Dummy

	set S3, ""
	read S3, 256
        clone S4, S3
        set S5, S4
        save S5
        bsr STRIPSPACE
	restore S5

	eq I3, .STYPE, INPSTRING

	save S0
	save S5
	bsr ATON
	bsr NSTORE
	branch ENDINPUT

INPSTRING:
	savec S0
	savec S5
	bsr SSTORE
	branch ENDINPUT

ENDINPUT:
	popi
	pops
	ret

# TRACE
I_TRACE:
	pushi
	pushs
	restore I10  # Line #
	save ""
	bsr EVAL_EXPR
	bsr ATOI
	restore I25
	bsr CLEAR
	restore I0

	save I25
	popi
	pops
	restore I25
	ret

# Runtime stack mgmt.
#   Put two things on the stack.  A type FOR/GOS and
#   a marker (variable name/"").  This will search down
#   through the stack.
# Called by "RETURN" and "NEXT"
STACKSEARCH:
	pushi
	pushs
	restore S0   # Marker
	restore S1   # TypeA

KEEPLOOKING:
	restore I5   # Stack depth
	eq I5, 0, ENDSEARCH
	restore S2   # Type
	restore S3   # Line #
	restore S7   # Cached position...
	restore S4   # Marker     (FOR)
	restore S5   # Expression (FOR)
	restore S6   # Step       (FOR)
	sub I5, I5, 5
	save I5
	ne S2, S1, KEEPLOOKING  # Type mismatch
	ne S0, S4, KEEPLOOKING  # Marker mismatch

PUTBACK:
	restore I5
	save S6
	save S5
	save S4
	save S7     # Cached position
	save S3
	save S2
	add I5, I5, 5

ENDSEARCH:
	save I5
	popi
	pops
	ret

# Error messages
#
ERR_IO:
	print "I/O Error "
	err S0
	print S0
	print "\n"
	branch ALL_ERR

# This is a Should Not Happen error now.
ERR_I_NEXT_MS:
	save I5
	bsr CLEAR
	restore I0
	save 0   # Initialize a new runtime stack
	print "Unexpected FOR/GOS on stack "
	branch ALL_ERR

ERR_I_NEXT_CROSS:
	save I5
	bsr CLEAR
	restore I0
	save 0   # Initialize a new runtime stack
	print "Crossed FOR/NEXT values "
	branch ALL_ERR

ERR_I_UNDERFLOW:
	save 0   # Initialize a new runtime stack
	print "GOSUB/FOR stack underflow "
	branch ALL_ERR

SYNTAX_ERROR:
	print "Syntax error "
	branch ALL_ERR

ERR_SYN_CLEAR:
	save I5
	bsr CLEAR
	restore I0
	branch SYNTAX_ERROR

ERR_I_DIM2:
	print "Dimension size <= 0 "
	bsr CLEAR
	restore I0
	branch ALL_ERR

ERR_DATA_EXHAUSTED:
	print "DATA EXHAUSTED AT READ "
	branch ALL_ERR

ERR_ON_FAIL:
	print "ON GOTO/GOSUB OFFSET OUT OF RANGE "
	bsr CLEAR
	restore I0
	branch ALL_ERR

ERR_IF:
	print "Error in IF statement at line "
	dec I23
	save I23
	bsr ITOA
	restore S31
	print S31
	print "\n"
	set I22, 1
	ret

ALL_ERR:
	dec I23
	print " at line "

	save I23
	bsr ITOA
	restore S31	# Convert for puts
	print S31

	print "\n"
	set I22, 1	# Stop please
	save I22
	popi
	pops
	restore I22

	ret

