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
	eq I1, -1, WHICH_GT
	eq I1, 1, WHICH_LT
	print "Error in for-loop comparison\n"
	branch GEN_ERROR
WHICH_LT:
	set S0, "<="
	ret
WHICH_GT:
	set S0, ">="
	ret
	
	# ###############
	# Push step/finish
	#  Set S0 to "step" or "finish"
	#  Set S1 to the variable
	#  Set S2 to the type
	# 
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
	push P9, I0
	push P9, "FLO"
	ret
PUSHSTEPFLO:
	set N0, P1["value"]
	push P9, N0
	push P9, "FLO"
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
	set I0, 0
	set N0, 0.0
	new P0, .PerlHash
	set P0["guess"], 1	# Indicate unsure'd-ness
	set N0, S1
	eq N0, 0.0, GUESS_STRING
	# Oooh, a number?
	set I0, S1	# Convert to int, then compare to
	set N1, I0	#    float.  Did we lose precision?
	eq N1, N0, GUESS_INT   # No loss.  Probably integer
	set P0["type"], "FLO"
	set P0["value"], N0
	ret
GUESS_INT:
	set P0["type"], "INT"
	set P0["value"], I0
	ret
GUESS_STRING:
	set P0["type"], "STRING"
	set P0["value"], S1
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


