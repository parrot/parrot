	# Runtime support functions
	
	# ##############################
	# FOR_SIGN   Determine how the initial for-loop
	#      should be run.
	# Inputs:
	#    S0 for variable name
	#    S2 for variable type (INT/FLO)
	# Outputs:
	#   I0 = -1  end < start and sign(step) == -1
	#         0  INVALID  sign(end-start) != sign(step)
	#         1  start < end and sign is positive
	# Based on the for-structure in P11
FOR_SIGN:
	pushp
	bsr FOR_SETUP   # Sets P3, P4, P5  based on S0, S2
	bsr CASTFLOATS # Sets N3, N4, N5  based on Px
	set I0, 0
	
	eq N5, 0.0, CASE1 	# Always OK.
	lt N5, 0.0, STEPLOW	# step is negative.
	
STEPHI: lt N3, N4, CASE1
	gt N3, N4, CASE0
	branch CASE1	
	
STEPLOW:lt N3, N4, CASE0
	gt N3, N4, CASEN1
	branch CASEN1

CASEN1: set I0, -1
	branch END_FOR_SIGN
CASE1:  set I0, 1
	branch END_FOR_SIGN
CASE0:  set I0, 0
END_FOR_SIGN:
	popp
	ret


	# ############################
	# Sets P3, P4, P5 based on S0, S2
	#    for current stackframe
FOR_SETUP:
	#print "For Setup\n"
	set P0, P11[I25]
	set P1, P0["FOR"]
	set P0, P1[S2]
	set P1, P0[S0]
	
	set P3, P1["start"]
	set P4, P1["finish"]
	set P5, P1["step"]
	ret
	
	# #############################
	# Take P3, P4, P5 and set N3, N4, N5
	# (sets original types in S3, S4, S5 by accident)
CASTFLOATS:
	#print "Cast floats\n"
	set S3, P3["type"]
	eq S3, "INT", START_INT
	set N3, P3["value"]
	branch FOR_CAST2
START_INT:
	set I3, P3["value"]
	set N3, I3
	
FOR_CAST2:
	set S4, P4["type"]
	eq S4, "INT", START_INTx
	set N4, P4["value"]
	branch FOR_CAST3
START_INTx:
	set I4, P4["value"]
	set N4, I4
	
FOR_CAST3:
	set S5, P5["type"]
	eq S5, "INT", START_INTy
	set N5, P5["value"]
	branch FOR_CAST4
START_INTy:
	set I5, P5["value"]
	set N5, I5
FOR_CAST4:
	ret
	
ERR_FORINVALID:
	print "FOR loop has invalid start/end/step\n"
	branch GEN_ERROR
	
	# ##############
	# Using I1
	#    I1=-1  S0= ">"
	#    I1=1   S0= "<"
WHICH_COMPARE:
	eq I1, -1, EXPR_LE
	eq I1, 1, EXPR_GE
	print "Error in for-loop comparison\n"
	branch GEN_ERROR
	
	# ###############
	# Push step/finish
	#  Set S0 to "step" or "finish"
	#  Set S1 to the variable
	#  Set S2 to the type
	# Returns: P7 all set up
PUSHSTEP:
	set P1, P11[I25]
	set P2, P1["FOR"]
	set P1, P2[S2]
	set P2, P1[S1]
	set P1, P2[S0]
	set S0, P1["type"]
	eq S0, "INT", PUSHSTEPINT
	eq S0, "FLO", PUSHSTEPFLO
	print "Invalid step type"
	branch GEN_ERROR
PUSHSTEPINT:
	set I0, P1["value"]
	new P7, .PerlHash
	set P7["type"],"INT"
	set P7["value"],I0
	ret
PUSHSTEPFLO:
	set N0, P1["value"]
	new P7, .PerlHash
	set P7["type"],"FLO"
	set P7["value"],N0
	ret
	
	# ##########################
	# Do next read for READ/DATA
	#  P15 has the data itself
	#  P16 has the index (for restore)
	#  I15 is the current pointer
	# Trashes I0
	# Returns:
	#        P0 value read.
