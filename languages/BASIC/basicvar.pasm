# Basic variable and code storage management
#
# Global Resources:
#   P20
#   P21
#   P22
#   P23  See below.
#
# Subscripted variables are stored independently of each other as:
#   varname|subscr,subscr   (the subscripts will be reversed)
#   The limit to subscripting is:
#     (Length of variable name)[+1+subscriptlen+1+[subscriptlen+1]...
#     So that FOO(56,1) will occupy FOO|1,56 an 8-byte slot
#
# $Id$
# $Log: basicvar.pasm,v 
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
# Revision 1.5  2002/05/22 19:59:59  clintp
# Fixed problem with uninitialized string variables
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
# Revision 1.14  2002/04/28 01:09:36  Clinton
# Added speedups by using set Ix, Sx and avoiding a lot of
# STRIPSPACE calls.  Compensated for weird read-data bug.
#
# Revision 1.12  2002/04/21 22:58:57  Clinton
# Made Eliza compatable
#
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
.constant NTYPE 0
.constant STYPE 1
.constant CTYPE 2

# All of these routines use, misuse and abuse I0, I1, S0, S1, S2
#    Should be saved/restored okay though.

# Numeric variable handling
#   NSTORE
#   NFETCH
#
# For all of these the general pattern is:
#    push the name
#    push the value (if needed)
#    call
#
# Store numerics
NSTORE: pushn
	pushs
	restore N1   # Value
	restore S0   # Name
	set P20[S0], N1
	popn
	pops
	ret

# Fetch Numerics
NFETCH: pushn
	pushs
	restore S0   # Name
	set N1, P20[S0]
	save N1
	popn
	pops
	ret

# String variable handling
#   SSTORE
#   SFETCH
#
# For all of these the general pattern is:
#    push the name
#    push the value (if needed)
#    call
#
# Create String 
# DIMENSION is now a no-op.
#
# Strings are a little smarter now.  They work *exactly* like
# numeric variables, except that if the store size exceeds the 
# allocated storage we destroy the existing variable and create a new one.
#
SSTORE: pushs
	restore S1  # Value
	restore S0  # Name
	set P21[S0], S1
	pops
	ret
	
# Fetch a string
# If the string wasn't previously dimensioned then
# we return the empty string
SFETCH: pushs
	pushi
	restore S0  # Name
	set S1, P21[S0]
	length I0, S1
	ne I0, 0, SNOTNULL
	set S1, ""

SNOTNULL: save S1
	popi
	pops
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
CFETCH: pushi
        pushs
        restore I0            # Line number to fetch.
        set I2, I0
        eq I0, -1, CFETCHSTART
	set S0, I0
        set S0, P22[S0]
        ne S0, "", CFETCHEND

        # Not found.  Let's see if this is a +1
        dec I0
	set S0, I0
        set S0, P22[S0]
        ne S0, "", CFETCHNEXT
        branch CNOTFOUND

CFETCHNEXT:
	set S0, I0
        set I1, P23[S0]  # Okay, got the line before
        inc I1
        gt I1, I28, COVERFLOW
        set I0, P24[I1]  # Next line number is...
        eq I0, 0, COVERFLOW
	set S0, I0
        set S0, P22[S0]  # Fetch it.
        ne S0, "", CFETCHEND
        branch CNOTFOUND       # This is a should-not-happen, I think.

CFETCHSTART:
        set I6, 0    # Line position to fetch
        gt I6, I28, COVERFLOW
        set I0, P24[I6]
        eq I0, 0, COVERFLOW
	set S0, I0
        set S0, P22[S0]  # Fetch line
        ne S0, "", CFETCHEND
        branch CNOTFOUND       # This is a should-not-happen, I think.

CFETCHEND:
        save S0
        save I0

CFETCHEND2:
        popi
        pops
        ret
COVERFLOW:
        save -1
        branch CFETCHEND2
CNOTFOUND:
        print "LINE "
        print I2
        print " NOT FOUND\n"
        save -1
        branch CFETCHEND2

# CSTORE
#  Inputs: A code line on the stack.  Must be formatted like this:
#                  \d+\s
# Outputs: Nothing
CSTORE: pushi
	pushs
	set I8, 0   # One-token-only flag
	restore S0  # Safekeeping (the line to insert)
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
	restore I5  # Dummy

	set I1, S1
	lt I1, 1, ENOTVALIDLINE

	set I5, 0   # Start with a blank stack.

CLOAD:  set I0, 0
CNEXT:  gt I0, I28, CEND
        set I3, P24[I0]   # Get the next line
	set S1, I3
        set S1, P22[S1]   # Get the line code itself
	inc I0
	eq I3, I1, CNEXT	# Skip this, it's being replaced.
	save S1
	inc I5
	branch CNEXT

CEND:   eq I8, 1, CINIT
	save S0			# Insert the new line
	bsr STRIPSPACE
	inc I5

CINIT:  save I5
	# Initialize program area
        new P22, .PerlHash     # The lines themselves  (Keyed on Line #)
        new P23, .PerlHash     # Pointers from the lines to the array  (Keyed on Line #)
        new P24, .PerlArray    # Array of line numbers
	set I28, -1

# Entry point for LOAD
CENDLOAD:
	bsr REVERSESTACK
	bsr NSORTSTACK

	# Take the stack and re-insert it as lines
        restore I5
STOREC: eq I5, 0, DONEADD
        restore S0              # Code line
        set I1, S0              # Line Number

	set S1, I1
        set P22[S1], S0   # The line itself
        inc I28
        set P23[S1], I28   # Index back to array
        set P24[I28], I1
        dec I5
        branch STOREC

DONEADD:
	save I28
	popi
	pops
	restore I28
	ret

ENOTVALIDLINE:
	print "BAD LINE NUMBER\n"
	end


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
	set I3, .NTYPE	# Numeric (assume)
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
	set I3, .STYPE
	eq I5, 0, VARDECODED

	restore S2	# There's something else...
	dec I5
# S2's either the stop, expression, something.
FINDEC:
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
