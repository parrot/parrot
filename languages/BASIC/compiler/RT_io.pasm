	# I/O *core* functions
	# All of this is likely to change once Parrot gets
	#    the I/O sorted out.
	#
	# Not a lot of error handling here yet

	# ###########################
	# OPEN
	#   Takes:
	#	S0   Filename
	#	S1   Mode   (r, w, a)
	#   Returns:
	#       I0   File Descriptor
	# 	I1   0
OPEN:	open I0, S0, S1
	err I1
	ne I1, 0, ERR_OPEN
	ret

ERR_FN:
	print "Expecting string as filename"
	branch GEN_ERROR

ERR_OPEN:
	print "Unable to open "
	print S0
	branch IO_ERR

CLOSE:	eq I0, 0, ERR_BADF
	close I0
	err I1
	ne I1, 0, ERR_CLOSE
	ret

ERR_CLOSE:
	print "Unable to close "
	print I0
	branch IO_ERR

IO_ERR:	err S1
	print ": "
	print S1
	branch GEN_ERROR
	

        # ###########################
        # READLINE    Read FD until EOL
        # Takes:
        #       I1   FD to read
        #       S0   String read (EOL included!)
        #
        # Returns:
        #       I0   Error?
READLINE:
        set S0, ""
        readline S0, I1
        ret

	# ############################
	# READCHARS  Read chars from FD
	# Takes:
	#	I1  FD to read
	#	I2  # characters to read
	#	S0  string read
	# Returns:
	# 	I0  Error?
READCHARS:
	print "PARROT WARNING: Currently implemented...poorly\n"
	set S0, ""
	read S0, I1, I2
	ret

        # ###########################
        # PRINTLINE   Print S0 to file w/no EOL
        #       I1   FD to write
        #       S0   String to write
        # Returns:
        #       I0   Error?
PRINTLINE:
        print I1, S0
        ret

	# ###########################
	# SPLITLINE	Splits a line into parts
	# Inputs:
	#	S0	Line to split
	# 	I0	If false, don't split please.
	# Outputs:
	# 	P1	Array of values?  (Yeah, array of hashes, ints, floats, etc..)
	# Trashes:
	#	I0, I1, S1, S2, I3
SPLITLINE:
	bsr CHOMP
	new P1, .PerlArray
	eq I0, 0, SPLITSINGLE
SPLITAGAIN:
	length I0, S0
	eq I0, 0, SPLITEND
	bsr REMOVETOK
	bsr GUESSTYPE	# Thing in S1
	push P1, P0
	# Now, try to figure out what this token is.
	branch SPLITAGAIN
SPLITEND:
	set I1, P1
	ne I1, 0, SPLITGONE
	new P0, .PerlHash   # If no entries, create a single null entry
	set P0["type"], "STRING"
	set P0["value"], ""
	push P1, P0
SPLITGONE:
	ret
SPLITSINGLE:
	new P0, .PerlHash
	set P0["type"], "STRING"
	set P0["value"], S0
	push P1, P0
	branch SPLITGONE

	# ############################
	# Remove a token from the front of S0
	# Returns:
	#	S0 without the token
	#	S1 the token
	# BASIC's Rules:
	#    COMMAS separate tokens
	#    Leading/trailing spaces ignored and removed.
	#    Quotes can surround part of a token w/commas and spaces
REMOVETOK:
	set I1, 0	# Inquote
	set S1, ""	# Base string
TOKLOOP:
	length I0, S0
	eq I0, 0, EOTOK
	substr S2, S0, 0, 1
	dec I0
	substr S0, S0, 1, I0
	eq S2, '"', QUOTE
	eq I1, 1, QUOTED
	eq S2, " ", WHITESP
	eq S2, "\r", WHITESP
	eq S2, "\n", WHITESP
	eq S2, ",", EOTOK
	concat S1, S1, S2
	branch TOKLOOP
WHITESP:length I0, S1
	eq I0, 0, TOKLOOP  # Leading spaces
QUOTED: concat S1, S1, S2
	branch TOKLOOP
QUOTE:	eq I1, 0, STARTQ
	set I1, 0
	branch TOKLOOP
STARTQ: set I1, 1
	branch TOKLOOP
EOTOK:	ret

        # ###########################
        # CHOMP      Remove trailing \r\n thingies from S0
        # Takes:
        #       S0
        #
CHOMP:  pushi
        pushs
        length I0, S0
	eq I0, 0, CHOMPOK
        dec I0
CHOMPLOOK:
        substr S1, S0, I0, 1
        eq S1, "\n", CHOMPIT
        eq S1, "\r", CHOMPIT
        branch CHOMPOK
CHOMPIT:substr S0, S0, 0, I0
        dec I0
	le I0, 0, CHOMPOK
        branch CHOMPLOOK
CHOMPOK:save S0
        pops
        popi
        restore S0
        ret

ERR_INPFIELDS:
	print "Input field count wrong"
	branch GEN_ERROR
ERR_BADF:
	print "File descriptor is incorrect"
	branch GEN_ERROR