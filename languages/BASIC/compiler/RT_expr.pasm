	# Globals
	# I25   Current Depth
	# P10   Array of Hashes, stack frames
	#		P10[CURRDEPTH]->{expr}->[]
	#                             ->{exprwork}->[]
	#		P10[CURRDEPTH]->{expr_lhs}  INT bool 0/1
	#               P10[0]->{types}->{_typedefname}->[]
	#                                  That array is:
	#                                    { name => Sx,  type => INT/FLO/STRING/USER }
	#		P10[CURRDEPTH]->{FLO}
	#		P10[CURRDEPTH]->{INT}  
	#		P10[CURRDEPTH]->{STRING}
	#		P10[CURRDEPTH]->{USER}->{varname}->{_type}->Sx
	#		P10[CURRDEPTH]->{ARRAY}->{varname}->{  _type => INT/FLO/STRING/USER
	#						       elements => {
	#									S0 => { }
	#								   }
	
	# Expression Evaluation Machine
	# 
	# P10[CURRDEPTH]->{expr}->[]
	#               ->{exprwork}->[]
	#
	# Registers 5 or less are forfeit.  N0, I0, S0, etc...
	# TO MAKE THIS RE-ENTRANT:
	#   * If you leave, redirect P9 and P8 properly with EXPR_RESTART
	#
	# Return P6 as a structure (see below)
	
	# Entry Points:
	# 	EXPRINIT    Initializes the engine
	#	EVALEXPR    Begins evaluating an expression
	
	# Set P9 to the current expr frame for convenience later,
	# 	and init.
	# Set P8 to the current expr work frame for convenience.
EXPRINIT:
	#sweep
	set P0, P10[I25]
	set P9, P0["expr"]
	set P8, P0["exprwork"]
	set P9, 0
	set P8, 0
	ret

EXPR_RESTART:
	set P0, P10[I25]
	set P9, P0["expr"]
	set P8, P0["exprwork"]
	ret




	
PUSHRESULT:			# Unneeded?
	print "Unused?  PUSHRESULT\n"
	end
	push P8, P5
	set S0, P5["type"]
	ret

	# POPZERO and POPONE prepare operands to be operated on.  
	#
	# POPZERO returns value in P6
	# POPONE  returns value in P7
	#
	# {
	#     type => INT/FLO/STRING/BARE
	#    value => S, N, I
	# }
	# 
	# Remember, P8's the workstack....
	#
	#  If any of the operands is a bareword, then assume it's a variable
	#  and go fetch a value first.
POPZERO:#print "WS POPZERO\n"		# Unneeded
	print "Unused? POPZERO\n"
	end
	set I5, P8
	eq I5, 0, ERRSTACK
	pop P6, P8	# Type
	set S0, P6["type"]
	ne S0, "BARE", POPZERORET
	set S0, P6["value"]
	#print "VARLOOKUP in popzero\n"
	bsr VARLOOKUP
	bsr VARSTUFF
	set P6, P0
POPZERORET:
	ret
	
POPZERO_CAREFUL:   # Do *not* de-reference variables... unless
	#print "CAREFUL POPZERO\n"
	print "Unused? POPZERO_CAREFUL\n"
	end
	set I5, P8
	eq I5, 0, ERRSTACK
	pop P6, P8
	set S0, P6["type"]
	#print "Returning an "
	#print S0
	#print " in P6\n"
	ret
	
POPONE: 				# Unneeded
	print "Unused? POPONE\n"
	end
	#print "WS POPONE of type "
	set I5, P8
	eq I5, 0, ERRSTACK
	pop P7, P8
	set S0, P7["type"]
	#print S0
	#print "\n"
	ne S0, "BARE", POPONERET
	set S0, P7["value"]
	#print "VARLOOKUP in popone\n"
	bsr VARLOOKUP
	bsr VARSTUFF
	set P7, P0
