# Basic variable and code storage management
#
# Global Resources:
#   S20
#   S21
#   S22  Numeric/String/Code variable storage formatted as:
#         8 bytes (name).  Terminates with "#"  Line number for Code
#	  3 bytes (width)  N=12
#     width bytes (value)
#
#   I18  Cached line number
#   I19  Cached line position
#
# Subscripted variables are stored independently of each other as:
#   varname|subscr,subscr   (the subscripts will be reversed)
#   The limit to subscripting is:
#     (Length of variable name)[+1+subscriptlen+1+[subscriptlen+1]...
#     So that FOO(56,1) will occupy FOO|1,56 an 8-byte slot
#
# $Id$
# $Log$
# Revision 1.1  2002/04/11 01:25:59  jgoff
# Adding clintp's BASIC interpreter.
#
# Revision 1.8  2002/04/09 03:14:31  Clinton
# Optimized line lookups by using I18 and I19 as a line number
# cache and pointer
#
# Revision 1.7  2002/04/07 00:52:31  Clinton
# Fixed accidental STRIPSPACE on string storage
#
# Revision 1.6  2002/04/06 21:24:53  Clinton
# Added advanced string handling.  String vars are created automagically now
#
# Revision 1.5  2002/04/06 19:58:52  Clinton
# Before allowing undimensioned strings.
# Added VDESTROY capability
#
# Revision 1.4  2002/04/01 22:16:54  Clinton
# Changed load sequence a bit
#
# Revision 1.3  2002/03/31 05:15:31  Clinton
# Adjusted
#
# Revision 1.2  2002/03/31 05:13:48  Clinton
# Id Keywords
#

.const NTYPE 0
.const STYPE 1
.const CTYPE 2
.const NAMEWIDTH 15
.const VARWIDTH 3
.const TERMINATOR "-"
.const STRINGMINW 10

# (internal) Find variable
#  Inputs: variable name (or code line number)
#          type
# Outputs: offset, -1 if unknown
VFIND:  pushi
	pushs
	restore I5
	restore S5
	length I0, S5
	gt I0, NAMEWIDTH, VFINDTOOLONG

	set S15, S20  # Assume Ints
	eq I5, NTYPE, VSEARCH
	set S15, S21  # Strings?
	eq I5, STYPE, VSEARCH
	set S15, S22  # Code then
	save S5
	bsr ATOI
	restore I6    # Line numbers are numeric

VSEARCH:
	set I0, -1
	set I1, 0
	ne I5, CTYPE, VFINDL
	set I1, I18

VFINDL:
	set S2, ""
	substr S2, S15, I1, NAMEWIDTH
	save S2
	bsr STRIPSPACE
	restore S2	       # Var name/line #
	eq S2, S5, VFOUND     # Exact match
	eq S2, "#", VFINDEND  # Exhausted
	ne I5, CTYPE, VNOTFOUND
	save S2
	bsr ATOI
	restore I2
	ge I2, I6, VFOUND
VNOTFOUND:
	add I1, I1, NAMEWIDTH
	set S2, ""
	substr S2, S15, I1, VARWIDTH
	save S2
	bsr STRIPSPACE
	bsr ATOI
	restore I2
	add I1, I1, VARWIDTH
	add I1, I1, I2
	branch VFINDL
VFOUND:
	set I0, I1
VFINDEND:
	save I0
	popi
	pops  # Read-only no S20 restore needed
	ret
VFINDTOOLONG:
	print "SYMBOL NAME TOO LONG: "
	print S5
	print "\n"
	end

# Create a variable  UNINITIALIZED
#  Inputs: Variable name
#          type
#          width
# Outputs: none
VCREATE:
	pushi
	pushs
	restore I6  # Width
	restore I5  # Type
	restore S0  # The variable name

	set S15, S20  # Assume Ints
	eq I5, NTYPE, VCSTART
	set S15, S21  # Strings?
	eq I5, STYPE, VCSTART
	set S15, S22  # Code then
VCSTART:
	save "#"
	save I5
	bsr VFIND  # Find the end
	restore I0

	# Assemble the new
	save S0
	save NAMEWIDTH
	bsr PAD
	restore S9
	concat S10, S9

	save I6
	bsr ITOA
	save VARWIDTH
	bsr PAD
	restore S9
	concat S10, S9

	repeat S9, " ", I6
	concat S10, S9

	save S15
	save S10
	save I0
	bsr STRINSERT  # New is on stack

