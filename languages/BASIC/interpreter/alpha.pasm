# Test for alphabeticness (7-bit ASCII only)
#  Input: (1-char) String on stack (will be removed)
# Output: 0 or 1 (integer) on stack
# Ex:	save "<"
#	bsr ISALPHA
#	restore I2  # False!
#
# $Id$
# $Log$
# Revision 1.2  2003/09/04 12:09:22  leo
# imcc cleanup; fix BASIC interpreter syntax
#
# Revision 1.1  2003/03/09 23:08:58  clintp
# Re-organized the languages\BASIC area into two areas, one for the older
# interpreted GW-type BASIC and one for the newer compiled QB-like BASIC.
#
# Revision 1.4  2002/07/31 15:46:06  clintp
# Clarified what 'whitespace' is
#
# Revision 1.3  2002/06/16 21:23:28  clintp
# Floating Point BASIC
#
# Revision 1.2  2002/04/29 01:10:04  clintp
# Speed changes, new language features
#
# Revision 1.7  2002/04/28 01:09:36  Clinton
# Added speedups by using set Ix, Sx and avoiding a lot of
# STRIPSPACE calls.  Compensated for weird read-data bug.
#
# Revision 1.5  2002/04/17 03:17:09  Clinton
# Added RIGHT(), LEFT(), and INSTR()
#
# Revision 1.3  2002/03/31 05:15:31  Clinton
# Adjusted
#
# Revision 1.2  2002/03/31 05:13:32  Clinton
# Id Keywords
#
#
ISALPHA:
	pushi
	pushs
	restore S1
	ge S1, "A", UPPER
	branch NONUP
UPPER:  le S1, "Z", ALPHA
NONUP:
	ge S1, "a", LOWER
	branch NONLOW
LOWER:  le S1, "z", ALPHA
NONLOW:
        ge S1, "0", NUMBER
        branch NONUM
NUMBER: le S1, "9", ALPHA
NONUM:  eq S1, "_", ALPHA
	eq S1, ".", ALPHA
        # Not A-Z0-9_.
	set I1, 0
	branch LEAVE_ISALPHA
ALPHA:  set I1, 1
LEAVE_ISALPHA:
	save I1
	popi
	pops
	ret

# Test for whitespace (tab, space, newline, any low-ASCII stuff)
#  Input: (1-char) String on stack (will be removed)
# Output: 0 or 1 (integer) on stack
ISWHITE:
	pushi
	pushs
	set I1, 1
	restore S1
	eq S1, "\x00", LEAVEWHITE
	eq S1, "\x07", LEAVEWHITE
	eq S1, "\x09", LEAVEWHITE
	eq S1, "\x0A", LEAVEWHITE
	eq S1, "\x0B", LEAVEWHITE
	eq S1, "\x0C", LEAVEWHITE
	eq S1, "\x0D", LEAVEWHITE
	eq S1, "\x1B", LEAVEWHITE
	eq S1, "\x20", LEAVEWHITE
	set I1, 0
LEAVEWHITE:
	save I1
	popi
	pops
	ret

# strnchr -- offset first occurance of X in Y
#  Inputs: Start offset
#          Character on stack (Y)
#	   String on stack (X)
# Outputs: Offset on stack, -1 if not found
STRNCHR:
	pushi
	pushs
	restore I0  # Offset
	restore S0  # Char
	restore S1  # String
	set S2, ""
	set I2, -1  # Not found
	length I3, S1
	set I4, I0
	gt I4, I3, STRNCHRERR

STRNLOOP:
	eq I3, I4, ENDSTRNCHR
	substr S3, S1, I4, 1
	eq S3, S0, STRNGOTONE
	inc I4
	branch STRNLOOP
STRNGOTONE:
	set I2, I4

ENDSTRNCHR:
	save I2
	popi
	pops
	ret
STRNCHRERR:
	print "String position out of bounds.  ERR\n"
	end

# atoi -- String to integer
#  Inputs: String on stack
# Outputs: Integer on top of the stack.
# Note: Invalid characters aren't currently handled
# TODO: Ignore spaces
# Ha!  Turns out there's already an opcode to do this
#  Backwards compatability only!
ATOI:   pushi
	pushs
	restore S0
	set I0, S0
	save I0
	popi
	pops
	ret

ATON:   pushn
	pushs
	restore S0
	set N0, S0
	save N0
	popn
	pops
	ret

# itoa  -- Integer to string
#  Inputs: Integer on stack
# Outputs: String on top of the stack
# Ha!  Turns out there's already an opcode to do this
#  Backwards compatability only!
ITOA: 	pushi
	pushs
	restore I0
	set S0, I0
	save S0
	popi
	pops
	ret

# ANSI-C's %f format uses something like %.6f which
# is ugly and exposes things I'd rather not have exposed.
NTOA: 	pushn
	pushs
	pushi
	restore N0
	set S0, N0
	length I0, S0
	dec I0
	eq 0, I0, NTOADONE

NTOATRUNC:
	le I0, 0, NTOADONE
	substr S1, S0, I0, 1
	ne S1, "0", NTOA_ALMOST
	substr S0, S0, 0, I0
	dec I0
	branch NTOATRUNC