POPONERET:
	ret

	# ##############################
	# VARSTUFF
	# Inputs:
	#               S1 - type
	#      S0/N0/I0/P0 - (latent) value
	# Outputs:
	#            P0 - { type => "int/str/flo", value => i0/s0/n0 }
	# Trashes: P1
VARSTUFF: 
	pushp
	#print "In varstuff\n"
	new P1, .PerlArray
	set P1[.TYPE], S1
	eq S1, "INT", STUFFINT
	eq S1, "FLO", STUFFFLO
	eq S1, "STRING", STUFFSTRING
	eq S1, "USER", STUFFUSER             # CAP 10/28
	print "Unhandled return type\n"
	branch GEN_ERROR
STUFFINT:set P1[.VALUE], I0
	set P0, P1
	branch STUFFRET
STUFFFLO:set P1[.VALUE], N0
	set P0, P1
	branch STUFFRET
STUFFSTRING:set P1[.VALUE], S0
	set P0, P1
	branch STUFFRET
STUFFRET: save P0
	popp
	restore P0
	ret
STUFFUSER:				    # CAP 10/28
	ret

	# ########################################################
	# UNSTUFF
	# Inputs:
	#          P6 - { type => "int/flo/str/bare", value => i0/n0/s0/s0 }
	# Outputs:
	#          S0/N0/I0  -  Value of structure
	#          S2        -  Type of structure
	#
	# Types "BARE" will be looked up as variables.  (RECURSE!)
UNSTUFF:set S0, P6[.TYPE]
	#print "Unstuffing a "
	#print S0
	#print "\n"
	eq S0, "INT", UNSTUFFINT
	eq S0, "FLO", UNSTUFFFLO
	eq S0, "STRING", UNSTUFFSTRING
	eq S0, "BARE", UNSTUFFBARE
	eq S0, "USER", UNSTUFFUSER
	print "Cannot unstuff a "
	print S0
	branch GEN_ERROR
UNSTUFFINT:
	set S2, "INT"
	set I0, P6[.VALUE]
	ret
UNSTUFFFLO:
	set S2, "FLO"
	set N0, P6[.VALUE]
	ret
UNSTUFFSTRING:
	set S2, "STRING"
	set S0, P6[.VALUE]
	ret
	
UNSTUFFBARE:
	pushp
	set S0, P6[.VALUE]    # Variable's name
	#print "VARLOOKUP in unstuffbare\n"
	bsr VARLOOKUP
	bsr VARSTUFF	       # Sets P0
	save P0
	popp
	restore P6
	#print "Unstuffing again "
	#print S1
	#print "\n"
	ne S1, "USER", UNSTUFF   # CAP 10/28
	set S2, "USER"
	ret
UNSTUFFUSER:
	set P0, P6
	set S2, "USER"
	ret
	

	# EVALUATION STARTS HERE
	#
	#  P9  -- instruction stack, set up by the caller:
	#  push value (?)
	#  push type
	#	etc...
	#  
EVALEXPR:
	print "INVALID NOW"
	end

	set I5, P9
	eq I5, 0, STACKE
	pop S5, P9
	
	#print "Pulled a "
	#print S5
	#print " from stack\n"

	# Check for literals
LITEVAL:
	eq S5, "STRING", LITERALPUSH
	eq S5, "INT", LITERALPUSH
	eq S5, "FLO", LITERALPUSH
	eq S5, "OP", OPEVAL
	eq S5, "BARE", VARPUSH
	eq S5, "ARG", ARGPUSH
	eq S5, "SUBS", SUBSPUSH
	eq S5, "FUNC", DOFUNC
	eq S5, "SUBSCRIPT", SUBSCRIPT_PUSH
	branch ERR

	# Lookup a variable and push it
	#
VARPUSH:pop S0, P9	# Variable's name
	new P0, .PerlArray
	set P0[.TYPE], "BARE"
	set P0[.VALUE], S0
	push P8, P0
	branch EVALEXPR

	# Pushing Literals onto the workstack
	#