VCREND: save I5
	popi
	pops
	restore I5
	ne I5, NTYPE, VCNOTNUM
	restore S20
	branch VCBAIL
VCNOTNUM:
	ne I5, STYPE, VCNOTSTR
	restore S21
	branch VCBAIL
VCNOTSTR:
	restore S22 # Code
VCBAIL: ret

# Set variables
# (We assume they exist already, a runtime error occurs otherwise)
#  Inputs: Value is on the stack
#	   Name is on the stack
#          Width is on the stack
# Outputs: (none)
VSTORE:
	pushi
	pushs
	restore S5  # Value (I will space pad)
	restore I6  # width
	restore I5  # type
	restore S0  # Variable name

	save S0
	save I5
	bsr VFIND
	restore I0  # Location
	eq I0, -1, VSTOREERR

	set S15, S20  # Assume Ints
	eq I5, NTYPE, VSSTART
	set S15, S21  # Strings?
	eq I5, STYPE, VSSTART
	set S15, S22  # Code then
VSSTART:
	add I0, I0, NAMEWIDTH
	substr S1, S15, I0, VARWIDTH
	save S1
	bsr STRIPSPACE
	bsr ATOI
	restore I1
	ne I1, I6, VSTOREERR2

	add I0, I0, VARWIDTH
	save S5
	save I1
	bsr PAD
	restore S5
	save S15
	save S5
	save I1
	save I0
	bsr STRREPLACE

	save I5
        popi
	pops
	restore I5
	ne I5, NTYPE, VSNOTNUM
	restore S20
	branch VSBAIL
VSNOTNUM:
	ne I5, STYPE, VSNOTSTR
	restore S21
	branch VSBAIL
VSNOTSTR:
	restore S22 # Code
VSBAIL: ret


VSTOREERR:
	print "NOVAR for STORE\n"
	end
VSTOREERR2:
	print "WIDTH MISMATCH for STORE\n"
	end

# Fetch variables
#  Inputs: Name is on the stack
#          Type is on the stack
# Outputs: The value on the stack (AS A STRING)
VFETCH:
	pushi
	pushs
	restore I5  # type
	restore S0  # Variable name

	save S0
	save I5
	bsr VFIND
	restore I0  # Location
	eq I0, -1, VFETCHERR

	set S15, S20  # Assume Ints
	eq I5, NTYPE, VFSTART
	set S15, S21  # Strings?
	eq I5, STYPE, VFSTART
	set S15, S22  # Code then
VFSTART:
	add I0, I0, NAMEWIDTH
	substr S1, S15, I0, VARWIDTH
	save S1
	bsr STRIPSPACE
	bsr ATOI
	restore I1    # Width of data
	add I0, I0, VARWIDTH
	substr S1, S15, I0, I1
	save S1
	popi
	pops
	ret

VFETCHERR:
	print "NOT DEFINED on FETCH\n"
	end

# Destroy a variable
# Should only be called by the string stuff when a variable has exceeded maximum 
# length and needs to be killed.
#  Inputs: Name on stack
#          Type on stack
# Outputs: N/A
VDESTROY:
	pushi
	pushs

	restore I5    # Type
	save I5

	bsr VFIND
	restore I0
	eq I0, -1, VDESTROYEND

	set S15, S20  # Assume Ints
	eq I5, NTYPE, VDSTART
	set S15, S21  # Strings?
	eq I5, STYPE, VDSTART
	set S15, S22  # Code then

VDSTART:
	add I1, I0, NAMEWIDTH
	substr S1, S15, I1, VARWIDTH
	save S1
	bsr STRIPSPACE
	bsr ATOI
	restore I2    # Width of var storage entry

	add I2, I2, NAMEWIDTH
	add I2, I2, VARWIDTH

	save S15
	save ""
	save I2
	save I0
	bsr STRREPLACE
	restore S15

	save S15
	eq I5, NTYPE, VDNUM
	eq I5, STYPE, VDSTRING
	eq I5, CTYPE, VDCODE
	branch VDFATAL

VDNUM:  restore S20
	branch VDESTROYEND
VDSTRING:
	restore S21
	branch VDESTROYEND
VDCODE:
	restore S22
	branch VDESTROYEND

VDESTROYEND:	
	save S20
	save S21
	save S22
	popi
	pops
	restore S22
	restore S21
	restore S20
	ret
