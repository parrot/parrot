# Stack Library
#  This'll get a whole lot cleaner when I can tell the
#  depth of the stack automagically
#
# $Id$
# $Log$
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

#
.const CS_GAP I0
.const CS_SWAPPED I1
.const CS_FORI  I2
.const CS_FORJ       I3
.const CS_ALENGTH I5
# SORTSTACK
# NSORTSTACK
#  Inputs: A well-formed stack
# Outputs: Another well-formed stack
# Ported from suggestions at http://www.perlmonks.org/index.pl?node_id=153974
#   as an improvement over the bubble sort.

NSORTSTACK:	# Entry point for *numeric* sort
	pushi
	pushs
	set I10, 1
	branch DOSORT
SORTSTACK:
# Now aliased to COMBSORT.... a vast improvement over earlier schemes.
# Implements a combsort in PASM
#  Inputs: depth on top of stack, stack of strings under
# Outputs: Stack, intact but sorted.
#
COMBSORT:
	pushi
	pushs
	set I10, 0

DOSORT: restore CS_ALENGTH
	set CS_GAP, CS_ALENGTH
COMBTOP:mul CS_GAP, CS_GAP, 10
	div CS_GAP, CS_GAP 13
	eq CS_GAP, 9, COMBNEWGAP
	eq CS_GAP, 10, COMBNEWGAP
	branch COMBREST
COMBNEWGAP:
	set CS_GAP, 11
COMBREST:
	lt CS_GAP, 1 COMBNEWGAP2
	branch COMBREST2
COMBNEWGAP2:
	set CS_GAP, 1
COMBREST2:
	set CS_SWAPPED, 0
	set CS_FORI, 1
COMBTOPCS_FOR:
	set I6, CS_ALENGTH
	sub I6, I6, CS_GAP
	gt CS_FORI, I6, AFTERCS_FOR
	set CS_FORJ, CS_GAP
	add CS_FORJ, CS_FORJ, CS_FORI

	save CS_FORI
	bsr PEEK
	restore S0
	save CS_FORJ
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
	save CS_FORI
	save CS_FORJ
	bsr SWAP
	set CS_SWAPPED, 1
COMBENDCS_FOR:
	inc CS_FORI
	branch COMBTOPCS_FOR
AFTERCS_FOR:
	eq CS_SWAPPED, 1, COMBTOP
	ne CS_GAP, 1, COMBTOP
	save CS_ALENGTH
	pops
	popi
	ret
