	# QuickBASIC variable storage.
	#
	# S0 should have the SIGIL attached to it still.
	#	% (int), & (long)   are both implemented as Parrot INT
	#	! (single), # (double) are both Parrot Floats
	#	$ (string) is a Parrot string
	# If no sigil is specified (or it's unrecognizable), 
	#       the QuickBASIC default is single-precision
	#
	# Variables have the structure:
	#  {
	#      ref => variable in prior stack frame name (nosigil),
	#      value => N/I/S
	#  }
	
	# ###########################################################
	# VARLOOKUP
	#   Inputs:        S0  Variable Name
	#  Outputs:  S0/N0/I0  Variable's value
	#	           S1  Variable's type
	#
	#
VARLOOKUP:
	# Work on setting s1 to the type: "int", "STRING", "FLO"
	set I3, I25		# Current stack depth
	set S1, "unk"
	
	bsr SIGILTYPE		# -> S0 name   -> S0 name (nosigil), S2 (INT/FLO/STR)
	set S1, S2
	bsr DOVARLOOK
	ret
	
	# Note: A "FLO" sigil *may* indicate a user-type.
	#     This loops down stack frames looking for variable storage.
DOVARLOOK:
	#print "Searching variable stack at "
	#print I3
	#print " for "
	#print S0
	#print "\n"
	eq I3, -1, NOVARFOUND    
	set P0, P10[I3]    # Right stack frame
	set P1, P0[S1]   # S1 - type
	set P0, P1[S0]   # So - var name
	typeof S2, P0
	eq S2, "PerlUndef", ANOTHERFRAME_USER
	branch GOTVAR
ANOTHERFRAME_USER:
	# For stack "crawling", change the NOVARFOUND's below to ANOTHERFRAME
	ne S1, "FLO", NOVARFOUND   #  ANOTHERFRAME
	set P0, P10[I3]
	set P1, P0["USER"]
	set P0, P1[S0]
	typeof S2, P0
	eq S2, "PerlUndef", NOVARFOUND   #  ANOTHERFRAME
	#print "** Reference to a user variable type on RHS! **\n"
	set S0, P0["_type"]         # CAP 10/28
	set S1, "USER"
	ret

GOTVAR:
	set S2, P0["ref"]
	ne S2, "", REFERENCELOOK
	eq S1, "INT", SETINT
	eq S1, "FLO", SETFLO
	eq S1, "STRING", SETSTRING
	print "Should not happen #52\n"
	branch GEN_ERROR

SETINT: set I0, P0["value"]
	branch VARLOOKEND
SETFLO: set N0, P0["value"]
	#print "Found the value "
	#print N0
	#print "\n"
	branch VARLOOKEND
SETSTRING:
	set S0, P0["value"]
	#print "Found the value "
	#print S0
	#print "\n"
	branch VARLOOKEND
VARLOOKEND:
	ret
ANOTHERFRAME:	
	dec I3
	branch DOVARLOOK
	
	# References re-set the name (S0) and go back into the loop.
	#
REFERENCELOOK:
	#print "Following reference... to "
	#print S2
	#print "\n"
	set S0, S2
	branch ANOTHERFRAME

NOVARFOUND:
	#print "Setting default value\n"
	eq S1, "STRING", STRINGDEF
	eq S1, "FLO", FLODEF
	set I0, 0
	ret	
STRINGDEF:
	set S0, ""
	ret
FLODEF:	set N0, 0.0
	ret

DISPASS:ret
	pushs
	set S1, P0["type"]
	set S0, P6["type"]
	
	print "In ASSIGNMENT "
	print "Left-hand type: '"
	print S1
	print "' Right-hand type: '"
	print S0
	print "'\n"
	pops
	ret
	
	########################################################
	#
	# Does an assignment
	#  P0 is the Left-hand side of the expression  (target)
	#  P6 is the Right-hand side of the expression
ASSIGNMENT:
	#print "In assignment\n"
	bsr DISPASS
	set S1, P0["type"]
	ne S1, "BARE", NOBARE          # Left-hand side is not BARE...
	# The right-hand side is a simple bareword
	pushp
	bsr UNSTUFF		# Unpacks P6 (RHS) into S0/N0/I0, etc...(Trashes P0)
	save P6
	popp
	restore P6
	#bsr DISPASS
	eq S2, "USER", USERRIGHT # 10/28
	set S1, P0["value"]     # The name of the variable as a string (w/sigil)
	bsr SETVAR		
	ret
	