VDFATAL:
	print "Unknown type in DESTROY"
	end


# All of these routines use, misuse and abuse I0, I1, S0, S1, S2
#    Should be saved/restored okay though.

# Numeric variable handling
#   NCREATE (almost never needed)
#   NSTORE
#   NFETCH
#
# For all of these the general pattern is:
#    push the name
#    push the value (if needed)
#    call
#
# Create Numeric
.const NUMWIDTH 12
NCREATE:
	pushi
	pushs
	restore S0  # Name
	save S0
	save NTYPE
	bsr VFIND
	restore I0
	ne I0, -1, NCREATED
	save S0
	save NTYPE
	save NUMWIDTH
	bsr VCREATE
	save S0
	save NTYPE
	save NUMWIDTH
	save "0"
	bsr VSTORE
NCREATED:
	save S20
	popi
	pops
	restore S20
	ret

# Store numerics
NSTORE:
	pushi
	pushs
	restore I1   # Value
	restore S0   # Name

	save S0
	save NTYPE
	bsr VFIND
	restore I0
	ne I0, -1, NSCREATED
	save S0
	save NTYPE
	save NUMWIDTH
	bsr VCREATE
NSCREATED:
	save I1
	bsr ITOA
	restore S1
	save S0
	save NTYPE
	save NUMWIDTH
	save S1
	bsr VSTORE
	save S20
	popi
	pops
	restore S20
	ret

# Fetch Numerics
NFETCH: pushi
	pushs
	restore S0
	save S0
	save NTYPE
	bsr VFIND
	restore I0
	ne I0, -1, NFCREATED
	save S0
	bsr NCREATE
NFCREATED:
	save S0
	save NTYPE
	bsr VFETCH
	bsr STRIPSPACE
	bsr ATOI
	save S20
	popi
	pops
	restore S20
	ret

# String variable handling
#   SCREATE (DIM)
#   SSTORE
#   SFETCH
# Strings are \n terminated internally
#
# For all of these the general pattern is:
#    push the name
#    push the value (if needed)
#    call
#
# Create String 
# DIMENSION is now a no-op.
SCREATE:
	pushi
	pushs
	restore I1  # Dimensioned width
	restore S0  # Name
	inc I1      # Add one for the terminator
	save S0
	save STYPE
	bsr VFIND
	restore I0
	ne I0, -1, DIMERROR
	save S0
	save STYPE
	save I1
	bsr VCREATE

	save S0
	save STYPE
	save I1
	save TERMINATOR
	bsr VSTORE
	save S21
	popi
	pops
	restore S21
	ret
DIMERROR:
	print "DIM FAILURE"
	end

# Strings are a little smarter now.  They work *exactly* like
# numeric variables, except that if the store size exceeds the 
# allocated storage we destroy the existing variable and create a new one.
#
SSTORE:
	pushi
	pushs
	restore S1  # Value
	restore S0  # Name
	save S0
	save STYPE
	bsr VFIND
	restore I0
	eq I0, -1, NODIMERR
	add I0, I0, NAMEWIDTH
	substr S2, S21, I0, 3
	save S2
	bsr STRIPSPACE
	bsr ATOI
	restore I1   # Allowable width

	#save S1
	#bsr STRIPSPACE
	#restore S1

	length I0, S1
	ge I0, I1, STRTOOLONG

	concat S1, TERMINATOR
STOREIT:
	save S0
	save STYPE
	save I1
	save S1
	bsr VSTORE
	save S21
	popi
	pops
	restore S21
	ret

	# These are no longer errors.
	# Create a new string slot
	# Always create them for at least STRINGMINW
NODIMERR:
	concat S1, TERMINATOR
	length I1, S1
	gt I1, STRINGMINW, LENOKAY
	set I1, STRINGMINW
LENOKAY:save S0
	save STYPE
	save I1
	bsr VCREATE
	branch STOREIT

	# Destroy the old slot, create a new one
STRTOOLONG:
	save S0
	save STYPE
	bsr VDESTROY
	branch NODIMERR

# Fetch a string
# If the string wasn't previously dimensioned then
# we return the empty string
SFETCH:
	pushi
	pushs
	restore S0  # Name
	save S0
	save STYPE
	bsr VFIND
	restore I0
	ne I0, -1, GETSVAL
	set S1, ""
	branch RETSVAL