READ:	set I0, P15
	dec I0
	lt I0, I15, ERR_READ
	set P0, P15[I15]
	inc I15
	ret

	# ####################################
	# Index you want to restore into in S0
	# An invalid "restore X" statement generates
	# no error!  It simply does a "restore"
RESTORE:set I15, P16[S0]
	ret
	
ERR_READ:
	print "Out of data"
	branch GEN_ERROR
ERR_ON_RANGE:
	print "On.. range must be between 0 and 255"
	branch GEN_ERROR


	# ####################################
	# GUESSTYPE
	# Input:
	#      S1  A string of some kind
	# Return:
	#      P0  A typed value, BASIC-style
	# Trashes: I0, N1, N0
	# Method:
	#      Convert the string to Integer and Float.
	#      If zero, call it a string.
GUESSTYPE:
	pushs
	set I0, 0
	set N0, 0.0
	new P0, .PerlHash
	set P0["guess"], 1	# Indicate unsure'd-ness
	set S0, S1
	bsr GUESS_ISINT
	eq I0, 1, GUESS_INT
	bsr GUESS_ISFLOAT
	eq I0, 0, GUESS_STRING
	set N0, S1
	set P0["type"], "FLO"
	set P0["value"], N0
	pops
	ret
GUESS_INT:
	set I0, S1
	set P0["type"], "INT"
	set P0["value"], I0
	pops
	ret
GUESS_STRING:
	set P0["type"], "STRING"
	set P0["value"], S1
	pops
	ret

	# #########################################
	# SWAP
	# Input:
	#    P12  a LHS
	#    P13  another LHS
	# Return:
	#    P12 and P13 properly swapped
	# Everything (*everything*) internally is done with references.
	#    We have to do this the hard way.  :(
	# SWAPS VALUES, NOT REFERENCES!!
SWAP:	set S0, P12["type"]
	set S1, P13["type"]
	ne S0, S1, ERR_SWAP
	ne S0, "BARE", ERR_SWAP
	
	# Construct a P0 from P12 (COPY!)
	set P6, P12
	bsr DEREF		# Get the real value of it in P6
	bsr UNSTUFF		# Into vars
	set S1, S2
	bsr VARSTUFF		# P0's my new guy.
	set P7, P0		# P7 is P12's old contents

	set P6, P13
	bsr DEREF
	bsr UNSTUFF
	set S1, S2
	bsr VARSTUFF
	set P8, P0		# P8 is P13's old contents

	set P0, P12
	set P6, P8
	bsr ASSIGNMENT

	set P0, P13
	set P6, P7
	bsr ASSIGNMENT
	ret


ERR_SWAP:
	print "Cannot swap unlike types"
	branch GEN_ERROR

GEN_ERROR:
	print " at line "
	print I11
	print "\n"
	end


# Genned with Steve Fink's regex generator
# Parrot, languages\regex\regex.pl
#
#
# Input:  S0  (thing to be tested)
# Output: I0  (true, false)
#
# Ints are ^\s+\d+$
# Floats are ^\s+\d+\.
GUESS_ISINT:
	pushi
	pushs
	pushp
	new P0, .IntList
	new P1, .IntList
	new P2, .IntList
	set I1, 0
	length I2, S0
	set P0[0], 0
	set P0[1], -2 # open group 1
	set P1[1], -2 # close group 1
	ge I1, I2, INT_L57 # need 1 more chars
	push P2, 0 # pushindex
INT_L:

	# loop
	sub I0, I2, I1 # need 2 more chars
	lt I0, 2, INT_L5
	ord I0, S0, I1 # tmp = INPUT[pos]
	ne I0, 32, INT_L5 # match 'S'
	add I1, 1 # pos++
	branch INT_L3
INT_L2:

	# undo_match
	add I1, -1 # pos--
	branch INT_L5
INT_L3:

	# after_match
	push P2, 1 # pushindex
	branch INT_L
INT_L4:

	# star_back
	pop I0, P2 # popint
	if I0, INT_L2
	branch INT_L57
INT_L5:

	# star_next
	ge I1, I2, INT_L4 # need 1 more chars
	push P2, -1 # pushmark
