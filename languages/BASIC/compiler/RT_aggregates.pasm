	# Array things
	#
	#   P10[CURRDEPTH]->{ARRAY}->{varname}->{      type => ARRAY
	#					       _type => INT/FLO/STRING/usertype
	#					       elements => {
	# 							 	S0 => { }
	#

	# #############################################
	# ARRAY_LOOKUP
	# Inputs:  
	#	S0   Array's name (WITH SIGIL)
	#	P8 - Stack (back to type SUBS)
	#		has subscripts
	# Returns:
	#       P0 - Element of the array   { type => USER/INT/FLO/STRING etc...
	#
ARRAY_LOOKUP:
	set S5, S0      # Save name for later (self-reference, arg passing)
	set I3, I25
AL_LOOP:eq I3, -1, ERR_NOTDEF
	set P1, P10[I3]
	set P0, P1["ARRAY"]
	set P1, P0[S0]
	typeof S1, P1
	ne S1, "PerlUndef", AL_GOTONE
	
	branch ERR_NOTDEF     # Swap comments to enable crawling
	#dec I3
	#branch AL_LOOP
	
	# P1's got the variable placeholder.
	# Now build the key.
AL_GOTONE:
	bsr ARRAY_BUILDKEY   # Returns key in S2
	set P2, P1["elements"]
	set P0, P2[S2]
	typeof S3, P0
	eq S3, "PerlUndef", AR_MAKEBLANK   # TODO FIXME HALGHALGHLAGHL
	ret				   # Got one!

	# Create a new element at that key
AR_MAKEBLANK:
	bsr AR_MAKEFAKE    # Put a fake thingy in P2
	set P0, P2
	set P2, P1["elements"]
	set P2[S2], P0
	set P2, P1["keys"]
	push P2, S2
	ret

	# AR_MAKEFAKE
	# Inputs:
	#	S2	Name of element to make
	# 	P1	Parent of elements (the array itself)
	# Outputs:
	# 	Fake thing in P2
AR_MAKEFAKE:
	set S1, P1["_type"]
	new P2, .PerlHash
	set P2["type"], S1
	set P2["parent"], S5
	eq S1, "INT", AR_MAKEINT
	eq S1, "FLO", AR_MAKEFLO
	eq S1, "STRING", AR_MAKESTRING
	eq S1, "USER", AR_MAKEUSER
	branch ARR_UNKNOWN
	
AR_MAKEINT:
	set P2["value"], 0
	ret
AR_MAKEFLO:
	set P2["value"], 0.0
	ret
AR_MAKESTRING:
	set P2["value"], ""
	ret
AR_MAKEUSER:
	set S0, P1["usertype"]
	pushp
	bsr STRUCT_DIM    # New thing comes back in P0
	save P0
	popp
	restore P0
	set P2["type"], "USER"
	set S0, P1["usertype"]
	set P2["_type"], S0
	set P2["storage"], P0
	ret
	
	# ########################
	# ARRAY_BUILDKEY
	# Inputs:
	#	P8 -- Stack of keystuff
	# Outputs:
	#	S2 -- The key
	# Trashes:
	#       S0, I0, N0, S1
ARRAY_BUILDKEY:
	set S2, ""	
AL_BUILDKEY:
	set I0, P8  
	eq I0, 0, ERR_STACKE
	pop P0, P8
	set S1, P0["type"]
	eq S1, "SUBS", BUILDKEY_DONE
	length I0, S2
	eq I0, 0, AL_DIST
	concat S2, S2, ","
AL_DIST:eq S1, "INT", AL_APPINT
	eq S1, "FLO", AL_APPFLO
	eq S1, "STRING", AL_APPSTRING
	eq S1, "BARE", AL_VARIABLE
	branch ERR_BADKEY
AL_APPINT:
	set I0, P0["value"]
	set S0, I0
	concat S2, S2, S0
	branch AL_BUILDKEY
AL_APPFLO:
	set N0, P0["value"]
	set I0, N0
	set S0, I0
	concat S2, S2, S0
	branch AL_BUILDKEY