GETSVAL:save S0
	save STYPE
	bsr VFETCH
	bsr STRIPSPACE
	restore S1

	length I1, S1		# chopn S1, 1
	dec I1
	substr S1, S1, 0, I1

RETSVAL:save S1
	set S1, S1  # Fix bug?
	popi
	pops  # No state-saving needed
	ret

# Code Storage and Retrieval
#  This...is...insane.  Takes arguments as though strings
#
#  CSTORE -- store a code line, overwriting existing lines.
#  CFETCH -- fetch a code line.  NOTE: you'll get the line
#            specified or *higher*

# Fetch a line to be decoded.
#   Inputs: Integer line number (on stack)
#  Outputs: The line number (integer) found (-1 if none)
# 	    The corresponding line or *the next higher*
#
# Line lookups now *start* where the last one left off.  For forward
#   jumps, this means that only backwards jumps are O(n)
#  
#   I18 is the offset where the last line was found.
#   I19 is the last line number found.
#
CFETCH: pushi
	pushs
	restore I1   # Line number we want
	gt I1, I19, INCACHE
	set I18, 0

INCACHE:
	save I1
	bsr ITOA
	save CTYPE
	bsr VFIND
	restore I0   # Offset, line that was found.
	eq I0, -1, CNOLINE

	set I18, I0  # Where to start next time

	substr S3, S22, I0, NAMEWIDTH
	save S3
	bsr STRIPSPACE
	bsr ATOI
	restore I3

	add I0, I0, NAMEWIDTH
	substr S4, S22, I0, VARWIDTH
	save S4
	bsr STRIPSPACE
	bsr ATOI
	restore I1  # Length

	add I0, I0, VARWIDTH
	substr S4, S22, I0, I1
	save S4
	bsr STRIPSPACE
	restore S4

	length I2, S4		# chopn S4, 1
	dec I2
	substr S4, S4, 0, I2

	save S4		# The line
	save I3		# The line number

	set I19, I3     # Remember me.


	save I19
	save I18
	popi
	pops
	restore I18
	restore I19
	ret

CNOLINE:
	set I18, 0
	set I19, 0
	save -1
	popi
	pops
	ret


# CSTORE
#  Inputs: A code line on the stack.  Must be formatted like this:
#                  \d+\s
# Outputs: Nothing
# Trashes I0-I4, S0-S4
CSTORE:
	pushi
	pushs
	set I8, 0   # One-token-only flag
	restore S0  # Safekeeping
	save S0
	bsr TOKENIZER
	bsr REVERSESTACK
	restore I0  # Depth
	ne I0, 1, ONELNCK
	set I8, 1   # Just the line number!
ONELNCK:
	restore S1  # Line number
	dec I0
	save I0
	bsr CLEAR   # Empty the stack
	save S1
	bsr ATOI
	restore I1  # Number as numeric
	lt I1, 1, ENOTVALIDLINE
	# This is fucking ugly.  :)
	# Load the stack up with the lines so far, skipping the
	#    one entry we (might be) replacing.
	set I2, 0	# Depth
	set I0, 0
	eq I8, 1, CNEXT # Don't add if it's just a number
	save S0		# The line we're adding
	inc I2
CNEXT:
	set S3, ""
	substr S3, S22, I0, NAMEWIDTH
	save S3
	bsr STRIPSPACE
	restore S3
	eq S3, "#", CEND

	add I0, I0, NAMEWIDTH
	set S4, ""
	substr S4, S22, I0, VARWIDTH
	save S4
	bsr STRIPSPACE
	bsr ATOI
	restore I1

	add I0, I0, VARWIDTH
	set S4, ""
	substr S4, S22, I0, I1
	add I0, I0, I1
	save S4
	bsr STRIPSPACE
	restore S4

	length I3, S4
	dec I3
	substr S4, S4, 0, I3

	eq S1, S3, CNEXT  # Skipping this line
	save S4  # The line
	inc I2
	branch CNEXT

	# At this point the stack is full of stuff
	# Sort it.
CEND:   save I2
CENDLOAD:		# Entry point for LOAD
	bsr REVERSESTACK
	bsr LSORTSTACK
	bsr REVERSESTACK

	# Take the stack and re-insert it as lines
	set S22, "#"
	set I0, 0
	restore I1
	set I0, I1
	# Stuff the lines into the storage area