LITERALPUSH:
	#print "Literal push of "
	#print S5
	#print " "
	new P0, .PerlArray
	set P0[.TYPE], S5
	eq S5, "INT", INTLITPUSH
	eq S5, "FLO", FLOLITPUSH
	eq S5, "STRING", STRINGLITPUSH
	branch ERR
ENDLITPUSH:
	#print "\n"
	push P8, P0
	branch EVALEXPR
INTLITPUSH:
	pop I0, P9
	set P0[.VALUE], I0
	#print I0
	branch ENDLITPUSH
FLOLITPUSH:
	pop N0, P9
	set P0[.VALUE], N0
	#print N0
	branch ENDLITPUSH
STRINGLITPUSH:
	pop S0, P9
	set P0[.VALUE], S0
	#print S0
	branch ENDLITPUSH
	
ARGPUSH:#print "Pushed an argument marker to stack\n"	
	print "Unused ARGPUSH?\n"
	end
	pop S0, P9
	new P0, .PerlHash
	set P0["type"], "ARG"
	push P8, P0
	branch EVALEXPR
SUBSPUSH: #print "Pushed a subscript marker to the stack\n"
	pop S0, P9
	new P0, .PerlHash
	set P0["type"], "SUBS"
	push P8, P0
	branch EVALEXPR

SUBSCRIPT_PUSH: #print "Looking up a subscripted thingy\n"
	pop S0, P9    # The name.
	bsr ARRAY_LOOKUP
	push P8, P0
	branch EVALEXPR

	# Call functions external to the machine.
	#    These can be user-defined functions or
	#    built-ins.  If the former, the function header
	#    etc.. should set up the arguments correctly.
	#
DOFUNC: pop S0, P9  # The function name
	#print "Jumping to internal '"
	#print S0
	#print "'?\n"
	bsr JUMPTABLE
	ne I1, 0, USERFUNC
	branch EVALEXPR

	# Call a user-defined function.
	# 	WATCH RE-ENTRANCY!!!
	#
USERFUNC:
	set I5, P8	# Save this for argc
USERFUNCARGS:
	set I4, P8
	eq I4, 0, USERFUNCARGSEND
	pop P0, P8
	set S1, P0[.TYPE]
	set S2, P0[.PARENT]
	ne S2, "", UF_PASSARR
	eq S1, "INT", UFAINT
	eq S1, "FLO", UFAFLO
	eq S1, "STRING", UFASTRING
	eq S1, "BARE", UFAVAR
	eq S1, "USER", UFUSER
	print "Invalid argument type on the pass "
	print S1
	print "\n"
 	branch GEN_ERROR
UFAINT: set I2, P0[.VALUE]
	save I2
	branch UFAEND
UFAFLO: set N2, P0[.VALUE]
	save N2
	branch UFAEND
UFASTRING:
	set S2, P0[.VALUE]
	save S2
	branch UFAEND
UFAVAR: set S2, P0[.VALUE]
	save S2
	branch UFAEND
UFUSER: save P0
	branch UFAEND
UF_PASSARR:                     # The array was resolved down to a bogus element
	save S2			# This is the parent's NAME
	branch UFAEND
	
UFAEND:	#print "== Pushing type\n"
	save S1    # Save the type.
	branch USERFUNCARGS



USERFUNCARGSEND:
	save I5     #   depth of arguments
	bsr UF_DISPATCH
	ne I1, 0, TRYSUB
	# Return stuff is result of EVALEXPR
	#    in P6.
	# S1 is type, S0/N0/I0 is the result
	bsr UNSTUFF
	set S1, S2
	#print "Came back from function with a "
	#print S1
	#print "\n"
	bsr VARSTUFF
	set P6, P0
	bsr EXPR_RESTART
#	bsr PUSHRESULT

#	bsr EXPR_RESTART
	ret
	
TRYSUB:
	bsr SUB_DISPATCH		# If a sub is dispatched,
	ne I1, 0, ERRNOSUCHFUNC		#  expect no return value
	branch EXPREND			#  get out of postfix machine!