INT_L6:

	# plus_loop
	ge I1, I2, INT_L56 # need 1 more chars
	set I0, P0[1] # get group 1 start
	push P2, I0 # pushindex
	set I0, P1[1] # get group 1 end
	push P2, I0 # pushindex
	set P0[1], I1 # open group 1
	ord I0, S0, I1 # tmp = INPUT[pos]
	ne I0, 48, INT_L9 # match 'A'
	add I1, 1 # pos++
	branch INT_L8
INT_L7:

	# undo_match2
	add I1, -1 # pos--
	branch INT_L9
INT_L8:

	# after_match2
	push P2, 0 # pushindex
	branch INT_L13
INT_L9:

	# alt_try9
	ord I0, S0, I1 # tmp = INPUT[pos]
	ne I0, 49, INT_L14 # match 'B'
	add I1, 1 # pos++
	branch INT_L11
INT_L10:

	# undo_match3
	add I1, -1 # pos--
	branch INT_L14
INT_L11:

	# after_match3
	push P2, 1 # pushindex
	branch INT_L13
INT_L12:

	# alt_back9
	pop I0, P2 # popint
	eq I0, 0, INT_L7
	branch INT_L10
INT_L13:

	# alt_next9
	push P2, 0 # pushindex
	branch INT_L18
INT_L14:

	# alt_try8
	ord I0, S0, I1 # tmp = INPUT[pos]
	ne I0, 50, INT_L19 # match 'C'
	add I1, 1 # pos++
	branch INT_L16
INT_L15:

	# undo_match4
	add I1, -1 # pos--
	branch INT_L19
INT_L16:

	# after_match4
	push P2, 1 # pushindex
	branch INT_L18
INT_L17:

	# alt_back8
	pop I0, P2 # popint
	eq I0, 0, INT_L12
	branch INT_L15
INT_L18:

	# alt_next8
	push P2, 0 # pushindex
	branch INT_L23
INT_L19:

	# alt_try7
	ord I0, S0, I1 # tmp = INPUT[pos]
	ne I0, 51, INT_L24 # match 'D'
	add I1, 1 # pos++
	branch INT_L21
INT_L20:

	# undo_match5
	add I1, -1 # pos--
	branch INT_L24
INT_L21:

	# after_match5
	push P2, 1 # pushindex
	branch INT_L23
INT_L22:

	# alt_back7
	pop I0, P2 # popint
	eq I0, 0, INT_L17
	branch INT_L20
INT_L23:

	# alt_next7
	push P2, 0 # pushindex
	branch INT_L28
INT_L24:

	# alt_try6
	ord I0, S0, I1 # tmp = INPUT[pos]
	ne I0, 52, INT_L29 # match 'E'
	add I1, 1 # pos++
	branch INT_L26
INT_L25:

	# undo_match6
	add I1, -1 # pos--
	branch INT_L29
INT_L26:

	# after_match6
	push P2, 1 # pushindex
	branch INT_L28
INT_L27:

	# alt_back6
	pop I0, P2 # popint
	eq I0, 0, INT_L22
	branch INT_L25
INT_L28:

	# alt_next6
	push P2, 0 # pushindex
	branch INT_L33
INT_L29:

	# alt_try5
	ord I0, S0, I1 # tmp = INPUT[pos]
	ne I0, 53, INT_L34 # match 'F'
	add I1, 1 # pos++
	branch INT_L31
INT_L30:

	# undo_match7
	add I1, -1 # pos--
	branch INT_L34
INT_L31:

	# after_match7
	push P2, 1 # pushindex
	branch INT_L33
INT_L32:

	# alt_back5
	pop I0, P2 # popint
	eq I0, 0, INT_L27
	branch INT_L30
INT_L33:

	# alt_next5
	push P2, 0 # pushindex
	branch INT_L38
INT_L34:

	# alt_try4
	ord I0, S0, I1 # tmp = INPUT[pos]
	ne I0, 54, INT_L39 # match 'G'
	add I1, 1 # pos++
	branch INT_L36
INT_L35:

	# undo_match8
	add I1, -1 # pos--
	branch INT_L39
INT_L36:

	# after_match8
	push P2, 1 # pushindex
	branch INT_L38