NTOA_ALMOST:
	substr S1, S0, I0, 1
	ne S1, ".", NTOADONE
	substr S0, S0, 0, I0
	dec I0

NTOADONE:
	save S0
	popi
	popn
	pops
	ret

# Stripspace
#  Inputs: string on stack
# Outputs: string on stack, less trailing spaces
STRIPSPACE:
        pushi
        pushs
        restore S0
        length I0, S0
        eq I0, 0, SSDONE
        dec I0
        set S1, ""
SSCHECK:
        substr S1, S0, I0, 1
        save S1
        bsr ISWHITE
        restore I1
        eq I1, 0, SSDONE
        dec I0
        eq I0, 0, SSDONE
        branch SSCHECK
SSDONE:
        inc I0
        substr S0, S0, 0, I0
        save S0
        popi
        pops
        ret

STRIPLEADSPACE:
	pushi
	pushs
	set S0, ""
	set S1, ""
	restore S0  # Edit me!
SLSLOOP:
	length I0, S0
	le I0, 0, SLSEXIT
	substr S1, S0, 0, 1
	ne S1, " ", SLSEXIT
	dec I0
	substr S0, S0, 1, I0
	branch SLSLOOP
SLSEXIT:
	savec S0
	popi
	pops
	ret


# Stringinsert  -  Insert string X into Y at position N
#  Inputs: Position
#          String to Insert
#          Target String
# Outputs: Final String
STRINSERT:
	pushi
	pushs
	restore I0
	restore S0  # Insert string
	restore S1  # Insert into string
	set S3, ""  # The first part
	set S2, ""  # The second part
	length I1, S1
	ne I0, 0, STRNOTZERO
	set S2, S1	# Inserting at 0
	branch ENDSTRINSERT
STRNOTZERO:
	substr S3, S1, 0, I0
	substr S2, S1, I0, I1
ENDSTRINSERT:
	set S10, ""
	concat S10, S3
	concat S10, S0
	concat S10, S2
	save S10
	popi
	pops
	ret

# stringreplace -- Replace Characters in a string
#  Inputs: Position
#	   Number of characters to replce
#          String to Insert
#          Target String
# Outputs: Final String
#
STRREPLACE:
	pushi
	pushs
	restore I0  # Offset
	restore I1  # How many to replace
	restore S0  # Insert String
	restore S1  # Insert into String
	length I3, S1
	set S3, ""  # First part
	set S2, ""  # Second part
	substr S3, S1, 0, I0
	add I0, I0, I1
	sub I3, I3, I1
	substr S2, S1, I0, I3
	set S10, ""
	concat S10, S3
	concat S10, S0
	concat S10, S2
	save S10
	popi
	pops
	ret

# pad -- space padding (trailing)
#  Inputs: length
#          string
# Outputs: string
# NO BOUNDS CHECKING
PAD:
	pushi
	pushs
	restore I0
	restore S0

	set S1, ""
	length I1, S0
	concat S1, S0
	sub I0, I0, I1
	le I0, 0, PADE
	repeat S9, " ", I0
	concat S1, S9
PADE:   save S1
	popi
	pops
	ret

# isnum -- is this thing a number?
#  Inputs: string on stack
# Outputs: 1 if it is, 0 if it is not
#   I can't think of a fast and easy way to do this.
#   The obvious ways are all flawed.  BF&I then.
ISNUM:
	pushi
	pushn
	pushs
	restore S0  # The thing in question

	length I0, S0
	eq 0, I0, NOTISNUM
	set I1, 0
	set I3, 0  # Decimal flag

NUMLOOP:
	eq I1, I0, ISNUM_YES
	gt I3, 1, NOTISNUM     # Multiple .'s
	substr S1, S0, I1, 1
	eq S1, "-", ISNUMNEG
	ne S1, ".", NOPOINT
	inc I3
	inc I1
	branch NUMLOOP

ISNUMNEG:
	gt I1, 0, NOTISNUM	# - not in first position
	eq I0, 1, NOTISNUM	# or bare -
	inc I1
	branch NUMLOOP

NOPOINT:
	ge S1, "0", STILLNUM
	branch NOTISNUM
STILLNUM:
	le S1, "9", GOTNUM
	branch NOTISNUM
GOTNUM:
	inc I1
	branch NUMLOOP

ISNUM_YES:
	save 1
	branch ENDISNUM
NOTISNUM:
	save 0
ENDISNUM:
	popi
	popn
	pops
	ret

# strstr  -- is this string inside of the other string?
#  Inputs: push the source string
#          push the substring you're looking for
#          offset to start looking
# Outputs: The offset of the substring within the string.
STRSTR: pushi
	pushs
	restore I0	# Start position
	restore S0	# Substring
	restore S1	# Source string
	set I3, -1	# default return value
	length I1, S0
	length I2, S1

STRLOOK:add I4, I0, I1
	gt I4, I2, STREND	# Length exhausted
	substr S2, S1, I0, I1
	eq S2, S0, GOTSTR
	inc I0
	branch STRLOOK
GOTSTR: set I3, I0
STREND: save I3
	popi
	pops
	ret


