# Stack Library
#  This'll get a whole lot cleaner when I can tell the
#  depth of the stack automagically
#
# $Id$
# $Log$
# Revision 1.1  2002/04/11 01:25:59  jgoff
# Adding clintp's BASIC interpreter.
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
PEEK:   pushi
	restore I0
	set I3, I0
	inc I0
	set I2 0
PLOOP:  ge I2, I3, POL
	rotate_up I0
	inc I2
	branch PLOOP
POL:
	restore S0
	save S0
	eq I0, 0, EOP
	rotate_up I0

EOP:	save S0
	popi
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
	set I3, I0
	inc I0
	set I2, 0
RLOOP:	ge I2, I3, ROL
	rotate_up I0
	inc I2
	branch RLOOP
ROL:	restore S0
	save S1
	eq I0, 0, ENDOFREPLACE
	rotate_up I0
ENDOFREPLACE:
	save S0
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
#  Inputs: A well-formed stack
# Outputs: Another well-formed stack
# Ported from suggestions at http://www.perlmonks.org/index.pl?node_id=153974
#   as an improvement over the bubble sort.
SORTSTACK:
	pushi
	pushs
	# Assume that rotate_up as defined in the original problem
	# statement has been defined.
	restore I5	# local $len = pop(@stack);
    	set I6, I5	# local $bum = $len;
    			# local ($x, $y, $limit);
SORTMORE:
	le I6,1,ENDSORT # while ($bum > 1) {
	set I7, I6	#      $limit = $bum;
SHUFFLE:	
	dec I7
	eq I7, 0, ALMOSTDONE	# while (--$limit) {
	restore S2		#     $x = pop(@stack);
	restore S3		#     $y = pop(@stack);
	le S2, S3, SORTSWAP 	# if ($x gt $y) {
	save S2			#     push(@stack, $x);
	save S3			#     push(@stack, $y);
	branch ROT		# }
SORTSWAP:			# else {
	save S3			#     push(@stack, $y);
	save S2			#     push(@stack, $x); }
ROT:
        rotate_up I6		# rotate_up($bum);
	branch SHUFFLE		# }
ALMOSTDONE:		        # At end of the $limit loop, top element is the max, and
				# top+1 to end is semi-sorted. One more rotate_up()
				# is needed before moving the floor up one notch.
	rotate_up I6		# rotate_up($bum);
	dec I6 			# $bum--; }
	branch SORTMORE
ENDSORT:
	save I5
	popi
	pops
	ret