AL_APPSTRING:
	set S0, P0["value"]
	concat S2, S2, S0
	branch AL_BUILDKEY
AL_VARIABLE:
	set S0, P0["value"]
	pushs
	pushp
	bsr VARLOOKUP
	bsr VARSTUFF   # Produce P0 from S0, S1, etc...
	save P0
	popp
	pops
	restore P0
	set S1, P0["type"]
	branch AL_DIST
BUILDKEY_DONE:
	ret


	# ##########################################
	# Given an element, return the parent array
	# Inputs:
	#	P6  Element
	# Outputs:
	#       P0  Parent reference
ARR_FINDPARENT:
	pushp
	pushs
	pushi
	set S0, P6["parent"]
	set I3, I25
ARR_FP:	eq I3, -1, UF_ERRMISMATCH
	set P0, P10[I3]
	set P1, P0["ARRAY"]
	set P0, P1[S0]
	typeof S2, P0
	dec I3				 # crawl?
	eq S2, "PerlUndef", ARR_FP
	save P0
	popi
	pops
	popp
	restore P0
	ret

	# Member stuff
	# 
	# These are operations of the form:
	#    operand1 . operand2
	# Where
	#    operand1 is the user-defined data type
	#    operand2 is the member of that type
	# Result:
	#    A user-type variable object.  Pfft.
	#    {
	#	type => "USER",
	#	path => [ object, member, member, member ]
	#    }
	#
	# 
MEMBER: bsr POPZERO_CAREFUL
	set P7, P6
	bsr POPZERO_CAREFUL
	set S0, P7["type"]	# The member
	set S1, P6["type"]	# The object  (or USER type)

	eq S1, "BARE", MEM_NEED_VAR   # Not in the struct yet, create it!
	ne S1, "USER", ERRTYPMIS

	# ################################
	# Given
	#        P6 -- USER structure
	#	 P7 -- Member information
	# Return
	#        P5 -- New USER thingy.  Or specific type?
	set P1, P6
	branch MEM_NEED_OK

	# ################################
	# Given
	#        P6 -- Original structure  (BARE)
	#	 P7 -- Member information
	# Return
	#        P5 -- Struct for thingy (whatever!)
	#
MEM_NEED_VAR:
	set S0, P6["value"]
	set I3, I25
MEM_NEED_LOOP:
	lt I3, 0, DRU_NOTFOUND	# Look down through the stack
	set P1, P10[I3]		# For something of the right type.
	set P2, P1["USER"]
	set P1, P2[S0]
	typeof S1, P1
	ne S1, "PerlUndef", MEM_NEED_OK

	branch DRU_NOTFOUND	# Reverse these to enable crawling
	#dec I3
	#branch MEM_NEED_LOOP
	
MEM_NEED_OK:
	set S0, P7["value"]     # The member.
	set P0, P1["storage"]
	typeof S1, P0
	eq S1, "PerlUndef", ERR_INTERNAL
	set P1, P0[S0]
	typeof S1, P1
	eq S1, "PerlUndef", ERR_BAD_MEMBER

	set P5, P1
	bsr PUSHRESULT
	branch EVALEXPR

	# ##################################
	# ERRORS
ARR_UNKNOWN:
	print "Trying to make unknown type:"
	print S1
	branch GEN_ERROR
ERR_NOTDEF:
	print "Array type "
	print S0
	print " not defined\n"
	branch GEN_ERROR
ERR_STACKE:
	print "(internal) Stack unexpectedly empty in array"
	branch GEN_ERROR
ERR_BADKEY:
	print "Cannot use type "
	print S1
	print " as a key\n"
	branch GEN_ERROR
	
ERR_BAD_MEMBER:
	print "Bad member for structure: "
	print S0
	print "\n"
	branch GEN_ERROR
ERR_INTERNAL:
	print "Bad setup of structure\n"
	branch GEN_ERROR
DRU_NOTFOUND:
	print "User-variable not found\n"
	branch GEN_ERROR
ERRTYPMIS:
	print "Type mismatch in member deref, member is "
	print S0
	print " object is "
	print S1
	print " (not USER!) "
	branch GEN_ERROR