ERRNOSUCHFUNC:
	print "ERROR: Function "
	print S0
	print " not found"
	branch GEN_ERROR

	# Evaluation of Math Operators
	# (note, they're loded in from math.pasm)
	#
OPEVAL:
	pop S4, P9	# Get the operator
	#print "Doing op "
	#print S4
	#print "\n"
	
#	eq S4, "+", ADD
#	eq S4, "-", SUB
#	eq S4, "*", MUL
#	eq S4, "/", DIV
#	eq S4, ">", GT
#	eq S4, "<", LT
#	eq S4, "=", EQ
#	eq S4, "<=", LE
#	eq S4, ">=", GE
#	eq S4, "<>", NE
	eq S4, "and", AND
	eq S4, "or", OR
	eq S4, "not", NOT
	eq S4, "xor", XOR
	eq S4, "eqv", EQV
	eq S4, "imp", IMP
	eq S4, "mod", MOD
	eq S4, "^", POW

#	eq S4, "UNARYMINUS", UNARYMINUS
	eq S4, ".", MEMBER
	branch ERRILLOP

	# EVALUATION ENDS HERE
	# Cleanup and return from the postfix Engine
	# 	P6 is the result, a PerlHash
	#
	#
STACKE:	set I1, P8
	eq I1, 1, STACKOK
	print "Stack has extra elements, expression error!\n"
	branch GEN_ERROR
STACKOK:#print "Stack OK\n"
	set P0, P10[I25]
	bsr POPZERO_CAREFUL   # The result in P6
	#print "Returning from evalexpr\n"
EXPREND:set P9, 0
	set P8, 0
	ret
	
	# Error messages, etc...
	# 
ERR:	print "General error '"
	print S4
	print "' operator\n"
	branch GEN_ERROR
ERRNOTVAR:
	print "Expected variable"
	branch GEN_ERROR
ERRSTACK:
	print "Unexpected empty stack while evaluating "
	print S5
	print "\n"
	branch GEN_ERROR
POPTYPERR:
	print "Unexpected type on stack "
	print S5 
	print "\n"
	branch GEN_ERROR
ERRILLOP:
	print "Illegal opcode "
	print S4
	print "\n"
	branch GEN_ERROR
	
	# Cast up takes the two args in P6, P7
	#    and casts them to the maximum precision needed.
	#
	#    int / float   -> float
	#    int / int     -> int
	#    float / int   -> float
	#    float / float -> float
	#    string / *    -> ERR
	#     * / string   -> ERR
	#    string / string -> string
	# 
	# Resulting type from the cast is in S0
	#
CAST_UP:set S0, P6[.TYPE]
	set S1, P7[.TYPE]
	eq S0, S1, CAST_UP_DONE
	eq S0, "STRING", CAST_ERR
	eq S1, "STRING", CAST_ERR
	eq S1, "INT", CAST_TO_FLOAT1
	eq S0, "INT", CAST_TO_FLOAT2
	branch CAST_UP_DONE
CAST_TO_FLOAT1:
	set I1, P7[.VALUE]
	set N1, I1
	set P7[.TYPE], "FLO"
	set P7[.VALUE], N1
	set S0, "FLO"
	branch CAST_UP_DONE
CAST_TO_FLOAT2:
	set I0, P6[.VALUE]
	set N0, I0
	set P6[.TYPE], "FLO"
	set P6[.VALUE], N0
	set S0, "FLO"
	branch CAST_UP_DONE
CAST_UP_DONE:
	ret
CAST_ERR:
	print "Type mismatch in operator\n"
	branch GEN_ERROR


	# Explicitly cast both to float, using similar rules.
CAST_TO_FLOAT:
	pushs
	pushi
	pushn
	set S0, P6[.TYPE]
	eq S0, "INT", CAST_ZERO_TO_FLOAT
	set N0, P6[.VALUE]
	branch TEST_ONE