ADDLINE:
	eq 0, I0, DONEADD
	set S0, ""
	restore S0	 # Whole line

	save S0
	save " "
	save 0
	bsr STRNCHR
	restore I2
	set S1, ""
	substr S1, S0, 0, I2

	concat S0, TERMINATOR
	length I2, S0

	save S1
	save CTYPE
	save I2
	bsr VCREATE

	save S1
	save CTYPE
	save I2
	save S0
	bsr VSTORE

	dec I0
	branch ADDLINE

DONEADD:
	save S22
	popi
	pops
	restore S22	
	ret

ENOTVALIDLINE:
	print "BAD LINE NUMBER\n"
	end


# Sort whatever's on the stack.
# This is a modified version of sortstack, sorts numerically by the first field
#
LSORTSTACK:
	pushi
	pushs
	# Assume that rotate_up as defined in the original problem
	# statement has been defined.
	restore I5	# local $len = pop(@stack);
    	set I6, I5	# local $bum = $len;
    			# local ($x, $y, $limit);
LSORTMORE:
	le I6,1,LENDSORT # while ($bum > 1) {
	set I7, I6	#      $limit = $bum;
LSHUFFLE:	
	dec I7
	eq I7, 0, LALMOSTDONE	# while (--$limit) {
	bsr GETLINENO	
	restore I2
	restore S2		#     $x = pop(@stack);
	bsr GETLINENO
	restore I3
	restore S3		#     $y = pop(@stack);

#	le S2, S3, LSORTSWAP
	le I2, I3, LSORTSWAP 	# if ($x gt $y) {

	savec S2			#     push(@stack, $x);
	savec S3			#     push(@stack, $y);
	branch LROT		# }
LSORTSWAP:			# else {
	savec S3			#     push(@stack, $y);
	savec S2			#     push(@stack, $x); }
LROT:
        rotate_up I6		# rotate_up($bum);
	branch LSHUFFLE		# }
LALMOSTDONE:		        # At end of the $limit loop, top element is the max, and
				# top+1 to end is semi-sorted. One more rotate_up()
				# is needed before moving the floor up one notch.
	rotate_up I6		# rotate_up($bum);
	dec I6 			# $bum--; }
	branch LSORTMORE
LENDSORT:
	save I5
	popi
	pops
	ret

#  Inputs: Code line
# Outputs: Line number on stack as integer
#          Code line underneath
GETLINENO:
	pushi
	pushs
	restore S2
	save S2
	save " "
	save 0
	bsr STRNCHR
	restore I3
	set S7, ""
	substr S7, S2, 0, I3
	save S7
	bsr ATOI
	restore I0
	savec S2
	save I0
	popi
	pops
	ret

# Vardecode
# All-purpose variable decoder.  It's kinda blind though, so when you call it
# had better be a varaible there or the results are... unpredictable.  
# Deals with "A$" as one *or* two tokens!
#   Inputs: Stopword for evaluation
#	    Normal stack.  With what you *think* is the start of the variable
#           on top.  A$ ...
#  Outputs: Type (NTYPE, STYPE, CTYPE, etc...) on top then the name.
#           Array variables will be encoded in such a way they can be looked up
#           as-is.
VARDECODE:
	pushi
	pushs
	set S3, ""
	restore S3  # Stopword
	restore I5  # Depth
	
	restore S1	# Variable name
	set I3, NTYPE	# Numeric (assume)
	dec I5

	set S5, ""	# Check for 1-token string vars.
	length I2, S1
	substr S5, S1, I2, 1
	eq S5, "$", DECSTRING

	eq I5, 0, VARDECODED  # Nothing left it has to be numeric

	restore S2	# $, ( or stopword
	dec I5

	ne S2, "$", FINDEC

DECSTRING:
	set I3, STYPE
	eq I5, 0, VARDECODED

	restore S2	# There's something else...
	dec I5
FINDEC:			# S2's either the stop, expression, something.
	save S2
	inc I5
	eq S2, "(", VARSUBSCRIPT
	branch VARDECODED  # Nothing more to see here.
	
VARSUBSCRIPT:
	save I5
	save S3		# Stop word
	bsr EVAL_EXPR
	restore S0	# Subscript
	concat S1, "|"
	concat S1, S0   # var|expr[,expr...]
	restore I5

VARDECODED:
	save I5		# Fix the stack
	save S1		# Save the name
	save I3		# Save the type
	popi
	pops
	ret