INT_L37:

	# alt_back4
	pop I0, P2 # popint
	eq I0, 0, INT_L32
	branch INT_L35
INT_L38:

	# alt_next4
	push P2, 0 # pushindex
	branch INT_L43
INT_L39:

	# alt_try3
	ord I0, S0, I1 # tmp = INPUT[pos]
	ne I0, 55, INT_L44 # match 'H'
	add I1, 1 # pos++
	branch INT_L41
INT_L40:

	# undo_match9
	add I1, -1 # pos--
	branch INT_L44
INT_L41:

	# after_match9
	push P2, 1 # pushindex
	branch INT_L43
INT_L42:

	# alt_back3
	pop I0, P2 # popint
	eq I0, 0, INT_L37
	branch INT_L40
INT_L43:

	# alt_next3
	push P2, 0 # pushindex
	branch INT_L48
INT_L44:

	# alt_try2
	ord I0, S0, I1 # tmp = INPUT[pos]
	ne I0, 56, INT_L49 # match 'I'
	add I1, 1 # pos++
	branch INT_L46
INT_L45:

	# undo_match10
	add I1, -1 # pos--
	branch INT_L49
INT_L46:

	# after_match10
	push P2, 1 # pushindex
	branch INT_L48
INT_L47:

	# alt_back2
	pop I0, P2 # popint
	eq I0, 0, INT_L42
	branch INT_L45
INT_L48:

	# alt_next2
	push P2, 0 # pushindex
	branch INT_L53
INT_L49:

	# alt_try
	ord I0, S0, I1 # tmp = INPUT[pos]
	ne I0, 57, INT_L54 # match 'J'
	add I1, 1 # pos++
	branch INT_L51
INT_L50:

	# undo_match11
	add I1, -1 # pos--
	branch INT_L54
INT_L51:

	# after_match11
	push P2, 1 # pushindex
	branch INT_L53
INT_L52:

	# alt_back
	pop I0, P2 # popint
	eq I0, 0, INT_L47
	branch INT_L50
INT_L53:

	# alt_next
	set P1[1], I1 # close group 1
	branch INT_L55
INT_L54:

	# group_iback
	pop I0, P2 # popint
	set P1[1], I0 # close group 1
	pop I0, P2 # popint
	set P0[1], I0 # open group 1
	branch INT_L56
INT_L55:

	# group_next
	push P2, 0 # pushindex
	branch INT_L6
INT_L56:

	# plus_rfail
	pop I0, P2 # popindex
	eq I0, -1, INT_L4 # was a mark?
	lt I1, I2, INT_L52 # at end?
	set I0, 1
	set P1[0], I1
	branch INT_L58
INT_L57:

	# FAIL
	set I0, 0
	set P1[0], -2
	save 0
	branch GUESS_INTDONE
INT_L58:
	save 1
GUESS_INTDONE:
	popi
	pops
	popp
	restore I0
	ret

GUESS_ISFLOAT:
	pushp
	pushs
	pushi
	new P0, .IntList
	new P1, .IntList
	new P2, .IntList
	set I1, 0
	length I2, S0
	set P0[0], 0
	set P0[1], -2 # open group 1
	set P1[1], -2 # close group 1
	sub I0, I2, I1 # need 2 more chars
	lt I0, 2, FLOAT_L59
	push P2, 0 # pushindex
FLOAT_L:

	# loop
	sub I0, I2, I1 # need 3 more chars
	lt I0, 3, FLOAT_L5
	ord I0, S0, I1 # tmp = INPUT[pos]
	ne I0, 32, FLOAT_L5 # match ' '
	add I1, 1 # pos++
	branch FLOAT_L3
FLOAT_L2:

	# undo_match
	add I1, -1 # pos--
	branch FLOAT_L5
FLOAT_L3:

	# after_match
	push P2, 1 # pushindex
	branch FLOAT_L
FLOAT_L4:

	# star_back
	pop I0, P2 # popint
	if I0, FLOAT_L2
	branch FLOAT_L59
FLOAT_L5:

	# star_next
	sub I0, I2, I1 # need 2 more chars
	lt I0, 2, FLOAT_L4
	push P2, -1 # pushmark