USERRIGHT:	# 10/28
	#print "User-thingy now on right-hand side.  We now have:\n"
	bsr DISPASS
	set S0, P0["type"]
	eq S0, "USER", NOBARE
	# Thing on right is a bareword.  Presumably it's a user-type variable.
	ne S0, "BARE", ERRTYPASS
	set S0, P0["value"]
	bsr VARLOOKUP		# P0 comes back as side-effect!
	bsr DISPASS
	# Fall through.
		
	# Bizarre shit's afoot.  The left side *isn't* a bareword.  
	# Try a direct assignment from one to the other.  Yeech.
	#  P0  <=  P6
NOBARE: #print "Direct assignment?!?!\n"
	set S0, P6["type"]
	eq S0, "BARE", INDIRECT_ASS
	typeof S1, P0
	eq S1, "PerlUndef", USERASSTYPMIS1   # mundane = usertype
	set S1, P0["type"]
	ne S0, S1, USERASSTYPMIS1
	
	set P0["type"], S0
	eq S0, "INT", NB_INTASS
	eq S0, "STRING", NB_STRASS
	eq S0, "FLO", NB_FLOASS
	eq S0, "USER", NB_USERASS
	print "Unknown type in assignment\n"
	branch GEN_ERROR
	
NB_INTASS:
	set I0, P6["value"]
	set P0["value"], I0
	ret
NB_FLOASS:
	set N0, P6["value"]
	set P0["value"], N0
	ret
NB_STRASS:
	set S0, P6["value"]
	set P0["value"], S0
	ret
NB_USERASS:
	# I'm surely going to hell for this.
	set S0, P6["type"]	# Make types match
	set P0["type"], S0
	set S0, P6["_type"]
	set S1, P0["_type"]
	ne S0, S1, ERR_USERASSTYPMIS
	#print "Copying a "
	#print S0
	#print "\n"
	bsr STRUCT_COPY
	set P0["storage"], P1
	ret
	
	# The thing on the left (P0) is not a bareword (reftype?).
	# the thing on the right (P6) is a bareword.
INDIRECT_ASS:
	set S0, P6["value"]
	pushp
	pushs
	bsr VARLOOKUP
	bsr VARSTUFF
	save P0
	pops
	popp
	restore P6
	branch ASSIGNMENT
	
	# Trying to do direct assignment and the types don't match.
	# S0 is the Right Hand type
	# S1 is the Left Hand type
	# Allowable casts:
	#          S1    S0
	#         INT = FLO  
	#         FLO = INT
USERASSTYPMIS1:
	#print "Checking for a cast\n"
	eq S1, "INT", UATM_INT
	eq S1, "FLO", UATM_FLO
	branch ERR_USERASSTYPMIS
UATM_INT:
	ne S0, "FLO", ERR_USERASSTYPMIS
	#print "Casting RHS to INT"
	set N0, P6["value"]
	set I0, N0
	set P6["value"], I0
	set P6["type"], "INT"
	branch NOBARE
UATM_FLO:
	ne S0, "INT", ERR_USERASSTYPMIS
	#print "Casting RHS to FLO\n"
	set I0, P6["value"]
	set N0, I0
	set P6["value"], N0
	set P6["type"], "FLO"
	branch NOBARE
	
ERR_USERASSTYPMIS:
	print "Type mismatch in user-assignment.  Expected "
	print S0
	print " got "
	print S1
	print "\n"
	branch GEN_ERROR
	

ERRTYPASS:
	print "Unknown type\n"
	branch GEN_ERROR

	###############################################################
	# Set a variable
	# Inputs: S1 Variable name (w/sigil)
	#	  S0/I0/N0 Variable value
	#         S2 (->S4) Variable's type leftover from EXPR.
	# Trashes P0, P1, and a lot more.
	#
SETVAR: #print "N0= "
	#print N0
	#print "\n"
	set S3, S0
	set S4, S2      # Type of assigned thing (for casting)
	set S0, S1
	bsr SIGILTYPE
	set S1, S0      # Name
	set S0, S3	# Restored value
	set I3, I25
	#print "SETVAR Type "
	#print S2
	#print "\n"
