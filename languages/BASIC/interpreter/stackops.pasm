# Stack Library
#  This'll get a whole lot cleaner when I can tell the
#  depth of the stack automagically
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
# Revision 1.4  2002/06/02 02:04:12  clintp
# Removed constant assignment of register names
#
# Revision 1.3  2002/06/01 18:23:01  clintp
# For new assembler
#
# Revision 1.2  2002/04/29 01:10:04  clintp
# Speed changes, new language features
#
# Revision 1.5  2002/04/28 01:09:36  Clinton
# Added speedups by using set Ix, Sx and avoiding a lot of
# STRIPSPACE calls.  Compensated for weird read-data bug.
#
# Revision 1.3  2002/03/31 05:15:31  Clinton
# Adjusted
#
# Revision 1.2  2002/03/31 05:13:28  Clinton
# Id Keywords
#

# peek -- return whatever string is on the stack
#   Inputs: the offset on the stack
#  Outputs: the string
# Non-Destructive!
# Does *not* test for bounds conditions
# FAST!
PEEK:   pushi
	pushs
	restore I0
	mul I0, I0, -1
	rotate_up I0
	restore S0
	save S0
	mul I0, I0, -1
	rotate_up I0
	savec S0
	popi
	pops
	ret

# REPLACE -- replace thing at stack position X
#   Inputs: the offset to remove
#	    the string to leave in its place
#  Outputs: The string removed
#     Note: Almost *identical* to PEEK above
# Does *not* test for bounds conditions
REPLACE: pushi
	pushs
	restore S1
	restore I0

	mul I0, I0, -1
	rotate_up I0
	restore S0
	savec S1
	mul I0, I0, -1
	rotate_up I0
	savec S0

	popi
	pops
	ret

# swap -- swap the position of two strings on the stack
#  Inputs: Offsets of the two things on the stack
# Outputs: None.
# Does *not* test for bounds conditions
SWAP:	pushi
	pushs

	restore I0
	restore I1
	save I0
	save "-"     # Just a dummy
	bsr REPLACE

	restore S0
	save I1
	save S0

	bsr REPLACE

	restore S1
	save I0
	save S1

	bsr REPLACE
	restore S1   # dummy
        popi
	pops
	ret

# Reverse the stack
#   Inputs: Stack depth on top of the stack
#  Outputs: Stack depth on top of the stack
REVERSESTACK:
	pushi
	restore I5
	set I0, I5
REVSHIFT:
	eq I0, 0, REVERSEEND
	rotate_up I0
	dec I0
	branch REVSHIFT
REVERSEEND:
	save I5
	popi
	ret

# Clear the stack
#  Inputs: Stack depth on top of the stack
# Outputs: 0 on top of the stack
CLEAR:  pushi
	pushs
        restore I5
CLEARL: eq I5, 0, CLEAREND
        restore S0
        dec I5
        branch CLEARL
CLEAREND:
	save 0
	popi
	pops
	ret

# SORTSTACK
# NSORTSTACK
#  Inputs: A well-formed stack
# Outputs: Another well-formed stack
# Ported from suggestions at http://www.perlmonks.org/index.pl?node_id=153974
#   as an improvement over the bubble sort.

# Entry point for *numeric* sort
NSORTSTACK:
	pushi
	pushs
	set I10, 1
	branch DOSORT
# Now aliased to COMBSORT.... a vast improvement over earlier schemes.
# Implements a combsort in PASM
#  Inputs: depth on top of stack, stack of strings under
# Outputs: Stack, intact but sorted.
#
SORTSTACK:
	noop
COMBSORT:
	pushi
	pushs
	set I10, 0

DOSORT: restore I5
	set I0, I5
COMBTOP:mul I0, I0, 10
	div I0, I0, 13
	eq I0, 9, COMBNEWGAP
	eq I0, 10, COMBNEWGAP
	branch COMBREST
COMBNEWGAP:
	set I0, 11
COMBREST:
	lt I0, 1, COMBNEWGAP2
	branch COMBREST2
COMBNEWGAP2:
	set I0, 1
COMBREST2:
	set I1, 0
	set I2, 1
COMBTOPCS_FOR:
	set I6, I5
	sub I6, I6, I0
	gt I2, I6, AFTERCS_FOR
	set I3, I0
	add I3, I3, I2

	save I2
	bsr PEEK
	restore S0
	save I3
	bsr PEEK
	restore S1
	eq I10, 1, COMBNSORT
	le S0, S1, COMBENDCS_FOR
	branch SORTSWAP

COMBNSORT:
	set I7, S0
	set I8, S1
	le I7, I8, COMBENDCS_FOR
	branch SORTSWAP

SORTSWAP:
	save I2
	save I3
	bsr SWAP
	set I1, 1
COMBENDCS_FOR:
	inc I2
	branch COMBTOPCS_FOR
AFTERCS_FOR:
	eq I1, 1, COMBTOP
	ne I0, 1, COMBTOP
	save I5
	pops
	popi
	ret