CAST_ZERO_TO_FLOAT:
	set I0, P6[.VALUE]
	set N0, I0
TEST_ONE:
	set S1, P7[.TYPE]
	eq S1, "INT", CAST_ONE_TO_FLOAT
	set N1, P7[.VALUE]
	branch CAST_TO_FLOAT_END
CAST_ONE_TO_FLOAT:
	set I1, P7[.VALUE]
	set N1, I1
CAST_TO_FLOAT_END:
	new P6, .PerlArray
	set P6[.TYPE], "FLO"
	set P6[.VALUE], N0
	new P7, .PerlArray
	set P7[.TYPE], "FLO"
	set P7[.VALUE], N1
	popn
	popi
	pops
	ret
	
	# DEREF
	# Make a result suitable for printing or something.
	# 
	# Input P6 is the thing to be de-referenced
	#           Leave results in P6!
DEREF:  set S0, P6[.TYPE]
	ne S0, "BARE", ENDDEREF
	set S0, P6[.VALUE]   
	bsr VARLOOKUP    # Go look up the varible associated with this bareword
	bsr VARSTUFF
	set P6, P0
ENDDEREF:ret


	# Truth
	# Determine whether a given result is true or false.
	# Input: 
	#	P6 (result from EVALEXPR
	# Set:
	#    I1 = 1 True
	#    I1 = 0 False
TRUTH:  bsr UNSTUFF
	eq S2, "INT", TRUEINT
	eq S2, "FLO", TRUEFLO
	eq S2, "STRING", TRUESTRING
	print "Cannot determine truthsense of a "
	print S2
	print "\n"
	branch GEN_ERROR
TRUEINT:ne I0, 0, TRUE
	branch FALSE
TRUEFLO:ne N0, 0.0, TRUE
	branch FALSE
TRUESTRING:
	ne S0, "", TRUE
	branch FALSE
FALSE:  set I1, 0
	#print " !! FALSE\n"
	ret	
TRUE:	set I1, 1
	#print " !! TRUTH\n"
	ret

	# Runtime Push
	# Given a thingy in P0, push it to the *WORK* stack
	# Kind of like LITERAL_PUSH above, but not from P9 as a stack.
RUNTIME_PUSH:
	print "Unused RUNTIME_PUSH?\n"
	end
	set S0, P0["type"]
	eq S0, "FLO", RT_FLO
	eq S0, "INT", RT_INT
	eq S0, "STRING", RT_STRING
	print "ERR: Runtime push with "
	print S0
	print "\n"
	set S1, P0["value"]
	print S1
	branch GEN_ERROR
RT_FLO: set N0, P0["value"]
	push P9, N0
	push P9, S0
	ret
RT_INT: set I0, P0["value"]
	push P9, I0
	push P9, S0
	ret
RT_STRING:
	set S1, P0["value"]
	push P9, S1
	push P9, S0
	ret
	
	# Take P6 and make it an INT
CAST_TO_INT:
	set S0, P6[.TYPE]
	eq S0, "INT", CTI_RET
	eq S0, "FLO", CTI_FLO
	eq S0, "STRING", CTI_STR
	print "ERR: Attempt to cast "
	print S0
	print " to INTEGER"
	branch GEN_ERROR
CTI_FLO:set N0, P6[.VALUE]
	set I0, N0
	branch CTI_CONV
CTI_STR:set S0, P6[.VALUE]
	set I0, S0
	branch CTI_CONV
CTI_CONV:
	set P6[.TYPE], "INT"
	set P6[.VALUE], I0
CTI_RET:ret

	# Take the array in P8 and swap everything
	# upside-down
REVERSEARGS:
	set I0, P8
	lt I0, 2, NOREVERSE   # Not necessary..
	new P0, .PerlArray
REVERSEARGS2:
	set I0, P8
	eq I0, 0, ENDREVERSE
	pop P1, P8
	push P0, P1
	branch REVERSEARGS2
ENDREVERSE:
	set P8, P0
NOREVERSE:
	ret