SETFOLLOW:
	lt I3, 0, ERRCHASING
	set P0, P10[I3]
	set P1, P0[S2]  # Vars of type X
	set P0, P1[S1]  # Get variable info
	typeof S3, P0
	ne S3, "PerlUndef", SETALREADY
	new P0, .PerlHash
SETALREADY:
	set S3, P0["ref"]
	eq S3, "", SETHERE
	#print "Setting a var, following a ref.\n"
	set S1, S3
	dec I3
	branch SETFOLLOW

SETHERE:
	eq S4, "REF", SETREFERENCE
	eq S2, "INT", SETINTVAR
	eq S2, "FLO", SETFLOVAR
	eq S2, "STRING", SETSTRINGVAR
	print "Bad type"
	branch GEN_ERROR
SETINTVAR: eq S4, "INT", SETINTNOCAST
	eq S4, "STRING", SETINT_FROMSTRING
	set I0, N0
SETINTNOCAST:
	set P0["value"], I0
	branch SETEND
SETINT_FROMSTRING:			# Should probably be an error.
	set I0, S0
	branch SETEND
	
SETFLOVAR: eq S4, "FLO", SETFLONOCAST
	eq S4, "STRING", SETFLO_FROMSTRING
	set N0, I0
SETFLONOCAST:
	set P0["value"], N0
	#print "Assigning Value of "
	#print N0
	#print "\n"
	branch SETEND
SETFLO_FROMSTRING:			# Should probably be an error
	set N0, S0
	branch SETEND
	
SETSTRINGVAR:
	eq S4, "INT", STRING_INT_CONV
	eq S4, "FLO", STRING_FLO_CONV
SETSTRING2:
	set P0["value"], S0
	#print "("
	#print S0
	#print ") "
	branch SETEND
STRING_INT_CONV:
	set S0, I0
	branch SETSTRING2
STRING_FLO_CONV:
	bsr NORMALIZE_FLO  # Sets S0 based on N0
	branch SETSTRING2
	
SETREFERENCE:
	set S4, S1    # Reference name
	set S5, S2    # Reference type
	set S0, S0    # Referent name
	set S2, ""    #     will be referent type
	bsr SIGILTYPE
	set S1, S4
	
	#print "Setting reference from "
	#print S5
	#print " variable named "
	#print S1
	#print " to variable "
	#print S0
	#print " of type "
	#print S2
	#print "\n"
	
	ne S5, S2, ERRREFTYPEMISMATCH
	set P0["ref"], S0
	
SETEND:	set P1[S1], P0
	ret

ERRREFTYPEMISMATCH:
	print "Attempted to set a reference from type "
	print S5
	print " to "
	print S2
	print " in function definition."
	branch GEN_ERROR
ERRCHASING:
	print "Stack exhausted chasing reference\n"
	branch GEN_ERROR
	
	
	# ################################################################
	# Sigil Type
	#  Inputs:  S0 Variable name
	# Outputs:  S2 Variable type (INT/FLO/STRING)
	#           S0 Variable name w/o SIGIL
	# (assumes no sigil is FLO)
SIGILTYPE:
	pushs
	pushi
	length I0, S0
	eq I0, 1, SIGILFLO
	dec I0
	substr S2, S0, I0, 1
	#print "SIGIL is "
	#print S2
	#print "\n"
	eq S2, "%", SIGILINT
	eq S2, "&", SIGILINT
	eq S2, "!", SIGILFLO
	eq S2, "#", SIGILFLO
	eq S2, "$", SIGILSTRING
	branch SIGILFLONOSIGIL
SIGILSTRING:
	substr S0, S0, 0, I0
	set S2, "STRING"
	branch SIGILEND
SIGILINT:
	substr S0, S0, 0, I0
	set S2, "INT"
	branch SIGILEND
SIGILFLO:
	substr S0, S0, 0, I0
SIGILFLONOSIGIL:
	set S2, "FLO"
	branch SIGILEND
SIGILEND:
	save S2
	save S0
	popi
	pops
	restore S0
	restore S2
	ret