FLOAT_L6:

	# plus_loop
	sub I0, I2, I1 # need 2 more chars
	lt I0, 2, FLOAT_L56
	set I0, P0[1] # get group 1 start
	push P2, I0 # pushindex
	set I0, P1[1] # get group 1 end
	push P2, I0 # pushindex
	set P0[1], I1 # open group 1
	ord I0, S0, I1 # tmp = INPUT[pos]
	ne I0, 48, FLOAT_L9 # match 'A'
	add I1, 1 # pos++
	branch FLOAT_L8
FLOAT_L7:

	# undo_match2
	add I1, -1 # pos--
	branch FLOAT_L9
FLOAT_L8:

	# after_match2
	push P2, 0 # pushindex
	branch FLOAT_L13
FLOAT_L9:

	# alt_try9
	ord I0, S0, I1 # tmp = INPUT[pos]
	ne I0, 49, FLOAT_L14 # match 'B'
	add I1, 1 # pos++
	branch FLOAT_L11
FLOAT_L10:

	# undo_match3
	add I1, -1 # pos--
	branch FLOAT_L14
FLOAT_L11:

	# after_match3
	push P2, 1 # pushindex
	branch FLOAT_L13
FLOAT_L12:

	# alt_back9
	pop I0, P2 # popint
	eq I0, 0, FLOAT_L7
	branch FLOAT_L10
FLOAT_L13:

	# alt_next9
	push P2, 0 # pushindex
	branch FLOAT_L18
FLOAT_L14:

	# alt_try8
	ord I0, S0, I1 # tmp = INPUT[pos]
	ne I0, 50, FLOAT_L19 # match 'C'
	add I1, 1 # pos++
	branch FLOAT_L16
FLOAT_L15:

	# undo_match4
	add I1, -1 # pos--
	branch FLOAT_L19
FLOAT_L16:

	# after_match4
	push P2, 1 # pushindex
	branch FLOAT_L18
FLOAT_L17:

	# alt_back8
	pop I0, P2 # popint
	eq I0, 0, FLOAT_L12
	branch FLOAT_L15
FLOAT_L18:

	# alt_next8
	push P2, 0 # pushindex
	branch FLOAT_L23
FLOAT_L19:

	# alt_try7
	ord I0, S0, I1 # tmp = INPUT[pos]
	ne I0, 51, FLOAT_L24 # match 'D'
	add I1, 1 # pos++
	branch FLOAT_L21
FLOAT_L20:

	# undo_match5
	add I1, -1 # pos--
	branch FLOAT_L24
FLOAT_L21:

	# after_match5
	push P2, 1 # pushindex
	branch FLOAT_L23
FLOAT_L22:

	# alt_back7
	pop I0, P2 # popint
	eq I0, 0, FLOAT_L17
	branch FLOAT_L20
FLOAT_L23:

	# alt_next7
	push P2, 0 # pushindex
	branch FLOAT_L28
FLOAT_L24:

	# alt_try6
	ord I0, S0, I1 # tmp = INPUT[pos]
	ne I0, 52, FLOAT_L29 # match 'E'
	add I1, 1 # pos++
	branch FLOAT_L26
FLOAT_L25:

	# undo_match6
	add I1, -1 # pos--
	branch FLOAT_L29
FLOAT_L26:

	# after_match6
	push P2, 1 # pushindex
	branch FLOAT_L28
FLOAT_L27:

	# alt_back6
	pop I0, P2 # popint
	eq I0, 0, FLOAT_L22
	branch FLOAT_L25
FLOAT_L28:

	# alt_next6
	push P2, 0 # pushindex
	branch FLOAT_L33
FLOAT_L29:

	# alt_try5
	ord I0, S0, I1 # tmp = INPUT[pos]
	ne I0, 53, FLOAT_L34 # match 'F'
	add I1, 1 # pos++
	branch FLOAT_L31
FLOAT_L30:

	# undo_match7
	add I1, -1 # pos--
	branch FLOAT_L34
FLOAT_L31:

	# after_match7
	push P2, 1 # pushindex
	branch FLOAT_L33
