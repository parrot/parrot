	# I/O *core* functions
	# All of this is likely to change once Parrot gets
	#    the I/O sorted out.
	#
	# Not a lot of error handling here yet
.sub _READCHARS 	# string readchars(int numchar, int fd)
	saveall
	.param int numchar
	.param int fd
	set $S0, ""
	read $S0, fd, numchar
	.return $S0
	restoreall
	ret
.end



#	# ###########################
#	# OPEN
#	#   Takes:
#	#	S0   Filename
#	#	S1   Mode   (r, w, a)
#	#   Returns:
#	#       I0   File Descriptor
#	# 	I1   0
#OPEN:	open I0, S0, S1
#	err I1
#	ne I1, 0, ERR_OPEN
#	ret
#
#ERR_FN:
#	print "Expecting string as filename"
#	branch GEN_ERROR
#
#ERR_OPEN:
#	print "Unable to open "
#	print S0
#	branch IO_ERR
#
#CLOSE:	eq I0, 0, ERR_BADF
#	close I0
#	err I1
#	ne I1, 0, ERR_CLOSE
#	ret
#
#ERR_CLOSE:
#	print "Unable to close "
#	print I0
#	branch IO_ERR
#
#IO_ERR:	err S1
#	print ": "
#	print S1
#	branch GEN_ERROR
#	
#
#        # ###########################
#        # READLINE    Read FD until EOL
#        # Takes:
#        #       I1   FD to read
#        #       S0   String read (EOL included!)
#        #
#        # Returns:
#        #       I0   Error?
.sub _READLINE		# string readline(int fd)
	saveall
	.param int fd
	set $S0, ""
	readline $S0, fd
	.return $S0
	restoreall
	ret
.end
#	# ###########################
#	# SPLITLINE	Splits a line into parts
#	# Outputs:
#	# 	P1	Array of strings
.sub _SPLITLINE		# PerlArray splitline (string line, int splitflag)
	saveall
	.param string line
	.param int splitflag
	.local string token
	.arg line
	call _CHOMP
	.result line

	$P1=new PerlArray
	eq splitflag, 0, SPLITSINGLE

SPLITAGAIN:
	length $I0, line
	eq $I0, 0, SPLITEND
	.arg line
	call _REMOVETOK
	.result line
	.result token
	push $P1, token
	branch SPLITAGAIN

SPLITEND:
	set $I1, $P1
	ne $I1, 0, SPLITGONE
	push $P1, ""
	branch SPLITGONE

SPLITSINGLE:
	push $P1, line

SPLITGONE:
	.return $P1
	restoreall

	ret
.end
#
#	# ############################
#	# Remove a token from the front of S0
#	# BASIC's Rules:
#	#    COMMAS separate tokens
#	#    Leading/trailing spaces ignored and removed.
#	#    Quotes can surround part of a token w/commas and spaces
.sub _REMOVETOK		# (string token, string neworiginal) removetok(string original)
	saveall
	.param string original
	set $I1, 0	# Inquote
	set $S1, ""	# Base string
TOKLOOP:
	length $I0, original
	eq $I0, 0, EOTOK
	substr $S2, original, 0, 1
	dec $I0
	substr original, original, 1, $I0
	eq $S2, '"', QUOTE
	eq $I1, 1, QUOTED
	eq $S2, " ", WHITESP
	eq $S2, "\r", WHITESP
	eq $S2, "\n", WHITESP
	eq $S2, ",", EOTOK
	concat $S1, $S1, $S2
	branch TOKLOOP
WHITESP:length $I0, $S1
	eq $I0, 0, TOKLOOP  # Leading spaces
QUOTED: concat $S1, $S1, $S2
	branch TOKLOOP
QUOTE:	eq $I1, 0, STARTQ
	set $I1, 0
	branch TOKLOOP
STARTQ: set $I1, 1
	branch TOKLOOP
EOTOK:	.return $S1	# The token
	.return original# The original, w/o the token
	restoreall
.end

#        # ###########################
#        # CHOMP      Remove trailing \r\n thingies from S0
.sub _CHOMP	# string chomp(string line)
	saveall
	.param string line
	length $I0, line
	dec $I0
	le $I0, 0, CHOMPOK
CHOMPLOOK:
	substr $S1, line, $I0, 1
	eq $S1, "\n", CHOMPIT
	eq $S1, "\r", CHOMPIT
	eq $S1, "", CHOMPIT
	branch CHOMPOK
CHOMPIT:substr line, line, 0, $I0
	dec $I0
	le $I0, 0, CHOMPOK
	branch CHOMPLOOK
CHOMPOK:.return line
	restoreall
	ret
.end	

#
#ERR_INPFIELDS:
#	print "Input field count wrong"
#	branch GEN_ERROR
#ERR_BADF:
#	print "File descriptor is incorrect"
#	branch GEN_ERROR
