	# S0 has the function name (soon to be S5)
	# Arguments will be passed on the user stack
	# 	Count
	#	type
	#	value
	#	type
	#	value [...count times...]
	#
	# Result will be passed in I0/N0/S0
	#    type in S1
	#

	#
	# Prototypical user function.
	#
	# int myfunc(int foo, flo bar, string baz$)
	# 	passed types are FLO, INT, STRING, BARE (varname)
	# 
UF_ERRARGCNT:
	print "Argument count wrong in function "
 	print S5
 	print "().  Expected "
	print I4
	print " received "
	print I5
	print "\n"
	branch GEN_ERROR
UF_ERRARGTYPE:
	print "Wrong type passed"
	branch GEN_ERROR

	# Load arguments into variables as passed.
	# 	Depth is still in I5
UF_ARGLOAD:
	set I5, P5
	eq I5, 0, UF_ENDARGLOAD
	restore S2	# Arg type
	
	pop S0, P5  # Arg stuff
	pop S1, P5  # Variable name (here, in this scope)
		
	#print "Arg type S0="
	#print S0
	#print " arg name S1="
	#print S1
	#print " type? S2="
	#print S2
	#print "\n"
	
	eq S0, "ARRAY", UF_ARRAYPASSED
	eq S2, "FLO", UF_LOADFLO
	eq S2, "INT", UF_LOADINT
	eq S2, "STRING", UF_LOADSTRING
	eq S2, "BARE", UF_LOADBARE
	eq S2, "USER", UF_LOADUSER
	branch UF_ARGLOADUNK
	
UF_ARGLOADPROC:
	# Load into variables... here.
	bsr SETVAR
	branch  UF_ARGLOAD
UF_LOADFLO:
	restore N0
	branch UF_ARGLOADPROC
UF_LOADINT:
	restore I0
	branch UF_ARGLOADPROC
UF_LOADSTRING:
	restore S0
	branch UF_ARGLOADPROC
UF_LOADBARE:
	#print "LOADING BARE\n"
	eq S0, "FLO", UF_LOADBAREVAR
	eq S0, "INT", UF_LOADBAREVAR
	eq S0, "STRING", UF_LOADBAREVAR
	branch UF_LOADUSERSTRUCT
	# S0 = Referent (w/SIGIL)
	# S1 = Variable name
	# S2 = Type of current var (BARE)
UF_LOADBAREVAR:
	print 2, "Reference?\n"
	set S2, "REF"
	restore S0
	branch UF_ARGLOADPROC
	
UF_ARRAYPASSED:   # Arrays are strange.
	restore S0
	#print "The local array "
	#print S1
	#print " refers to parent "
	#print S0

	set I3, I25
	dec I3		# Parent's scope
	
UF_AP_LOOP:
	#print "Once...\n"
	eq I3, -1, UF_ERRMISMATCH
	set P0, P10[I3]
	set P1, P0["ARRAY"]
	set P0, P1[S0]
	typeof S2, P0
	dec I3
	eq S2, "PerlUndef", UF_AP_LOOP
	
	set P1, P10[I25]
	set P2, P1["ARRAY"]
	set P2[S1], P0	# Hack it in!
	branch UF_ARGLOADPROC

	
	# You passed a user-structure
	# 
UF_LOADUSERSTRUCT:
	restore S3
	#print "The local structure "
	#print S1
	#print " refers to "
	#print S3
	#print " of type "
	#print S0
	#print "\n"
	
	pushs
	pushi 		# This is how to look in the parent scope!
	set S0, S3
	dec I25
	bsr VARLOOKUP   # Result back in P0, actually.
	typeof S0, P0
	eq S0, "PerlUndef", UF_ERRMISMATCH
	popi
	pops

UF_FINISHUSER:
	# Roll this one by hand.  We want a reference...
	set S5, P0["_type"]
	ne S5, S0, UF_ERRMISMATCH
	set P1, P0["storage"]
	
	new P3, .PerlHash
	set P3["_type"], S5
	set P3["type"], "USER"
	set P2, P0["storage"]
	set P3["storage"], P2
	
	set P1, P10[I25]   
	set P2, P1["USER"]
	set P2[S1], P3         # Reference back to original structure!  Evil!
	branch UF_ARGLOAD
	
UF_LOADUSER:
	restore P0
	branch UF_FINISHUSER
		
	
UF_ENDARGLOAD:
	#print "Done processing arguments\n"
	ret
	
UF_ARGLOADUNK:
	print "Unknown argument type '"
	print S2
	print "' passed to function "
	print S5
	print "\n"
	branch GEN_ERROR
UF_ERRMISMATCH:
	print "Type mismatch! Expected "
	print S0
	print " found "
	print S5
	print "\n"
	branch GEN_ERROR