FLOAT_L32:

	# alt_back5
	pop I0, P2 # popint
	eq I0, 0, FLOAT_L27
	branch FLOAT_L30
FLOAT_L33:

	# alt_next5
	push P2, 0 # pushindex
	branch FLOAT_L38
FLOAT_L34:

	# alt_try4
	ord I0, S0, I1 # tmp = INPUT[pos]
	ne I0, 54, FLOAT_L39 # match 'G'
	add I1, 1 # pos++
	branch FLOAT_L36
FLOAT_L35:

	# undo_match8
	add I1, -1 # pos--
	branch FLOAT_L39
FLOAT_L36:

	# after_match8
	push P2, 1 # pushindex
	branch FLOAT_L38
FLOAT_L37:

	# alt_back4
	pop I0, P2 # popint
	eq I0, 0, FLOAT_L32
	branch FLOAT_L35
FLOAT_L38:

	# alt_next4
	push P2, 0 # pushindex
	branch FLOAT_L43
FLOAT_L39:

	# alt_try3
	ord I0, S0, I1 # tmp = INPUT[pos]
	ne I0, 55, FLOAT_L44 # match 'H'
	add I1, 1 # pos++
	branch FLOAT_L41
FLOAT_L40:

	# undo_match9
	add I1, -1 # pos--
	branch FLOAT_L44
FLOAT_L41:

	# after_match9
	push P2, 1 # pushindex
	branch FLOAT_L43
FLOAT_L42:

	# alt_back3
	pop I0, P2 # popint
	eq I0, 0, FLOAT_L37
	branch FLOAT_L40
FLOAT_L43:

	# alt_next3
	push P2, 0 # pushindex
	branch FLOAT_L48
FLOAT_L44:

	# alt_try2
	ord I0, S0, I1 # tmp = INPUT[pos]
	ne I0, 56, FLOAT_L49 # match 'I'
	add I1, 1 # pos++
	branch FLOAT_L46
FLOAT_L45:

	# undo_match10
	add I1, -1 # pos--
	branch FLOAT_L49
FLOAT_L46:

	# after_match10
	push P2, 1 # pushindex
	branch FLOAT_L48
FLOAT_L47:

	# alt_back2
	pop I0, P2 # popint
	eq I0, 0, FLOAT_L42
	branch FLOAT_L45
FLOAT_L48:

	# alt_next2
	push P2, 0 # pushindex
	branch FLOAT_L53
FLOAT_L49:

	# alt_try
	ord I0, S0, I1 # tmp = INPUT[pos]
	ne I0, 57, FLOAT_L54 # match 'J'
	add I1, 1 # pos++
	branch FLOAT_L51
FLOAT_L50:

	# undo_match11
	add I1, -1 # pos--
	branch FLOAT_L54
FLOAT_L51:

	# after_match11
	push P2, 1 # pushindex
	branch FLOAT_L53
FLOAT_L52:

	# alt_back
	pop I0, P2 # popint
	eq I0, 0, FLOAT_L47
	branch FLOAT_L50
FLOAT_L53:

	# alt_next
	set P1[1], I1 # close group 1
	branch FLOAT_L55
FLOAT_L54:

	# group_iback
	pop I0, P2 # popint
	set P1[1], I0 # close group 1
	pop I0, P2 # popint
	set P0[1], I0 # open group 1
	branch FLOAT_L56
FLOAT_L55:

	# group_next
	push P2, 0 # pushindex
	branch FLOAT_L6
FLOAT_L56:

	# plus_rfail
	pop I0, P2 # popindex
	eq I0, -1, FLOAT_L4 # was a mark?
	ge I1, I2, FLOAT_L52 # need 1 more chars
	ord I0, S0, I1 # tmp = INPUT[pos]
	ne I0, 46, FLOAT_L52 # match '.'
	add I1, 1 # pos++
	set I0, 1
	set P1[0], I1
	branch FLOAT_L60
FLOAT_L59:

	# FAIL
	set I0, 0
	set P1[0], -2
	save 0
	branch GUESS_FLOATDONE
FLOAT_L60:
	save 1
	# RETURN
GUESS_FLOATDONE:
	popp
	pops
	popi
	restore I0
	ret